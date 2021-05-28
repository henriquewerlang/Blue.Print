unit Delphi.Rest.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, Delphi.Rest.JSON.Serializer.Intf;

type
  IRestCommunication = interface
    ['{33BB3249-F044-4BDF-B3E0-EA2378A040C4}']
    function SendRequest(const URL: String): String;
    {$IFDEF PAS2JS}
    function SendRequestAsync(const URL: String): String; async;
    {$ENDIF}

    procedure SetHeaders(Headers: TStrings);
  end;

  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    FHeaders: TStrings;

    function SendRequest(const URL: String): String;
    {$IFDEF PAS2JS}
    function SendRequestAsync(const URL: String): String; async;
    {$ENDIF}

    procedure SetHeaders(Headers: TStrings);
  end;

  TRemoteService = class(TVirtualInterface)
  private
    FContext: TRttiContext;
    FRttiType: TRttiInterfaceType;
    FURL: String;
    FSerializer: IRestJsonSerializer;
    FCommunication: IRestCommunication;
    FOnExecuteException: TProc<Exception, IRestJsonSerializer>;
    FHeaders: TStringList;

    function Deserialize(const JSON: String; RttiType: TRttiType): TValue;
    function FormatURL(Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetHeader(Index: String): String;
    function GetHeaders: String;
    function GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequest(Method: TRttiMethod; const Args: TArray<TValue>): String;

    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    procedure SetHeader(Index: String; const Value: String);
    procedure SetHeaders(const Value: String);

    {$IFDEF PAS2JS}
    function GenerateParams(Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
    function OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
    function OnInvokeMethodPas2JsAsync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue; async;
    function OnInvokeMethodPas2JsSync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
    function SendRequestAsync(Method: TRttiMethod; const Args: TArray<TValue>): String; async;

    procedure OnInvokeMethodAsync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue); async;
    {$ENDIF}
  public
    constructor Create(TypeInfo: PTypeInfo);

    destructor Destroy; override;

    property Communication: IRestCommunication read FCommunication write FCommunication;
    property Header[Index: String]: String read GetHeader write SetHeader;
    property Headers: String read GetHeaders write SetHeaders;
    property OnExecuteException: TProc<Exception, IRestJsonSerializer> read FOnExecuteException write FOnExecuteException;
    property RttiType: TRttiInterfaceType read FRttiType;
    property Serializer: IRestJsonSerializer read FSerializer write FSerializer;
    property URL: String read FURL write FURL;
  end;

  TRemoteServiceTyped<T: IInterface> = class(TRemoteService)
  public
    constructor Create;
  end;

  IRemoteServiceFactory = interface
    function GetService(&Type: PTypeInfo; const URL: String): TRemoteService;
  end;

  TRemoteServiceFactory = class(TInterfacedObject, IRemoteServiceFactory)
  private
    class var GRemoteServiceFactory: IRemoteServiceFactory;
  private
    FHeaders: String;
    FSerializer: IRestJsonSerializer;
    FCommunication: IRestCommunication;
    FOnExecuteException: TProc<Exception, IRestJsonSerializer>;
    FURL: String;

    class function GetRemoteServiceFactory: TRemoteServiceFactory; static;

    function GetService(&Type: PTypeInfo; const URL: String): TRemoteService; overload;
  public
    constructor Create;

    class constructor Create;

    class function GetService<I: IInterface>: I; overload;
    class function GetService<I: IInterface>(const URL: String): I; overload;

    property Communication: IRestCommunication read FCommunication write FCommunication;
    property Headers: String read FHeaders write FHeaders;
    property OnExecuteException: TProc<Exception, IRestJsonSerializer> read FOnExecuteException write FOnExecuteException;
    property Serializer: IRestJsonSerializer read FSerializer write FSerializer;
    property URL: String read FURL write FURL;

    class property Instance: TRemoteServiceFactory read GetRemoteServiceFactory;
  end;

implementation

uses Delphi.Rest.Exceptions,
{$IFDEF PAS2JS}
  JS, Web, Pas2Js.Rest.JSON.Serializers
{$ELSE}
  Delphi.Rest.JSON.Serializer, System.Net.HTTPClient
{$ENDIF};

const
  COMPILER_OFFSET = 1;

{ TRemoteService }

constructor TRemoteService.Create(TypeInfo: PTypeInfo);
begin
  inherited Create(TypeInfo, {$IFDEF PAS2JS}@OnInvokeMethodPas2Js{$ELSE}OnInvokeMethod{$ENDIF});

  FContext := TRttiContext.Create;
  FHeaders := TStringList.Create;
  FRttiType := FContext.GetType(TypeInfo) as TRttiInterfaceType;
end;

function TRemoteService.Deserialize(const JSON: String; RttiType: TRttiType): TValue;
begin
  if Assigned(RttiType) then
    Result := Serializer.Deserialize(JSON, RttiType.Handle)
  else
    Result := TValue.Empty;
end;

destructor TRemoteService.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

function TRemoteService.FormatURL(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Result := Format('%s/%s/%s%s', [FURL, FRttiType.Name.Substring(1), Method.Name, GetURLParams(Method, Args)]);
end;

function TRemoteService.GetHeader(Index: String): String;
begin
  Result := FHeaders.Values[Index];
end;

function TRemoteService.GetHeaders: String;
begin
  Result := FHeaders.Text;
end;

function TRemoteService.GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  A: Integer;

  Params: TArray<TRttiParameter>;

begin
  Params := Method.GetParameters;
  Result := EmptyStr;

  for A := Low(Params) to High(Params) do
  begin
    if not Result.IsEmpty then
      Result := Result + '&';

    Result := Result + Format('%s=%s', [Params[A].Name, Serializer.Serialize(Args[COMPILER_OFFSET + A])]);
  end;

  if not Result.IsEmpty then
    Result := '?' + Result;
end;

procedure TRemoteService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  try
    Result := Deserialize(SendRequest(Method, Args), Method.ReturnType);
  except
    on E: Exception do
      if Assigned(FOnExecuteException) then
        OnExecuteException(E, Serializer)
      else
        raise;
  end;
end;

function TRemoteService.SendRequest(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Communication.SetHeaders(FHeaders);

  Result := Communication.SendRequest(FormatURL(Method, Args));
end;

procedure TRemoteService.SetHeader(Index: String; const Value: String);
begin
  FHeaders.Values[Index] := Value;
end;

procedure TRemoteService.SetHeaders(const Value: String);
begin
  FHeaders.Text := Value;
end;

{$IFDEF PAS2JS}
function TRemoteService.GenerateParams(Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
var
  A: Integer;

  Return: TValue;

  Param: TRttiParameter;

  Parameters: TArray<TRttiParameter>;

begin
  Parameters := Method.GetParameters;

  SetLength(Result, Succ(Length(Args)));

  for A := Low(Args) to High(Args) do
    Result[COMPILER_OFFSET + A] := TValue.Make(Parameters[A].ParamType.Handle, Args[A]);
end;

function TRemoteService.OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
var
  Method: TRttiMethod;

begin
  Method := FRttiType.GetMethod(aMethodName);

  if Method.IsAsyncCall then
    Result := OnInvokeMethodPas2JsAsync(Method, GenerateParams(Method, Args))
  else
    Result := OnInvokeMethodPas2JsSync(Method, GenerateParams(Method, Args));
end;

function TRemoteService.OnInvokeMethodPas2JsAsync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  await(OnInvokeMethodAsync(Method, Args, Return));

  Result := Return.AsJSValue;
end;

function TRemoteService.OnInvokeMethodPas2JsSync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  OnInvokeMethod(Method, Args, Return);

  Result := Return.AsJSValue;
end;

procedure TRemoteService.OnInvokeMethodAsync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
var
  ReturnType: TRttiType;

begin
  try
    ReturnType := Method.ReturnType;

    if ReturnType.IsInstanceExternal and (ReturnType.AsInstanceExternal.ExternalName = 'Promise') then
      ReturnType := nil;

    Result := Deserialize(await(String, SendRequestAsync(Method, Args)), ReturnType);
  except
    on E: Exception do
      if Assigned(FOnExecuteException) then
        OnExecuteException(E, Serializer)
      else
        raise;
  end;
end;

function TRemoteService.SendRequestAsync(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Communication.SetHeaders(FHeaders);

  Result := await(String, Communication.SendRequestAsync(FormatURL(Method, Args)));
end;

{$ENDIF}

{ TRestCommunication }

function TRestCommunication.SendRequest(const URL: String): String;
{$IFDEF PAS2JS}
var
  Connection: TJSXMLHttpRequest;

  A: Integer;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  Connection := TJSXMLHttpRequest.New;

  Connection.Open('GET', URL, False);

  for A := 0 to Pred(FHeaders.Count) do
    Connection.setRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  Connection.Send;

  if Connection.Status = 200 then
    Result := Connection.ResponseText
  else
    raise EHTTPStatusError.Create(Connection.status, Connection.ResponseText);
{$ELSE}
  var Connection := THTTPClient.Create;

  try
    var Response := Connection.Get(URL);

    var Content := Response.ContentAsString(TEncoding.UTF8);

    if Response.StatusCode = 200 then
      Result := Content
    else
      raise EHTTPStatusError.Create(Response.StatusCode, Content);
  finally
    Connection.Free;
  end;
{$ENDIF}
end;

{$IFDEF PAS2JS}
function TRestCommunication.SendRequestAsync(const URL: String): String;
var
  A: Integer;

  Options: TJSObject;

  RequestHeaders: TJSHTMLHeaders;

  Response: TJSResponse;

begin
  Options := TJSObject.New;
  RequestHeaders := TJSHTMLHeaders.New;

  for A := 0 to Pred(FHeaders.Count) do
    RequestHeaders.Append(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  Options['headers'] := RequestHeaders;

  Response := await(TJSResponse, Window.Fetch(URL, Options));

  if Response.Status = 200 then
    Result := await(String, Response.Text)
  else
    raise EHTTPStatusError.Create(Response.Status, await(String, Response.Text));
end;
{$ENDIF}

procedure TRestCommunication.SetHeaders(Headers: TStrings);
begin
  FHeaders := Headers;
end;

{ TRemoteServiceTyped<T> }

constructor TRemoteServiceTyped<T>.Create;
begin
  inherited Create(TypeInfo(T));
end;

{ TRemoteServiceFactory }

class constructor TRemoteServiceFactory.Create;
begin
  GRemoteServiceFactory := TRemoteServiceFactory.Create;
end;

constructor TRemoteServiceFactory.Create;
begin
  Communication := TRestCommunication.Create;
  Serializer := TRestJsonSerializer.Create;
end;

class function TRemoteServiceFactory.GetRemoteServiceFactory: TRemoteServiceFactory;
begin
  Result := TRemoteServiceFactory(GRemoteServiceFactory);
end;

function TRemoteServiceFactory.GetService(&Type: PTypeInfo; const URL: String): TRemoteService;
begin
  Result := TRemoteService.Create(&Type);
  Result.Communication := Communication;
  Result.Headers := Headers;
  Result.OnExecuteException := OnExecuteException;
  Result.Serializer := Serializer;
  Result.URL := URL;
end;

class function TRemoteServiceFactory.GetService<I>(const URL: String): I;
var
  Service: TRemoteService;

begin
  Service := GRemoteServiceFactory.GetService(TypeInfo(I), URL);

  Service.QueryInterface(Service.RttiType.GUID, Result);
end;

class function TRemoteServiceFactory.GetService<I>: I;
begin
  Result := Instance.GetService<I>(Instance.URL);
end;

end.

