unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF DCC}System.Net.HTTPClient, {$ENDIF}Blue.Print.Types, Blue.Print.Serializer;

type
  IHTTPCommunication = interface
    ['{8E39F66A-C72B-4314-80B1-D24F1AF4F247}']
    function SendRequest: String;
    {$IFDEF PAS2JS}
    function SendRequestAsync: String; async;
    {$ENDIF}

    procedure SetHeader(const Name, Value: String);
    procedure SetRequestMethod(const Value: TRequestMethod);
    procedure SetURL(const Value: String);

    property Header[const Name: String]: String write SetHeader;
    property RequestMethod: TRequestMethod write SetRequestMethod;
    property URL: String write SetURL;
  end;

  THTTPCommunication = class(TInterfacedObject, IHTTPCommunication)
  private
{$IFDEF DCC}
    FConnection: THTTPClient;
{$ENDIF}

    function SendRequest: String;
{$IFDEF PAS2JS}
    function SendRequestAsync: String; async;
{$ENDIF}

    procedure SetHeader(const Name, Value: String);
    procedure SetRequestMethod(const Value: TRequestMethod);
    procedure SetURL(const Value: String);

    property Connection: THTTPClient read FConnection;
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TRemoteService = class(TVirtualInterface)
  private
    FCommunication: IHTTPCommunication;
    FURL: String;

    FContext: TRttiContext;
    FFormData: TFormData;
    FInterfaceType: TRttiInterfaceType;
    FRttiType: TRttiInterfaceType;
    FSerializer: ISerializer;

    function CheckForceFormData(const Method: TRttiMethod): Boolean;
    function CheckParameterIsFile(const Parameter: TRttiParameter): Boolean;
    function CheckMethodParameterHasFile(const Method: TRttiMethod): Boolean;
    function Deserialize(const JSON: String; RttiType: TRttiType): TValue;
    function EncodeParamValue(const ParamValue: TValue): String;
    function GetCommandFromMethod(const Method: TRttiMethod): TRequestMethod;
    function GetFormData: TFormData;
    function GetParameterType(const Parameter: TRttiParameter): TParamType;
    function HasAttachment(const Method: TRttiMethod): Boolean;

    procedure AddFormDataField(const Param: TRttiParameter; const ParamValue: String);
    procedure AddFormDataFile(const Param: TRttiParameter; const AFile: TRequestFile);
    procedure AddParamToTheBody(const Param: TRttiParameter; const ParamValue: TValue; const ForceLoadFormData: Boolean);
    procedure LoadRequest(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadRequestAuthentication(const Method: TRttiMethod);
    procedure LoadRequestParams(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure LoadRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>);
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);

    property FormData: TFormData read GetFormData;
    property InterfaceType: TRttiInterfaceType read FInterfaceType;
  public
    constructor Create(const TypeInfo: PTypeInfo);

    destructor Destroy; override;

    class function CreateService<T: IInvokable>(const URL: String): T;

    function GetService<T: IInvokable>(const URL: String): T;

    property Communication: IHTTPCommunication read FCommunication write FCommunication;
    property Serializer: ISerializer read FSerializer write FSerializer;
  end;

implementation

uses
{$IFDEF PAS2JS}
  JS, Web, WebOrWorker,
{$ELSE}
  System.Net.Mime, System.NetConsts, System.Net.URLClient, Web.HTTPApp
{$ENDIF};

const
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};

{ TRemoteService }

procedure TRemoteService.AddFormDataField(const Param: TRttiParameter; const ParamValue: String);
begin
{$IFDEF PAS2JS}
  FormData.Append(Param.Name, ParamValue);
{$ELSE}
  FormData.AddField(Param.Name, ParamValue);
{$ENDIF}
end;

procedure TRemoteService.AddFormDataFile(const Param: TRttiParameter; const AFile: TRequestFile);
begin
{$IFDEF PAS2JS}
  FormData.Append(Param.Name, AFile);
{$ELSE}
  if Assigned(AFile) then
    FormData.AddStream(Param.Name, AFile.Stream, AFile.FileName);
{$ENDIF}
end;

procedure TRemoteService.AddParamToTheBody(const Param: TRttiParameter; const ParamValue: TValue; const ForceLoadFormData: Boolean);
var
  AFile: TRequestFile;

