unit Delphi.Rest.Server.Service;

interface

uses System.Classes, System.SysUtils, System.Rtti, Web.HTTPApp, Delphi.Rest.Service.Container, Delphi.Rest.JSON.Serializer.Intf;

type
  EInvalidParameterType = class(Exception);

  EServiceContainerNotLoaded = class(Exception)
  public
    constructor Create;
  end;

  TOnGetServiceContainer = TFunc<IServiceContainer>;

  TRestServerService = class(TComponent, IGetWebAppServices, IWebAppServices, IWebExceptionHandler, IWebDispatcherAccess)
  private
    FActive: Boolean;
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FServiceContainer: IServiceContainer;
    FSerializer: IRestJsonSerializer;
    FOnGetServiceContainer: TOnGetServiceContainer;

    function GetParams(const Method: TRttiMethod; var ConvertedParams: TArray<TValue>): Boolean;
    function GetParamValue(const Method: TRttiMethod; const Param: TRttiParameter; var ParamLoaded: Boolean): TValue;
    function GetSerializer: IRestJsonSerializer;
    function GetServiceContainer: IServiceContainer;
  protected
    // IGetWebAppServices
    function GetWebAppServices: IWebAppServices; virtual;

    // IWebAppServices
    function GetActive: Boolean; virtual;
    function GetExceptionHandler: TObject; virtual;
    function HandleRequest: Boolean; virtual;

    procedure FinishContext; virtual;
    procedure InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse); virtual;

    // IWebExceptionHandler
    procedure HandleException(E: Exception; var Handled: Boolean); virtual;

    // IWebDispatcherAccess
    function Request: TWebRequest;
    function Response: TWebResponse;
  public
    property Serializer: IRestJsonSerializer read GetSerializer write FSerializer;
    property ServiceContainer: IServiceContainer read GetServiceContainer write FServiceContainer;
  published
    property Active: Boolean read FActive write FActive;
    property OnGetServiceContainer: TOnGetServiceContainer read FOnGetServiceContainer write FOnGetServiceContainer;
  end;

implementation

uses System.TypInfo, System.Math, Winapi.WinInet, System.NetConsts, Rest.Types, Delphi.Rest.JSON.Serializer, Delphi.Rest.Types, Delphi.Rest.Content.Parser;

{ TRestServerService }

procedure TRestServerService.FinishContext;
begin

end;

function TRestServerService.GetActive: Boolean;
begin
  Result := FActive;
end;

function TRestServerService.GetExceptionHandler: TObject;
begin
  Result := Self;
end;

function TRestServerService.GetParams(const Method: TRttiMethod; var ConvertedParams: TArray<TValue>): Boolean;
begin
  ConvertedParams := [];
  var Parameters := Method.GetParameters;

  Result := Length(Parameters) = 0;

  for var Param in Parameters do
    ConvertedParams := ConvertedParams + [GetParamValue(Method, Param, Result)];
end;

function TRestServerService.GetParamValue(const Method: TRttiMethod; const Param: TRttiParameter; var ParamLoaded: Boolean): TValue;

  function GetFiles: TArray<TRESTRequestFile>;
  begin
    Result := nil;

    for var A := 0 to Pred(Request.Files.Count) do
      if (Param.Name = Request.Files[A].FieldName) or Request.Files[A].FieldName.IsEmpty then
        Result := Result + [Request.Files[A]];
  end;

  function GetParamValue(Fields: TStrings; var ParamValue: String): Boolean;
  begin
    var ParamIndex := Fields.IndexOfName(Param.Name);
    Result := ParamIndex > -1;

    if Result then
      ParamValue := Fields.ValueFromIndex[ParamIndex];
  end;

  function CanGetContentFields: Boolean;
  begin
    Result := (Request.ContentType = CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED) or Request.ContentType.StartsWith(CONTENTTYPE_MULTIPART_FORM_DATA);
  end;

  function CanLoadParamFromContent: Boolean;
  begin
    Result := (Request.ContentType = CONTENTTYPE_APPLICATION_JSON) or Request.ContentType.StartsWith(CONTENTTYPE_TEXT_PLAIN);
  end;

  function GetParamValueFromContent(var ParamValue: String): Boolean;
  begin
    ParamValue := Request.Content;
    Result := not ParamValue.IsEmpty and (Length(Method.GetParameters) = 1) and CanLoadParamFromContent;
  end;

