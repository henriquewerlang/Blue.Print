unit Blue.Print.OpenAPI31.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TOpenAPI31SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

{ TOpenAPI31SchemaConverter }

procedure TOpenAPI31SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TOpenAPI31SchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI31] := TOpenAPI31SchemaConverter.Create;

end.
