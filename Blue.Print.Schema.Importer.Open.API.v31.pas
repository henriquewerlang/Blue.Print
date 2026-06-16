unit Blue.Print.Schema.Importer.Open.API.v31;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI31SchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  end;

implementation

{ TOpenAPI31SchemaLoader }

procedure TOpenAPI31SchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
