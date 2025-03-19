unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema;

type
  TUnit = class
  public

  end;

  TImporter = class
  private
    procedure GenerateUnit(const Definition: IXMLSchemaDef);
  public
    procedure Import(const FileName: String);
  end;

implementation

uses System.SysUtils;

{ TImporter }

procedure TImporter.GenerateUnit(const Definition: IXMLSchemaDef);
begin
  for var A := 0 to Pred(Definition.ComplexTypes.Count) do
  begin
    var ComplexType := Definition.ComplexTypes[A];

    if ComplexType.Name = '' then
      raise Exception.Create('Um erro');
  end;

  for var A := 0 to Pred(Definition.SchemaIncludes.Count) do
    GenerateUnit(Definition.SchemaIncludes[A].SchemaRef);

  for var A := 0 to Pred(Definition.SchemaImports.Count) do
    GenerateUnit(Definition.SchemaImports[A].SchemaRef);
end;

procedure TImporter.Import(const FileName: String);
begin
  var Schema := LoadXMLSchema(FileName);

  GenerateUnit(Schema.SchemaDef);
end;

end.
