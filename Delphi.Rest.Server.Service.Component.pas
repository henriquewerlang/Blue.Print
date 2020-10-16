unit Delphi.Rest.Server.Service.Component;

interface

uses System.Classes, System.SysUtils, System.Rtti, Web.HTTPApp, Delphi.Rest.Service.Container, Delphi.Rest.JSON.Serializer;

type
  EInvalidParameterType = class(Exception);

  TRestServerService = class(TComponent, IGetWebAppServices, IWebAppServices, IWebExceptionHandler)
  private
    FActive: Boolean;
    FRequest: TWebRequest;
    FResponse: TWebResponse;
    FServiceContainer: IServiceContainer;
    FSerializer: TRestJsonSerializer;

    function GetParams(Info: TRttiMethod; const Params: TArray<String>; var ConvertedParams: TArray<TValue>): Boolean;
    function GetParamValue(Param: TRttiParameter; const Value: String): TValue;
    function GetSerializer: TRestJsonSerializer;
    function GetValue(RttiType: TRttiType; const Value: String): TValue;

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

    property Serializer: TRestJsonSerializer read GetSerializer;
  public
    destructor Destroy; override;

    property Request: TWebRequest read FRequest;
    property Response: TWebResponse read FResponse;
    property ServiceContainer: IServiceContainer read FServiceContainer write FServiceContainer;
  published
    property Active: Boolean read FActive write FActive;
  end;

implementation

uses System.TypInfo, System.Math, Winapi.WinInet;

{ TRestServerService }

destructor TRestServerService.Destroy;
begin
  FSerializer.Free;

  inherited;
end;

procedure TRestServerService.FinishContext;
begin

end;

function TRestServerService.GetActive: Boolean;
begin
  Result := FActive;
end;

function TRestServerService.GetExceptionHandler: TObject;
begin
  Result := nil;
end;

function TRestServerService.GetParams(Info: TRttiMethod; const Params: TArray<String>; var ConvertedParams: TArray<TValue>): Boolean;
const
  OFFSET_PROCEDURE = 2;

begin
  ConvertedParams := [];
  var Parameters := Info.GetParameters;
  Result := Length(Params) - OFFSET_PROCEDURE = Length(Parameters);

  if Result then
    for var A := Low(Parameters) to High(Parameters) do
      ConvertedParams := ConvertedParams + [GetParamValue(Parameters[A], Params[A + OFFSET_PROCEDURE])];
end;

function TRestServerService.GetParamValue(Param: TRttiParameter; const Value: String): TValue;
begin
  Result := GetValue(Param.ParamType, Value);
end;

function TRestServerService.GetSerializer: TRestJsonSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TRestJsonSerializer.Create;

  Result := FSerializer;
end;

function TRestServerService.GetValue(RttiType: TRttiType; const Value: String): TValue;
begin
  case RttiType.TypeKind of
    tkArray: ;
    tkMRecord: ;
    tkRecord: ;

    tkClass: Result := Serializer.Deserialize(Value, RttiType.Handle);

    tkDynArray:
    begin
      var ArrayType := TRttiDynamicArrayType(RttiType);
      var Return: TArray<TValue> := nil;
      var Values := Value.Substring(1, Value.Length - 2).Split([',']);

      for var ArrayValue in Values do
        Return := Return + [GetValue(ArrayType.ElementType, ArrayValue.Trim)];

      Result := TValue.FromArray(ArrayType.Handle, Return);
    end;

    tkChar,
    tkLString,
    tkString,
    tkUString,
    tkWChar,
    tkWString: Result := Value.Substring(1, Value.Length - 2);

    tkEnumeration: Result := TValue.FromOrdinal(RttiType.Handle, GetEnumValue(RttiType.Handle, Value));

    tkFloat: Result := StrToFloat(Value, TFormatSettings.Invariant);

    tkInt64: Result := Value.ToInt64;

    tkInteger: Result := Value.ToInteger;

    tkSet:
    begin
      var EnumValue := 0;
      var EnumNames := Value.Substring(1, Value.Length - 2).Split([',']);

      for var EnumName in EnumNames do
        EnumValue := EnumValue + Trunc(IntPower(2, GetValue(TRttiSetType(RttiType).ElementType, EnumName.Trim).AsOrdinal));

      TValue.Make(EnumValue, RttiType.Handle, Result);
    end;

    tkClassRef,
    tkMethod,
    tkInterface,
    tkPointer,
    tkProcedure,
    tkUnknown,
    tkVariant: raise EInvalidParameterType.Create('The param type is invalid!');
  end;
end;

function TRestServerService.GetWebAppServices: IWebAppServices;
begin
  Result := Self;
end;

procedure TRestServerService.HandleException(E: Exception; var Handled: Boolean);
begin

end;

function TRestServerService.HandleRequest: Boolean;
begin
  var Info: TRttiType;
  var Instance: TValue;
  var Params := Request.URL.Split(['/'], TStringSplitOptions.ExcludeEmpty);

  Result := (Length(Params) > 0) and ServiceContainer.GetService(Params[0], Info, Instance);

  if Result then
    if Length(Params) = 1 then
      Response.StatusCode := HTTP_STATUS_NOT_FOUND
    else
    begin
      var Method := Info.GetMethod(Params[1]);

      if Assigned(Method) then
      begin
        var ProcParams: TArray<TValue>;

        if GetParams(Method, Params, ProcParams) then
        begin
          var Return := Method.Invoke(Instance, ProcParams);

          if Assigned(Method.ReturnType) then
            Response.Content := Serializer.Serialize(Return);
        end
        else
          Response.StatusCode := HTTP_STATUS_BAD_REQUEST;
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

