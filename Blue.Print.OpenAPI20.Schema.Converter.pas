unit Blue.Print.OpenAPI20.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TOpenAPI20SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

{ TOpenAPI20SchemaConverter }

procedure TOpenAPI20SchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TOpenAPI20SchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := TOpenAPI20SchemaConverter.Create;

end.
