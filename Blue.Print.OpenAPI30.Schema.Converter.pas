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

  function GetNamespace: String;
  begin
    Result := Definition.info.title;
  end;

  function GetComponentsNamespace: String;
  begin
    Result := GetNamespace + '/components';
  end;

  function GetComponentesSchemasNamespace: String;
  begin
    Result := GetComponentsNamespace + '/schemas';
  end;

  function GeneratePropertyName(const ClassDefinition: TTypeClassDefinition): String;
  begin
    Result := 'AllOf';

    if ClassDefinition.HasProperties then
      Result := Result + Succ(Length(ClassDefinition.Properties)).ToString;
  end;

  function CreateReferenceType(const ParentModule: TTypeClassDefinition; const Reference: OpenAPIDefinition.Reference): TTypeReferenceDefinition;
  begin
    var ReferenceValue := Reference.&string[0].Value.Replace('#', GetNamespace);

    var Namespace := ReferenceValue.Substring(0, ReferenceValue.LastDelimiter('/'));

    Result := Schema.Importer.CreateReferenceType(ParentModule, Namespace, ReferenceValue.Substring(Succ(Namespace.Length)));
  end;

  function CreateSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.Schema): TTypeDefinition;

    function CreatePropertyType(const ClassDefinition: TTypeClassDefinition; const PropertyName: String; const PropertySchema: OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType): TTypeDefinition;
    begin
      if PropertySchema.IsReferenceStored then
        Result := CreateReferenceType(ClassDefinition, PropertySchema.Reference)
      else
        Result := CreateSchemaType(ClassDefinition, Format('.%sType', [PropertyName]), PropertySchema.Schema);
    end;

  begin
    Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];

    if SchemaType.IsPropertiesStored then
    begin
      var ClassDefinition := Schema.Importer.CreateClassType(ParentModule, TypeName);

      for var PropertySchema in SchemaType.properties.additionalProperties do
        ClassDefinition.AddProperty(PropertySchema.Key, CreatePropertyType(ClassDefinition, PropertySchema.Key, PropertySchema.Value));

      Result := ClassDefinition;
    end
    else if SchemaType.IsEnumStored then
    begin
      var EnumeratorDefinition := Schema.Importer.CreateEnumeratorType(ParentModule, TypeName);

      for var EnumeratorValue in SchemaType.enum do
        EnumeratorDefinition.AddEnumeration(EnumeratorValue.ToString);

      Result := EnumeratorDefinition;
    end
    else if SchemaType.IsTypeStored then
      case SchemaType.&type of
        OpenAPIDefinition.Schema.TTypeType.array: ;
        OpenAPIDefinition.Schema.TTypeType.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        OpenAPIDefinition.Schema.TTypeType.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        OpenAPIDefinition.Schema.TTypeType.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        OpenAPIDefinition.Schema.TTypeType.object: Result := Schema.Importer.CreateClassType(ParentModule, TypeName);
        OpenAPIDefinition.Schema.TTypeType.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if SchemaType.IsAllOfStored then
    begin
      var ClassDefinition := Schema.Importer.CreateClassType(ParentModule, TypeName);

      for var AllOf in SchemaType.allOf do
        ClassDefinition.AddProperty(GeneratePropertyName(ClassDefinition), CreateSchemaType(ClassDefinition, '.AllOfType', AllOf.Schema));

      Result := ClassDefinition;
    end;
  end;

  function CreateComponentSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType): TTypeDefinition;
  begin
    if SchemaType.IsReferenceStored then
      Result := CreateReferenceType(ParentModule, SchemaType.Reference)
    else
      Result := CreateSchemaType(ParentModule, TypeName, SchemaType.Schema);
  end;

begin
  Definition := Schema.SchemaValue.AsType<OpenAPIDefinition>;

  for var SchemaDefinition in Definition.components.schemas.PatternProperty do
  begin
    var TypeDefinition := CreateComponentSchemaType(MainClass, SchemaDefinition.Key, SchemaDefinition.Value);

    if not TypeDefinition.IsClassDefinition and not TypeDefinition.IsEnumeratorDefinition then
      TypeDefinition := Schema.Importer.CreateAliasType(MainClass, SchemaDefinition.Key, TypeDefinition);

    Schema.Importer.AddType(GetComponentesSchemasNamespace, TypeDefinition);
  end;
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