begin
  Result := TValue.Empty;

  case Param.ParamType.TypeKind of
    tkClassRef,
    tkInterface,
    tkMethod,
    tkPointer,
    tkProcedure,
    tkUnknown,
    tkVariant: raise EInvalidParameterType.Create('The param type is invalid!');

    tkClass:
      if Param.ParamType.AsInstance.MetaclassType = TRESTRequestFile then
      begin
        var Files := GetFiles;

        ParamLoaded := Length(Files) = 1;

        if ParamLoaded then
          Result := TValue.From(Files[0]);

        Exit;
      end;

    tkDynArray:
    begin
      var ArrayType := TRttiDynamicArrayType(Param.ParamType).ElementType;

      ParamLoaded := ArrayType.IsInstance and (ArrayType.AsInstance.MetaclassType = TRESTRequestFile);

      if ParamLoaded then
        Exit(TValue.From(GetFiles));
    end;
  end;

  var ParamValue: String;

  ParamLoaded := (GetParamValue(Request.QueryFields, ParamValue) or CanGetContentFields and GetParamValue(Request.ContentFields, ParamValue) or GetParamValueFromContent(ParamValue));

  if ParamLoaded then
    if IsTypeKindString(Param.ParamType.TypeKind) then
      Result := ParamValue
    else if ParamValue.IsEmpty then
      ParamLoaded := False
    else
      Result := Serializer.Deserialize(ParamValue, Param.ParamType.Handle);
end;

function TRestServerService.GetSerializer: IRestJsonSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TRestJsonSerializer.Create;

  Result := FSerializer;
end;

function TRestServerService.GetServiceContainer: IServiceContainer;
begin
  if not Assigned(FServiceContainer) and Assigned(FOnGetServiceContainer) then
    FServiceContainer := FOnGetServiceContainer;

  if not Assigned(FServiceContainer) then
    raise EServiceContainerNotLoaded.Create;

  Result := FServiceContainer;
end;

function TRestServerService.GetWebAppServices: IWebAppServices;
begin
  Result := Self;
end;

procedure TRestServerService.HandleException(E: Exception; var Handled: Boolean);
begin
  Handled := True;
  Response.Content := E.Message;
  Response.StatusCode := HTTP_STATUS_SERVER_ERROR;

  Response.SendResponse;
end;

function TRestServerService.HandleRequest: Boolean;
var
  Params: TArray<String>;

  Method: TRttiMethod;

  Return: TValue;

  function IsValidRequest: Boolean;
  begin
    Result := (Length(Params) > 0) and ExtractFileExt(Params[High(Params)]).IsEmpty;
  end;

  function GetContentType: String;
  begin
    var Attribute := Method.GetAttribute<ContentTypeAttribute>;

    if not Assigned(Attribute) then
      Attribute := Method.Parent.GetAttribute<ContentTypeAttribute>;

    if Assigned(Attribute) then
    begin
      Result := Attribute.ContentType;

      if not Attribute.CharSet.IsEmpty then
        Result := Format('%s; charset=%s', [Result, Attribute.CharSet]);
    end
    else
      Result := CONTENTTYPE_APPLICATION_JSON;
  end;

  procedure CheckContentDisposition;
  begin
    var Attribute := Method.GetAttribute<AttachmentAttribute>;

    if Assigned(Attribute) then
      Response.CustomHeaders.Values[sContentDisposition] := Format('attachment; filename="%s"', [Attribute.FileName]);
  end;

  procedure LoadContent;
  begin
    Response.ContentType := GetContentType;

    if not Return.IsEmpty and Return.IsType<TRESTResponseFile> then
      Response.ContentStream := Return.AsType<TRESTResponseFile>
    else
      Response.Content := Serializer.Serialize(Return);
  end;

begin
  var Instance := TValue.Empty;
  Params := Request.PathInfo.Split(['/'], TStringSplitOptions.ExcludeEmpty);
  var ServiceInfo: TRttiType := nil;

  Result := IsValidRequest and ServiceContainer.GetService(Params[0], ServiceInfo, Instance);

  if Result then
    if Length(Params) = 2 then
    begin
      Method := ServiceInfo.GetMethod(Params[1]);

      if Assigned(Method) then
      begin
        var ProcParams: TArray<TValue>;

        if GetParams(Method, ProcParams) then
        begin
          Return := Method.Invoke(Instance, ProcParams);

          if Assigned(Method.ReturnType) then
          begin
            LoadContent;

            CheckContentDisposition;
          end;

          Response.FreeContentStream := False;
          Response.StatusCode := HTTP_STATUS_OK;

          Response.SendResponse;
        end
        else
          Response.StatusCode := HTTP_STATUS_BAD_REQUEST;
      end
      else
        Response.StatusCode := HTTP_STATUS_NOT_FOUND;
    end
    else
      Response.StatusCode := HTTP_STATUS_NOT_FOUND;
end;

procedure TRestServerService.InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
begin
  FRequest := Request;
  FResponse := Response;
end;

function TRestServerService.Request: TWebRequest;
begin
  Result := FRequest;
end;

function TRestServerService.Response: TWebResponse;
begin
  Result := FResponse;
end;

{ EServiceContainerNotLoaded }

constructor EServiceContainerNotLoaded.Create;
begin
  inherited Create('The service container not loaded, load the ServiceContainer property or OnServiceContainer event!');
end;

end.

