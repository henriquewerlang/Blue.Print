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

uses System.Rtti, Blue.Print.Serializer;

{ TJSONDraft4SchemaConverter }

procedure TJSONDraft4SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
const
  ALL_OF_PROPERTY = 'AllOf';

var
  DefinitionsNamespace: String;
  JSONDefinition: JSONSchema;

  function LoadSchemaType(const ParentClassDefinition: TTypeClassDefinition; const JSONSchemaType: JSONSchema): TTypeDefinition;

    procedure DefineProperties(const ClassDefinition: TTypeClassDefinition; const JSONSchemaType: JSONSchema);
    var
      PropertyDefinition: TTypePropertyDefinition;

      function IsRequired: Boolean;
      begin
        for var Required in JSONSchemaType.required do
          if Required = PropertyDefinition.Name then
            Exit(True);

        Result := False;
      end;

    begin
      for var PropertySchema in JSONSchemaType.properties.additionalProperties do
      begin
        var PropertyType := LoadSchemaType(ClassDefinition, PropertySchema.Value);

        PropertyDefinition := ClassDefinition.AddProperty(PropertySchema.Key, PropertyType);
        PropertyDefinition.Optional := not IsRequired;

        if PropertyType.IsClassDefinition then
          PropertyType.Name := Format('.%sType', [PropertyDefinition.Name]);
      end;

      if JSONSchemaType.IsAdditionalPropertiesStored then
      begin
        var DynamicPropertyType := LoadSchemaType(ClassDefinition, JSONSchemaType.additionalProperties.JSONSchema);

        ClassDefinition.AddProperty('additionalProperties', Schema.Importer.CreateDynamicPropertyType(ClassDefinition, DynamicPropertyType));

        if DynamicPropertyType.IsClassDefinition then
          DynamicPropertyType.Name := 'TAdditionalPropertiesType';
      end;
    end;

    function GetReferenceSchemaName(JSONSchemaType: JSONSchema): String;
    begin
      if JSONSchemaType.ref = '#' then
        Result := MainClass.Name
      else
        Result := JSONSchemaType.ref.Substring(Succ(JSONSchemaType.ref.LastDelimiter('/')));
    end;

    procedure LoadSchemaArray(const SchemaArray: JSONSchema.schemaArray; const PropertyNamePrefix: String);
    var
      SchemaClassDefinition: TTypeClassDefinition;
      SchemaItem: JSONSchema;

      function GetPropertyName: String;
      begin
        if SchemaItem.IsRefStored then
          Result := GetReferenceSchemaName(SchemaItem)
        else if SchemaItem.IsTypeStored then
          Result := TRttiEnumerationType.GetName(SchemaItem.&type.simpleTypes)
        else
          Result := PropertyNamePrefix + Succ(Length(SchemaClassDefinition.Properties)).ToString;
      end;

    begin
      if (Length(SchemaArray) = 1) and SchemaArray[0].IsRefStored then
        Result := LoadSchemaType(ParentClassDefinition, SchemaArray[0])
      else
      begin
        SchemaClassDefinition := Schema.Importer.CreateClassType(ParentClassDefinition, EmptyStr);
        SchemaClassDefinition.Flat := True;

        Result := SchemaClassDefinition;

        for SchemaItem in SchemaArray do
          SchemaClassDefinition.AddProperty(GetPropertyName, LoadSchemaType(SchemaClassDefinition, SchemaItem)).Optional := PropertyNamePrefix <> ALL_OF_PROPERTY;
      end
    end;

  begin
    Result := nil;

    if JSONSchemaType.IsPropertiesStored then
    begin
      Result := ParentClassDefinition;

      DefineProperties(ParentClassDefinition, JSONSchemaType);
    end
    else if JSONSchemaType.IsAllOfStored then
      LoadSchemaArray(JSONSchemaType.allOf, ALL_OF_PROPERTY)
    else if JSONSchemaType.IsAnyOfStored then
      LoadSchemaArray(JSONSchemaType.anyOf, 'AnyOf')
    else if JSONSchemaType.IsOneOfStored then
      LoadSchemaArray(JSONSchemaType.oneOf, 'OneOf')
    else if JSONSchemaType.IsTypeStored then
      case JSONSchemaType.&type.simpleTypes of
        JSONSchema.simpleTypes.array: Result := Schema.Importer.CreateArrayType(ParentClassDefinition, LoadSchemaType(ParentClassDefinition, JSONSchemaType.items.JSONSchema));
        JSONSchema.simpleTypes.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        JSONSchema.simpleTypes.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        JSONSchema.simpleTypes.null: Result := nil;
        JSONSchema.simpleTypes.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        JSONSchema.simpleTypes.object:
        begin
          Result := Schema.Importer.CreateClassType(ParentClassDefinition, EmptyStr);

          DefineProperties(Result.AsClassDefinition, JSONSchemaType);
        end;
        JSONSchema.simpleTypes.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if JSONSchemaType.IsRefStored then
      if JSONSchemaType.ref = '#' then
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, JSONDefinition.id, GetReferenceSchemaName(JSONSchemaType))
      else
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, DefinitionsNamespace, GetReferenceSchemaName(JSONSchemaType))
    else if JSONSchemaType.IsEnumStored then
    begin
      var EnumerationDefinition := Schema.Importer.CreateEnumeratorType(ParentClassDefinition, EmptyStr);

      for var EnumValue in JSONSchemaType.enum do
        EnumerationDefinition.Values.AddStrings(EnumValue.ToString);

      Result := EnumerationDefinition;
    end
    else
      Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];
  end;

begin
  JSONDefinition := Schema.SchemaValue.AsType<JSONSchema>;

  DefinitionsNamespace := JSONDefinition.id + '/definitions';
  var DefinitionsNamespacePrefix := Schema.Importer.GetPrefixName(JSONDefinition.id) + '/defs';

  Schema.Importer.AddNamespace(DefinitionsNamespace, DefinitionsNamespacePrefix);

  LoadSchemaType(MainClass, JSONDefinition);

  for var SchemaDefinition in JSONDefinition.definitions.additionalProperties do
  begin
    var ParentClass := MainClass;

    if SchemaDefinition.Value.IsPropertiesStored then
      ParentClass := Schema.Importer.CreateClassType(MainClass, EmptyStr);

    var TypeDefinition := LoadSchemaType(ParentClass, SchemaDefinition.Value);

    if TypeDefinition.IsEnumeratorDefinition or TypeDefinition.IsClassDefinition then
      TypeDefinition.Name := SchemaDefinition.Key
    else
      TypeDefinition := Schema.Importer.CreateAliasType(ParentClass, SchemaDefinition.Key, TypeDefinition);

    Schema.Importer.AddType(DefinitionsNamespace, TypeDefinition);
  end;
end;

procedure TJSONDraft4SchemaConverter.LoadSchema(const Schema: TSchema);

  function GetSerializer: IBluePrintSerializer;
  begin
    Result := TBluePrintJSONSerializer.Create;
  end;

begin
  var Definition := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(JSONSchema)).AsType<JSONSchema>;
  Schema.Namespace := Definition.id;
  Schema.SchemaValue := Definition;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.

