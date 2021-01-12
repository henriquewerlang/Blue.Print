unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, Delphi.Rest.JSON.Serializer.Intf;

type
  IRestCommunication = interface
    ['{33BB3249-F044-4BDF-B3E0-EA2378A040C4}']
    function SendRequest(URL: String): String;
  end;

  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    function SendRequest(URL: String): String;
  end;

  TClientService = class
  private
    FContext: TRttiContext;
    FRttiType: TRttiInterfaceType;
    FURL: String;
    FSerializer: IRestJsonSerializer;
    FCommunication: IRestCommunication;

    function Deserialize(const JSON: String; Method: TRttiMethod): TValue;
    function GetSerializer: IRestJsonSerializer;
    function GetURLParams(Method: TRttiMethod; const Args: {$IFDEF PAS2JS}TJSValueDynArray{$ELSE}TArray<TValue>{$ENDIF}): String;

    {$IFDEF PAS2JS}
    function OnInvokeMethod(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
    {$ELSE}
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    {$ENDIF}
  public
    constructor Create(URL: String); overload;
    constructor Create(URL: String; Communication: IRestCommunication); overload;

    function GetService<T: IInterface>: T;

    property Communication: IRestCommunication read FCommunication write FCommunication;
    property Serializer: IRestJsonSerializer read GetSerializer write FSerializer;
  end;

implementation

uses
{$IFDEF PAS2JS}
  JS, Web, JSON.Serializers.Pas2Js,
{$ENDIF}
  Delphi.Rest.JSON.Serializer;

{ TClientService }

constructor TClientService.Create(URL: String);
begin
  Create(URL, TRestCommunication.Create);
end;

constructor TClientService.Create(URL: String; Communication: IRestCommunication);
begin
  inherited Create;

  FCommunication := Communication;
  FContext := TRttiContext.Create;
  FURL := URL;
end;

function TClientService.Deserialize(const JSON: String; Method: TRttiMethod): TValue;
begin
  if Assigned(Method.ReturnType) then
    Result := Serializer.Deserialize(JSON, Method.ReturnType.Handle)
  else
    Result := TValue.Empty;
end;

function TClientService.GetSerializer: IRestJsonSerializer;
begin
  if not Assigned(FSerializer) then
    FSerializer := TRestJsonSerializer.Create;

  Result := FSerializer;
end;

function TClientService.GetService<T>: T;
var
  Instance: TVirtualInterface;

begin
  FRttiType := FContext.GetType(TypeInfo(T)) as TRttiInterfaceType;
  Instance := TVirtualInterface.Create(TypeInfo(T), {$IFDEF PAS2JS}@{$ENDIF}OnInvokeMethod);

  Instance.QueryInterface(FRttiType.GUID, Result);
end;

function TClientService.GetURLParams(Method: TRttiMethod; const Args: {$IFDEF PAS2JS}TJSValueDynArray{$ELSE}TArray<TValue>{$ENDIF}): String;
const
  COMPILER_OFFSET = {$IFDEF DCC}1{$ELSE}0{$ENDIF};

var
  A: Integer;

  Params: TArray<TRttiParameter>;

begin
  Params := Method.GetParameters;
  Result := EmptyStr;

  for A := Low(Params) to High(Params) do
  begin
    if not Result.IsEmpty then
      Result := Result + '&';

    Result := Result + Format('%s=%s', [Params[A].Name, Serializer.Serialize({$IFDEF PAS2JS}TValue.FromJSValue{$ENDIF}(Args[COMPILER_OFFSET + A]))]);
  end;

  if not Result.IsEmpty then
    Result := '?' + Result;
end;

{$IFDEF PAS2JS}
function TClientService.OnInvokeMethod(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
{$ELSE}
procedure TClientService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
{$ENDIF}
{$IFDEF PAS2JS}
var
  Method: TRttiMethod;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  Method := FRttiType.GetMethod(aMethodName);
{$ENDIF}

  Result := Deserialize(Communication.SendRequest(Format('%s/%s/%s%s', [FURL, FRttiType.Name.Substring(1), Method.Name, GetURLParams(Method, Args)])), Method){$IFDEF PAS2JS}.AsJSValue{$ENDIF};
end;

{ TRestCommunication }

function TRestCommunication.SendRequest(URL: String): String;
{$IFDEF PAS2JS}
var
  Connection: TJSXMLHttpRequest;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  Connection := TJSXMLHttpRequest.New;

  Connection.Open('GET', URL, False);

  Connection.Send;

  if Connection.Status <> 200 then
    raise Exception.CreateFmt('The service "%s" called not found!', [URL]);

  Result := Connection.ResponseText;
{$ENDIF}
end;

end.

