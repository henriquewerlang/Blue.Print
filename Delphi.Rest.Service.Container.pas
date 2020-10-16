unit Delphi.Rest.Service.Container;

interface

uses System.Rtti;

type
  IServiceContainer = interface
    ['{B34DEF5C-A790-4DD6-B47C-506AEF7DDC27}']
    function GetService(const Name: String; out Info: TRttiType; out Instance: TValue): Boolean;
  end;

implementation

end.
