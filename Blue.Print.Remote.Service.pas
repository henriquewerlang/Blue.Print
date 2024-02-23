unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF PAS2JS}JSApi.JS, BrowserAPI.Web, BrowserAPI.WebOrWorker{$ELSE}System.Net.HTTPClient{$ENDIF}, Blue.Print.Types, Blue.Print.Serializer;

type
  IHTTPCommunication = interface
    ['{8E39F66A-C72B-4314-80B1-D24F1AF4F247}']
    function SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String): String;
//    {$IFDEF PAS2JS}
//    function SendRequestAsync(const RequestMethod: TRequestMethod; const URL, Body: String): String; async;
//    {$ENDIF}

    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
  end;

  THTTPCommunication = class(TInterfacedObject, IHTTPCommunication)
  private
    FConnection: {$IFDEF PAS2JS}TJSXMLHttpRequest{$ELSE}THTTPClient{$ENDIF};

    function SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String): String;
//{$IFDEF PAS2JS}
//    function SendRequestAsync(const RequestMethod: TRequestMethod; const URL, Body: String): String; async;
//{$ENDIF}

    procedure SetHeader(const HeaderName, Value: String);
  public
    constructor Create;

    destructor Destroy; override;
  end;

  [NodeName('SOAP-ENV:Envelope')]
  TSOAPEnvelop = record
  public
    [NodeName('SOAP-ENV:Body')]
    SOAPBody: TValue;

    constructor Create(const Body: TValue);
  end;

  TRemoteService = class(TVirtualInterface)
  private
    FCommunication: IHTTPCommunication;
    FURL: String;

    FContext: TRttiContext;
    FInterfaceType: TRttiInterfaceType;
    FSerializer: IBluePrintSerializer;

    function BuildRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function EncodeValue(const Value: String): String;
    function GetAttribute<T: TCustomAttribute>(RttiObject: TRttiObject): T;
    function GetParameterType(const Parameter: TRttiParameter): TParameterType;
    function GetRemoteMethodName(const Method: TRttiMethod): String;
    function GetRemoteName(const RttiObject: TRttiObject; const DefaultName: String): String;
    function GetRemoteServiceName: String;
    function GetRequestMethod(const Method: TRttiMethod): TRequestMethod;
    function GetPathParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetQueryParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetSerializer: IBluePrintSerializer;
    function GetSOAPActionName(const Method: TRttiMethod): String;
    function IsSOAPRequest: Boolean;
    function LoadRequestBody(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>): TValue;

    procedure ForEachParam(const Method: TRttiMethod; const Args: TArray<TValue>; const Proc: TProc<TRttiParameter, TValue>);
    procedure LoadAuthorization(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadParams(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
    procedure LoadRequestHeaders(const Method: TRttiMethod);
  protected
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue); virtual;

    property InterfaceType: TRttiInterfaceType read FInterfaceType;
  public
    constructor Create(const TypeInfo: PTypeInfo; const Serializer: IBluePrintSerializer);

    destructor Destroy; override;

    class function CreateService<T: IInvokable>(const URL: String): T; overload;
    class function CreateService<T: IInvokable>(const URL: String; const Serializer: IBluePrintSerializer): T; overload;

    function GetService<T: IInvokable>(const URL: String): T;

    property Communication: IHTTPCommunication read FCommunication write FCommunication;
    property Serializer: IBluePrintSerializer read GetSerializer write FSerializer;
  end;

implementation

{$IFDEF DCC}
uses System.Net.Mime, System.NetConsts, System.Net.URLClient, System.NetEncoding, Web.HTTPApp;
{$ENDIF}

const
  AUTHORIZATION_HEADER = 'Authorization';
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};
  CONTENT_TYPE_HEADER = 'Content-Type';
  SOAP_ACTION_HEADER = 'SOAPAction';

{ TRemoteService }

function TRemoteService.BuildRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Result := FURL + GetRemoteServiceName + GetRemoteMethodName(Method) + GetPathParams(Method, Args) + GetQueryParams(Method, Args);
end;

