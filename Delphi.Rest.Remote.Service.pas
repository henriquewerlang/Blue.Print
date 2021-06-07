unit Delphi.Rest.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, Delphi.Rest.Types, Delphi.Rest.JSON.Serializer.Intf;

type
  TRestRequest = class
  public
    Headers: String;
    Method: TRESTMethod;
    Params: String;
    URL: String;
  end;

  IRestCommunication = interface
    ['{33BB3249-F044-4BDF-B3E0-EA2378A040C4}']
    function SendRequest(const Request: TRestRequest): String;
    {$IFDEF PAS2JS}
    function SendRequestAsync(const Request: TRestRequest): String; async;
    {$ENDIF}
  end;

  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    FHeaders: TStringList;

    function SendRequest(const Request: TRestRequest): String;
    {$IFDEF PAS2JS}
    function SendRequestAsync(const Request: TRestRequest): String; async;
    {$ENDIF}
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TRemoteService = class(TVirtualInterface)
  private
    FContext: TRttiContext;
    FRttiType: TRttiInterfaceType;
    FURL: String;
    FSerializer: IRestJsonSerializer;
    FCommunication: IRestCommunication;
    FOnExecuteException: TProc<Exception, IRestJsonSerializer>;
    FRequest: TRestRequest;
    FHeaders: TStringList;

    function Deserialize(const JSON: String; RttiType: TRttiType): TValue;
    function FormatURL(Method: TRttiMethod): String;
    function GetHeader(Index: String): String;
    function GetHeaders: String;
    function GetParamsInURL(Method: TRttiMethod): Boolean;
    function GetComandFromMethod(Method: TRttiMethod): TRESTMethod;
    function GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequest(Method: TRttiMethod; const Args: TArray<TValue>): String;

    procedure LoadRequest(Method: TRttiMethod; const Args: TArray<TValue>);
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
  COMMAND_NAME: array[TRESTMethod] of String = ('DELETE', 'GET', 'PATCH', 'POST', 'PUT');
  COMPILER_OFFSET = 1;

{ TRemoteService }

constructor TRemoteService.Create(TypeInfo: PTypeInfo);
begin
  inherited Create(TypeInfo, {$IFDEF PAS2JS}@OnInvokeMethodPas2Js{$ELSE}OnInvokeMethod{$ENDIF});

  FContext := TRttiContext.Create;
  FHeaders := TStringList.Create;
  FRequest := TRestRequest.Create;
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
  FRequest.Free;

  FHeaders.Free;

  inherited;
end;

function TRemoteService.FormatURL(Method: TRttiMethod): String;
begin
  Result := Format('%s/%s/%s', [FURL, FRttiType.Name.Substring(1), Method.Name]);
end;

function TRemoteService.GetComandFromMethod(Method: TRttiMethod): TRESTMethod;
begin
  if not TRESTMethodAttribute.GetMethodType(Method, Result) then
    Result := rmGet;
end;

function TRemoteService.GetHeader(Index: String): String;
begin
  Result := FHeaders.Values[Index];
end;

function TRemoteService.GetHeaders: String;
begin
  Result := FHeaders.Text;
end;

function TRemoteService.GetParamsInURL(Method: TRttiMethod): Boolean;
var
  ParamType: TRESTParamType;

begin
  if TRESTParamAttribute.GetParamsInURL(Method, ParamType) then
    Result := ParamType = ptURL
  else
    Result := FRequest.Method in [rmGet, rmDelete];
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
end;

procedure TRemoteService.LoadRequest(Method: TRttiMethod; const Args: TArray<TValue>);
begin
  FRequest.Headers := Headers;
  FRequest.Method := GetComandFromMethod(Method);
  FRequest.Params := GetURLParams(Method, Args);
  FRequest.URL := FormatURL(Method);

  if GetParamsInURL(Method) and not FRequest.Params.IsEmpty then
  begin
    FRequest.URL := FRequest.URL + '?' + FRequest.Params;

    FRequest.Params := EmptyStr;
  end;
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
  LoadRequest(Method, Args);

  Result := Communication.SendRequest(FRequest);
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

    if Assigned(ReturnType) and ReturnType.IsInstanceExternal and (ReturnType.AsInstanceExternal.ExternalName = 'Promise') then
      ReturnType := nil;

    Result := Deserialize(await(SendRequestAsync(Method, Args)), ReturnType);
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
  LoadRequest(Method, Args);

  Result := await(Communication.SendRequestAsync(FRequest));
end;

{$ENDIF}

{ TRestCommunication }

constructor TRestCommunication.Create;
begin
  inherited;

  FHeaders := TStringList.Create;
end;

destructor TRestCommunication.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

function TRestCommunication.SendRequest(const Request: TRestRequest): String;
{$IFDEF PAS2JS}
var
  Connection: TJSXMLHttpRequest;

  A: Integer;

{$ENDIF}
begin
  FHeaders.Text := Request.Headers;

{$IFDEF PAS2JS}
  Connection := TJSXMLHttpRequest.New;

  Connection.Open(COMMAND_NAME[Request.Method], Request.URL, False);

  for A := 0 to Pred(FHeaders.Count) do
    Connection.setRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  if not Request.Params.IsEmpty then
    Connection.setRequestHeader('Content-Type', 'application/json');

  Connection.Send(Request.Params);

  if Connection.Status = 200 then
    Result := Connection.ResponseText
  else
    raise EHTTPStatusError.Create(Connection.status, Connection.ResponseText);
{$ELSE}
  var Connection := THTTPClient.Create;

  try
    var Response: IHTTPResponse;

    for var A := 0 to Pred(FHeaders.Count) do
      Connection.CustomHeaders[FHeaders.Names[A]] := FHeaders.ValueFromIndex[A];

    case Request.Method of
      rmDelete: Response := Connection.Delete(Request.URL);
      rmGet: Response := Connection.Get(Request.URL);
      rmPatch: Response := Connection.Patch(Request.URL);
      rmPost: Response := Connection.Post(Request.URL, TStream(nil));
      rmPut: Response := Connection.Put(Request.URL);
    end;

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
function TRestCommunication.SendRequestAsync(const Request: TRestRequest): String;
var
  A: Integer;

  Options: TJSObject;

  RequestHeaders: TJSHTMLHeaders;

  Response: TJSResponse;

begin
  FHeaders.Text := Request.Headers;
  Options := TJSObject.New;
  RequestHeaders := TJSHTMLHeaders.New;

  for A := 0 to Pred(FHeaders.Count) do
    RequestHeaders.Append(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  if not Request.Params.IsEmpty then
  begin
    Options['body'] := Request.Params;

    RequestHeaders.Append('Content-Type', 'application/json');
  end;

  Options['headers'] := RequestHeaders;
  Options['method'] := COMMAND_NAME[Request.Method];

  Response := await(Window.Fetch(Request.URL, Options));

  if Response.Status = 200 then
    Result := await(Response.Text)
  else
    raise EHTTPStatusError.Create(Response.Status, await(Response.Text));
end;
{$ENDIF}

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

