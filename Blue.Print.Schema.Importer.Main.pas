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

var
  Main: TMain;

implementation

{$R *.dfm}

uses Blue.Print.Schema.Importer;

{ TMain }

procedure TMain.GenerateFilesClick(Sender: TObject);
begin
  var Importer := TImporter.Create;

  Importer.Import(SchemaFileName.Text);

  Importer.Free;
end;

procedure TMain.SelectSchemaFileClick(Sender: TObject);
begin
  if OpenSchemaFile.Execute() then
    SchemaFileName.Text := OpenSchemaFile.FileName;
end;

end.
