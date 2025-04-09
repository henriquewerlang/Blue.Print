program Blue.Print.Schema.Importer.Application;

uses
  System.SysUtils,
  Vcl.Forms,
  Blue.Print.Schema.Importer.Main in 'Blue.Print.Schema.Importer.Main.pas' {Main},
  Blue.Print.Schema.Importer in 'Blue.Print.Schema.Importer.pas',
  Blue.Print.Serializer in 'Blue.Print.Serializer.pas',
  Blue.Print.Types in 'Blue.Print.Types.pas',
  Blue.Print.Open.API.Schema.v30 in 'Blue.Print.Open.API.Schema.v30.pas',
  Blue.Print.Open.API.Schema.v20 in 'Blue.Print.Open.API.Schema.v20.pas',
  Blue.Print.JSON.Schema in 'Blue.Print.JSON.Schema.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  if FindCmdLineSwitch('XSD') then
    ImportCommandLine
  else
    Application.CreateForm(TMain, Main);
  Application.Run;
end.
