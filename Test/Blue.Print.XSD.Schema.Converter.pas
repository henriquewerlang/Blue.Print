unit Blue.Print.XSD.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TXSDSchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

{ TXSDSchemaConverter }

procedure TXSDSchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TXSDSchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.XSD] := TXSDSchemaConverter.Create;

end.
