unit Delphi.Rest.Server.Service;

interface

uses System.Classes, System.SysUtils, System.Rtti, Web.HTTPApp, Delphi.Rest.Service.Container, Delphi.Rest.JSON.Serializer.Intf;

type
  EInvalidParameterType = class(Exception);

  TOnGetServiceContainer = function: IServiceContainer of object;

  TRestServerService = class(TComponent, IGetWebAppServices, IWebAppServices, IWebExceptionHandler)
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
  public
    property Request: TWebRequest read FRequest;
    property Response: TWebResponse read FResponse;
    property Serializer: IRestJsonSerializer read GetSerializer write FSerializer;
    property ServiceContainer: IServiceContainer read GetServiceContainer write FServiceContainer;
  published
    property Active: Boolean read FActive write FActive;
    property OnGetServiceContainer: TOnGetServiceContainer read FOnGetServiceContainer write FOnGetServiceContainer;
  end;

implementation

uses System.TypInfo, System.Math, Winapi.WinInet, Rest.Types, Delphi.Rest.JSON.Serializer, Delphi.Rest.Types, Delphi.Rest.Content.Parser;

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

  function GetFiles: TArray<TStream>;
  begin
    Result := nil;

    for var A := 0 to Pred(Request.Files.Count) do
      Result := Result + [Request.Files[A].Stream];
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
      if Param.ParamType.AsInstance.MetaclassType = TStream then
      begin
        ParamLoaded := Request.Files.Count = 1;

        if ParamLoaded then
          Result := TValue.From(Request.Files[0].Stream);

        Exit;
      end;
    tkDynArray:
    begin
      var ArrayType := TRttiDynamicArrayType(Param.ParamType).ElementType;

      ParamLoaded := ArrayType.IsInstance and (ArrayType.AsInstance.MetaclassType = TStream);

      if ParamLoaded then
        Exit(TValue.From(GetFiles));
    end;
  end;

  var ParamValue := Request.QueryFields.Values[Param.Name];

  if ParamValue.IsEmpty then
    ParamValue := Request.ContentFields.Values[Param.Name];

  ParamLoaded := not ParamValue.IsEmpty;

  if ParamLoaded then
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
begin
  var URL := Request.URL;

  Result := ExtractFileExt(URL).IsEmpty;

  if Result then
  begin
    var Info: TRttiType := nil;
    var Instance := TValue.Empty;
    var Params := URL.Split(['/'], TStringSplitOptions.ExcludeEmpty);
    Result := (Length(Params) > 0) and ServiceContainer.GetService(Params[0], Info, Instance);

    if Result then
      if Length(Params) = 2 then
      begin
        var Method := Info.GetMethod(Params[1]);

        if Assigned(Method) then
        begin
          var ProcParams: TArray<TValue>;

          if GetParams(Method, ProcParams) then
          begin
            var Return := Method.Invoke(Instance, ProcParams);

            if Assigned(Method.ReturnType) then
            begin
              Response.Content := Serializer.Serialize(Return);
              Response.ContentType := CONTENTTYPE_APPLICATION_JSON;
            end;

            Response.StatusCode := HTTP_STATUS_OK;
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
end;

procedure TRestServerService.InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
begin
  FRequest := Request;
  FResponse := Response;
end;

end.
