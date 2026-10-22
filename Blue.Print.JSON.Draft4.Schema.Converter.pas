unit Blue.Print.JSON.Draft4.Schema.Converter;

interface

uses System.SysUtils, Blue.Print.Schema.Importer, Blue.Print.Types, Blue.Print.JSON.Draft4.Schema;

type
  TJSONDraft4SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses Blue.Print.Serializer;

{ TJSONDraft4SchemaConverter }

procedure TJSONDraft4SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
var
  DefinitionsNamespace: String;
  JSONDefinition: TJSONSchema.TJSONSchema;

  function LoadSchemaType(const ParentClassDefinition: TTypeClassDefinition; const JSONSchema: TJSONSchema.TJSONSchema): TTypeDefinition;
  begin
    Result := nil;

    if JSONSchema.IsTypeStored then
      case JSONSchema.&type.simpleTypes of
        TJSONSchema.simpleTypes.array: Result := Schema.Importer.CreateArrayType(ParentClassDefinition, LoadSchemaType(ParentClassDefinition, JSONSchema.items.schema));
        TJSONSchema.simpleTypes.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        TJSONSchema.simpleTypes.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        TJSONSchema.simpleTypes.null: Result := nil;
        TJSONSchema.simpleTypes.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        TJSONSchema.simpleTypes.object: Result := Schema.Importer.CreateClassType(ParentClassDefinition, EmptyStr);
        TJSONSchema.simpleTypes.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if JSONSchema.IsRefStored then
      if JSONSchema.ref = '#' then
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, JSONDefinition.id, MainClass.Name)
      else
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, DefinitionsNamespace, JSONSchema.ref.Substring(Succ(JSONSchema.ref.LastDelimiter('/'))))
    else if JSONSchema.IsEnumStored then
    begin
      var EnumerationDefinition := Schema.Importer.CreateEnumeratorType(ParentClassDefinition, EmptyStr);

      EnumerationDefinition.Values.AddStrings(JSONSchema.enum);

      Result := EnumerationDefinition;
    end
    else
      Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];
  end;

  procedure DefineProperties(const ClassDefinition: TTypeClassDefinition; const JSONSchema: TJSONSchema.TJSONSchema);
  var
    PropertyDefinition: TTypePropertyDefinition;

    function IsRequired: Boolean;
    begin
      for var Required in JSONSchema.required do
        if Required = PropertyDefinition.Name then
          Exit(True);

      Result := False;
    end;

  begin
    for var PropertySchema in JSONSchema.properties.additionalProperties do
    begin
      var PropertyType := LoadSchemaType(ClassDefinition, PropertySchema.Value);

      PropertyDefinition := ClassDefinition.AddProperty(PropertySchema.Key, PropertyType);
      PropertyDefinition.Optional := not IsRequired;

      if PropertyType.IsClassDefinition then
        PropertyType.Name := PropertyDefinition.Name + 'Type';
    end;
  end;

begin
  JSONDefinition := Schema.SchemaValue.AsType<TJSONSchema.TJSONSchema>;

  DefinitionsNamespace := JSONDefinition.id + '/definitions';
  var DefinitionsNamespacePrefix := Schema.Importer.GetPrefixName(JSONDefinition.id) + '/defs';

  Schema.Importer.AddNamespace(DefinitionsNamespace, DefinitionsNamespacePrefix);

  DefineProperties(MainClass, JSONDefinition);

  for var SchemaDefinition in JSONDefinition.definitions.additionalProperties do
  begin
    var TypeDefinition: TTypeDefinition;

    if SchemaDefinition.Value.IsPropertiesStored then
    begin
      var ClassDefinition := Schema.Importer.CreateClassType(MainClass, SchemaDefinition.Key);
      TypeDefinition := ClassDefinition;

      DefineProperties(ClassDefinition, SchemaDefinition.Value);
    end
    else
    begin
      TypeDefinition := LoadSchemaType(MainClass, SchemaDefinition.Value);

      if TypeDefinition.IsEnumeratorDefinition then
        TypeDefinition.Name := SchemaDefinition.Key;

      if not TypeDefinition.IsEnumeratorDefinition then
        TypeDefinition := Schema.Importer.CreateAliasType(MainClass, SchemaDefinition.Key, TypeDefinition);
    end;

    Schema.Importer.AddType(DefinitionsNamespace, TypeDefinition);
  end;
end;

procedure TJSONDraft4SchemaConverter.LoadSchema(const Schema: TSchema);

  function GetSerializer: IBluePrintSerializer;
  begin
    Result := TBluePrintJSONSerializer.Create;
  end;

begin
  var Definition := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(TJSONSchema.TJSONSchema)).AsType<TJSONSchema.TJSONSchema>;
  Schema.Namespace := Definition.id;
  Schema.SchemaValue := Definition;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.

