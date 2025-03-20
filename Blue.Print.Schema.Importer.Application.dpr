program Blue.Print.Schema.Importer.Application;

uses
  System.SysUtils,
  Vcl.Forms,
  Blue.Print.Schema.Importer.Main in 'Blue.Print.Schema.Importer.Main.pas' {Main},
  Blue.Print.Schema.Importer in 'Blue.Print.Schema.Importer.pas',
  Xml.XMLSchema in 'c:\program files (x86)\embarcadero\studio\23.0\SOURCE\XML\Xml.XMLSchema.pas',
  Blue.Print.Serializer in 'Blue.Print.Serializer.pas',
  Blue.Print.Types in 'Blue.Print.Types.pas';

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
