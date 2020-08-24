unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, Delphi.Rest.Communication;

type
  TClientService = class
  private
    FCommunication: IRestCommunication;
    FContext: TRttiContext;

    procedure OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
  public
    constructor Create(Communication: IRestCommunication);

    function GetService<T: IInterface>: T;
  end;

implementation

uses System.SysUtils;

{ TClientService }

constructor TClientService.Create(Communication: IRestCommunication);
begin
  inherited Create;

  FCommunication := Communication;
  FContext := TRttiContext.Create;
end;

function TClientService.GetService<T>: T;
begin
  var Instance := TVirtualInterface.Create(TypeInfo(T), OnInvokeMethod);
  var RttiType := FContext.GetType(TypeInfo(T)) as TRttiInterfaceType;

  Instance.QueryInterface(RttiType.GUID, Result);
end;

procedure TClientService.OnInvokeMethod(Method: TRttiMethod; const Args: TArray<TValue>; out Result: TValue);
begin
  var Body := TBody.Create;

  for var A := Succ(Low(Args)) to High(Args) do
    Body.Values := Body.Values + [Args[A]];

  FCommunication.SendRequest(Format('/%s/%s', [Method.Parent.Name.Substring(1), Method.Name]), Body);

  Body.Free;
end;

end.