begin
//  if ParamValue.IsType<TRequestFile>(False) then
//    if ForceLoadFormData then
//      AddFormDataFile(Param, ParamValue.AsType<TRequestFile>)
//    else
//      FRequest.Body := ParamValue
//  else if (Param.ParamType is TRttiDynamicArrayType) and (TRttiDynamicArrayType(Param.ParamType).ElementType.Handle = TypeInfo(TRequestFile)) then
//    for AFile in ParamValue.AsType<TArray<TRequestFile>> do
//      AddFormDataFile(Param, AFile)
//  else if ForceLoadFormData then
//    AddFormDataField(Param, EncodeParamValue(ParamValue))
//  else
//    FRequest.Body := TValue.From(EncodeParamValue(ParamValue));
end;

function TRemoteService.CheckForceFormData(const Method: TRttiMethod): Boolean;
var
  Parameter: TRttiParameter;

  BodyParamCount: Integer;

begin
//  BodyParamCount := 0;
//
//  for Parameter in Method.GetParameters do
//    if GetParameterType(Parameter) = ptBody then
//      Inc(BodyParamCount);
//
//  Result := BodyParamCount > 1;
end;

function TRemoteService.CheckMethodParameterHasFile(const Method: TRttiMethod): Boolean;
var
  Param: TRttiParameter;

begin
  Result := False;

  for Param in Method.GetParameters do
    if CheckParameterIsFile(Param) then
      Exit(True);
end;

function TRemoteService.CheckParameterIsFile(const Parameter: TRttiParameter): Boolean;
begin
  Result := (Parameter.ParamType.Handle = TypeInfo(TRequestFile)) or (Parameter.ParamType.Handle = TypeInfo(TArray<TRequestFile>));
end;

constructor TRemoteService.Create(const TypeInfo: PTypeInfo);
begin
  inherited Create(TypeInfo, {$IFDEF PAS2JS}@{$ENDIF}OnInvokeMethod);

  FContext := TRttiContext.Create;
  FInterfaceType := FContext.GetType(TypeInfo) as TRttiInterfaceType;
end;

class function TRemoteService.CreateService<T>(const URL: String): T;
begin
  Result := TRemoteService.Create(TypeInfo(T)).GetService<T>(URL);
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
{$IFDEF DCC}
  FFormData.Free;
{$ENDIF}

  inherited;
end;

function TRemoteService.EncodeParamValue(const ParamValue: TValue): String;
begin
  if IsTypeKindString(ParamValue.Kind) then
    Result := ParamValue.AsString
  else
    Result := Serializer.Serialize(ParamValue);
end;

function TRemoteService.GetCommandFromMethod(const Method: TRttiMethod): TRequestMethod;

  procedure GetTypeFromAttribute(const RttiType: TRttiObject);
  var
    RequestMethodAttribute: TRequestMethodAttribute;

  begin
    RequestMethodAttribute := RttiType.GetAttribute<TRequestMethodAttribute>;

    if Assigned(RequestMethodAttribute) then
      Result := RequestMethodAttribute.Method;
  end;

begin
//  Result := rmGet;
//
//  GetTypeFromAttribute(Method.Parent);
//
//  GetTypeFromAttribute(Method);
end;

function TRemoteService.GetFormData: TFormData;
begin
  if not Assigned(FFormData) then
    FFormData := TFormData.{$IFDEF PAS2JS}new{$ELSE}Create{$ENDIF};

  Result := FFormData;
end;

function TRemoteService.GetParameterType(const Parameter: TRttiParameter): TParamType;

  procedure GetTypeFromAttribute(const RttiType: TRttiObject);
  var
    Attribute: TParamAttribute;

  begin
    Attribute := RttiType.GetAttribute<TParamAttribute>;

    if Assigned(Attribute) then
      Result := Attribute.ParamType;
  end;

begin
//  if FRequest.Method in [rmPatch, rmPost, rmPut] then
//    Result := ptBody
//  else
//    Result := ptQuery;

  GetTypeFromAttribute(Parameter.Parent);

  GetTypeFromAttribute(Parameter);

//  if CheckParameterIsFile(Parameter) then
//    Result := ptBody;
end;

function TRemoteService.GetService<T>(const URL: String): T;
begin
  FURL := URL;

  QueryInterface(InterfaceType.GUID, Result);
end;

function TRemoteService.HasAttachment(const Method: TRttiMethod): Boolean;
begin
  Result := Method.HasAttribute<AttachmentAttribute>;
end;

