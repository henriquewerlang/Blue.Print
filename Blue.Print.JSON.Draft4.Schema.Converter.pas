unit Blue.Print.JSON.Draft4.Schema.Converter;

interface

uses System.SysUtils, Blue.Print.Schema.Importer, Blue.Print.Types, Blue.Print.JSON.Draft4.Schema;

type
  TJSONDraft4SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    FImporter: TSchemaImporter;
    FJSONDefinition: JSONSchema;
    FMainClass: TTypeClassDefinition;

    function CreateSchemaType(const ParentClassDefinition: TTypeClassDefinition; const TypeName: String; const JSONSchemaType: JSONSchema): TTypeDefinition;
    function GetDefinitionsNamespace: String;
    function GetReferenceSchemaName(const JSONSchemaType: JSONSchema): String;

    procedure Convert(const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
    procedure LoadSchemaType(const TypeDefinition: TTypeDefinition; const JSONSchemaType: JSONSchema);

    property DefinitionsNamespace: String read GetDefinitionsNamespace;
    property JSONDefinition: JSONSchema read FJSONDefinition;
    property Importer: TSchemaImporter read FImporter;
    property MainClass: TTypeClassDefinition read FMainClass;
  end;

implementation

uses System.Rtti, Blue.Print.Serializer;

{ TJSONDraft4SchemaConverter }

procedure TJSONDraft4SchemaConverter.Convert(const Schema: TSchema);
begin
  FImporter := Schema.Importer;
  FJSONDefinition := Schema.SchemaValue.AsType<JSONSchema>;
  FMainClass := Schema.MainClass;

  LoadSchemaType(MainClass, JSONDefinition);

  for var SchemaDefinition in JSONDefinition.definitions.additionalProperties do
  begin
    var TypeName := SchemaDefinition.Key;

    var TypeDefinition := CreateSchemaType(MainClass, TypeName, SchemaDefinition.Value);

    if not TypeDefinition.IsEnumeratorDefinition and not TypeDefinition.IsClassDefinition then
      TypeDefinition := Importer.CreateAliasType(MainClass, TypeName, TypeDefinition);

    Importer.AddType(DefinitionsNamespace, TypeDefinition);
  end;
end;

function TJSONDraft4SchemaConverter.CreateSchemaType(const ParentClassDefinition: TTypeClassDefinition; const TypeName: String; const JSONSchemaType: JSONSchema): TTypeDefinition;
begin
  Result := Importer.BuildInTypes[TBuildInType.ValueType];

  if JSONSchemaType.IsRefStored then
  begin
    var Namespace: String;

    if JSONSchemaType.ref = '#' then
      Namespace := JSONDefinition.id
    else
      Namespace := DefinitionsNamespace;

    Exit(Importer.CreateReferenceType(ParentClassDefinition, EmptyStr, Namespace, GetReferenceSchemaName(JSONSchemaType)));
  end
  else if JSONSchemaType.IsEnumStored then
    Result := Importer.CreateEnumeratorType(ParentClassDefinition, TypeName)
  else if JSONSchemaType.IsPropertiesStored then
    Result := Importer.CreateClassType(ParentClassDefinition, TypeName)
  else if JSONSchemaType.IsTypeStored then
    case JSONSchemaType.&type.simpleTypes of
      JSONSchema.simpleTypes.array: Result := Importer.CreateArrayType(ParentClassDefinition, CreateSchemaType(ParentClassDefinition, TypeName + 'Array', JSONSchemaType.items.JSONSchema));
      JSONSchema.simpleTypes.boolean: Result := Importer.BuildInTypes[TBuildInType.BooleanType];
      JSONSchema.simpleTypes.integer: Result := Importer.BuildInTypes[TBuildInType.IntegerType];
      JSONSchema.simpleTypes.null: Result := nil;
      JSONSchema.simpleTypes.number: Result := Importer.BuildInTypes[TBuildInType.DoubleType];
      JSONSchema.simpleTypes.object: Result := Importer.CreateClassType(ParentClassDefinition, TypeName);
      JSONSchema.simpleTypes.string: Result := Importer.BuildInTypes[TBuildInType.StringType];
    end
  else if JSONSchemaType.IsAllOfStored or JSONSchemaType.IsAnyOfStored or JSONSchemaType.IsOneOfStored then
    Result := Importer.CreateClassType(ParentClassDefinition, TypeName);

  LoadSchemaType(Result, JSONSchemaType);
end;

function TJSONDraft4SchemaConverter.GetDefinitionsNamespace: String;
begin
  Result := JSONDefinition.id + '/definitions'
end;

function TJSONDraft4SchemaConverter.GetReferenceSchemaName(const JSONSchemaType: JSONSchema): String;
begin
  if JSONSchemaType.ref = '#' then
    Result := MainClass.Name
  else
    Result := JSONSchemaType.ref.Substring(Succ(JSONSchemaType.ref.LastDelimiter('/')));
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

procedure TJSONDraft4SchemaConverter.LoadSchemaType(const TypeDefinition: TTypeDefinition; const JSONSchemaType: JSONSchema);
const
  ALL_OF_PROPERTY = 'AllOf';

  function GetPropertyName(const SchemaItem: JSONSchema; const PropertyNamePrefix: String; const PropertyCount: NativeInt): String;
  begin
    if SchemaItem.IsRefStored then
      Result := GetReferenceSchemaName(SchemaItem)
    else if SchemaItem.IsTypeStored then
      Result := TRttiEnumerationType.GetName(SchemaItem.&type.simpleTypes)
    else
    begin
      Result := PropertyNamePrefix;

      if PropertyCount > 0 then
       Result := Result + Succ(PropertyCount).ToString;
    end;
  end;

  function CreateProperty(const ClassDefinition: TTypeClassDefinition; const PropertyName: String; const PropertyType: TTypeDefinition; const IsOptional: Boolean): TTypePropertyDefinition;
  begin
    Result := ClassDefinition.AddProperty(PropertyName, PropertyType);
    Result.Optional := IsOptional;
  end;

  function CreatePropertyType(const PropertyName: String; const PropertyTypeSchema: JSONSchema): TTypeDefinition;
  begin
    Result := CreateSchemaType(TypeDefinition.AsClassDefinition, Format('.%sType', [PropertyName]), PropertyTypeSchema);
  end;

  function CreatePropertyFromSchema(const PropertyName: String; const PropertySchema: JSONSchema): TTypePropertyDefinition;

    function IsRequired: Boolean;
    begin
      for var Required in JSONSchemaType.required do
        if Required = PropertyName then
          Exit(True);

      Result := False;
    end;

  begin
    Result := CreateProperty(TypeDefinition.AsClassDefinition, PropertyName, CreatePropertyType(PropertyName, PropertySchema), not IsRequired);
  end;

  function CreatePropertyWithDynamicPropertyType(const PropertyName: String; const DynamicPropertySchema: JSONSchema): TTypePropertyDefinition;
  begin
    var PropertyType := Importer.CreateDynamicPropertyType(TypeDefinition.AsClassDefinition, CreatePropertyType(PropertyName, DynamicPropertySchema));

    Result := CreateProperty(TypeDefinition.AsClassDefinition, PropertyName, PropertyType, False);
  end;

  procedure DefineProperties(const TypeDefinition: TTypeDefinition; const JSONSchemaType: JSONSchema);
  begin
    if JSONSchemaType.IsPropertiesStored then
      for var PropertySchema in JSONSchemaType.properties.additionalProperties do
        CreatePropertyFromSchema(PropertySchema.Key, PropertySchema.Value);

    if JSONSchemaType.IsAdditionalPropertiesStored and JSONSchemaType.additionalProperties.IsJSONSchemaStored then
      CreatePropertyWithDynamicPropertyType('additionalProperties', JSONSchemaType.additionalProperties.JSONSchema);

    if JSONSchemaType.IsPatternPropertiesStored then
      for var PatternProperty in JSONSchemaType.patternProperties.additionalProperties do
      begin
        var PropertyDefinition := CreatePropertyWithDynamicPropertyType(GetPropertyName(PatternProperty.Value, 'PatternProperty', Length(TypeDefinition.AsClassDefinition.Properties)), PatternProperty.Value);

        Importer.CreatePatternPropertyAttribute(PropertyDefinition, PatternProperty.Key);
      end;
  end;

  procedure LoadSchemaArray(const SchemaArray: JSONSchema.schemaArray; const PropertyNamePrefix: String);
  begin
    var ClassTypeDefinition := TypeDefinition.AsClassDefinition;

    Importer.CreateFlatAttribute(ClassTypeDefinition);

    for var SchemaItem in SchemaArray do
      CreatePropertyFromSchema(GetPropertyName(SchemaItem, PropertyNamePrefix, Length(ClassTypeDefinition.Properties)), SchemaItem).Optional := PropertyNamePrefix <> ALL_OF_PROPERTY;
  end;

begin
  if JSONSchemaType.IsPropertiesStored or JSONSchemaType.IsAdditionalPropertiesStored or JSONSchemaType.IsPatternPropertiesStored then
    DefineProperties(TypeDefinition, JSONSchemaType)
  else if JSONSchemaType.IsAllOfStored then
    LoadSchemaArray(JSONSchemaType.allOf, ALL_OF_PROPERTY)
  else if JSONSchemaType.IsAnyOfStored then
    LoadSchemaArray(JSONSchemaType.anyOf, 'AnyOf')
  else if JSONSchemaType.IsOneOfStored then
    LoadSchemaArray(JSONSchemaType.oneOf, 'OneOf')
  else if JSONSchemaType.IsEnumStored then
  begin
    var EnumerationDefinition := TypeDefinition.AsEnumeratorDefinition;

    for var EnumValue in JSONSchemaType.enum do
      EnumerationDefinition.Values.AddStrings(EnumValue.ToString);
  end;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.

