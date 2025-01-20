unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF PAS2JS}JSApi.JS, BrowserAPI.Web, BrowserAPI.WebOrWorker{$ELSE}System.Net.URLClient, System.Net.HTTPClient{$ENDIF}, Blue.Print.Types, Blue.Print.Serializer;

type
  IAuthorization = interface
    ['{D5474FD1-CE92-4FCC-AA6E-6E88562A7F55}']
    procedure SetAuthorizationValue(const Value: String);
    procedure SetCertificate(const Value: TStream; const Password: String);

    property Value: String write SetAuthorizationValue;
  end;

  IHeaders = interface
    ['{A21DC397-0661-4FFE-A4DF-609FE127C1FD}']
    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
  end;

  IHTTPCommunication = interface
    ['{8E39F66A-C72B-4314-80B1-D24F1AF4F247}']
    procedure SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
    procedure SetCertificate(const Value: TStream; const Password: String);
    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
  end;

  THTTPCommunication = class(TInterfacedObject, IHTTPCommunication)
  private
    FCertificatePassword: String;
    FCertificateValue: TStream;
    FConnection: {$IFDEF PAS2JS}TJSXMLHttpRequest{$ELSE}THTTPClient{$ENDIF};
    FHeaders: TStringList;

{$IFDEF DCC}
    procedure LoadCertificate(const Sender: TObject; const ARequest: TURLRequest; const ACertificateList: TCertificateList; var AnIndex: Integer);
{$ENDIF}
    procedure LoadHeaders;
    procedure SendRequest(const RequestMethod: TRequestMethod; const URLString, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
    procedure SetCertificate(const Value: TStream; const Password: String);
    procedure SetHeader(const HeaderName, Value: String);
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TRemoteService = class(TVirtualInterface, IAuthorization, IHeaders)
  private
    FCommunication: IHTTPCommunication;
    FContext: TRttiContext;
    FInterfaceType: TRttiInterfaceType;
    FSerializer: IBluePrintSerializer;
    FURL: String;

    function BuildRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function EncodeValue(const Value: String): String;
    function GetAttribute<T: TCustomAttribute>(RttiObject: TRttiObject): T;
    function GetAttributes<T: TCustomAttribute>(RttiObject: TRttiObject): TArray<T>;
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
    function LoadRequestBodyAndHeaders(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>; const AsyncRequest: Boolean; const ReturnEvent: TProc<TValue>; const ErrorEvent: TProc<Exception>): TValue;

    procedure ForEachParam(const Method: TRttiMethod; const Args: TArray<TValue>; const Proc: TProc<TRttiParameter, TValue>);
    procedure LoadAuthorization(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadParams(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
    procedure LoadRequestHeaders(const Method: TRttiMethod; const LoadBodyContentType: Boolean);
    procedure SetAuthorizationValue(const Value: String);
    procedure SetCertificate(const Value: TStream; const Password: String);
    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
  protected
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue); virtual;

    property InterfaceType: TRttiInterfaceType read FInterfaceType;
  public
    constructor Create(const TypeInfo: PTypeInfo; const Serializer: IBluePrintSerializer);

    destructor Destroy; override;

    class function CreateService<T: IInvokable>(const URL: String; const Serializer: IBluePrintSerializer = nil): T;

    function GetService<T: IInvokable>(const URL: String): T;

    property Communication: IHTTPCommunication read FCommunication write FCommunication;
    property Serializer: IBluePrintSerializer read GetSerializer write FSerializer;
  end;

implementation

{$IFDEF DCC}
uses System.Net.Mime, System.NetConsts, System.NetEncoding, Web.HTTPApp, REST.Types;
{$ENDIF}

const
  AUTHORIZATION_HEADER = 'Authorization';
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};
  CONTENT_TYPE_HEADER = 'Content-Type';
{$IFDEF PAS2JS}
  CONTENTTYPE_APPLICATION_SOAP_XML = 'application/soap+xml';
  CONTENTTYPE_TEXT_PLAIN = 'text/plain';
{$ENDIF}

{$IFDEF DCC}
procedure ValidateCertificate(const Sender: TObject; const ARequest: TURLRequest; const Certificate: TCertificate; var Accepted: Boolean);
begin
  Accepted := True;
end;
{$ENDIF}

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
var
  Attributes: TArray<T>;

begin
  Attributes := GetAttributes<T>(RttiObject);

  if Assigned(Attributes) then
    Result := Attributes[0] as T
  else
    Result := nil;
end;

function TRemoteService.GetAttributes<T>(RttiObject: TRttiObject): TArray<T>;
var
  Attribute: TCustomAttribute;

begin
  Result := nil;

  if Assigned(RttiObject) then
  begin
    for Attribute in RttiObject.GetAttributes do
      if Attribute is T then
        Result := Result + [Attribute as T];

    Result := Result + GetAttributes<T>(RttiObject.Parent);
  end;
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
  Result := GetAttribute<SoapServiceAttribute>(FInterfaceType).BaseAction + '/' ;
  SOAPAction := GetAttribute<SoapActionAttribute>(Method);

  if Assigned(SOAPAction) then
    Result := Result + SOAPAction.ActionName
  else
    Result := Result + Method.Name;
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
        Header[AUTHORIZATION_HEADER] := Value.ToString;
    end);
