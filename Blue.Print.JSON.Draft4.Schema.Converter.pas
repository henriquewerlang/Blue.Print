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
var
  DefinitionsNamespace: String;
  JSONDefinition: TJSONSchema.TJSONSchema;

  function LoadSchemaType(const ParentClassDefinition: TTypeClassDefinition; const JSONSchema: TJSONSchema.TJSONSchema): TTypeDefinition;

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
          PropertyType.Name := Format('.%sType', [PropertyDefinition.Name]);
      end;

      if JSONSchema.IsAdditionalPropertiesStored then
        ClassDefinition.AddProperty('additionalProperties', Schema.Importer.CreateDynamicPropertyType(Result.AsClassDefinition, LoadSchemaType(ClassDefinition, JSONSchema.additionalProperties.AdditionalPropertiesProperty)));
    end;

    function GetReferenceSchemaName(JSONSchema: TJSONSchema.TJSONSchema): String;
    begin
      if JSONSchema.ref = '#' then
        Result := MainClass.Name
      else
        Result := JSONSchema.ref.Substring(Succ(JSONSchema.ref.LastDelimiter('/')));
    end;

    procedure LoadSchemaArray(const SchemaArray: TJSONSchema.schemaArray; const PropertyNamePrefix: String);
    var
      SchemaClassDefinition: TTypeClassDefinition;
      SchemaItem: TJSONSchema.TJSONSchema;

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
          SchemaClassDefinition.AddProperty(GetPropertyName, LoadSchemaType(SchemaClassDefinition, SchemaItem));
      end
    end;

  begin
    Result := nil;

    if JSONSchema.IsAllOfStored then
      LoadSchemaArray(JSONSchema.allOf, 'AllOf')
    else if JSONSchema.IsAnyOfStored then
      LoadSchemaArray(JSONSchema.anyOf, 'AnyOf')
    else if JSONSchema.IsOneOfStored then
      LoadSchemaArray(JSONSchema.oneOf, 'OneOf')
    else if JSONSchema.IsPropertiesStored then
    begin
      Result := ParentClassDefinition;

      DefineProperties(ParentClassDefinition, JSONSchema);
    end
    else if JSONSchema.IsTypeStored then
      case JSONSchema.&type.simpleTypes of
        TJSONSchema.simpleTypes.array: Result := Schema.Importer.CreateArrayType(ParentClassDefinition, LoadSchemaType(ParentClassDefinition, JSONSchema.items.schema));
        TJSONSchema.simpleTypes.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        TJSONSchema.simpleTypes.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        TJSONSchema.simpleTypes.null: Result := nil;
        TJSONSchema.simpleTypes.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        TJSONSchema.simpleTypes.object:
        begin
          Result := Schema.Importer.CreateClassType(ParentClassDefinition, EmptyStr);

          DefineProperties(Result.AsClassDefinition, JSONSchema);
        end;
        TJSONSchema.simpleTypes.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if JSONSchema.IsRefStored then
      if JSONSchema.ref = '#' then
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, JSONDefinition.id, GetReferenceSchemaName(JSONSchema))
      else
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, DefinitionsNamespace, GetReferenceSchemaName(JSONSchema))
    else if JSONSchema.IsEnumStored then
    begin
      var EnumerationDefinition := Schema.Importer.CreateEnumeratorType(ParentClassDefinition, EmptyStr);

      EnumerationDefinition.Values.AddStrings(JSONSchema.enum);

      Result := EnumerationDefinition;
    end
    else
      Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];
  end;

begin
  JSONDefinition := Schema.SchemaValue.AsType<TJSONSchema.TJSONSchema>;

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
  var Definition := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(TJSONSchema.TJSONSchema)).AsType<TJSONSchema.TJSONSchema>;
  Schema.Namespace := Definition.id;
  Schema.SchemaValue := Definition;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.

