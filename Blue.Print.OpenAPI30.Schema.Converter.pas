unit Blue.Print.OpenAPI30.Schema.Converter;

interface

uses Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema;

type
  TOpenAPI30SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    function LoadDefinition(const Schema: TSchema): OpenAPIDefinition;

    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses System.SysUtils, Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI30SchemaConverter }

procedure TOpenAPI30SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
var
  Definition: OpenAPIDefinition;

  function GetSchemaNamespace: String;
  begin
    Result := Definition.info.title + '/schema';
  end;

  function CreateSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.Schema): TTypeDefinition;
  begin
    Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];

    if SchemaType.IsPropertiesStored then
    begin
      var ClassDefinition := Schema.Importer.CreateClassType(MainClass, TypeName);

      for var PropertySchema in SchemaType.properties.additionalProperties do
        ClassDefinition.AddProperty(PropertySchema.Key, CreateSchemaType(ClassDefinition, Format('.%sType', [PropertySchema.Key]), PropertySchema.Value.Schema));

      Result := ClassDefinition;
    end
    else if SchemaType.IsTypeStored then
      case SchemaType.&type of
        OpenAPIDefinition.Schema.TTypeType.array: ;
        OpenAPIDefinition.Schema.TTypeType.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        OpenAPIDefinition.Schema.TTypeType.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        OpenAPIDefinition.Schema.TTypeType.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        OpenAPIDefinition.Schema.TTypeType.object: Result := Schema.Importer.CreateClassType(ParentModule, TypeName);
        OpenAPIDefinition.Schema.TTypeType.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end;
  end;

  function CreateComponentSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType): TTypeDefinition;
  begin
    Result := CreateSchemaType(ParentModule, TypeName, SchemaType.Schema);
  end;

begin
  Definition := Schema.SchemaValue.AsType<OpenAPIDefinition>;

  for var SchemaDefinition in Definition.components.schemas.PatternProperty do
    Schema.Importer.AddType(GetSchemaNamespace, CreateComponentSchemaType(MainClass, SchemaDefinition.Key, SchemaDefinition.Value));
end;

function TOpenAPI30SchemaConverter.LoadDefinition(const Schema: TSchema): OpenAPIDefinition;

  function GetSerializer: IBluePrintSerializer;
  begin
    Result := TBluePrintJSONSerializer.Create;
  end;

begin
  Result := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(OpenAPIDefinition)).AsType<OpenAPIDefinition>;
end;

procedure TOpenAPI30SchemaConverter.LoadSchema(const Schema: TSchema);
begin
  var Definition := LoadDefinition(Schema);

  Schema.Namespace := Definition.info.title;
  Schema.SchemaValue := Definition;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := TOpenAPI30SchemaConverter.Create;

end.

