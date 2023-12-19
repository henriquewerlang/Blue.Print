unit Blue.Print.Server.Service;

interface

uses System.Classes, System.SysUtils, System.Rtti, System.TypInfo, Web.HTTPApp, Web.ReqFiles, Blue.Print.Types;

type
  EInvalidParameterType = class(Exception);

  EServiceContainerNotLoaded = class(Exception)
  public
    constructor Create;
  end;

  TImageContentParser = class(TAbstractContentParser)
  private
    FContentFiels: TStrings;
    FFiles: TWebRequestFiles;

    procedure LoadImagem;
  public
    destructor Destroy; override;

    class function CanParse(AWebRequest: TWebRequest): Boolean; override;

    function GetContentFields: TStrings; override;
    function GetFiles: TAbstractWebRequestFiles; override;
  end;

  TBluePrintWebAppService = class(TComponent, IGetWebAppServices, IWebAppServices, IWebExceptionHandler, IWebDispatcherAccess)
  private
    FActive: Boolean;
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FSerializer: IBluePrintSerializer;

    function GetParams(const Method: TRttiMethod; var ConvertedParams: TArray<TValue>): Boolean;
    function GetParamValue(const Method: TRttiMethod; const Param: TRttiParameter; var ParamLoaded: Boolean): TValue;
    function GetSerializer: IBluePrintSerializer;
  protected
    // IGetWebAppServices
    function GetWebAppServices: IWebAppServices;

    // IWebAppServices
    function GetActive: Boolean;
    function GetExceptionHandler: TObject;
    function HandleRequest: Boolean;

    procedure FinishContext;
    procedure InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);

    // IWebExceptionHandler
    procedure HandleException(E: Exception; var Handled: Boolean);

    // IWebDispatcherAccess
    function Request: TWebRequest;
    function Response: TWebResponse;
  public
    property Serializer: IBluePrintSerializer read GetSerializer write FSerializer;
  published
    property Active: Boolean read FActive write FActive;
  end;

implementation

uses System.Math, Winapi.WinInet, System.NetConsts, Rest.Types, Blue.Print.Serializer;

{ TBluePrintWebAppService }

procedure TBluePrintWebAppService.FinishContext;
begin

end;

function TBluePrintWebAppService.GetActive: Boolean;
begin
  Result := FActive;
end;

function TBluePrintWebAppService.GetExceptionHandler: TObject;
begin
  Result := Self;
end;

function TBluePrintWebAppService.GetParams(const Method: TRttiMethod; var ConvertedParams: TArray<TValue>): Boolean;
begin
  ConvertedParams := [];
  var Parameters := Method.GetParameters;

  Result := Length(Parameters) = 0;

  for var Param in Parameters do
    ConvertedParams := ConvertedParams + [GetParamValue(Method, Param, Result)];
end;

function TBluePrintWebAppService.GetParamValue(const Method: TRttiMethod; const Param: TRttiParameter; var ParamLoaded: Boolean): TValue;

  function GetFiles: TArray<TRequestFile>;
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

  function CanLoadParamFromContentFields: Boolean;
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
      if Param.ParamType.AsInstance.MetaclassType = TRequestFile then
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

      ParamLoaded := ArrayType.IsInstance and (ArrayType.AsInstance.MetaclassType = TRequestFile);

      if ParamLoaded then
        Exit(TValue.From(GetFiles));
    end;
  end;

  var ParamValue: String;

  ParamLoaded := (GetParamValue(Request.QueryFields, ParamValue) or CanLoadParamFromContentFields and GetParamValue(Request.ContentFields, ParamValue) or GetParamValueFromContent(ParamValue));

  if ParamLoaded then
    if IsTypeKindString(Param.ParamType.TypeKind) then
      Result := ParamValue
    else if ParamValue.IsEmpty then
      ParamLoaded := False
    else
//      Result := Serializer.Deserialize(ParamValue, Param.ParamType.Handle);
end;

function TBluePrintWebAppService.GetSerializer: IBluePrintSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TBluePrintJsonSerializer.Create;

  Result := FSerializer;
end;

function TBluePrintWebAppService.GetWebAppServices: IWebAppServices;
begin
  Result := Self;
end;

procedure TBluePrintWebAppService.HandleException(E: Exception; var Handled: Boolean);
begin
  Handled := True;
  Response.Content := E.Message;
  Response.StatusCode := HTTP_STATUS_SERVER_ERROR;

  Response.SendResponse;
end;

function TBluePrintWebAppService.HandleRequest: Boolean;
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

    if not Return.IsEmpty and Return.IsType<TResponseFile> then
      Response.ContentStream := Return.AsType<TResponseFile>
//    else
//      Response.Content := Serializer.Serialize(Return);
  end;

  procedure LoadHeaders;
  begin
    for var MethodAttribute in Method.GetAttributes do
      if MethodAttribute is HeaderAttribute then
      begin
        var MethodHeader := HeaderAttribute(MethodAttribute);
        Response.CustomHeaders.Values[MethodHeader.Name] := MethodHeader.Value;
      end;

    for var ServiceAttribute in Method.Parent.GetAttributes do
      if ServiceAttribute is HeaderAttribute then
      begin
        var ServiceHeader := HeaderAttribute(ServiceAttribute);
        Response.CustomHeaders.Values[ServiceHeader.Name] := ServiceHeader.Value;
      end;
  end;

begin
  var Instance := TValue.Empty;
  Params := Request.PathInfo.Split(['/'], TStringSplitOptions.ExcludeEmpty);
  var ServiceInfo: TRttiType := nil;

  Result := IsValidRequest {and ServiceContainer.GetService(Params[0], ServiceInfo, Instance)};

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

          LoadHeaders;

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

procedure TBluePrintWebAppService.InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
begin
  FRequest := Request;
  FResponse := Response;
end;

function TBluePrintWebAppService.Request: TWebRequest;
begin
  Result := FRequest;
end;

function TBluePrintWebAppService.Response: TWebResponse;
begin
  Result := FResponse;
end;

{ EServiceContainerNotLoaded }

constructor EServiceContainerNotLoaded.Create;
begin
  inherited Create('The service container not loaded, load the ServiceContainer property or OnServiceContainer event!');
end;

{ TImageContentParser }

class function TImageContentParser.CanParse(AWebRequest: TWebRequest): Boolean;
begin
  Result := AWebRequest.ContentType.StartsWith('image/');
end;

destructor TImageContentParser.Destroy;
begin
  FFiles.Free;

  FContentFiels.Free;

  inherited;
end;

function TImageContentParser.GetContentFields: TStrings;
begin
  if not Assigned(FContentFiels) then
    FContentFiels := TStringList.Create;

  Result := FContentFiels;
end;

function TImageContentParser.GetFiles: TAbstractWebRequestFiles;
begin
  if not Assigned(FFiles) then
  begin
    FFiles := TWebRequestFiles.Create;

    LoadImagem;
  end;

  Result := FFiles;
end;

procedure TImageContentParser.LoadImagem;
begin
  FFiles.Add(EmptyStr, EmptyStr, EmptyStr, WebRequest.RawContent, WebRequest.ContentLength);
end;

initialization
  RegisterContentParser(TImageContentParser);

end.

