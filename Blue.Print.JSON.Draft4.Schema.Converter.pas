unit Blue.Print.JSON.Draft4.Schema.Converter;

interface

uses System.SysUtils, Blue.Print.Schema.Importer, Blue.Print.Types, Blue.Print.JSON.Draft4.Schema;

type
  EJSONSchemaInvalid = class(Exception)
  public
    constructor Create;
  end;

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

  function LoadSchemaType(const ParentModule: TTypeModuleDefinition; const JSONSchema: TJSONSchema.TJSONSchema): TTypeDefinition;
  begin
    Result := nil;

    if JSONSchema.IsTypeStored then
      case JSONSchema.&type.simpleTypes of
        TJSONSchema.simpleTypes.array: Result := Schema.Importer.CreateArrayType(ParentModule, LoadSchemaType(ParentModule, JSONSchema.items.schema));
        TJSONSchema.simpleTypes.boolean: Result := Schema.Importer.BuildInTypes[TBuildInType.BooleanType];
        TJSONSchema.simpleTypes.integer: Result := Schema.Importer.BuildInTypes[TBuildInType.IntegerType];
        TJSONSchema.simpleTypes.null: Result := nil;
        TJSONSchema.simpleTypes.number: Result := Schema.Importer.BuildInTypes[TBuildInType.DoubleType];
        TJSONSchema.simpleTypes.object: Result := nil;
        TJSONSchema.simpleTypes.string: Result := Schema.Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if JSONSchema.IsRefStored then
      Result := Schema.Importer.CreateReferenceType(ParentModule, DefinitionsNamespace, JSONSchema.ref.Substring(Succ(JSONSchema.ref.LastDelimiter('/'))))
    else
      raise EJSONSchemaInvalid.Create;
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

      for var PropertyDefinition in SchemaDefinition.Value.properties.additionalProperties do
        ClassDefinition.AddProperty(PropertyDefinition.Key, LoadSchemaType(ClassDefinition, PropertyDefinition.Value));

      Schema.Importer.AddType(DefinitionsNamespace, ClassDefinition);
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

{ EJSONSchemaInvalid }

constructor EJSONSchemaInvalid.Create;
begin
  inherited Create('The JSON schema is invalid!');
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.

