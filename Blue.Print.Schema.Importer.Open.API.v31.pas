unit Blue.Print.Schema.Importer.Open.API.v31;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI31SchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter);
  end;

implementation

{ TOpenAPI31SchemaLoader }

constructor TOpenAPI31SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;
end;

procedure TOpenAPI31SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
