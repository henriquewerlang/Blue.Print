unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes, Blue.Print.Schema.Importer, Vcl.Menus;

type
  TMain = class(TForm)
    ImportSchema: TButton;
    lblConfigurationFile: TLabel;
    ConfigurationFile: TEdit;
    SelectConfigurationFile: TButton;
    OpenConfigurationFile: TFileOpenDialog;
    procedure SelectConfigurationFileClick(Sender: TObject);
    procedure ImportSchemaClick(Sender: TObject);
  private
    procedure GenerateFile(const Importer: TSchemaImporter);
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses System.SysUtils, System.Types, Blue.Print.Schema.Importer.Open.API.v20, Blue.Print.Schema.Importer.Open.API.v30, Blue.Print.Schema.Importer.Open.API.v31;

{ TMain }

procedure TMain.ImportSchemaClick(Sender: TObject);
begin
  GenerateFile(TSchemaImporter.Create);
end;

procedure TMain.GenerateFile(const Importer: TSchemaImporter);
begin
  Importer.LoadConfig(ConfigurationFile.Text);

  Importer.Import;

  Importer.Free;
end;

procedure TMain.SelectConfigurationFileClick(Sender: TObject);
begin
  if OpenConfigurationFile.Execute then
    ConfigurationFile.Text := OpenConfigurationFile.FileName;
end;

end.
