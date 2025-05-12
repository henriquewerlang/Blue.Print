unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes, Blue.Print.Schema.Importer, Vcl.Menus;

type
  TMain = class(TForm)
    SchemaFileName: TEdit;
    lblSchemaFile: TLabel;
    SelectSchemaFile: TButton;
    OpenSchemaFile: TFileOpenDialog;
    ImportXSD: TButton;
    lblConfigurationFile: TLabel;
    ConfigurationFile: TEdit;
    SelectConfigurationFile: TButton;
    OpenConfigurationFile: TFileOpenDialog;
    lblOutputFolder: TLabel;
    OutputFolder: TEdit;
    SelectOutputFolder: TButton;
    OpenOutputFolder: TFileOpenDialog;
    ImportJSONSchema: TButton;
    ImportOpenAPI: TButton;
    OpenAPI: TPopupMenu;
    OpenAPI20: TMenuItem;
    OpenAPI30: TMenuItem;
    OpenAPI31: TMenuItem;
    procedure ImportXSDClick(Sender: TObject);
    procedure SelectSchemaFileClick(Sender: TObject);
    procedure SelectConfigurationFileClick(Sender: TObject);
    procedure SelectOutputFolderClick(Sender: TObject);
    procedure ImportJSONSchemaClick(Sender: TObject);
    procedure OpenAPI20Click(Sender: TObject);
    procedure OpenAPI30Click(Sender: TObject);
    procedure OpenAPI31Click(Sender: TObject);
    procedure ImportOpenAPIClick(Sender: TObject);
  private
    procedure GenerateFile(const Importer: TSchemaImporter);
  end;

  procedure ImportCommandLine;

var
  Main: TMain;

implementation

{$R *.dfm}

uses System.SysUtils, System.Types, Blue.Print.Schema.Importer.Open.API.v20, Blue.Print.Schema.Importer.Open.API.v30, Blue.Print.Schema.Importer.Open.API.v31;

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

procedure TMain.ImportOpenAPIClick(Sender: TObject);
begin
  var Position := ImportOpenAPI.ClientToScreen(Point(0, 0));

  OpenAPI.Popup(Succ(Position.X + ImportOpenAPI.Width), Position.Y)
end;

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

procedure TMain.ImportXSDClick(Sender: TObject);
begin
  GenerateFile(TXSDImporter.Create);
end;

procedure TMain.OpenAPI20Click(Sender: TObject);
begin
  GenerateFile(TOpenAPI20Import.Create);
end;

procedure TMain.OpenAPI30Click(Sender: TObject);
begin
  GenerateFile(TOpenAPI30Import.Create);
end;

procedure TMain.OpenAPI31Click(Sender: TObject);
begin
  GenerateFile(TOpenAPI31Import.Create);
end;

procedure TMain.ImportJSONSchemaClick(Sender: TObject);
begin
  GenerateFile(TJSONSchemaImport.Create);
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
