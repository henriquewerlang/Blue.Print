unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes, Blue.Print.Schema.Importer;

type
  TMain = class(TForm)
    SchemaFileName: TEdit;
    lblSchemaFile: TLabel;
    SelectSchemaFile: TButton;
    OpenSchemaFile: TFileOpenDialog;
    GenerateXML: TButton;
    lblConfigurationFile: TLabel;
    ConfigurationFile: TEdit;
    SelectConfigurationFile: TButton;
    OpenConfigurationFile: TFileOpenDialog;
    lblOutputFolder: TLabel;
    OutputFolder: TEdit;
    SelectOutputFolder: TButton;
    OpenOutputFolder: TFileOpenDialog;
    GenerateOpenAPI: TButton;
    procedure GenerateXMLClick(Sender: TObject);
    procedure SelectSchemaFileClick(Sender: TObject);
    procedure SelectConfigurationFileClick(Sender: TObject);
    procedure SelectOutputFolderClick(Sender: TObject);
    procedure GenerateOpenAPIClick(Sender: TObject);
  private
    procedure GenerateFile(const Importer: TSchemaImporter);
  end;

  procedure ImportCommandLine;

var
  Main: TMain;

implementation

{$R *.dfm}

uses System.SysUtils;

procedure ImportCommandLine;
begin
  var AliasCommand: String;
  var ConfigFile: String;
  var FileName: String;
  var Importer := TXSDImporter.Create;
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

procedure TMain.GenerateFile(const Importer: TSchemaImporter);
begin
  Importer.LoadConfig(ConfigurationFile.Text);

  if SchemaFileName.Text <> EmptyStr then
    Importer.Configuration.SchemaFolder := ConfigurationFile.Text;

  if OutputFolder.Text <> EmptyStr then
    Importer.Configuration.OutputFolder := OutputFolder.Text;

  Importer.Import;

  Importer.Free;
end;

procedure TMain.GenerateOpenAPIClick(Sender: TObject);
begin
  GenerateFile(TOpenAPIImport30.Create);
end;

procedure TMain.GenerateXMLClick(Sender: TObject);
begin
  GenerateFile(TXSDImporter.Create);
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
