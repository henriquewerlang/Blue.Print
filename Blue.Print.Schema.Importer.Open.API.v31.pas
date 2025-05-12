unit Blue.Print.Schema.Importer.Open.API.v31;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI31Import = class(TSchemaImporter)
  protected
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); override;
  end;

implementation

{ TOpenAPI31Import }

procedure TOpenAPI31Import.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
