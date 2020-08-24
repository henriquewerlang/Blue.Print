unit Delphi.Rest.Communication.Pas2Js;

interface

uses Delphi.Rest.Communication;

type
  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    function SendRequest(URL: String; Body: TBody): String;
  end;

implementation

uses Web;

{ TRestCommunication }

function TRestCommunication.SendRequest(URL: String; Body: TBody): String;
var
  Connection: TXMLHttpRequest;

begin
  Connection := TXMLHttpRequest.Create;

  Connection.Open('GET', URL);

  Connection.Send(Body);

  Result := Connection.ResponseText;

  Connection.Free;
end;

end.
