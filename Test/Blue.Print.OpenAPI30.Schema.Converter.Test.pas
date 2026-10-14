unit Blue.Print.OpenAPI30.Schema.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema, Blue.Print.OpenAPI30.Schema.Converter, Blue.Print.Types;

type
  [TestFixture]
  TOpenAPI30SchemaConverterTest = class
  private
    FConverter: ISchemaConverter;
    FDefinition: TOpenAPIDefinition.TOpenAPIDefinition;
    FMainClass: TTypeClassDefinition;
    FNamespaces: TDictionary<String, String>;
    FSchema: TSchema;
    FSerializer: IBluePrintSerializer;
    FTypes: TDictionary<String, TTypeDefinition>;

    procedure ConvertSchema;
    procedure LoadSchemaText;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure IfTheJSONIsInvalidMustRaiseAnError;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheInfoTitleInTheNamespacePropertyOfTheSchema;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheSchemaValue;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheSchemaValueWithTheOpenAPIClassEspecification;
    [Test]
    procedure IfTheRequestBodyIsStoredMustLoadAClassWithTheNameRequestBodyInTheMainClassSchema;
    [Test]
    procedure IfTheRequestBodyIsntLoadedCantLoadTheRequestBodyClassInTheMainClass;
    [Test]
    procedure AllClassesInsideTheRequestBodiesMustBeLoadedInTheRequestBodiesClassHasExpected;
    [Test]
    procedure IfTheSchemaPropertyFromComponentsIsLoadedMustDeclareAClassWithTheSchemaNameInTheMainClass;
    [Test]
    procedure IfTheSchemaPropertyFromComponentsIsntLoadedCanCreateTheSchemaClass;
    [Test]
    procedure TheClassesInsideTheSchemasPropertyMustBeAppendedInTheSchemaClassInTheMainClassHasExpected;
    [Test]
    procedure WhenTheSchemaHasPropertiesMustLoadAllInTheClassCreated;
  end;

implementation

uses System.JSON, System.SysUtils, Blue.Print.Serializer;

{ TOpenAPI30SchemaConverterTest }

procedure TOpenAPI30SchemaConverterTest.AllClassesInsideTheRequestBodiesMustBeLoadedInTheRequestBodiesClassHasExpected;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyClass');

  FDefinition.components.requestBodies.AddPatternProperty('MyClass2');

  FDefinition.components.requestBodies.AddPatternProperty('MyClass3');

  ConvertSchema;

  Assert.AreEqual(3, Length(FMainClass.Classes[0].Classes));

  Assert.AreEqual('md:MyClass', FMainClass.Classes[0].Classes[0].Name);
  Assert.AreEqual('md:MyClass2', FMainClass.Classes[0].Classes[1].Name);
  Assert.AreEqual('md:MyClass3', FMainClass.Classes[0].Classes[2].Name);
end;

procedure TOpenAPI30SchemaConverterTest.ConvertSchema;
begin
  LoadSchemaText;

  FConverter.LoadSchema(FSchema);

  FConverter.Convert(FMainClass, FSchema);
end;

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

