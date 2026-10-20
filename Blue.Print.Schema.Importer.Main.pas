unit Blue.Print.Schema.Importer.Main;

interface

uses Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls, System.Classes, Vcl.Menus;

type
  TMain = class(TForm)
    ImportSchema: TButton;
    lblConfigurationFile: TLabel;
    ConfigurationFile: TEdit;
    SelectConfigurationFile: TButton;
    OpenConfigurationFile: TFileOpenDialog;
    procedure SelectConfigurationFileClick(Sender: TObject);
    procedure ImportSchemaClick(Sender: TObject);
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses System.SysUtils, System.Types, Blue.Print.Schema.Importer;

{ TMain }

procedure TMain.ImportSchemaClick(Sender: TObject);
begin
  var Import := TSchemaImporter.Create;

  Import.Import(ConfigurationFile.Text);

  Import.Free;
end;

procedure TMain.SelectConfigurationFileClick(Sender: TObject);
begin
  if OpenConfigurationFile.Execute then
    ConfigurationFile.Text := OpenConfigurationFile.FileName;
end;

end.

