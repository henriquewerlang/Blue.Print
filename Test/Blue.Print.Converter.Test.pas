unit Blue.Print.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.Types;

type
  [TestFixture]
  TConverterTest = class
  private
    FMainClass: TTypeClassDefinition;
    FNamespaces: TDictionary<String, String>;
    FSchema: TSchema;
  protected
    FConverter: ISchemaConverter;
    FSerializer: IBluePrintSerializer;
    FTypes: TDictionary<String, TTypeDefinition>;

    function GetSerializer: IBluePrintSerializer;

    procedure AddNamespace(const Prefix, Name: String);
    procedure ConvertSchema(const Definition: TObject);
    procedure LoadSchemaText(const Definition: TObject);
    procedure Prepare(const SchemaType: TSchemaType);

    property MainClass: TTypeClassDefinition read FMainClass;
    property Schema: TSchema read FSchema;
  public
    [TearDown]
    procedure TearDown;
  end;

implementation

uses System.IOUtils, System.SysUtils, Blue.Print.Serializer;

{ TConverterTest }

procedure TConverterTest.AddNamespace(const Prefix, Name: String);
begin
  FNamespaces.Add(Name, Prefix);
end;

procedure TConverterTest.LoadSchemaText(const Definition: TObject);
begin
  Schema.SchemaText := GetSerializer.Serialize(Definition);
end;

procedure TConverterTest.ConvertSchema(const Definition: TObject);
begin
  LoadSchemaText(Definition);

  FConverter.LoadSchema(Schema);

  FConverter.Convert(MainClass, Schema);
end;

function TConverterTest.GetSerializer: IBluePrintSerializer;
begin
  Result := TBluePrintJSONSerializer.Create;
end;

procedure TConverterTest.Prepare(const SchemaType: TSchemaType);
begin
  FConverter := TSchemaImporter.Converters[SchemaType];
  FMainClass := TTypeClassDefinition.Create;
  FNamespaces := TDictionary<String, String>.Create;
  FTypes := TDictionary<String, TTypeDefinition>.Create;

  FSchema := TSchema.Create(FNamespaces, FTypes);
end;

procedure TConverterTest.TearDown;
begin
  FConverter := nil;

  FMainClass.Free;

  FNamespaces.Free;

  FTypes.Free;

  FSchema.Free;
end;

end.
