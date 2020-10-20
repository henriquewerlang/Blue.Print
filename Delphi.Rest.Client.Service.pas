unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, Delphi.Rest.JSON.Serializer;

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
    FSerializer: TRestJsonSerializer;
    FCommunication: IRestCommunication;

{$IFDEF PAS2JS}
    function GetURLParams(const Args: TJSValueDynArray): String;
    function OnInvokeMethod(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
{$ELSE}
    function GetURLParams(const Args: TArray<TValue>): String;

    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
{$ENDIF}

    function Deserialize(const JSON: String; Method: TRttiMethod): TValue;
  public
    constructor Create(URL: String); overload;
    constructor Create(URL: String; Communication: IRestCommunication); overload;

    destructor Destroy; override;

    function GetService<T: IInterface>: T;

    property Communication: IRestCommunication read FCommunication write FCommunication;
  end;

implementation

uses
{$IFDEF PAS2JS}
  JS, Web, JSON.Serializers.Pas2Js
{$ELSE}
  System.JSON.Serializers
{$ENDIF}
    ;

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
  FSerializer := TRestJsonSerializer.Create;
  FURL := URL;
end;

function TClientService.Deserialize(const JSON: String; Method: TRttiMethod): TValue;
begin
  if Assigned(Method.ReturnType) then
    Result := FSerializer.Deserialize(JSON, Method.ReturnType.Handle)
  else
    Result := TValue.Empty;
end;

destructor TClientService.Destroy;
begin
  FSerializer.Free;

  inherited;
end;

function TClientService.GetService<T>: T;
var
  Instance: TVirtualInterface;

begin
  FRttiType := FContext.GetType(TypeInfo(T)) as TRttiInterfaceType;
  Instance := TVirtualInterface.Create(TypeInfo(T), {$IFDEF PAS2JS}@{$ENDIF}OnInvokeMethod);

  Instance.QueryInterface(FRttiType.GUID, Result);
end;

{$IFDEF PAS2JS}
function TClientService.GetURLParams(const Args: TJSValueDynArray): String;
{$ELSE}
function TClientService.GetURLParams(const Args: TArray<TValue>): String;
{$ENDIF}
const
  COMPILER_OFFSET =
{$IFDEF DCC}
    1
{$ELSE}
    0
{$ENDIF}
    ;

var
  A: Integer;

begin
  Result := EmptyStr;

  for A := Low(Args) + COMPILER_OFFSET to High(Args) do
    Result := Result + '/' + FSerializer.Serialize({$IFDEF PAS2JS}TValue.FromJSValue{$ENDIF}(Args[A]));
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

  Result := Deserialize(Communication.SendRequest(Format('%s/%s/%s%s', [FURL, FRttiType.Name.Substring(1), Method.Name, GetURLParams(Args)])), Method){$IFDEF PAS2JS}.AsJSValue{$ENDIF};
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

  Result := Connection.ResponseText;
{$ENDIF}
end;

end.