end;

procedure TRemoteService.LoadParams(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
begin
  ForEachParam(Method, Args,
    procedure (Parameter: TRttiParameter; Value: TValue)
    begin
      if (Parameter.GetAttribute<AuthorizationAttribute> = nil) and (GetParameterType(Parameter) = ParameterType) then
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
        Value := TValue.From(TSOAPEnvelop.Create(Parameter, Value));

      Body := Serializer.Serialize(Value);
    end, TParameterType.Body, Args);

  Result := Body;
end;

function TRemoteService.LoadRequestBodyAndHeaders(const Method: TRttiMethod; const Args: TArray<TValue>): String;
begin
  Result := LoadRequestBody(Method, Args);

  LoadRequestHeaders(Method, not Result.IsEmpty);
end;

procedure TRemoteService.LoadRequestHeaders(const Method: TRttiMethod; const LoadBodyContentType: Boolean);
var
  Attribute: HeaderAttribute;
  CharSet: String;
  CharSetAttr: CharSetAttribute;
  ContentTypeAttr: ContentTypeAttribute;
  ContentTypeText: String;

begin
  ContentTypeAttr := GetAttribute<ContentTypeAttribute>(Method);
  CharSetAttr := GetAttribute<CharSetAttribute>(Method);

  for Attribute in GetAttributes<HeaderAttribute>(Method) do
    Header[Attribute.Name] := Attribute.Value;

  if IsSOAPRequest then
    ContentTypeText := Format('%s;action=%s', [CONTENTTYPE_APPLICATION_SOAP_XML, GetSOAPActionName(Method)])
  else if Assigned(ContentTypeAttr) then
    ContentTypeText := ContentTypeAttr.ContentType
  else if LoadBodyContentType then
    ContentTypeText := FSerializer.ContentType
  else
    ContentTypeText := CONTENTTYPE_TEXT_PLAIN;

  if Assigned(CharSetAttr) then
    CharSet := CharSetAttr.CharSet
  else
    CharSet := 'utf-8';

  if not CharSet.IsEmpty then
    CharSet := ';charset=' + CharSet;

  Header[CONTENT_TYPE_HEADER] := ContentTypeText + CharSet;
end;

procedure TRemoteService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
var
  Error: Exception;
  ReturnValue: TValue;

{$IFDEF PAS2JS}
  function SendRequestAsync: TJSPromise;
  begin
    Result := TJSPromise.New(
      procedure (Resolve, Reject: TProc<JSValue>)
      begin
        SendRequest(Method, Args, True,
          procedure (Value: TValue)
          begin
            Resolve(Value.AsJSValue);
          end,
          procedure (Error: Exception)
          begin
            Reject(Error);
          end);
      end);
  end;
{$ENDIF}

begin
{$IFDEF PAS2JS}
    if Method.IsAsyncCall then
      Result := TValue.From(SendRequestAsync)
    else
{$ENDIF}
  begin
    Error := nil;

    SendRequest(Method, Args, False,
      procedure (Value: TValue)
      begin
        ReturnValue := Value;
      end,
      procedure (E: Exception)
      begin
        Error := E;
      end);

    Result := ReturnValue;

    if Assigned(Error) then
      raise Error;
  end;
end;

function TRemoteService.SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>; const AsyncRequest: Boolean; const ReturnEvent: TProc<TValue>; const ErrorEvent: TProc<Exception>): TValue;
begin
  LoadAuthorization(Method, Args);

  Communication.SendRequest(GetRequestMethod(Method), BuildRequestURL(Method, Args), LoadRequestBodyAndHeaders(Method, Args), AsyncRequest, Method.ReturnType.IsInstance and (Method.ReturnType.AsInstance.MetaclassType = TStream),
    procedure(ContentString: String; ContentStream: TStream)
    begin
      if Assigned(Method.ReturnType) then
        if Assigned(ContentStream) then
          ReturnEvent(TValue.From(ContentStream))
        else
          ReturnEvent(Serializer.Deserialize(ContentString, Method.ReturnType.Handle))
      else
        ReturnEvent(TValue.Empty);
    end, ErrorEvent);
