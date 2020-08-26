unit Delphi.Rest.Communication.Pas2Js;

interface

uses Delphi.Rest.Communication, Web;

type
  TRestCommunication = class(TInterfacedObject, IRestCommunication)
  private
    function SendRequest(URL: String; Body: TBody): String;
  end;

implementation

{ TRestCommunication }

function TRestCommunication.SendRequest(URL: String; Body: TBody): String;
var
  Connection: TJSXMLHttpRequest;

begin
  Connection := TJSXMLHttpRequest.New;

  Connection.Open('GET', URL);

  Connection.Send(Body);

  Result := Connection.ResponseText;
//
//  Connection.Free;
end;

end.
