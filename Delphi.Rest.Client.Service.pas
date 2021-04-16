unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, Delphi.Rest.JSON.Serializer.Intf;

type
  IRestCommunication = interface
    ['{33BB3249-F044-4BDF-B3E0-EA2378A040C4}']
    function SendRequestAsync(const URL: String): String;{$IFDEF PAS2JS} async;{$ENDIF}
    function SendRequestSync(const URL: String): String;

    procedure SetHeaders(Headers: TStrings);
  end;

  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    FHeaders: TStrings;

    function SendRequestAsync(const URL: String): String;{$IFDEF PAS2JS} async;{$ENDIF}
    function SendRequestSync(const URL: String): String;

    procedure SetHeaders(Headers: TStrings);
  end;

  TClientService = class
  private
    FContext: TRttiContext;
    FRttiType: TRttiInterfaceType;
    FURL: String;
    FSerializer: IRestJsonSerializer;
    FCommunication: IRestCommunication;
    FAsynchronousInvoke: Boolean;
    FOnExecuteException: TProc<Exception, IRestJsonSerializer>;
    FHeaders: TStringList;

    function Deserialize(const JSON: String; Method: TRttiMethod): TValue;
    function FormatURL(Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetCommunication: IRestCommunication;
    function GetHeader(Index: String): String;
    function GetSerializer: IRestJsonSerializer;
    function GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequestAsync(Method: TRttiMethod; const Args: TArray<TValue>): String;{$IFDEF PAS2JS} async;{$ENDIF}
    function SendRequestSync(Method: TRttiMethod; const Args: TArray<TValue>): String;

    procedure OnInvokeMethodAsync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);{$IFDEF PAS2JS} async;{$ENDIF}
    procedure OnInvokeMethodSync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    procedure SetHeader(Index: String; const Value: String);

    {$IFDEF PAS2JS}
    function GenerateParams(Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
    function OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
    function OnInvokeMethodPas2JsAsync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue; async;
    function OnInvokeMethodPas2JsSync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
    {$ELSE}
    procedure OnInvokeMethodDelphi(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    {$ENDIF}
  public
    constructor Create; overload;
    constructor Create(const URL: String; Communication: IRestCommunication; AsynchronousInvoke: Boolean); overload;

    destructor Destroy; override;

    function GetService<T: IInterface>: T;

    property AsynchronousInvoke: Boolean read FAsynchronousInvoke write FAsynchronousInvoke;
    property Communication: IRestCommunication read GetCommunication write FCommunication;
    property Header[Index: String]: String read GetHeader write SetHeader;
    property OnExecuteException: TProc<Exception, IRestJsonSerializer> read FOnExecuteException write FOnExecuteException;
    property Serializer: IRestJsonSerializer read GetSerializer write FSerializer;
    property URL: String read FURL write FURL;
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

{ TClientService }

constructor TClientService.Create;
begin
  inherited Create;

  FContext := TRttiContext.Create;
  FHeaders := TStringList.Create;
end;

constructor TClientService.Create(const URL: String; Communication: IRestCommunication; AsynchronousInvoke: Boolean);
begin
  Create;

  FAsynchronousInvoke := AsynchronousInvoke;
  FCommunication := Communication;
  FURL := URL;
end;

function TClientService.Deserialize(const JSON: String; Method: TRttiMethod): TValue;
begin
  if Assigned(Method.ReturnType) then
    Result := Serializer.Deserialize(JSON, Method.ReturnType.Handle)
  else
    Result := TValue.Empty;
end;

destructor TClientService.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

function TClientService.FormatURL(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Result := Format('%s/%s/%s%s', [FURL, FRttiType.Name.Substring(1), Method.Name, GetURLParams(Method, Args)]);
end;

function TClientService.GetCommunication: IRestCommunication;
begin
  if not Assigned(FCommunication) then
    FCommunication := TRestCommunication.Create;

  Result := FCommunication;
end;

function TClientService.GetHeader(Index: String): String;
begin
  Result := FHeaders.Values[Index];
end;

function TClientService.GetSerializer: IRestJsonSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TRestJsonSerializer.Create;

  Result := FSerializer;
end;

function TClientService.GetService<T>: T;
var
  Instance: TVirtualInterface;

begin
  FRttiType := FContext.GetType(TypeInfo(T)) as TRttiInterfaceType;
  Instance := TVirtualInterface.Create(TypeInfo(T), {$IFDEF PAS2JS}@OnInvokeMethodPas2Js{$ELSE}OnInvokeMethodDelphi{$ENDIF});

  Instance.QueryInterface(FRttiType.GUID, Result);
end;

function TClientService.GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
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

procedure TClientService.OnInvokeMethodSync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  try
    Result := Deserialize(SendRequestSync(Method, Args), Method);
  except
    on E: Exception do
      if Assigned(FOnExecuteException) then
        OnExecuteException(E, Serializer)
      else
        raise;
  end;
end;

procedure TClientService.OnInvokeMethodAsync(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  try
    Result := Deserialize({$IFDEF PAS2JS}await{$ENDIF}(SendRequestAsync(Method, Args)), Method);
  except
    on E: Exception do
      if Assigned(FOnExecuteException) then
        OnExecuteException(E, Serializer)
      else
        raise;
  end;
end;

{$IFDEF DCC}
procedure TClientService.OnInvokeMethodDelphi(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  if FAsynchronousInvoke then
    OnInvokeMethodAsync(Method, Args, Result)
  else
    OnInvokeMethodSync(Method, Args, Result);
end;
{$ENDIF}

function TClientService.SendRequestAsync(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Communication.SetHeaders(FHeaders);

  Result := {$IFDEF PAS2JS}await{$ENDIF}(Communication.SendRequestAsync(FormatURL(Method, Args)));
end;

function TClientService.SendRequestSync(Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Communication.SetHeaders(FHeaders);

  Result := Communication.SendRequestSync(FormatURL(Method, Args));
end;

procedure TClientService.SetHeader(Index: String; const Value: String);
begin
  FHeaders.Values[Index] := Value;
end;

{$IFDEF PAS2JS}
function TClientService.GenerateParams(Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
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

function TClientService.OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
var
  Method: TRttiMethod;

begin
  Method := FRttiType.GetMethod(aMethodName);

  if FAsynchronousInvoke then
    Result := OnInvokeMethodPas2JsAsync(Method, GenerateParams(Method, Args))
  else
    Result := OnInvokeMethodPas2JsSync(Method, GenerateParams(Method, Args));
end;

function TClientService.OnInvokeMethodPas2JsSync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  OnInvokeMethodSync(Method, Args, Return);

  Result := Return.AsJSValue;
end;

function TClientService.OnInvokeMethodPas2JsAsync(Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  await(OnInvokeMethodAsync(Method, Args, Return));

  Result := Return.AsJSValue;
end;
{$ENDIF}

{ TRestCommunication }

function TRestCommunication.SendRequestSync(const URL: String): String;
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

  var Response := Connection.Get(URL);
  var Content := Response.ContentAsString(TEncoding.UTF8);

  try
    if Response.StatusCode = 200 then
      Result := Content
    else
      raise EHTTPStatusError.Create(Response.StatusCode, Content);
  finally
    Connection.Free;
  end;
{$ENDIF}
end;

procedure TRestCommunication.SetHeaders(Headers: TStrings);
begin
  FHeaders := Headers;
end;

function TRestCommunication.SendRequestAsync(const URL: String): String;
{$IFDEF PAS2JS}
var
  A: Integer;

  Response: TJSResponse;

  Headers: TJSHTMLHeaders;

  Config: TJSObject;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  Config := TJSObject.New;
  Headers := TJSHTMLHeaders.New;

  for A := 0 to Pred(FHeaders.Count) do
    Headers.Append(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  Config['headers'] := Headers;

  Response := await(Window.Fetch(URL, Config));

  if Response.OK then
    Result := await(Response.Text)
  else
    raise EHTTPStatusError.Create(Response.status, await(Response.Text));
{$ELSE}
  Result := SendRequestSync(URL);
{$ENDIF}
end;

end.