constructor TRemoteService.Create(const TypeInfo: PTypeInfo; const Serializer: IBluePrintSerializer);
begin
  inherited Create(TypeInfo, {$IFDEF PAS2JS}@{$ENDIF}OnInvokeMethod);

  FCommunication := THTTPCommunication.Create;
  FContext := TRttiContext.Create;
  FInterfaceType := FContext.GetType(TypeInfo) as TRttiInterfaceType;
  FSerializer := Serializer;
end;

class function TRemoteService.CreateService<T>(const URL: String; const Serializer: IBluePrintSerializer): T;
var
  RemoteService: TRemoteService;

begin
  RemoteService := TRemoteService.Create(TypeInfo(T), Serializer);
  Result := RemoteService.GetService<T>(URL);
end;

class function TRemoteService.CreateService<T>(const URL: String): T;
begin
  Result := CreateService<T>(URL, TBluePrintJsonSerializer.Create);
end;

destructor TRemoteService.Destroy;
begin
  FContext.Free;

  inherited;
end;

function TRemoteService.EncodeValue(const Value: String): String;
begin
  Result := {$IFDEF PAS2JS}EncodeURIComponent{$ELSE}TNetEncoding.URL.Encode{$ENDIF}(Value);
end;

procedure TRemoteService.ForEachParam(const Method: TRttiMethod; const Args: TArray<TValue>; const Proc: TProc<TRttiParameter, TValue>);
var
  Parameter: TRttiParameter;

  ValueIndex: Integer;

begin
  ValueIndex := COMPILER_OFFSET;

  for Parameter in Method.GetParameters do
  begin
    Proc(Parameter, Args[ValueIndex]);

    Inc(ValueIndex);
  end;
end;

function TRemoteService.GetAttribute<T>(RttiObject: TRttiObject): T;
begin
  repeat
    Result := RttiObject.GetAttribute<T>;
    RttiObject := RttiObject.Parent;
  until Assigned(Result) or not Assigned(RttiObject);
end;

function TRemoteService.GetParameterType(const Parameter: TRttiParameter): TParameterType;
var
  ParameterAttribute: TParameterAttribute;

begin
  ParameterAttribute := GetAttribute<TParameterAttribute>(Parameter);

  if Assigned(ParameterAttribute) then
    Result := ParameterAttribute.ParamType
  else if Parameter.ParamType.IsInstance then
    Result := TParameterType.Body
  else
    Result := TParameterType.Query;
end;

function TRemoteService.GetPathParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  PathParams: String;

begin
  PathParams := EmptyStr;

  LoadParams(Method,
    procedure (Parameter: TRttiParameter; Value: TValue)
    begin
      PathParams := PathParams + '/' + EncodeValue(Value.ToString);
    end, TParameterType.Path, Args);

  Result := PathParams;
end;

function TRemoteService.GetQueryParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  QueryParams: String;

begin
  QueryParams := EmptyStr;

  LoadParams(Method,
    procedure(Parameter: TRttiParameter; Value: TValue)
    begin
      if not QueryParams.IsEmpty then
        QueryParams := QueryParams + '&';

      QueryParams := QueryParams + Format('%s=%s', [EncodeValue(Parameter.Name), EncodeValue(Value.ToString)]);
    end, TParameterType.Query, Args);

  if not QueryParams.IsEmpty then
    QueryParams := '/?' + QueryParams;

  Result := QueryParams;
end;

function TRemoteService.GetRemoteMethodName(const Method: TRttiMethod): String;
begin
  if IsSOAPRequest then
    Result := EmptyStr
  else
    Result := GetRemoteName(Method, Method.Name);
end;

function TRemoteService.GetRemoteName(const RttiObject: TRttiObject; const DefaultName: String): String;
var
  RemoteName: RemoteNameAttribute;

begin
  RemoteName := RttiObject.GetAttribute<RemoteNameAttribute>;

  if Assigned(RemoteName) then
    Result := RemoteName.RemoteName
  else
    Result := DefaultName;

  Result := EncodeValue(Result);

  if not Result.IsEmpty then
    Result := '/' + Result;
