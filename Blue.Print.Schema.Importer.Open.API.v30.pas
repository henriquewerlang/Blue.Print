unit Blue.Print.Schema.Importer.Open.API.v30;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI30Import = class(TSchemaImporter)
  protected
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); override;
  end;

implementation

{ TOpenAPI30Import }

procedure TOpenAPI30Import.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
