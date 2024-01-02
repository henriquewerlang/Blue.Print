unit Blue.Print.Server.Service;

interface

uses System.Classes, System.SysUtils, System.Rtti, System.TypInfo, Web.HTTPApp, Web.ReqFiles, Blue.Print.Types;

type
  EInvalidParameterType = class(Exception);

  EFindServiceError = class(Exception)
  public
    constructor Create;
  end;

  TFindService = reference to function(const ServiceName: String): TValue;

  TBluePrintWebAppService = class(TComponent, IGetWebAppServices, IWebAppServices, IWebExceptionHandler, IWebDispatcherAccess)
  private
    FActive: Boolean;
    FOnFindService: TFindService;
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FRttiContext: TRttiContext;
    FSerializer: IBluePrintSerializer;

    function FindService(const ServiceName: String): TValue;
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

    property RttiContext: TRttiContext read FRttiContext;
  public
    constructor Create(AOwner: TComponent); override;

    destructor Destroy; override;

    property Serializer: IBluePrintSerializer read GetSerializer write FSerializer;
  published
    property Active: Boolean read FActive write FActive default True;
    property OnFindService: TFindService read FOnFindService write FOnFindService;
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

implementation

uses System.Math, System.NetConsts, System.Generics.Collections, Blue.Print.Serializer;

type
  TArrayEnumerator<T> = class(TEnumerator<T>)
  private
    FCurrent: NativeInt;
    FValue: TArray<T>;
  protected
    function DoGetCurrent: T; override;
    function DoMoveNext: Boolean; override;
  public
    constructor Create(const Value: TArray<T>);
  end;

{ TBluePrintWebAppService }

constructor TBluePrintWebAppService.Create(AOwner: TComponent);
begin
  inherited;

  FActive := True;
  FRttiContext := TRttiContext.Create;
end;

destructor TBluePrintWebAppService.Destroy;
begin
  FRttiContext.Free;

  inherited;
end;

function TBluePrintWebAppService.FindService(const ServiceName: String): TValue;
begin
  if Assigned(FOnFindService) then
    Result := FOnFindService(ServiceName)
  else
    raise EFindServiceError.Create;
end;

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
var
  HTTPStatusException: EHTTPStatusError absolute E;

begin
  Handled := True;
  Response.Content := E.Message;
  if E is EHTTPStatusError then
    Response.StatusCode := HTTPStatusException.StatusCode
  else
    Response.StatusCode := HTTP_STATUS_SERVER_ERROR;

  Response.SendResponse;
end;

function TBluePrintWebAppService.HandleRequest: Boolean;
const
  METHOD_NAME_INDEX = 1;
  PARAMS_INDEX = 2;
  SERVICE_NAME_INDEX = 0;

var
  Params: TArray<String>;

  Method: TRttiMethod;

  function IsValidRequest: Boolean;
  begin
    Result := (Length(Params) > 1) and ExtractFileExt(Params[High(Params)]).IsEmpty;
  end;

  function LoadParams: TArray<TValue>;
  var
    Buffer: TStringStream;

    Parameters: TList<TRttiParameter>;

    function LoadBuffer(const Value: String): TStringStream;
    begin
      Buffer.Size := 0;

      Buffer.WriteString(Value);

      Result := Buffer;
    end;

    procedure LoadParameterValue(const Parameter: TRttiParameter; const Value: String);
    begin
      Parameters.Extract(Parameter);

      Result[TArray.IndexOf<TRttiParameter>(Method.GetParameters, Parameter)] := FSerializer.Deserialize(LoadBuffer(Value), Parameter.ParamType.Handle);
    end;

    function FindParameterByName(const ParameterName: String): TRttiParameter;
    begin
      Result := nil;

      for var Parameter in Method.GetParameters do
        if Parameter.Name = ParameterName then
          Exit(Parameter);
    end;

    function GetCurrentParameter: TRttiParameter;
    begin
      if Parameters.IsEmpty then
        raise EHTTPErrorBadRequest.Create('Parameter count exceeded!')
      else
        Result := Parameters.First;
    end;

  begin
    Buffer := TStringStream.Create(EmptyStr, TEncoding.Unicode);
    Parameters := TList<TRttiParameter>.Create(Method.GetParameters);

    SetLength(Result, Parameters.Count);

    try
      for var A := PARAMS_INDEX to High(Params) do
        LoadParameterValue(GetCurrentParameter, Params[A]);

      for var A := 0 to Pred(Request.QueryFields.Count) do
        LoadParameterValue(FindParameterByName(Request.QueryFields.Names[A]), Request.QueryFields.ValueFromIndex[A]);

      if not Parameters.IsEmpty then
        raise EHTTPErrorBadRequest.Create('Parameter count mismatch!');
    finally
      Buffer.Free;

      Parameters.Free;
    end;
  end;

begin
  Params := Request.PathInfo.Split(['/'], TStringSplitOptions.ExcludeEmpty);
  Result := IsValidRequest;

  if Result then
  begin
    var Service := FindService(Params[SERVICE_NAME_INDEX]);

    if Service.IsEmpty then
      raise EHTTPErrorNotFound.Create;

    var ServiceType := RttiContext.GetType(Service.TypeInfo);

    Method := ServiceType.GetMethod(Params[METHOD_NAME_INDEX]);

    if not Assigned(Method) then
      raise EHTTPErrorNotFound.Create;

    var ReturnValue := Method.Invoke(Service, LoadParams);

    if Assigned(Method.ReturnType) then
    begin
      Response.ContentStream := TMemoryStream.Create;
      Response.StatusCode := HTTP_STATUS_OK;

      Serializer.Serialize(ReturnValue, Response.ContentStream);

      Response.ContentStream.Position := 0;
    end
    else
      Response.StatusCode := HTTP_STATUS_NO_CONTENT;
  end;
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

{ TArrayEnumerator<T> }

constructor TArrayEnumerator<T>.Create(const Value: TArray<T>);
begin
  FCurrent := -1;
  FValue := Value;
end;

function TArrayEnumerator<T>.DoGetCurrent: T;
begin
  Result := FValue[FCurrent];
end;

function TArrayEnumerator<T>.DoMoveNext: Boolean;
begin
  Inc(FCurrent);

  Result := FCurrent < Length(FValue);
end;

{ EFindServiceError }

constructor EFindServiceError.Create;
begin
  inherited Create('You must load the OnFindService event and return the instance of the object to treat the request!');
end;

initialization
  RegisterContentParser(TImageContentParser);

end.