procedure TRemoteService.LoadRequest(const Method: TRttiMethod; const Args: TArray<TValue>);
begin
{$IFDEF PAS2JS}
  FFormData := nil;
{$ELSE}
  FreeAndNil(FFormData);
{$ENDIF}

//  FRequest := TRestRequest.Create;
//  FRequest.FileDownload := HasAttachment(Method);
//  FRequest.Method := GetCommandFromMethod(Method);

  LoadRequestAuthentication(Method);

  LoadRequestURL(Method, Args);

//  LoadRequestHeaders;
//
//  if CheckMethodParameterHasFile(Method) then
//    FRequest.Method := rmPost;
end;

procedure TRemoteService.LoadRequestAuthentication(const Method: TRttiMethod);
var
  AuthenticationHeader, AuthenticationName: String;

begin
  AuthenticationHeader := EmptyStr;

  if TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationHeader) then
    Communication.Header['Authorization'] := Format('%s %s', [AuthenticationName, AuthenticationHeader]);
end;

procedure TRemoteService.LoadRequestParams(const Method: TRttiMethod; const Args: TArray<TValue>);
var
  A: Integer;

  Params: TArray<TRttiParameter>;

  ParamType: TParamType;

  ParamValue: TValue;

  ForceFormData: Boolean;

  PathValues, QueryValues: TStringList;

begin
  ForceFormData := CheckForceFormData(Method);
  Params := Method.GetParameters;
  PathValues := TStringList.Create;
  PathValues.Delimiter := '/';
  PathValues.QuoteChar := #0;
  QueryValues := TStringList.Create;
  QueryValues.Delimiter := '&';
  QueryValues.QuoteChar := #0;

  for A := Low(Params) to High(Params) do
  begin
    ParamType := GetParameterType(Params[A]);
    ParamValue := Args[COMPILER_OFFSET + A];

//    if ParamType = ptBody then
//      AddParamToTheBody(Params[A], ParamValue, ForceFormData)
//    else if ParamType = ptQuery then
//      QueryValues.AddPair(Params[A].Name, EncodeParamValue(ParamValue))
//    else
//      PathValues.Add(ParamValue.ToString);
  end;

//  if Assigned(FFormData) then
//    FRequest.Body := TValue.From(FormData);
//
//  if PathValues.Count > 0 then
//    FRequest.URL := '/' + PathValues.DelimitedText;
//
//  if QueryValues.Count > 0 then
//    FRequest.URL := FRequest.URL + '?' + QueryValues.DelimitedText;
//
//  PathValues.Free;
//
//  QueryValues.Free;
end;

procedure TRemoteService.LoadRequestURL(const Method: TRttiMethod; const Args: TArray<TValue>);
begin
  LoadRequestParams(Method, Args);

//  FRequest.URL := Format('%s/%s/%s%s', [FURL, GetRemoteRequestServiceName, GetRemoteRequestName(Method), FRequest.URL]);
end;

procedure TRemoteService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);

{$IFDEF PAS2JS}
  function InvokeMehodAsync: JSValue; async;
  var
    ReturnType: TRttiType;

  begin
    try
      ReturnType := Method.ReturnType;

      if Assigned(ReturnType) and ReturnType.IsInstanceExternal and (ReturnType.AsInstanceExternal.ExternalName = 'Promise') then
        ReturnType := nil;

      Result := Deserialize(await(Communication.SendRequestAsync(FRequest)), ReturnType).AsJSValue;
    except
      on E: Exception do
        CheckException(E);
    end;
  end;
{$ENDIF}

  function GetRemoteName(const RttiObject: TRttiObject; const DefaultName: String): String;
  var
    RemoteName: RemoteNameAttribute;

  begin
    RemoteName := RttiObject.GetAttribute<RemoteNameAttribute>;

    if Assigned(RemoteName) then
      Result := RemoteName.RemoteName
    else
      Result := DefaultName;
  end;

  function GetRemoteServiceName: String;
  begin
    Result := GetRemoteName(Method.Parent, Method.Parent.Name.Substring(1));
  end;

  function GetRemoteMethodName: String;
  begin
    Result := GetRemoteName(Method, Method.Name);
  end;

  procedure LoadRequestMethod;
  var
    RequestMethod: TRequestMethodAttribute;

  begin
    RequestMethod := Method.GetAttribute<TRequestMethodAttribute>;

    if Assigned(RequestMethod) then
      FCommunication.RequestMethod := RequestMethod.Method
    else
    begin
      RequestMethod := Method.Parent.GetAttribute<TRequestMethodAttribute>;

      if Assigned(RequestMethod) then
        FCommunication.RequestMethod := RequestMethod.Method
      else
        FCommunication.RequestMethod := TRequestMethod.Post;
    end;
  end;

  procedure LoadRequest;
  begin
    FCommunication.URL := Format('%s/%s/%s', [FURL, GetRemoteServiceName, GetRemoteMethodName]);

    LoadRequestMethod;
  end;

