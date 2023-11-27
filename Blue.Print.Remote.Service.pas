unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF DCC}System.Net.HTTPClient, {$ENDIF}Blue.Print.Types, Blue.Print.Serializer;

type
  IHTTPCommunication = interface
    ['{8E39F66A-C72B-4314-80B1-D24F1AF4F247}']
    function SendRequest(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
    {$IFDEF PAS2JS}
    function SendRequestAsync: String; async;
    {$ENDIF}
  end;

  THTTPCommunication = class(TInterfacedObject, IHTTPCommunication)
  private
    function SendRequest(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
{$IFDEF PAS2JS}
    function SendRequestAsync: String; async;
{$ENDIF}
  end;

  TRemoteService = class(TVirtualInterface)
  private
    FCommunication: IHTTPCommunication;
    FURL: String;

    FContext: TRttiContext;
    FInterfaceType: TRttiInterfaceType;
    FSerializer: ISerializer;

    function ConvertValue(const Value: TValue): String;
    function EncodeValue(const Value: String): String;
    function GetAttribute<T: TCustomAttribute>(RttiObject: TRttiObject): T;

    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);

    property InterfaceType: TRttiInterfaceType read FInterfaceType;
  public
    constructor Create(const TypeInfo: PTypeInfo);

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
  System.Net.Mime, System.NetConsts, System.Net.URLClient, System.NetEncoding, Web.HTTPApp
{$ENDIF};

const
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};

{ TRemoteService }

function TRemoteService.ConvertValue(const Value: TValue): String;
begin
  if Value.Kind = tkInteger then
    Result := Value.AsInt64.ToString
  else
    Result := Value.AsString;
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

function TRemoteService.EncodeValue(const Value: String): String;
begin
  {$IFDEF DCC}
  Result := TNetEncoding.URL.Encode(Value);
  {$ENDIF}
end;

function TRemoteService.GetAttribute<T>(RttiObject: TRttiObject): T;
begin
  repeat
    Result := RttiObject.GetAttribute<T>;
    RttiObject := RttiObject.Parent;
  until Assigned(Result) or not Assigned(RttiObject);
end;

function TRemoteService.GetService<T>(const URL: String): T;
begin
  FURL := URL;

  QueryInterface(InterfaceType.GUID, Result);
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

    Result := EncodeValue(Result);
  end;

  function GetRemoteServiceName: String;
  begin
    Result := GetRemoteName(Method.Parent, Method.Parent.Name.Substring(1));
  end;

  function GetRemoteMethodName: String;
  begin
    Result := GetRemoteName(Method, Method.Name);
  end;

  function GetRequestMethod: TRequestMethod;
  var
    RequestMethod: TRequestMethodAttribute;

  begin
    RequestMethod := GetAttribute<TRequestMethodAttribute>(Method);

    if Assigned(RequestMethod) then
      Result := RequestMethod.Method
    else
      Result := TRequestMethod.Post;
  end;

  function GetParameterType(const Parameter: TRttiParameter): TParameterType;
  var
    ParameterAttribute: TParameterAttribute;

  begin
    ParameterAttribute := GetAttribute<TParameterAttribute>(Parameter);

    if Assigned(ParameterAttribute) then
      Result := ParameterAttribute.ParamType
    else
      Result := TParameterType.Query;
  end;

  function LoadParams(const LoadFunction: TFunc<TRttiParameter, TValue, String>; const ParameterSeparator: String; const ParameterType: TParameterType): String;
  var
    Parameter: TRttiParameter;

    ValueIndex: Integer;

  begin
    Result := EmptyStr;
    ValueIndex := COMPILER_OFFSET;

    for Parameter in Method.GetParameters do
    begin
      if GetParameterType(Parameter) = ParameterType then
      begin
        if not Result.IsEmpty then
          Result := Result + ParameterSeparator;

        Result := Result + LoadFunction(Parameter, Args[ValueIndex]);
      end;

      Inc(ValueIndex);
    end;
  end;

  function GetQueryParams: String;
  begin
    Result := LoadParams(
      function(Parameter: TRttiParameter; Value: TValue): String
      begin
        Result := Format('%s=%s', [EncodeValue(Parameter.Name), EncodeValue(ConvertValue(Value))]);
      end, ';', TParameterType.Query);

    if not Result.IsEmpty then
      Result := '/?' + Result;
  end;

  function GetPathParams: String;
  begin
    Result := LoadParams(
      function(Parameter: TRttiParameter; Value: TValue): String
      begin
        Result := EncodeValue(ConvertValue(Value));
      end, '/', TParameterType.Path);

    if not Result.IsEmpty then
      Result := '/' + Result;
  end;

  function LoadRequestBody: TStream;
  var
    Body: TStream;

  begin
    Body := nil;

    LoadParams(
      function(Parameter: TRttiParameter; Value: TValue): String
      var
        ConvertedValue: String;

      begin
        if not Assigned(Body) then
          Body := TStringStream.Create;

        ConvertedValue := ConvertValue(Value);

        Body.Write(ConvertedValue[1], ConvertedValue.Length * SizeOf(Char));
      end, EmptyStr, TParameterType.Body);

    Result := Body;
  end;

  function BuildRequestURL: String;
  begin
    Result := Format('%s/%s/%s%s%s', [FURL, GetRemoteServiceName, GetRemoteMethodName, GetPathParams, GetQueryParams]);
  end;

begin
  Communication.SendRequest(GetRequestMethod, BuildRequestURL, LoadRequestBody);

//{$IFDEF PAS2JS}
//    if Method.IsAsyncCall then
//      Result := TValue.From(InvokeMehodAsync)
//{$ENDIF}
end;

{ THTTPCommunication }

function THTTPCommunication.SendRequest(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
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
  var Connection := THTTPClient.Create;
  Connection.ResponseTimeout := -1;
  Connection.SendTimeout := -1;

  var Response := Connection.Execute(REQUEST_METHOD_NAME[RequestMethod], URL, Body) as IHTTPResponse;
  Result := Response.ContentStream;

  if Response.StatusCode <> 200 then
    raise EHTTPStatusError.Create(Response.StatusCode, URL);
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

end.