end;

function TRemoteService.GetRemoteServiceName: String;
begin
  Result := GetRemoteName(InterfaceType, InterfaceType.Name);
end;

function TRemoteService.GetRequestMethod(const Method: TRttiMethod): TRequestMethod;
var
  RequestMethod: TRequestMethodAttribute;

begin
  RequestMethod := GetAttribute<TRequestMethodAttribute>(Method);

  if Assigned(RequestMethod) then
    Result := RequestMethod.Method
  else
    Result := TRequestMethod.Post;
end;

function TRemoteService.GetSerializer: IBluePrintSerializer;
begin
  if not Assigned(FSerializer) then
    if IsSOAPRequest then
      FSerializer := TBluePrintXMLSerializer.Create
    else
      FSerializer := TBluePrintJsonSerializer.Create;

  Result := FSerializer;
end;

function TRemoteService.GetService<T>(const URL: String): T;
begin
  FURL := URL;

  QueryInterface(InterfaceType.GUID, Result);
end;

function TRemoteService.GetSOAPActionName(const Method: TRttiMethod): String;
var
  SOAPAction: SoapActionAttribute;

begin
  SOAPAction := GetAttribute<SoapActionAttribute>(Method);

  if Assigned(SOAPAction) then
    Result := SOAPAction.ActionName
  else
    Result := Method.Name;
end;

function TRemoteService.IsSOAPRequest: Boolean;
begin
  Result := Assigned(GetAttribute<SoapServiceAttribute>(FInterfaceType));
end;

procedure TRemoteService.LoadAuthorization(const Method: TRttiMethod; const Args: TArray<TValue>);
begin
   ForEachParam(Method, Args,
    procedure (Parameter: TRttiParameter; Value: TValue)
    var
      Authorization: AuthorizationAttribute;

    begin
      Authorization := GetAttribute<AuthorizationAttribute>(Parameter);

      if Assigned(Authorization) then
        Communication.Header[AUTHORIZATION_HEADER] := Value.ToString;
    end);
end;

procedure TRemoteService.LoadParams(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
begin
  ForEachParam(Method, Args,
    procedure (Parameter: TRttiParameter; Value: TValue)
    begin
      if GetParameterType(Parameter) = ParameterType then
        LoadFunction(Parameter, Value);
    end);
end;

function TRemoteService.LoadRequestBody(const Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  Body: String;

begin
  Body := EmptyStr;

  LoadParams(Method,
    procedure(Parameter: TRttiParameter; Value: TValue)
    begin
      if IsSOAPRequest then
        Body := FSerializer.Serialize(TValue.From(TSOAPEnvelop.Create(Value)))
      else
        Body := FSerializer.Serialize(Value);
    end, TParameterType.Body, Args);

  Result := Body;
end;

procedure TRemoteService.LoadRequestHeaders(const Method: TRttiMethod);
var
  ContentType: ContentTypeAttribute;

begin
  ContentType := GetAttribute<ContentTypeAttribute>(Method);

  if IsSOAPRequest then
    Communication.Header[SOAP_ACTION_HEADER] := GetSOAPActionName(Method);

  if Assigned(ContentType) then
    Communication.Header[CONTENT_TYPE_HEADER] := ContentType.ContentType;
end;

procedure TRemoteService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
{$IFDEF PAS2JS}
  function SendRequestAsync: TJSPromise;
  begin
    Result := TJSPromise.New(
      procedure (Resolve: TProc<TValue>)
      begin
        Resolve(SendRequest(Method, Args));
      end);
  end;
{$ENDIF}

begin
{$IFDEF PAS2JS}
    if Method.IsAsyncCall then
      Result := TValue.From(SendRequestAsync)
    else
{$ENDIF}
  Result := SendRequest(Method, Args);
end;

function TRemoteService.SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>): TValue;
var
  Response: String;

begin
  LoadRequestHeaders(Method);

  LoadAuthorization(Method, Args);

  Response := Communication.SendRequest(GetRequestMethod(Method), BuildRequestURL(Method, Args), LoadRequestBody(Method, Args));

  if Assigned(Method.ReturnType) then
    Result := FSerializer.Deserialize(Response, Method.ReturnType.Handle);
end;

{ THTTPCommunication }

constructor THTTPCommunication.Create;
begin
  FConnection := {$IFDEF PAS2JS}TJSXMLHttpRequest.New{$ELSE}THTTPClient.Create{$ENDIF};
end;

destructor THTTPCommunication.Destroy;
begin
  {$IFDEF PAS2JS}
  FConnection := nil
  {$ELSE}
  FConnection.Free;
  {$ENDIF};

  inherited;
end;

function THTTPCommunication.SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String): String;
const
  REQUEST_METHOD_NAME: array[TRequestMethod] of String = ('DELETE', 'GET', 'PATCH', 'POST', 'PUT');

