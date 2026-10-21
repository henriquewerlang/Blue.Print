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
        TJSONSchema.simpleTypes.object: Result := nil;
        TJSONSchema.simpleTypes.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if JSONSchema.IsRefStored then
      if JSONSchema.ref = '#' then
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, JSONDefinition.id, MainClass.Name)
      else
        Result := Schema.Importer.CreateReferenceType(ParentClassDefinition, DefinitionsNamespace, JSONSchema.ref.Substring(Succ(JSONSchema.ref.LastDelimiter('/'))))
    else
      Result := Schema.Importer.BuildInTypes[TBuildInType.ValueType];
  end;

  procedure DefineProperties(const ClassDefinition: TTypeClassDefinition; const JSONSchema: TJSONSchema.TJSONSchema);
  begin
    for var PropertyDefinition in JSONSchema.properties.additionalProperties do
      ClassDefinition.AddProperty(PropertyDefinition.Key, LoadSchemaType(ClassDefinition, PropertyDefinition.Value));
  end;

begin
  JSONDefinition := Schema.SchemaValue.AsType<TJSONSchema.TJSONSchema>;

  DefinitionsNamespace := JSONDefinition.id + '/definitions';
  var DefinitionsNamespacePrefix := Schema.Importer.GetPrefixName(JSONDefinition.id) + '/defs';

  Schema.Importer.AddNamespace(DefinitionsNamespace, DefinitionsNamespacePrefix);

  for var SchemaDefinition in JSONDefinition.definitions.additionalProperties do
    if SchemaDefinition.Value.IsPropertiesStored then
    begin
      var ClassDefinition := Schema.Importer.CreateClassType(MainClass, SchemaDefinition.Key);

      DefineProperties(ClassDefinition, SchemaDefinition.Value);

      Schema.Importer.AddType(DefinitionsNamespace, ClassDefinition);
    end;

  DefineProperties(MainClass, JSONDefinition);
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

