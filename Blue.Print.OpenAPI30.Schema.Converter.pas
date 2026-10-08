unit Blue.Print.OpenAPI30.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TOpenAPI30SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses System.JSON;

{ TOpenAPI30SchemaConverter }

procedure TOpenAPI30SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin
  var RequestBodies := TTypeClassDefinition.Create;
  RequestBodies.Name := 'requestBodies';

  MainClass.AddClassDefinition(RequestBodies);

  var AClass := TTypeClassDefinition.Create;
  RequestBodies.AddClassDefinition(AClass);

  AClass := TTypeClassDefinition.Create;
  RequestBodies.AddClassDefinition(AClass);

  AClass := TTypeClassDefinition.Create;
  RequestBodies.AddClassDefinition(AClass);
end;

procedure TOpenAPI30SchemaConverter.LoadSchema(const Schema: TSchema);
begin
  var JSON := TJSONObject.ParseJSONValue(Schema.SchemaText, False, True) as TJSONObject;
  Schema.SchemaValue := JSON;

  var IdField := JSON.Get('id');

  if Assigned(IdField) then
    Schema.Namespace := IdField.JsonValue.AsType<String>
  else
    Schema.Namespace := Schema.SchemaFile.FileName;
end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := TOpenAPI30SchemaConverter.Create;

end.
