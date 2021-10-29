unit Delphi.Rest.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF DCC}System.Net.HTTPClient, {$ENDIF}Delphi.Rest.Types, Delphi.Rest.JSON.Serializer.Intf;

type
  TRestRequest = class
  public
    Body: TValue;
    Headers: String;
    Method: TRESTMethod;
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
    {$IFDEF DCC}
    FConnection: THTTPClient;
    {$ENDIF}

    {$IFDEF DCC}
    function GetConnection: THTTPClient;
    {$ENDIF}
    function SendRequest(const Request: TRestRequest): String;
    {$IFDEF PAS2JS}
    function SendRequestAsync(const Request: TRestRequest): String; async;
    {$ENDIF}

    {$IFDEF DCC}
    property Connection: THTTPClient read GetConnection;
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
    FFormData: TRESTFormData;

    function Deserialize(const JSON: String; RttiType: TRttiType): TValue;
    function GetComandFromMethod(const Method: TRttiMethod): TRESTMethod;
    function GetFormData: TRESTFormData;
    function GetHeader(const Index: String): String;
    function GetHeaders: String;
    function GetParamsInURL(const Method: TRttiMethod): Boolean;
    function SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>): String;

    procedure AddFormDataField(const Param: TRttiParameter; const ParamValue: String);
    procedure AddFormDataFile(const Param: TRttiParameter; const AFile: TRESTFile);
    procedure AddParamToTheBody(const Param: TRttiParameter; const ParamValue: TValue; const ForceLoadFormData: Boolean);
    procedure LoadRequest(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadRequestParams(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    procedure SetHeader(const Index, Value: String);
    procedure SetHeaders(const Value: String);

    {$IFDEF PAS2JS}
    function GenerateParams(const Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
    function OnInvokeMethodPas2Js(const AMethodName: String; const Args: TJSValueDynArray): JSValue;
    function OnInvokeMethodPas2JsAsync(const Method: TRttiMethod; const Args: TArray<TValue>): JSValue; async;
    function OnInvokeMethodPas2JsSync(const Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
    function SendRequestAsync(const Method: TRttiMethod; const Args: TArray<TValue>): String; async;

    procedure OnInvokeMethodAsync(const Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue); async;
    {$ENDIF}

    property FormData: TRESTFormData read GetFormData;
  public
    constructor Create(TypeInfo: PTypeInfo);

    destructor Destroy; override;

    property Communication: IRestCommunication read FCommunication write FCommunication;
    property Header[const Index: String]: String read GetHeader write SetHeader;
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
    function GetCommunication: IRestCommunication;
    function GetSerializer: IRestJsonSerializer;
  public
    class constructor Create;

    class function GetService<I: IInterface>: I; overload;
    class function GetService<I: IInterface>(const URL: String): I; overload;

    property Communication: IRestCommunication read GetCommunication write FCommunication;
    property Headers: String read FHeaders write FHeaders;
    property OnExecuteException: TProc<Exception, IRestJsonSerializer> read FOnExecuteException write FOnExecuteException;
    property Serializer: IRestJsonSerializer read GetSerializer write FSerializer;
    property URL: String read FURL write FURL;

    class property Instance: TRemoteServiceFactory read GetRemoteServiceFactory;
  end;

implementation

uses Delphi.Rest.Exceptions,
{$IFDEF PAS2JS}
  JS, Web, Pas2Js.Rest.JSON.Serializers
{$ELSE}
  Delphi.Rest.JSON.Serializer
{$ENDIF};

const
  COMMAND_NAME: array[TRESTMethod] of String = ('DELETE', 'GET', 'PATCH', 'POST', 'PUT');
  COMPILER_OFFSET = 1;

{ TRemoteService }

procedure TRemoteService.AddFormDataField(const Param: TRttiParameter; const ParamValue: String);
begin
{$IFDEF PAS2JS}
  FormData.Append(Param.Name, ParamValue);
{$ELSE}
  FormData.AddField(Param.Name, ParamValue);
{$ENDIF}
end;

procedure TRemoteService.AddFormDataFile(const Param: TRttiParameter; const AFile: TRESTFile);
begin
{$IFDEF PAS2JS}
  FormData.Append(Param.Name, AFile);
{$ELSE}
  FormData.AddStream(Param.Name, AFile.Stream, AFile.FileName);
{$ENDIF}
end;

procedure TRemoteService.AddParamToTheBody(const Param: TRttiParameter; const ParamValue: TValue; const ForceLoadFormData: Boolean);
var
  AFile: TRESTFile;

begin
  if ParamValue.IsType<TRESTFile>(False) then
    if ForceLoadFormData then
      AddFormDataFile(Param, ParamValue.AsType<TRESTFile>)
    else
      FRequest.Body := ParamValue
  else if (Param.ParamType is TRttiDynamicArrayType) and (TRttiDynamicArrayType(Param.ParamType).ElementType.Handle = TypeInfo(TRESTFile)) then
    for AFile in ParamValue.AsType<TArray<TRESTFile>> do
      AddFormDataFile(Param, AFile)
  else if ForceLoadFormData then
    AddFormDataField(Param, Serializer.Serialize(ParamValue))
  else
    FRequest.Body := TValue.From(Serializer.Serialize(ParamValue));
end;

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
  FRequest.Free;

  FHeaders.Free;

{$IFDEF DCC}
  FFormData.Free;
{$ENDIF}

  inherited;
end;

function TRemoteService.GetComandFromMethod(const Method: TRttiMethod): TRESTMethod;
begin
  if not TRESTMethodAttribute.GetMethodType(Method, Result) then
    Result := rmGet;
end;

function TRemoteService.GetFormData: TRESTFormData;
begin
  if not Assigned(FFormData) then
    FFormData := TRESTFormData.{$IFDEF PAS2JS}new{$ELSE}Create{$ENDIF};

  Result := FFormData;
end;

function TRemoteService.GetHeader(const Index: String): String;
begin
  Result := FHeaders.Values[Index];
end;

function TRemoteService.GetHeaders: String;
begin
  Result := FHeaders.Text;
end;

function TRemoteService.GetParamsInURL(const Method: TRttiMethod): Boolean;
var
  ParamType: TRESTParamType;

begin
  if TRESTParamAttribute.GetParamsInURL(Method, ParamType) then
    Result := ParamType = ptURL
  else
    Result := FRequest.Method in [rmGet, rmDelete];
end;

procedure TRemoteService.LoadRequest(const Method: TRttiMethod; const Args: TArray<TValue>);
begin
  FRequest.Free;

{$IFDEF PAS2JS}
  FFormData := nil;
{$ELSE}
  FreeAndNil(FFormData);
{$ENDIF}

  FRequest := TRestRequest.Create;
  FRequest.Headers := Headers;
  FRequest.Method := GetComandFromMethod(Method);

  LoadRequestURL(Method, Args);
end;

procedure TRemoteService.LoadRequestParams(const Method: TRttiMethod; const Args: TArray<TValue>);
var
  Params: TArray<TRttiParameter>;

  ParamsInURL: Boolean;

  function ForceFormDataInParams: Boolean;
  var
    ParamValue: TValue;

    FileInParam: Boolean;

  begin
    FileInParam := False;
    Result := not ParamsInURL and (Length(Params) > 1);

    if not Result then
      for ParamValue in Args do
      begin
        Result := Result or ParamValue.IsType<TRESTFile>(False) and FileInParam;

        FileInParam := FileInParam or ParamValue.IsType<TRESTFile>(False);
      end;
  end;

var
  A: Integer;

  ParamValue: TValue;

  ForceFormData: Boolean;

begin
  FRequest.URL := EmptyStr;
  ParamsInURL := GetParamsInURL(Method);
  Params := Method.GetParameters;

  ForceFormData := ForceFormDataInParams;

  for A := Low(Params) to High(Params) do
  begin
    ParamValue := Args[COMPILER_OFFSET + A];

    if ParamValue.IsType<TRESTFile>(False) or ParamValue.IsType<TArray<TRESTFile>>(False) or not ParamsInURL then
      AddParamToTheBody(Params[A], ParamValue, ForceFormData)
    else
    begin
      if not FRequest.URL.IsEmpty then
        FRequest.URL := FRequest.URL + '&';

      FRequest.URL := FRequest.URL + Format('%s=%s', [Params[A].Name, Serializer.Serialize(ParamValue)]);
    end;
  end;

  if Assigned(FFormData) then
    FRequest.Body := TValue.From(FormData);

  if not FRequest.URL.IsEmpty then
    FRequest.URL := '?' + FRequest.URL
end;


procedure TRemoteService.LoadRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>);
begin
  LoadRequestParams(Method, Args);

  FRequest.URL := Format('%s/%s/%s', [FURL, FRttiType.Name.Substring(1), Method.Name]) + FRequest.URL;
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

function TRemoteService.SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  LoadRequest(Method, Args);

  Result := Communication.SendRequest(FRequest);
end;

procedure TRemoteService.SetHeader(const Index, Value: String);
begin
  FHeaders.Values[Index] := Value;
end;

procedure TRemoteService.SetHeaders(const Value: String);
begin
  FHeaders.Text := Value;
end;

{$IFDEF PAS2JS}
function TRemoteService.GenerateParams(const Method: TRttiMethod; const Args: TJSValueDynArray): TArray<TValue>;
var
  A: Integer;

  Return: TValue;

  Param: TRttiParameter;

  Parameters: TArray<TRttiParameter>;

begin
  Parameters := Method.GetParameters;

  SetLength(Result, Succ(Length(Args)));

  for A := Low(Args) to High(Args) do
    TValue.Make(Args[A], Parameters[A].ParamType.Handle, Result[COMPILER_OFFSET + A]);
end;

function TRemoteService.OnInvokeMethodPas2Js(const AMethodName: String; const Args: TJSValueDynArray): JSValue;
var
  Method: TRttiMethod;

begin
  Method := FRttiType.GetMethod(aMethodName);

  if Method.IsAsyncCall then
    Result := OnInvokeMethodPas2JsAsync(Method, GenerateParams(Method, Args))
  else
    Result := OnInvokeMethodPas2JsSync(Method, GenerateParams(Method, Args));
end;

function TRemoteService.OnInvokeMethodPas2JsAsync(const Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  await(OnInvokeMethodAsync(Method, Args, Return));

  Result := Return.AsJSValue;
end;

function TRemoteService.OnInvokeMethodPas2JsSync(const Method: TRttiMethod; const Args: TArray<TValue>): JSValue;
var
  Return: TValue;

begin
  OnInvokeMethod(Method, Args, Return);

  Result := Return.AsJSValue;
end;

procedure TRemoteService.OnInvokeMethodAsync(const Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
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

function TRemoteService.SendRequestAsync(const Method: TRttiMethod; const Args: TArray<TValue>): String;
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

{$IFDEF DCC}
  FConnection.Free;
{$ENDIF}

  inherited;
end;

{$IFDEF DCC}
function TRestCommunication.GetConnection: THTTPClient;
begin
  if not Assigned(FConnection) then
    FConnection := THTTPClient.Create;

  Result := FConnection;
end;
{$ENDIF}

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

  Connection.Send(Request.Body.AsJSValue);

  if Connection.Status = 200 then
    Result := Connection.ResponseText
  else
    raise EHTTPStatusError.Create(Connection.status, Connection.ResponseText);
{$ELSE}
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

  Result := Response.ContentAsString(TEncoding.UTF8);

  if Response.StatusCode <> 200 then
    raise EHTTPStatusError.Create(Response.StatusCode, Result);
{$ENDIF}
end;

{$IFDEF PAS2JS}
function TRestCommunication.SendRequestAsync(const Request: TRestRequest): String;
var
  A: Integer;

  Options: TJSFetchInit;

  Response: TJSResponse;

begin
  FHeaders.Text := Request.Headers;
  Options := TJSFetchInit.New;
  Options.Method := COMMAND_NAME[Request.Method];

  if FHeaders.Count > 0 then
  begin
    Options.Headers := TJSHTMLHeaders.New;

    for A := 0 to Pred(FHeaders.Count) do
      Options.Headers.Append(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);
  end;

  if not Request.Body.IsEmpty then
    Options.Body := Request.Body.AsJSValue;

  Response := await(Window.Fetch(Request.URL, Options));

  Result := await(Response.Text);

  if Response.Status <> 200 then
    raise EHTTPStatusError.Create(Response.Status, Result);
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

function TRemoteServiceFactory.GetCommunication: IRestCommunication;
begin
  if not Assigned(FCommunication) then
    FCommunication := TRestCommunication.Create;

  Result := FCommunication;
end;

class function TRemoteServiceFactory.GetRemoteServiceFactory: TRemoteServiceFactory;
begin
  Result := TRemoteServiceFactory(GRemoteServiceFactory);
end;

function TRemoteServiceFactory.GetSerializer: IRestJsonSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TRestJsonSerializer.Create;

  Result := FSerializer;
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