end;

procedure TRemoteService.SetAuthorizationValue(const Value: String);
begin
  Header[AUTHORIZATION_HEADER] := Value;
end;

procedure TRemoteService.SetCertificate(const Value: TStream; const Password: String);
begin
  Communication.SetCertificate(Value, Password)
end;

procedure TRemoteService.SetHeader(const HeaderName, Value: String);
begin
  Communication.Header[HeaderName] := Value;
end;

{ THTTPCommunication }

constructor THTTPCommunication.Create;
begin
  inherited;

  {$IFDEF DCC}
  FConnection := THTTPClient.Create;
  FConnection.OnNeedClientCertificate := LoadCertificate;
  FConnection.ValidateServerCertificateCallback := ValidateCertificate;
  {$ENDIF}
  FHeaders := TStringList.Create;
end;

destructor THTTPCommunication.Destroy;
begin
  {$IFDEF DCC}
  FConnection.Free;
  {$ENDIF};

  FHeaders.Free;

  inherited;
end;

{$IFDEF DCC}
procedure THTTPCommunication.LoadCertificate(const Sender: TObject; const ARequest: TURLRequest; const ACertificateList: TCertificateList; var AnIndex: Integer);
begin
  var Request: IHTTPRequest := ARequest as THTTPRequest;

  Request.SetClientCertificate(FCertificateValue, FCertificatePassword);
end;
{$ENDIF}

procedure THTTPCommunication.LoadHeaders;
var
  A: Integer;

begin
  for A := 0 to Pred(FHeaders.Count) do
    {$IFDEF PAS2JS}
    FConnection.SetRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);
    {$ELSE}
    FConnection.CustomHeaders[FHeaders.Names[A]] := FHeaders.ValueFromIndex[A];
    {$ENDIF}
end;

procedure THTTPCommunication.SendRequest(const RequestMethod: TRequestMethod; const URLString, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
const
  REQUEST_METHOD_NAME: array[TRequestMethod] of String = ('DELETE', 'GET', 'PATCH', 'POST', 'PUT', 'OPTIONS');

var
  ContentStream: TStream;
  ContentString: String;

{$IFDEF PAS2JS}
  procedure DownloadFile(const URLString: String); async;
  var
    Anchor: TJSHTMLAnchorElement;

  begin
    Anchor := Document.CreateElement('a') as TJSHTMLAnchorElement;
    Anchor.HRef := URLString;
    Anchor.Style.cssText := 'display:none';

    Document.Body.AppendChild(Anchor);

    Anchor.Click();

    Document.Body.RemoveChild(Anchor);
  end;
{$ENDIF}

  procedure CheckStatusCode(const StatusCode: Integer);
  begin
    if (StatusCode < 200) or (StatusCode > 299) then
      ErrorEvent(EHTTPStatusError.Create(StatusCode, ContentString))
    else
      CompleteEvent(ContentString, ContentStream);
  end;

begin
{$IFDEF PAS2JS}
  FConnection := TJSXMLHttpRequest.New;
  FConnection.OnLoadEnd :=
    function(Event: TJSProgressEvent): Boolean
    begin
      if ReturnStream then
        ContentStream := TBlobStream.Create(TJSBlob(FConnection.Response))
      else
        ContentString := FConnection.ResponseText;

      CheckStatusCode(FConnection.Status);
    end;

  if ReturnStream then
    FConnection.ResponseType := 'blob';

  FConnection.Open(REQUEST_METHOD_NAME[RequestMethod], URLString, AsyncRequest);

  LoadHeaders;

  FConnection.Send(Body);
{$ELSE}
  var BodyStream := TStringStream.Create(Body, TEncoding.UTF8);
  ContentStream := nil;
  ContentString := EmptyStr;
  FConnection.ResponseTimeout := -1;
  FConnection.SendTimeout := -1;

  LoadHeaders;

  var Response := FConnection.Execute(REQUEST_METHOD_NAME[RequestMethod], URLString, BodyStream) as IHTTPResponse;

  if ReturnStream then
    ContentStream := Response.ContentStream
  else
    ContentString := Response.ContentAsString;

  BodyStream.Free;

  CheckStatusCode(Response.StatusCode);
{$ENDIF}
end;

procedure THTTPCommunication.SetCertificate(const Value: TStream; const Password: String);
begin
  FCertificatePassword := Password;
  FCertificateValue := Value;
end;

procedure THTTPCommunication.SetHeader(const HeaderName, Value: String);
begin
  FHeaders.Values[HeaderName] := Value;
end;

end.

