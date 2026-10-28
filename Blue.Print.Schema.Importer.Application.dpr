program Blue.Print.Schema.Importer.Application;

uses
  System.SysUtils,
  Vcl.Forms,
  Blue.Print.Schema.Importer.Main in 'Blue.Print.Schema.Importer.Main.pas' {Main},
  Blue.Print.Serializer in 'Blue.Print.Serializer.pas',
  Blue.Print.Types in 'Blue.Print.Types.pas',
  Blue.Print.Schema.Importer in 'Blue.Print.Schema.Importer.pas',
  Blue.Print.JSON.Draft4.Schema.Converter in 'Blue.Print.JSON.Draft4.Schema.Converter.pas',
  Blue.Print.OpenAPI30.Schema.Converter in 'Blue.Print.OpenAPI30.Schema.Converter.pas',
  Blue.Print.OpenAPI30.Schema in 'Blue.Print.OpenAPI30.Schema.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
