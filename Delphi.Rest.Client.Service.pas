unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, Delphi.Rest.Communication;

type
  TClientService = class
  private
    FCommunication: IRestCommunication;
    FContext: TRttiContext;
    FRttiType: TRttiInterfaceType;
    FURL: String;

{$IFDEF PAS2JS}
    function OnInvokeMethod(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
{$ELSE}
    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
{$ENDIF}
    function Deserialize(const JSON: String; Method: TRttiMethod): TValue;
  public
    constructor Create(URL: String; Communication: IRestCommunication);

    function GetService<T: IInterface>: T;
  end;

implementation

uses Delphi.Rest.JSON.Serializer,
{$IFDEF PAS2JS}
  JS, JSON.Serializers.Pas2Js
{$ELSE}
  System.JSON.Serializers
{$ENDIF}
    ;

{ TClientService }

constructor TClientService.Create(URL: String; Communication: IRestCommunication);
begin
  inherited Create;

  FCommunication := Communication;
  FContext := TRttiContext.Create;
  FURL := URL;
end;

function TClientService.Deserialize(const JSON: String; Method: TRttiMethod): TValue;
var
  Serializer: TRestJsonSerializer;

begin
  if Assigned(Method.ReturnType) then
  begin
    Serializer := TRestJsonSerializer.Create;

    Result := Serializer.Deserialize(JSON, Method.ReturnType.Handle);

    Serializer.Free;
  end
  else
    Result := TValue.Empty;
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
function TClientService.OnInvokeMethod(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
{$ELSE}
procedure TClientService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
{$ENDIF}
var
  A: Integer;

  Body: TBody;

{$IFDEF PAS2JS}
  Method: TRttiMethod;

{$ENDIF}
begin
  Body := TBody.Create;
{$IFDEF PAS2JS}
  Method := FRttiType.GetMethod(aMethodName);
{$ENDIF}

  for A := Succ(Low(Args)) to High(Args) do
    Body.Values := Body.Values + [{$IFDEF PAS2JS}TValue.FromJSValue{$ENDIF}(Args[A])];

  Result := Deserialize(FCommunication.SendRequest(Format('%s/%s/%s', [FURL, FRttiType.Name.Substring(1), Method.Name]), Body), Method){$IFDEF PAS2JS}.AsJSValue{$ENDIF};

  Body.Free;
end;

end.
