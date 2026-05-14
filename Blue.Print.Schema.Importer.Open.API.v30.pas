unit Blue.Print.Schema.Importer.Open.API.v30;

interface

uses Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v30;

type
  TOpenAPI30SchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FOpenAPIDefinition: TOpenAPIDefinition;

    procedure GenerateUnitFileDefinition(const UnitDefinition: TTypeUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter);
  end;

implementation

uses Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI30SchemaLoader }

constructor TOpenAPI30SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
end;

procedure TOpenAPI30SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TTypeUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);

  procedure LoadDefinition;
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    FOpenAPIDefinition := Serializer.Deserialize(FImporter.LoadFileFromConfiguration(UnitFileConfiguration), TypeInfo(TOpenAPIDefinition)).AsType<TOpenAPIDefinition>;
  end;

begin
  inherited;

  LoadDefinition;
end;

end.
