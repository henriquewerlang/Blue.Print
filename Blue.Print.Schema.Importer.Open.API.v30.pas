unit Blue.Print.Schema.Importer.Open.API.v30;

interface

uses Blue.Print.Schema.Importer;

type
  TOpenAPI30SchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter);
  end;

implementation

{ TOpenAPI30SchemaLoader }

constructor TOpenAPI30SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;
end;

procedure TOpenAPI30SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  inherited;

end;

end.
