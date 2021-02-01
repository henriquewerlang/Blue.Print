unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, System.SysUtils, System.Types, System.TypInfo, Delphi.Rest.JSON.Serializer.Intf;

type
  IRestCommunication = interface
    ['{33BB3249-F044-4BDF-B3E0-EA2378A040C4}']
    function SendRequest(URL: String): String;{$IFDEF PAS2JS} async;{$ENDIF}
  end;

  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    function SendRequest(URL: String): String;{$IFDEF PAS2JS} async;{$ENDIF}
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
    function GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;

    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
    {$IFDEF PAS2JS}
    function OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
    function OnInvokeMethodPas2JsAsync(const aMethodName: String; const Args: TJSValueDynArray): JSValue; async;
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
  JS, Web, Pas2Js.Rest.JSON.Serializers;
{$ELSE}
  Delphi.Rest.JSON.Serializer;
{$ENDIF}

const
  COMPILER_OFFSET = 1;

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
  Instance := TVirtualInterface.Create(TypeInfo(T), {$IFDEF PAS2JS}@OnInvokeMethodPas2Js{$ELSE}OnInvokeMethod{$ENDIF});

  Instance.QueryInterface(FRttiType.GUID, Result);
end;

function TClientService.GetURLParams(Method: TRttiMethod; const Args: TArray<TValue>): String;
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

    Result := Result + Format('%s=%s', [Params[A].Name, Serializer.Serialize(Args[COMPILER_OFFSET + A])]);
  end;

  if not Result.IsEmpty then
    Result := '?' + Result;
end;

procedure TClientService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  Result := Deserialize(Communication.SendRequest(Format('%s/%s/%s%s', [FURL, FRttiType.Name.Substring(1), Method.Name, GetURLParams(Method, Args)])), Method);
end;

{$IFDEF PAS2JS}
function TClientService.OnInvokeMethodPas2Js(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
begin
  Result := OnInvokeMethodPas2JsAsync(aMethodName, Args);
end;

function TClientService.OnInvokeMethodPas2JsAsync(const aMethodName: String; const Args: TJSValueDynArray): JSValue;
var
  A: Integer;

  Method: TRttiMethod;

  Params: TArray<TValue>;

  Return: TValue;

  Param: TRttiParameter;

  Parameters: TArray<TRttiParameter>;

begin
  Method := FRttiType.GetMethod(aMethodName);
  Parameters := Method.GetParameters;

  SetLength(Params, Succ(Length(Args)));

  for A := Low(Args) to High(Args) do
    Params[COMPILER_OFFSET + A] := TValue.Make(Parameters[A].ParamType.Handle, Args[A]);

  OnInvokeMethod(Method, Params, Return);

  Result := Return.AsJSValue;
end;
{$ENDIF}

{ TRestCommunication }

function TRestCommunication.SendRequest(URL: String): String;
{$IFDEF PAS2JS}
var
  Response: TJSResponse;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  Response := await(Window.Fetch(URL));

  Result := await(Response.Text);
{$ENDIF}
end;

end.

