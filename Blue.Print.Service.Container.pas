unit Blue.Print.Service.Container;

interface

uses System.Rtti;

type
  IServiceContainer = interface
    ['{B34DEF5C-A790-4DD6-B47C-506AEF7DDC27}']
    function GetService(const Name: String; var Info: TRttiType; var Instance: TValue): Boolean;
  end;

implementation

end.
