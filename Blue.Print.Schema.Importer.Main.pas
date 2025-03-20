unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes;

type
  TMain = class(TForm)
    SchemaFileName: TEdit;
    lblSchemaFile: TLabel;
    SelectSchemaFile: TButton;
    OpenSchemaFile: TOpenDialog;
    GenerateFiles: TButton;
    procedure GenerateFilesClick(Sender: TObject);
    procedure SelectSchemaFileClick(Sender: TObject);
  end;

  procedure ImportCommandLine;

var
  Main: TMain;

implementation

{$R *.dfm}

uses System.SysUtils, Blue.Print.Schema.Importer;

procedure ImportCommandLine;
begin
  var AliasCommand: String;
  var ConfigFile: String;
  var FileName: String;
  var Importer := TImporter.Create;
  var TypeChange: String;

  if FindCmdLineSwitch('XSD', FileName) then
  begin
    var List := TStringList.Create('"', ';');

    if FindCmdLineSwitch('Alias', AliasCommand) then
    begin
      List.DelimitedText := AliasCommand;

      for var A := 0 to Pred(List.Count) do
        Importer.AddUnitName(List.Names[A], List.ValueFromIndex[A]);
    end;

    if FindCmdLineSwitch('TypeChange', TypeChange) then
    begin
      List.DelimitedText := TypeChange;

      for var A := 0 to Pred(List.Count) do
        Importer.AddChangeType(List.Names[A], List.ValueFromIndex[A]);
    end;

    if FindCmdLineSwitch('Config', ConfigFile) then
      Importer.LoadConfig(ConfigFile);

    Importer.Import(FileName);
  end;

  Importer.Free;
end;

{ TMain }

procedure TMain.GenerateFilesClick(Sender: TObject);
begin
  var Importer := TImporter.Create;

  Importer.Import(SchemaFileName.Text);

  Importer.Free;
end;

procedure TMain.SelectSchemaFileClick(Sender: TObject);
begin
  if OpenSchemaFile.Execute then
    SchemaFileName.Text := OpenSchemaFile.FileName;
end;

end.
