unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF PAS2JS}JSApi.JS, BrowserAPI.Web, BrowserAPI.WebOrWorker{$ELSE}System.Net.URLClient, System.Net.HTTPClient{$ENDIF}, Blue.Print.Types, Blue.Print.Serializer;

type
  IAuthorization = interface
    ['{D5474FD1-CE92-4FCC-AA6E-6E88562A7F55}']
    procedure SetCertificate(const FileName, Password: String); overload;
    procedure SetCertificate(const Value: TStream; const Password: String); overload;
  end;

  IHeaders = interface
    ['{A21DC397-0661-4FFE-A4DF-609FE127C1FD}']
    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
  end;

  IHTTPCommunication = interface
    ['{8E39F66A-C72B-4314-80B1-D24F1AF4F247}']
    function GetResponseHeader(const HeaderName: String): String;

    procedure SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
    procedure SetCertificate(const FileName, Password: String); overload;
    procedure SetCertificate(const Value: TStream; const Password: String); overload;
    procedure SetHeader(const HeaderName, Value: String);

    property Header[const HeaderName: String]: String write SetHeader;
    property ResponseHeader[const HeaderName: String]: String read GetResponseHeader;
  end;

  THTTPCommunication = class(TInterfacedObject, IHTTPCommunication)
  private
    FCertificateFileName: String;
    FCertificatePassword: String;
    FCertificateValue: TStream;
    FHeaders: TStringList;
    FResponseHeaders: TStringList;

    function GetResponseHeader(const HeaderName: String): String;

    procedure SendRequest(const RequestMethod: TRequestMethod; const URLString, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
    procedure SetCertificate(const FileName, Password: String); overload;
    procedure SetCertificate(const Value: TStream; const Password: String); overload;
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
    function GetRemoteMethodName(const Method: TRttiMethod): String;
    function GetRemoteName(const RttiObject: TRttiObject; const DefaultName: String): String;
    function GetRemoteServiceName: String;
    function GetRequestMethod(const Method: TRttiMethod): TRequestMethod;
    function GetPathParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetQueryParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function GetSerializer(const XML: Boolean): IBluePrintSerializer;
    function GetSOAPActionName(const Method: TRttiMethod): String;
    function IsSOAPRequest: Boolean;
    function IsSOAP11Request(const Method: TRttiMethod): Boolean;
    function LoadRequestBody(const Method: TRttiMethod; const Args: TArray<TValue>): String;
    function SendRequest(const Method: TRttiMethod; const Args: TArray<TValue>; const AsyncRequest: Boolean; const ReturnEvent: TProc<TValue>; const ErrorEvent: TProc<Exception>): TValue;

    procedure ForEachParameter(const Method: TRttiMethod; const ParameterType: TParameterType; const LoadFunction: TProc<TRttiParameter, NativeInt, TParameterAttribute>; const CheckParameterFlags: TFunc<TRttiParameter, Boolean>);
    procedure LoadContentType(const Method: TRttiMethod);
    procedure LoadRequestHeaders(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadValuesFromParameters(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TParameterAttribute, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
    procedure SetCertificate(const FileName, Password: String); overload;
    procedure SetCertificate(const Value: TStream; const Password: String); overload;
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
    property Serializer: IBluePrintSerializer read FSerializer write FSerializer;
  end;

implementation

{$IFDEF DCC}
uses System.NetEncoding, REST.Types, Soap.SOAPConst;
{$ENDIF}

const
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};
  CONTENT_TYPE_HEADER = 'Content-Type';
{$IFDEF PAS2JS}
  CONTENTTYPE_APPLICATION_SOAP_XML = 'application/soap+xml';
  CONTENTTYPE_TEXT_PLAIN = 'text/plain';
  CONTENTTYPE_TEXT_XML = 'text/xml';
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
  FInterfaceType := FContext.GetType(TypeInfo).AsInterface;
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

procedure TRemoteService.ForEachParameter(const Method: TRttiMethod; const ParameterType: TParameterType; const LoadFunction: TProc<TRttiParameter, NativeInt, TParameterAttribute>; const CheckParameterFlags: TFunc<TRttiParameter, Boolean>);
var
  Parameter: TRttiParameter;
  ParameterAttribute: TParameterAttribute;
  ValueIndex: Integer;

  function SameParameterType: Boolean;
  begin
    if Assigned(ParameterAttribute) then
      Result := ParameterType = ParameterAttribute.ParamType
    else if Parameter.ParamType.IsInstance then
      Result := ParameterType = TParameterType.Body
    else
      Result := ParameterType = TParameterType.Query;
  end;

begin
  ValueIndex := COMPILER_OFFSET;

  for Parameter in Method.GetParameters do
  begin
    ParameterAttribute := GetAttribute<TParameterAttribute>(Parameter);

    if CheckParameterFlags(Parameter) and SameParameterType then
      LoadFunction(Parameter, ValueIndex, ParameterAttribute);

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

function TRemoteService.GetPathParams(const Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  PathParams: String;

begin
  PathParams := EmptyStr;

  LoadValuesFromParameters(Method,
    procedure (Parameter: TRttiParameter; ParameterAttribute: TParameterAttribute; Value: TValue)
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

  LoadValuesFromParameters(Method,
    procedure(Parameter: TRttiParameter; ParameterAttribute: TParameterAttribute; Value: TValue)
    var
      Query: QueryAttribute absolute ParameterAttribute;

      function GetQueryName: String;
      begin
        if not Assigned(Query) or Query.Name.IsEmpty then
          Result := Parameter.Name
        else
          Result := Query.Name;

        Result := EncodeValue(Result);
      end;

    begin
      if not QueryParams.IsEmpty then
        QueryParams := QueryParams + '&';

      QueryParams := QueryParams + Format('%s=%s', [GetQueryName, EncodeValue(Value.ToString)]);
    end, TParameterType.Query, Args);

  if not QueryParams.IsEmpty then
    QueryParams := '?' + QueryParams;

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

  if not Result.IsEmpty then
    Result := '/' + Result;
end;

function TRemoteService.GetRemoteServiceName: String;
begin
  if IsSOAPRequest then
    Result := EmptyStr
  else
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

function TRemoteService.GetSerializer(const XML: Boolean): IBluePrintSerializer;
begin
  if not Assigned(FSerializer) then
    if XML then
      FSerializer := TBluePrintXMLSerializer.Create
    else
      FSerializer := TBluePrintJSONSerializer.Create;

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
  Result := EmptyStr;
  SOAPAction := GetAttribute<SoapActionAttribute>(Method);

  if Assigned(SOAPAction) then
    Result := Result + SOAPAction.ActionName
  else
    Result := Result + Method.Name;
end;

function TRemoteService.IsSOAP11Request(const Method: TRttiMethod): Boolean;
begin
  Result := not Method.HasAttribute<SOAPActionAttribute>;
end;

function TRemoteService.IsSOAPRequest: Boolean;
begin
  Result := Assigned(GetAttribute<SOAPServiceAttribute>(FInterfaceType));
end;

procedure TRemoteService.LoadContentType(const Method: TRttiMethod);
var
  CharSet: String;
  CharSetAttr: CharSetAttribute;
  ContentTypeAttr: ContentTypeAttribute;
  ContentTypeText: String;

begin
  ContentTypeAttr := GetAttribute<ContentTypeAttribute>(Method);
  CharSetAttr := GetAttribute<CharSetAttribute>(Method);

  if IsSOAPRequest then
    if not IsSOAP11Request(Method) then
      ContentTypeText := Format('%s;action=%s', [CONTENTTYPE_APPLICATION_SOAP_XML, GetSOAPActionName(Method)])
    else
      ContentTypeText := CONTENTTYPE_TEXT_XML
  else if Assigned(ContentTypeAttr) then
    ContentTypeText := ContentTypeAttr.ContentType
  else if Assigned(FSerializer) then
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

function TRemoteService.LoadRequestBody(const Method: TRttiMethod; const Args: TArray<TValue>): String;
var
  Body: String;

  procedure LoadSOAPRequest;
  var
    SOAPEnvelop: TSOAPEnvelop;

  begin
    LoadValuesFromParameters(Method,
      procedure(Parameter: TRttiParameter; ParameterAttribute: TParameterAttribute; Value: TValue)
      begin
        if ParameterAttribute is SOAPHeader then
          SOAPEnvelop.AddHeaderPart(Parameter, Value)
        else
          SOAPEnvelop.AddBodyPart(Parameter, Value);
      end, TParameterType.Body, Args);

    LoadContentType(Method);

    if IsSOAP11Request(Method) then
      SOAPEnvelop.SOAPNameSpace := SSoapNamespace
    else
      SOAPEnvelop.SOAPNameSpace := SSoap12Namespace;

    Body := GetSerializer(True).Serialize(TValue.From(SOAPEnvelop));
  end;

  procedure LoadRESTRequest;
  begin
    LoadValuesFromParameters(Method,
      procedure(Parameter: TRttiParameter; ParameterAttribute: TParameterAttribute; Value: TValue)

        function GetSerializerType: Boolean;
        begin
          Result := Assigned(GetAttributes<XMLAttribute>(Parameter.ParamType)) or Assigned(GetAttributes<XMLAttribute>(Parameter));
        end;

      begin
        Body := GetSerializer(GetSerializerType).Serialize(Value);

        LoadContentType(Method);
      end, TParameterType.Body, Args);
  end;

begin
  if IsSOAPRequest then
    LoadSOAPRequest
  else
    LoadRESTRequest;

  Result := Body;
end;

procedure TRemoteService.LoadRequestHeaders(const Method: TRttiMethod; const Args: TArray<TValue>);
var
  Attribute: HeaderAttribute;

begin
  for Attribute in GetAttributes<HeaderAttribute>(Method) do
    Header[Attribute.Name] := Attribute.Value;

  LoadValuesFromParameters(Method,
    procedure (Parameter: TRttiParameter; ParameterAttribute: TParameterAttribute; Value: TValue)
    var
      HeaderValue: HeaderValueAttribute absolute ParameterAttribute;

    begin
      Header[HeaderValue.Name] := Value.ToString;
    end, TParameterType.Header, Args);
end;

procedure TRemoteService.LoadValuesFromParameters(const Method: TRttiMethod; const LoadFunction: TProc<TRttiParameter, TParameterAttribute, TValue>; const ParameterType: TParameterType; const Args: TArray<TValue>);
begin
  ForEachParameter(Method, ParameterType,
    procedure (Parameter: TRttiParameter; ValueIndex: NativeInt; ParameterAttribute: TParameterAttribute)
    begin
      LoadFunction(Parameter, ParameterAttribute, Args[ValueIndex]);
    end,
    function (Parameter: TRttiParameter): Boolean
    begin
      Result := Parameter.Flags * [pfOut] = [];
    end);
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
  LoadRequestHeaders(Method, Args);

  Communication.SendRequest(GetRequestMethod(Method), BuildRequestURL(Method, Args), LoadRequestBody(Method, Args), AsyncRequest,
    Assigned(Method.ReturnType) and Method.ReturnType.IsInstance and (Method.ReturnType.AsInstance.MetaclassType = TStream),
    procedure(ContentString: String; ContentStream: TStream)

      function GetSerializerType: Boolean;
      begin
        Result := Assigned(Method.ReturnType) and Assigned(GetAttributes<XMLAttribute>(Method.ReturnType)) or Assigned(GetAttributes<XMLAttribute>(Method));
      end;

    begin
      if Assigned(ContentStream) then
        ReturnEvent(TValue.From(ContentStream))
      else if not ContentString.IsEmpty then
        ReturnEvent(GetSerializer(GetSerializerType).Deserialize(ContentString, Method.ReturnType.Handle))
      else
        ReturnEvent(TValue.Empty);
    end, ErrorEvent);

  ForEachParameter(Method, TParameterType.Header,
    procedure (Parameter: TRttiParameter; ValueIndex: NativeInt; ParameterAttribute: TParameterAttribute)
    var
      HeaderValue: HeaderValueAttribute absolute ParameterAttribute;

    begin
      Args[ValueIndex] := TValue.From(Communication.ResponseHeader[HeaderValue.Name]);
    end,
    function (Parameter: TRttiParameter): Boolean
    begin
      Result := Parameter.Flags * [pfOut, pfVar] <> [];
    end);
end;

procedure TRemoteService.SetCertificate(const FileName, Password: String);
begin
  Communication.SetCertificate(FileName, Password);
end;

procedure TRemoteService.SetCertificate(const Value: TStream; const Password: String);
begin
  Communication.SetCertificate(Value, Password);
end;

procedure TRemoteService.SetHeader(const HeaderName, Value: String);
begin
  Communication.Header[HeaderName] := Value;
end;

{ THTTPCommunication }

constructor THTTPCommunication.Create;
begin
  inherited;

  FHeaders := TStringList.Create;
  FResponseHeaders := TStringList.Create;
end;

destructor THTTPCommunication.Destroy;
begin
  FHeaders.Free;

  FResponseHeaders.Free;

  inherited;
end;

function THTTPCommunication.GetResponseHeader(const HeaderName: String): String;
begin
  Result := FResponseHeaders.Values[HeaderName];
end;

procedure THTTPCommunication.SendRequest(const RequestMethod: TRequestMethod; const URLString, Body: String; const AsyncRequest, ReturnStream: Boolean; const CompleteEvent: TProc<String, TStream>; const ErrorEvent: TProc<Exception>);
const
  REQUEST_METHOD_NAME: array[TRequestMethod] of String = ('DELETE', 'GET', 'PATCH', 'POST', 'PUT', 'OPTIONS');

var
  Connection: {$IFDEF PAS2JS}TJSXMLHttpRequest{$ELSE}THTTPClient{$ENDIF};
  ContentStream: TStream;
  ContentString: String;

  procedure CheckStatusCode(const StatusCode: Integer);
  begin
    case StatusCode of
      0..299: CompleteEvent(ContentString, ContentStream);
      400: ErrorEvent(EHTTPErrorBadRequest.Create(ContentString));
      404: ErrorEvent(EHTTPErrorNotFound.Create);
      else ErrorEvent(EHTTPStatusError.Create(StatusCode, ContentString))
    end;
  end;

  procedure LoadHeaders;
  var
    A: Integer;

  begin
    for A := 0 to Pred(FHeaders.Count) do
      {$IFDEF PAS2JS}
      Connection.SetRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);
      {$ELSE}
      Connection.CustomHeaders[FHeaders.Names[A]] := FHeaders.ValueFromIndex[A];
      {$ENDIF}
  end;

begin
{$IFDEF PAS2JS}
  Connection := TJSXMLHttpRequest.New;
  Connection.OnLoadEnd :=
    function (Event: TJSProgressEvent): Boolean
    var
      Connection: TJSXMLHttpRequest;

    begin
      Connection := TJSXMLHttpRequest(Event.Target);

      if ReturnStream then
        ContentStream := TBlobStream.Create(TJSBlob(Connection.Response))
      else
        ContentString := Connection.ResponseText;

      CheckStatusCode(Connection.Status);
    end;

  if ReturnStream then
    Connection.ResponseType := 'blob';

  Connection.Open(REQUEST_METHOD_NAME[RequestMethod], URLString, AsyncRequest);

  LoadHeaders;

  Connection.Send(Body);
{$ELSE}
  var BodyStream := TStringStream.Create(Body, TEncoding.UTF8);
  ContentStream := nil;
  ContentString := EmptyStr;
  Connection := THTTPClient.Create;
  Connection.ResponseTimeout := -1;
  Connection.SendTimeout := -1;
  Connection.ValidateServerCertificateCallback := ValidateCertificate;

  LoadHeaders;

  var Request := Connection.GetRequest(REQUEST_METHOD_NAME[RequestMethod], URLString);
  Request.SourceStream := BodyStream;

  if Assigned(FCertificateValue) then
    Request.SetClientCertificate(FCertificateValue, FCertificatePassword)
  else if not FCertificateFileName.IsEmpty then
    Request.SetClientCertificate(FCertificateFileName, FCertificatePassword);

  try
    var Response := Connection.Execute(Request, nil);

    if ReturnStream then
      ContentStream := Response.ContentStream
    else
      ContentString := Response.ContentAsString;

    for var HeaderValue in Response.Headers do
      FResponseHeaders.Values[HeaderValue.Name] := HeaderValue.Value;

    CheckStatusCode(Response.StatusCode);
  finally
    BodyStream.Free;

    Connection.Free;
  end;
{$ENDIF}
end;

procedure THTTPCommunication.SetCertificate(const Value: TStream; const Password: String);
begin
  FCertificatePassword := Password;
  FCertificateValue := Value;
end;

procedure THTTPCommunication.SetCertificate(const FileName, Password: String);
begin
  FCertificateFileName := FileName;
  FCertificatePassword := Password;
end;

procedure THTTPCommunication.SetHeader(const HeaderName, Value: String);
begin
  FHeaders.Values[HeaderName] := Value;
end;

end.

