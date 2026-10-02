program Blue.Print.Schema.Importer.Application;

uses
  System.SysUtils,
  Vcl.Forms,
  Blue.Print.Schema.Importer.Main in 'Blue.Print.Schema.Importer.Main.pas' {Main},
  Blue.Print.Serializer in 'Blue.Print.Serializer.pas',
  {$R}
  Blue.Print.Types in 'Blue.Print.Types.pas' {$R *.res},
  Blue.Print.Schema.Importer in 'Blue.Print.Schema.Importer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
