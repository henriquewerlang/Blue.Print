unit Delphi.Rest.Client.Service;

interface

uses System.Rtti, Delphi.Rest.Communication;

type
  TClientService = class(TVirtualInterface)
  public
    constructor Create(Communication: IRestCommunication);

    class function GetService<T>: T;
  end;

implementation

{ TClientService }

constructor TClientService.Create(Communication: IRestCommunication);
begin

end;

class function TClientService.GetService<T>: T;
begin

end;

end.
