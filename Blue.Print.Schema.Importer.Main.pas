unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes;

type
  TMain = class(TForm)
    SchemaFileName: TEdit;
    lblSchemaFile: TLabel;
    SelectSchemaFile: TButton;
    OpenSchemaFile: TFileOpenDialog;
    GenerateFiles: TButton;
    lblConfigurationFile: TLabel;
    ConfigurationFile: TEdit;
    SelectConfigurationFile: TButton;
    OpenConfigurationFile: TFileOpenDialog;
    lblOutputFolder: TLabel;
    OutputFolder: TEdit;
    SelectOutputFolder: TButton;
    OpenOutputFolder: TFileOpenDialog;
    procedure GenerateFilesClick(Sender: TObject);
    procedure SelectSchemaFileClick(Sender: TObject);
    procedure SelectConfigurationFileClick(Sender: TObject);
    procedure SelectOutputFolderClick(Sender: TObject);
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
    if FindCmdLineSwitch('Config', ConfigFile) then
      Importer.LoadConfig(ConfigFile);

    Importer.Import;
  end;

  Importer.Free;
end;

{ TMain }

procedure TMain.GenerateFilesClick(Sender: TObject);
begin
  var Importer := TImporter.Create;

  Importer.LoadConfig(ConfigurationFile.Text);

  if SchemaFileName.Text <> EmptyStr then
    Importer.Configuration.SchemaFolder := ConfigurationFile.Text;

  if OutputFolder.Text <> EmptyStr then
    Importer.Configuration.OutputFolder := OutputFolder.Text;

  Importer.Import;

  Importer.Free;
end;

procedure TMain.SelectConfigurationFileClick(Sender: TObject);
begin
  if OpenConfigurationFile.Execute then
    ConfigurationFile.Text := OpenConfigurationFile.FileName;
end;

procedure TMain.SelectOutputFolderClick(Sender: TObject);
begin
  if OpenOutputFolder.Execute then
    OutputFolder.Text := OpenOutputFolder.FileName;
end;

procedure TMain.SelectSchemaFileClick(Sender: TObject);
begin
  if OpenSchemaFile.Execute then
    SchemaFileName.Text := OpenSchemaFile.FileName;
end;

end.
