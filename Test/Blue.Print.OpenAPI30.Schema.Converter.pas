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

{ TOpenAPI30SchemaConverter }

procedure TOpenAPI30SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TOpenAPI30SchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := TOpenAPI30SchemaConverter.Create;

end.