procedure TOpenAPI30SchemaConverterTest.IfTheRequestBodyIsntLoadedCantLoadTheRequestBodyClassInTheMainClass;
begin
  ConvertSchema;

  Assert.AreEqual(0, Length(FMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.IfTheRequestBodyIsStoredMustLoadAClassWithTheNameRequestBodyInTheMainClassSchema;
begin
  FDefinition.components.requestBodies;

  ConvertSchema;

  Assert.AreEqual(1, Length(FMainClass.Classes));

  Assert.AreEqual('md:requestBodies', FMainClass.Classes[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.IfTheSchemaPropertyFromComponentsIsLoadedMustDeclareAClassWithTheSchemaNameInTheMainClass;
begin
  FDefinition.components.schemas;

  ConvertSchema;

  Assert.AreEqual(1, Length(FMainClass.Classes));

  Assert.AreEqual('md:schemas', FMainClass.Classes[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.IfTheSchemaPropertyFromComponentsIsntLoadedCanCreateTheSchemaClass;
begin
  ConvertSchema;

  Assert.AreEqual(0, Length(FMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.LoadSchemaText;
begin
  FSchema.SchemaText := FSerializer.Serialize(FDefinition);
end;

procedure TOpenAPI30SchemaConverterTest.Setup;
begin
  FConverter := TOpenAPI30SchemaConverter.Create;
  FDefinition := TOpenAPIDefinition.TOpenAPIDefinition.Create;
  FDefinition.info.title := 'My Definition';
  FMainClass := TTypeClassDefinition.Create;
  FNamespaces := TDictionary<String, String>.Create;
  FSerializer := TBluePrintJSONSerializer.Create;
  FTypes := TDictionary<String, TTypeDefinition>.Create;

  FSchema := TSchema.Create(FNamespaces, FTypes);
  FSchema.SchemaFile := TSchemaFileConfiguration.Create;

  FNamespaces.Add(FDefinition.info.title, 'md');
end;

procedure TOpenAPI30SchemaConverterTest.TearDown;
begin
  FConverter := nil;
  FSerializer := nil;

  FDefinition.Free;

  FTypes.Free;

  FNamespaces.Free;

  FMainClass.Free;

  FSchema.SchemaFile.Free;

  FSchema.Free;
end;

procedure TOpenAPI30SchemaConverterTest.TheClassesInsideTheSchemasPropertyMustBeAppendedInTheSchemaClassInTheMainClassHasExpected;
begin
//  FDefinition.components.schemas.AddPatternProperty('MyClass').Reference.&string.Add('abc', '');
//
//  FDefinition.components.schemas.AddPatternProperty('MyClass2').Reference.&string.Add('abc', '');
//
//  FDefinition.components.schemas.AddPatternProperty('MyClass3').Reference.&string.Add('abc', '');

  ConvertSchema;

  Assert.AreEqual(3, Length(FMainClass.Classes[0].Classes));

  Assert.AreEqual('md:MyClass', FMainClass.Classes[0].Classes[0].Name);
  Assert.AreEqual('md:MyClass2', FMainClass.Classes[0].Classes[1].Name);
  Assert.AreEqual('md:MyClass3', FMainClass.Classes[0].Classes[2].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheInfoTitleInTheNamespacePropertyOfTheSchema;
begin
  LoadSchemaText;

  FConverter.LoadSchema(FSchema);

  Assert.AreEqual(FDefinition.info.title, FSchema.Namespace);
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheSchemaValue;
begin
  LoadSchemaText;

  FConverter.LoadSchema(FSchema);

  Assert.IsFalse(FSchema.SchemaValue.IsEmpty);
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheSchemaValueWithTheOpenAPIClassEspecification;
begin
  LoadSchemaText;

  FConverter.LoadSchema(FSchema);

  Assert.AreEqual(TOpenAPIDefinition.TOpenAPIDefinition, FSchema.SchemaValue.AsObject.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheSchemaHasPropertiesMustLoadAllInTheClassCreated;
begin
  var IntegerSchema := TOpenAPIDefinition.Schema.Create;
  IntegerSchema.&type := TOpenAPIDefinition.Schema.TypeProperty.integer;
  var PropertyType := TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.Create;
  PropertyType.Schema := IntegerSchema;
  var SchemaClass := FDefinition.components.schemas.AddPatternProperty('MyClass');

//  SchemaClass.Schema.properties.additionalProperties.Add('Prop1', PropertyType);
//  SchemaClass.Schema.properties.additionalProperties.Add('Prop2', PropertyType);
//  SchemaClass.Schema.properties.additionalProperties.Add('Prop3', PropertyType);
//
  ConvertSchema;

  Assert.AreEqual(3, Length(FMainClass.Classes[0].Classes[0].Properties));

  Assert.AreEqual('Prop1', FMainClass.Classes[0].Classes[0].Properties[0].Name);
  Assert.AreEqual('Prop2', FMainClass.Classes[0].Classes[0].Properties[1].Name);
  Assert.AreEqual('Prop3', FMainClass.Classes[0].Classes[0].Properties[2].Name);
end;

end.

