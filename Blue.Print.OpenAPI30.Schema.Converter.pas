unit Blue.Print.OpenAPI30.Schema.Converter;

interface

uses Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema;

type
  TOpenAPI30SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    function LoadDefinition(const Schema: TSchema): TOpenAPIDefinition.TOpenAPIDefinition;

    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses System.SysUtils, Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI30SchemaConverter }

procedure TOpenAPI30SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin
  var Definition := Schema.SchemaValue.AsType<TOpenAPIDefinition.TOpenAPIDefinition>;

  if Definition.components.IsRequestBodiesStored then
  begin
    var RequestBodies := TTypeClassDefinition.Create;
    RequestBodies.Name := 'requestBodies';

    Schema.AddClassDefinition(MainClass, Schema.Namespace, RequestBodies);

    for var RequestDefinition in Definition.components.requestBodies.PatternPropertyElement do
    begin
      var RequestBodyClass := TTypeClassDefinition.Create;
      RequestBodyClass.Name := RequestDefinition.Key;

      Schema.AddClassDefinition(RequestBodies, Schema.Namespace, RequestBodyClass);
    end;
  end;

  if Definition.components.IsSchemasStored then
  begin
    var Schemas := TTypeClassDefinition.Create;
    Schemas.Name := 'schemas';

    Schema.AddClassDefinition(MainClass, Schema.Namespace, Schemas);

    for var SchemaDefinition in Definition.components.schemas.PatternPropertyElement do
    begin
      var SchemaClass := TTypeClassDefinition.Create;
      SchemaClass.Name := SchemaDefinition.Key;

      Schema.AddClassDefinition(Schemas, Schema.Namespace, SchemaClass);

      for var PropertySchema in SchemaDefinition.Value.Schema.properties.additionalProperties do
        SchemaClass.AddProperty(PropertySchema.Key, nil);
    end;
  end;
end;

function TOpenAPI30SchemaConverter.LoadDefinition(const Schema: TSchema): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  var Serializer: IBluePrintSerializer := TBluePrintJSONSerializer.Create;

  Result := Serializer.Deserialize(Schema.SchemaText, TypeInfo(TOpenAPIDefinition.TOpenAPIDefinition)).AsType<TOpenAPIDefinition.TOpenAPIDefinition>;
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

