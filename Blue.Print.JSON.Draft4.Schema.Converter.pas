unit Blue.Print.JSON.Draft4.Schema.Converter;

interface

uses Blue.Print.Schema.Importer, Blue.Print.Types;

type
  TJSONDraft4SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    function GetSerializer: IBluePrintSerializer;

    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses Blue.Print.Serializer, Blue.Print.JSON.Draft4.Schema;

{ TJSONDraft4SchemaConverter }

procedure TJSONDraft4SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin
  var Definitions := TTypeClassDefinition.Create;
  Definitions.Name := 'definitions';
  var JSONDefinition := Schema.SchemaValue.AsType<TJSONSchema.TJSONSchema>;

  Schema.AddClassDefinition(MainClass, Schema.Namespace, Definitions);

  for var SchemaDefinition in JSONDefinition.definitions.additionalProperties do
    if SchemaDefinition.Value.IsPropertiesStored then
    begin
      var ClassDefinition := TTypeClassDefinition.Create;
      ClassDefinition.Name := SchemaDefinition.Key;

      for var PropertyDefinition in SchemaDefinition.Value.properties.additionalProperties do
        ClassDefinition.AddProperty(PropertyDefinition.Key, nil);

      Schema.AddClassDefinition(Definitions, Schema.Namespace, ClassDefinition);
    end;
end;

function TJSONDraft4SchemaConverter.GetSerializer: IBluePrintSerializer;
begin
  Result := TBluePrintJSONSerializer.Create;
end;

procedure TJSONDraft4SchemaConverter.LoadSchema(const Schema: TSchema);
begin
  var Definition := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(TJSONSchema.TJSONSchema)).AsType<TJSONSchema.TJSONSchema>;
  Schema.Namespace := Definition.id;
  Schema.SchemaValue := Definition;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.JSONDraft4] := TJSONDraft4SchemaConverter.Create;

end.
