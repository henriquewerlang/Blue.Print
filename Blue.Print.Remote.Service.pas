﻿unit Blue.Print.Remote.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, System.Classes, {$IFDEF DCC}System.Net.HTTPClient, {$ENDIF}Blue.Print.Types, Blue.Print.Serializer;

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

  TRemoteService = class(TVirtualInterface)
  private
    FCommunication: IHTTPCommunication;
    FURL: String;

    FContext: TRttiContext;
    FInterfaceType: TRttiInterfaceType;
    FSerializer: IBluePrintSerializer;

    function EncodeValue(const Value: String): String;
    function GetAttribute<T: TCustomAttribute>(RttiObject: TRttiObject): T;
  protected
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue); virtual;

    property InterfaceType: TRttiInterfaceType read FInterfaceType;
    property Serializer: IBluePrintSerializer read FSerializer write FSerializer;
  public
    constructor Create(const TypeInfo: PTypeInfo; const Serializer: IBluePrintSerializer);

    destructor Destroy; override;

    class function CreateService<T: IInvokable>(const URL: String): T; overload;
    class function CreateService<T: IInvokable>(const URL: String; const Serializer: IBluePrintSerializer): T; overload;

    function GetService<T: IInvokable>(const URL: String): T;

    property Communication: IHTTPCommunication read FCommunication write FCommunication;
  end;

implementation

uses
{$IFDEF PAS2JS}
  JS, Web, WebOrWorker
{$ELSE}
  System.Net.Mime, System.NetConsts, System.Net.URLClient, System.NetEncoding, Web.HTTPApp
{$ENDIF};

const
  COMPILER_OFFSET = {$IFDEF PAS2JS}0{$ELSE}1{$ENDIF};
  CONTENT_TYPE_HEADER = 'Content-Type';
  SOAP_ACTION_HEADER = 'SOAPAction';

{ TRemoteService }

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

    if not Result.IsEmpty then
      Result := '/' + Result;
  end;

  function GetRemoteServiceName: String;
  begin
    Result := GetRemoteName(Method.Parent, Method.Parent.Name);
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
    else if Parameter.ParamType.IsInstance then
      Result := TParameterType.Body
    else
      Result := TParameterType.Query;
  end;

  function GetSOAPActionName: String;
  begin
    Result := Method.Name;
  end;

  procedure LoadParams(const LoadFunction: TProc<TRttiParameter, TValue>; const ParameterType: TParameterType);
  var
    Parameter: TRttiParameter;

    ValueIndex: Integer;

  begin
    ValueIndex := COMPILER_OFFSET;

    for Parameter in Method.GetParameters do
    begin
      if GetParameterType(Parameter) = ParameterType then
        LoadFunction(Parameter, Args[ValueIndex]);

      Inc(ValueIndex);
    end;
  end;

  function GetQueryParams: String;
  var
    QueryParams: String;

  begin
    QueryParams := EmptyStr;

    LoadParams(
      procedure(Parameter: TRttiParameter; Value: TValue)
      begin
        if not QueryParams.IsEmpty then
          QueryParams := QueryParams + '&';

        QueryParams := QueryParams + Format('%s=%s', [EncodeValue(Parameter.Name), EncodeValue(Value.ToString)]);
      end, TParameterType.Query);

    if not QueryParams.IsEmpty then
      QueryParams := '/?' + QueryParams;

    Result := QueryParams;
  end;

  function GetPathParams: String;
  var
    PathParams: String;

  begin
    PathParams := EmptyStr;

    LoadParams(
      procedure (Parameter: TRttiParameter; Value: TValue)
      begin
        PathParams := PathParams + '/' + EncodeValue(Value.ToString);
      end, TParameterType.Path);

    Result := PathParams;
  end;

  function LoadRequestBody: String;
  var
    Body: String;

  begin
    Body := EmptyStr;

    LoadParams(
      procedure (Parameter: TRttiParameter; Value: TValue)
      begin
        Body := FSerializer.Serialize(Value);
      end, TParameterType.Body);

    Result := Body;
  end;

  function BuildRequestURL: String;
  begin
    Result := FURL + GetRemoteServiceName + GetRemoteMethodName + GetPathParams + GetQueryParams;
  end;

  procedure LoadSOAPInformation;
  begin
    if Assigned(GetAttribute<SoapServiceAttribute>(FInterfaceType)) then
    begin
      Communication.Header[CONTENT_TYPE_HEADER] := 'application/soap';
      Communication.Header[SOAP_ACTION_HEADER] := GetSOAPActionName;
    end;
  end;

  procedure SendRequest;
  var
    Response: String;

  begin
    LoadSOAPInformation;

    Response := Communication.SendRequest(GetRequestMethod, BuildRequestURL, LoadRequestBody);

    if Assigned(Method.ReturnType) then
      Result := FSerializer.Deserialize(Response, Method.ReturnType.Handle);
  end;

{$IFDEF PAS2JS}
  function SendRequestAsync: TJSPromise;
  begin
//    Result := TJSPromise.Create...
  end;
{$ENDIF}

begin
{$IFDEF PAS2JS}
    if Method.IsAsyncCall then
      Result := TValue.From(SendRequestAsync)
    else
{$ENDIF}
  SendRequest;
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

end;

end.

