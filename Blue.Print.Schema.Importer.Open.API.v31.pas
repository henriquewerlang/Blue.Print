unit Blue.Print.Schema.Importer.Open.API.v31;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI31SchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const UnitDefinition: TTypeUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter); override;
  end;

implementation

{ TOpenAPI31SchemaLoader }

constructor TOpenAPI31SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited;
end;

procedure TOpenAPI31SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TTypeUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
