unit Blue.Print.OpenAPI30.Schema.Converter.Test;

interface

uses Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema.Converter;

type
  [TestFixture]
  TOpenAPI30SchemaConverterTest = class
  private
    FConverter: ISchemaConverter;
    FMainClass: TTypeClassDefinition;
    FSchema: TSchema;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheNamespaceWithTheIdFieldValue;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheValueWithTheJSONObject;
    [Test]
    procedure IfTheJSONIsInvalidMustRaiseAnError;
    [Test]
    procedure WhenTheJSONDoestHaveTheIdFieldMustLoadTheFileNameInTheNamespaceProperty;
    [Test]
    procedure WhenTheSchemaHasRequestBodyInTheComponentsMustCreateTheClassToKeepThisTypeInsideTheClass;
    [Test]
    procedure InsideTheRequestBodiesMustLoadAllClassesDefinedInTheSchemaHasExpected;
  end;

implementation

uses System.JSON, System.SysUtils;

{ TOpenAPI30SchemaConverterTest }

procedure TOpenAPI30SchemaConverterTest.IfTheJSONIsInvalidMustRaiseAnError;
begin
  FSchema.SchemaText :=
    '''
    {
    }
    }
    ''';

  Assert.WillRaise(
    procedure
    begin
      FConverter.LoadSchema(FSchema);
    end, Exception);
end;

procedure TOpenAPI30SchemaConverterTest.InsideTheRequestBodiesMustLoadAllClassesDefinedInTheSchemaHasExpected;
begin
  FSchema.SchemaText :=
    '''
    {
      "components": {
          "requestBodies": {
              "MyClass": {
              },
              "MyClass2": {
              },
              "MyClass3": {
              }
          }
      }
    }
    ''';

  FConverter.LoadSchema(FSchema);

  FConverter.Convert(FMainClass, FSchema);

  Assert.IsTrue(Assigned(FMainClass.Classes), 'Need class declaration');

  var RequestBodies := FMainClass.Classes[0];

  Assert.AreEqual(3, Length(RequestBodies.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.Setup;
begin
  FConverter := TOpenAPI30SchemaConverter.Create;
  FMainClass := TTypeClassDefinition.Create;
  FSchema := TSchema.Create;
  FSchema.SchemaFile := TSchemaFileConfiguration.Create;
  FSchema.SchemaText := '{"id":"http://mysite.com"}';
end;

procedure TOpenAPI30SchemaConverterTest.TearDown;
begin
  FConverter := nil;

  FMainClass.Free;

  FSchema.Free;
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheNamespaceWithTheIdFieldValue;
begin
  FSchema.SchemaText := '{"id":"http://mysite.test.com"}';

  FConverter.LoadSchema(FSchema);

  Assert.AreEqual('http://mysite.test.com', FSchema.Namespace);
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheValueWithTheJSONObject;
begin
  FConverter.LoadSchema(FSchema);

  Assert.IsFalse(FSchema.SchemaValue.IsEmpty, 'Value is empty');

  Assert.IsTrue(FSchema.SchemaValue.IsType<TJSONObject>, 'JSON type is correct');

  var JSON := FSchema.SchemaValue.AsType<TJSONObject>;

  Assert.AreEqual('http://mysite.com', JSON.Values['id'].AsType<String>);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheJSONDoestHaveTheIdFieldMustLoadTheFileNameInTheNamespaceProperty;
begin
  FSchema.SchemaFile.FileName := 'MyFile.json';
  FSchema.SchemaText := '{}';

  FConverter.LoadSchema(FSchema);

  Assert.AreEqual('MyFile.json', FSchema.Namespace);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheSchemaHasRequestBodyInTheComponentsMustCreateTheClassToKeepThisTypeInsideTheClass;
begin
  FSchema.SchemaText :=
    '''
    {
      "components": {
          "requestBodies": {
              "MyClass": {
              }
          }
      }
    }
    ''';

  FConverter.LoadSchema(FSchema);

  FConverter.Convert(FMainClass, FSchema);

  Assert.IsTrue(Assigned(FMainClass.Classes), 'Need class declaration');

  Assert.AreEqual('requestBodies', FMainClass.Classes[0].Name);
end;

end.

