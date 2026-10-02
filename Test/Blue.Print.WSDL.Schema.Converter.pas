unit Blue.Print.WSDL.Schema.Converter;

interface

uses System.Rtti, Blue.Print.Schema.Importer;

type
  TWSDLSchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

{ TWSDLSchemaConverter }

procedure TWSDLSchemaConverter.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin

end;

procedure TWSDLSchemaConverter.LoadSchema(const Schema: TSchema);
begin

end;

initialization
  TSchemaImporter.Converters[TSchemaType.WSDL] := TWSDLSchemaConverter.Create;

end.