begin
  LoadRequest;

  Communication.SendRequest;

//    if FRequest.FileDownload then
//    begin
//      Result := TValue.Empty;
//
//      Communication.SendRequest;
//    end
//    else
//{$IFDEF PAS2JS}
//    if Method.IsAsyncCall then
//      Result := TValue.From(InvokeMehodAsync)
//    else
//{$ENDIF}
//      Result := Deserialize(SendRequest, Method.ReturnType);
end;

{ THTTPCommunication }

constructor THTTPCommunication.Create;
begin
  inherited;

{$IFDEF DCC}
  FConnection := THTTPClient.Create;
  FConnection.ResponseTimeout := -1;
  FConnection.SendTimeout := -1;
{$ENDIF}
end;

destructor THTTPCommunication.Destroy;
begin
{$IFDEF DCC}
  FConnection.Free;
{$ENDIF}

  inherited;
end;

function THTTPCommunication.SendRequest: String;
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

//  function LoadContentStream: TStream;
//  begin
//    Result := nil;
//
//    if not Request.Body.IsEmpty then
//      if Request.Body.IsType<String> then
//        Result := TStringStream.Create(Request.Body.AsString, TEncoding.UTF8)
//      else if Request.Body.IsType<TMultipartFormData> then
//      begin
//        var Content := Request.Body.AsType<TMultipartFormData>;
//
//        Connection.CustomHeaders[sContentType] := Content.MimeTypeHeader;
//        Result := Content.Stream;
//      end
//      else if Request.Body.IsType<TAbstractWebRequestFile> then
//        Result := TFileStream.Create(Request.Body.AsType<TAbstractWebRequestFile>.FileName, fmOpenRead or fmShareDenyWrite);
//  end;

begin
{$IFDEF PAS2JS}
  if Request.FileDownload then
    DownloadFile(Request.URL)
  else
  begin
    Connection := TJSXMLHttpRequest.New;

    Connection.Open(RESTRequestMethodToString(Request.Method), Request.URL, False);

    for A := 0 to Pred(FHeaders.Count) do
      Connection.SetRequestHeader(FHeaders.Names[A], FHeaders.ValueFromIndex[A]);

    Connection.Send(Request.Body.AsJSValue);

    Result := Connection.ResponseText

    if Connection.Status <> 200 then
      raise EHTTPStatusError.Create(Connection.status, Request.URL, Connection.ResponseText);
  end;
{$ENDIF}
//  var Content: TStream := nil;
//
//  try
//    Content := LoadContentStream;
//    Connection.ContentType := CONTENTTYPE_APPLICATION_JSON;
//
//    var Response := Connection.Execute(RESTRequestMethodToString(Request.Method), Request.URL, Content) as IHTTPResponse;
//    Result := Response.ContentAsString(TEncoding.UTF8);
//
//    if Response.StatusCode <> 200 then
//      raise EHTTPStatusError.Create(Response.StatusCode, Request.URL, Result);
//  finally
//    Content.Free;
//  end;
end;

{$IFDEF PAS2JS}
function THTTPCommunication.SendRequestAsync: String;
var
  A: Integer;

  Options: TJSFetchInit;

  Response: TJSResponse;

begin
  if Request.FileDownload then
    await(DownloadFile(Request.URL))
  else
  begin
    FHeaders.Text := Request.Headers;
    Options := TJSFetchInit.New;
    Options.Method := RESTRequestMethodToString(Request.Method);

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
      raise EHTTPStatusError.Create(Response.Status, Request.URL, Result);
  end;
end;
{$ENDIF}

procedure THTTPCommunication.SetHeader(const Name, Value: String);
begin

end;

procedure THTTPCommunication.SetRequestMethod(const Value: TRequestMethod);
begin

end;

procedure THTTPCommunication.SetURL(const Value: String);
begin

end;

end.

