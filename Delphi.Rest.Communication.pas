unit Delphi.Rest.Communication;

interface

uses System.Rtti, System.SysUtils;

type
  TBody = class
  public
    Values: TArray<TValue>;
  end;

  IRestCommunication = interface
    ['{69FF8AFB-94B8-4485-9794-184F2DCDE8F1}']
    function SendRequest(URL: String; Body: TBody): String;
  end;

implementation

end.