{$IFDEF PAS2JS}
var
  A: Integer;

  Connection: TJSXMLHttpRequest;

  procedure DownloadFile(const URL: String); async;
  var
    Anchor: TJSHTMLAnchorElement;

  begin
    Anchor := Document.CreateElement('a') as TJSHTMLAnchorElement;
    Anchor.HRef := URL;
    Anchor.Style.cssText := 'display:none';

    Document.Body.AppendChild(Anchor);

    Anchor.Click();

    Document.Body.RemoveChild(Anchor);
  end;
{$ENDIF}

  procedure CheckStatusCode(const StatusCode: Integer; const URL: String);
  begin
    if (StatusCode < 200) or (StatusCode > 299) then
      raise EHTTPStatusError.Create(StatusCode, Result);
  end;

begin
{$IFDEF PAS2JS}
//  if Request.FileDownload then
//    DownloadFile(Request.URL)
//  else
//  begin

  FConnection.Open(REQUEST_METHOD_NAME[RequestMethod], URL, False);

//  for A := 0 to Pred(FHeaders.Count) do
//    Connection.SetRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

  FConnection.Send();

  Result := FConnection.ResponseText;

  CheckStatusCode(FConnection.Status, URL);
{$ELSE}
  var BodyStream := TStringStream.Create(Body, TEncoding.UTF8);
  FConnection.ResponseTimeout := -1;
  FConnection.SendTimeout := -1;

  var Response := FConnection.Execute(REQUEST_METHOD_NAME[RequestMethod], URL, BodyStream) as IHTTPResponse;
  Result := Response.ContentAsString;

  BodyStream.Free;

  CheckStatusCode(Response.StatusCode, URL);
{$ENDIF}
end;

//{$IFDEF PAS2JS}
//function THTTPCommunication.SendRequestAsync(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
//var
//  A: Integer;
//
//  Options: TJSFetchInit;
//
//  Response: TJSResponse;
//
//begin
//  if Request.FileDownload then
//    await(DownloadFile(Request.URL))
//  else
//  begin
//    FHeaders.Text := Request.Headers;
//    Options := TJSFetchInit.New;
//    Options.Method := RESTRequestMethodToString(Request.Method);
//
//    if FHeaders.Count > 0 then
//    begin
//      Options.Headers := TJSHTMLHeaders.New;
//
//      for A := 0 to Pred(FHeaders.Count) do
//        Options.Headers.Append(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);
//    end;
//
//    if not Request.Body.IsEmpty then
//      Options.Body := Request.Body.AsJSValue;
//
//    Response := await(Window.Fetch(Request.URL, Options));
//
//    Result := await(Response.Text);
//
//    if Response.Status <> 200 then
//      raise EHTTPStatusError.Create(Response.Status, Request.URL, Result);
//  end;
//end;
//{$ENDIF}

procedure THTTPCommunication.SetHeader(const HeaderName, Value: String);
begin
  {$IFDEF PAS2JS}
  FConnection.setRequestHeader(HeaderName, Value);
  {$ELSE}
  FConnection.CustomHeaders[HeaderName] := Value;
  {$ENDIF}
end;

{ TSOAPEnvelop }

constructor TSOAPEnvelop.Create(const Body: TValue);
begin
  SOAPBody := Body;
end;

end.

