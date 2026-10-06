unit Blue.Print.OpenAPI32.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TOpenAPI32SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

{ TOpenAPI32SchemaConverter }

procedure TOpenAPI32SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TOpenAPI32SchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI32] := TOpenAPI32SchemaConverter.Create;

end.
