unit Blue.Print.JSON.Draft4.Schema.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.JSON.Draft4.Schema, Blue.Print.Types, Blue.Print.Converter.Test;

type
  [TestFixture]
  TJSONDraft4SchemaConverterTeste = class(TConverterTest)
  private
    FDefinition: TJSONSchema.TJSONSchema;

    function CreateClassDefinition(const Name: String): TJSONSchema.TJSONSchema;
    function CreateEnumerationDefinition(const Name: String; const Values: TArray<String>): TJSONSchema.TJSONSchema;

    procedure AddProperty(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const SimpleType: TJSONSchema.simpleTypes);
    procedure ConvertSchema;
    procedure LoadSchema;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TheInitializationSectionMustLoadTheConverterInTheSchemaConverterClassList;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheIdFieldInTheNamespaceOfTheSchemaClass;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheSchemaValueWithTheJSONDefinition;
    [Test]
    procedure IfTheSchemaHasDefinitionsMustCreateAClassWithTheNameCalledDefinitions;
    [Test]
    procedure MustAppendTheDefinitionsClassesInTheDefinitionsClassOfTheSchema;
    [Test]
    procedure MustAppendAllClassesDefinitionsInTheDefinitionsShema;
    [Test]
    procedure OnlyObjectsMustBeAppendedInTheClassesListOfTheDefinitions;
    [Test]
    procedure OnlyClassWithPropertiesCanBeAppendedToTheClassDefinitionsList;
    [Test]
    procedure WhenTheClassDefinitionHaveAPropertyMustLoadThePropertyInTheClass;
    [Test]
    procedure ThePropertyNameMustBeLoadedInThePropertyDefinition;
    [Test]
    procedure IfTheClassDefinitionHasMoreThanOnePropertyMustLoadAllProperties;
  end;

implementation

uses System.Rtti, Blue.Print.JSON.Draft4.Schema.Converter, Blue.Print.Serializer;

{ TJSONDraft4SchemaConverterTeste }

procedure TJSONDraft4SchemaConverterTeste.AddProperty(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const SimpleType: TJSONSchema.simpleTypes);
begin
  JSONSchema.properties.AddProperties(Name).&type.simpleTypes := SimpleType;
end;

procedure TJSONDraft4SchemaConverterTeste.ConvertSchema;
begin
  inherited ConvertSchema(FDefinition);
end;

function TJSONDraft4SchemaConverterTeste.CreateClassDefinition(const Name: String): TJSONSchema.TJSONSchema;
begin
  Result := FDefinition.definitions.AddDefinitions(Name);
  Result.&type.simpleTypes := TJSONSchema.simpleTypes.&object;
end;

function TJSONDraft4SchemaConverterTeste.CreateEnumerationDefinition(const Name: String; const Values: TArray<String>): TJSONSchema.TJSONSchema;
begin
  Result := FDefinition.definitions.AddDefinitions(Name);
  Result.&type.simpleTypes := TJSONSchema.simpleTypes.&array;
  Result.enum := Values;
end;

procedure TJSONDraft4SchemaConverterTeste.IfTheClassDefinitionHasMoreThanOnePropertyMustLoadAllProperties;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', TJSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual(3, Length(MainClass.Classes[0].Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.IfTheSchemaHasDefinitionsMustCreateAClassWithTheNameCalledDefinitions;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual(1, Length(MainClass.Classes));

  Assert.AreEqual('my:definitions', MainClass.Classes[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.LoadSchema;
begin
  LoadSchemaText(FDefinition);

  FConverter.LoadSchema(Schema);
end;

procedure TJSONDraft4SchemaConverterTeste.MustAppendAllClassesDefinitionsInTheDefinitionsShema;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ClassDefinition := CreateClassDefinition('MyClass2');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ClassDefinition := CreateClassDefinition('MyClass3');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual(3, Length(MainClass.Classes[0].Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.MustAppendTheDefinitionsClassesInTheDefinitionsClassOfTheSchema;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual(1, Length(MainClass.Classes[0].Classes));

  Assert.AreEqual('my:MyClass', MainClass.Classes[0].Classes[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.OnlyClassWithPropertiesCanBeAppendedToTheClassDefinitionsList;
begin
  CreateClassDefinition('MyClass');

  ConvertSchema;

  Assert.AreEqual(0, Length(MainClass.Classes[0].Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.OnlyObjectsMustBeAppendedInTheClassesListOfTheDefinitions;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum']);

  ConvertSchema;

  Assert.AreEqual(0, Length(MainClass.Classes[0].Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.Setup;
begin
  inherited;

  Prepare(TSchemaType.JSONDraft4);

  FDefinition := TJSONSchema.TJSONSchema.Create;
  FDefinition.id := 'My Schema';

  AddNamespace('my', FDefinition.id);
end;

procedure TJSONDraft4SchemaConverterTeste.TearDown;
begin
  inherited;

  FDefinition.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.TheInitializationSectionMustLoadTheConverterInTheSchemaConverterClassList;
begin
  Assert.IsNotNil(TSchemaImporter.Converters[TSchemaType.JSONDraft4]);
end;

procedure TJSONDraft4SchemaConverterTeste.ThePropertyNameMustBeLoadedInThePropertyDefinition;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual('MyProp', MainClass.Classes[0].Classes[0].Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenLoadTheSchemaMustLoadTheIdFieldInTheNamespaceOfTheSchemaClass;
begin
  FDefinition.id := 'My Test Schema';

  AddNamespace('test', FDefinition.id);

  LoadSchema;

  Assert.AreEqual(FDefinition.id, Schema.Namespace);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenLoadTheSchemaMustLoadTheSchemaValueWithTheJSONDefinition;
begin
  ConvertSchema;

  Assert.IsNotNil(Schema.SchemaValue.AsObject);

  Assert.AreEqual(TJSONSchema.TJSONSchema, Schema.SchemaValue.AsObject.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheClassDefinitionHaveAPropertyMustLoadThePropertyInTheClass;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ConvertSchema;

  Assert.AreEqual(1, Length(MainClass.Classes[0].Classes[0].Properties));
end;

end.

