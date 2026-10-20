unit Blue.Print.JSON.Draft4.Schema.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.JSON.Draft4.Schema, Blue.Print.Types;

type
  [TestFixture]
  TJSONDraft4SchemaConverterTeste = class
  private
    FConfiguration: TConfiguration;
    FDefinition: TJSONSchema.TJSONSchema;
    FImporter: TSchemaImporter;

    function AddProperty(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const SimpleType: TJSONSchema.simpleTypes): TJSONSchema.TJSONSchema;
    function AddPropertyWithTypeArray(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const ArrayType: TJSONSchema.TJSONSchema): TJSONSchema.TJSONSchema;
    function CreateClassDefinition(const Name: String): TJSONSchema.TJSONSchema;
    function CreateEnumerationDefinition(const Name: String; const Values: TArray<String>): TJSONSchema.TJSONSchema;
    function CreateSchema(const SimpleType: TJSONSchema.simpleTypes): TJSONSchema.TJSONSchema;
    function GetDefinitionJSON: String;
    function GetMainClass: TTypeClassDefinition;

    procedure ImportDefinition;
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
    procedure IfTheSchemaHasDefinitionsMustAppendTheSubschemaValue;
    [Test]
    procedure TheDefinitionsSubschemaMustAppendTheCurrentPrefixWithTheDefsName;
    [Test]
    procedure TheClassMustBeAppendedInTheMainClassHasExpected;
    [Test]
    procedure OnlyObjectsMustBeAppendedInTheClassesList;
    [Test]
    procedure OnlyClassWithPropertiesCanBeAppendedToTheClassList;
    [Test]
    procedure WhenTheClassDefinitionHaveAPropertyMustLoadThePropertyInTheClass;
    [Test]
    procedure ThePropertyNameMustBeLoadedInThePropertyDefinition;
    [Test]
    procedure IfTheClassDefinitionHasMoreThanOnePropertyMustLoadAllProperties;
    [Test]
    procedure WhenThePropertyTypeIsOfBooleanTypeMustLoadThePropertyWithTheBuildInTypeBoolean;
    [Test]
    procedure WhenThePropertyTypeIsOfStringTypeMustLoadThePropertyWithTheBuildInTypeString;
    [Test]
    procedure WhenThePropertyTypeIsOfIntegerTypeMustLoadThePropertyWithTheBuildInTypeInteger;
    [Test]
    procedure WhenThePropertyTypeIsOfNumberTypeMustLoadThePropertyWithTheBuildInTypeDouble;
    [Test]
    procedure WhenThePropertyIsAnArrayTypeMustLoadTheArrayTypeDefinition;
    [Test]
    procedure MustLoadTheArrayTypeWithTheTypeDefinedInTheItemsSchema;
    [Test]
    procedure IsTheSchemaDoesntHaveTheRefOrTheSimpleTypeLoadedMustRaiseAnError;
    [Test]
    procedure TheClassDeclarationMustBeInsideTheDefsSchemaNamespace;
    [Test]
    procedure WhenTheSchemaIsAReferenceMustCreateTheReferenceType;
    [Test]
    procedure MustLoadTheReferenceInformation;
    [Test]
    procedure MustFillTheReferencePropertyWithTheClassNameInTheJSONReference;
    [Test]
    procedure MustLoadTheReferenceNamespaceInformation;
    [Test]
    procedure TheNamespaceInTheReferenceMustBeTheIdOfTheJSONSchemaPlusTheDefinitionsName;
  end;

implementation

uses System.IOUtils, System.Rtti, Blue.Print.JSON.Draft4.Schema.Converter, Blue.Print.Serializer;

{ TJSONDraft4SchemaConverterTeste }

function TJSONDraft4SchemaConverterTeste.AddProperty(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const SimpleType: TJSONSchema.simpleTypes): TJSONSchema.TJSONSchema;
begin
  Result := JSONSchema.properties.AddProperties(Name);
  Result.&type.simpleTypes := SimpleType;
end;

function TJSONDraft4SchemaConverterTeste.AddPropertyWithTypeArray(const JSONSchema: TJSONSchema.TJSONSchema; const Name: String; const ArrayType: TJSONSchema.TJSONSchema): TJSONSchema.TJSONSchema;
begin
  Result := AddProperty(JSONSchema, name, TJSONSchema.simpleTypes.array);
  Result.items.schema := ArrayType;
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

function TJSONDraft4SchemaConverterTeste.CreateSchema(const SimpleType: TJSONSchema.simpleTypes): TJSONSchema.TJSONSchema;
begin
  Result := TJSONSchema.TJSONSchema.Create;
  Result.&type.simpleTypes := SimpleType;
end;

function TJSONDraft4SchemaConverterTeste.GetDefinitionJSON: String;
begin
  var Serializer: IBluePrintSerializer := TBluePrintJSONSerializer.Create;

  Result := Serializer.Serialize(FDefinition);
end;

function TJSONDraft4SchemaConverterTeste.GetMainClass: TTypeClassDefinition;
begin
  Result := FImporter.FindType(FDefinition.id, 'MainClass').AsClassDefinition;
end;

procedure TJSONDraft4SchemaConverterTeste.IfTheClassDefinitionHasMoreThanOnePropertyMustLoadAllProperties;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', TJSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.IfTheSchemaHasDefinitionsMustAppendTheSubschemaValue;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.WillNotRaise(
    procedure
    begin
      FImporter.GetPrefixName(FDefinition.id + '/definitions');
    end);
end;

procedure TJSONDraft4SchemaConverterTeste.ImportDefinition;
begin
  TFile.WriteAllText(FConfiguration.Units[0].SchemaFiles[0].FileName, GetDefinitionJSON);

  FImporter.Import(FConfiguration);
end;

procedure TJSONDraft4SchemaConverterTeste.IsTheSchemaDoesntHaveTheRefOrTheSimpleTypeLoadedMustRaiseAnError;
begin
  FDefinition.definitions.AddDefinitions('InvalidType').properties.AddProperties('InvalidProperty');

  Assert.WillRaise(
    procedure
    begin
      ImportDefinition;
    end, EJSONSchemaInvalid);
end;

procedure TJSONDraft4SchemaConverterTeste.MustFillTheReferencePropertyWithTheClassNameInTheJSONReference;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual('MyClass', ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheArrayTypeWithTheTypeDefinedInTheItemsSchema;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddPropertyWithTypeArray(ClassDefinition, 'MyProp', CreateSchema(TJSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType.AsArrayDefinition.ArrayType);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheReferenceInformation;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.IsNotEmpty(ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheReferenceNamespaceInformation;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.IsNotEmpty(ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Namespace);
end;

procedure TJSONDraft4SchemaConverterTeste.OnlyClassWithPropertiesCanBeAppendedToTheClassList;
begin
  CreateClassDefinition('MyClass');

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.OnlyObjectsMustBeAppendedInTheClassesList;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum']);

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.Setup;

  function CreateNamespaceConfiguration: TNamespaceConfiguration;
  begin
    Result := TNamespaceConfiguration.Create;
    Result.Namespace := FDefinition.id;
    Result.Prefix := 'my';
  end;

  function CreateSchemaFile: TSchemaFileConfiguration;
  begin
    Result := TSchemaFileConfiguration.Create;
    Result.FileName := TPath.GetTempFileName;
    Result.MainModuleName := 'MainClass';
    Result.SchemaType := TSchemaType.JSONDraft4;
  end;

  function CreateUnitConfiguration: TUnitConfiguration;
  begin
    Result := TUnitConfiguration.Create;
    Result.Name := 'JSON';
    Result.SchemaFiles := [CreateSchemaFile];
  end;

begin
  inherited;

  FConfiguration := TConfiguration.Create;
  FDefinition := TJSONSchema.TJSONSchema.Create;
  FDefinition.id := 'My Namespace';
  FImporter := TSchemaImporter.Create;

  FConfiguration.Namespaces := [CreateNamespaceConfiguration];
  FConfiguration.Units := [CreateUnitConfiguration];
end;

procedure TJSONDraft4SchemaConverterTeste.TearDown;
begin
  inherited;

  FConfiguration.Free;

  FImporter.Free;

  FDefinition.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.TheClassDeclarationMustBeInsideTheDefsSchemaNamespace;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');
  var TypeDefinition: TTypeDefinition;

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.IsTrue(FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', TypeDefinition));
end;

procedure TJSONDraft4SchemaConverterTeste.TheClassMustBeAppendedInTheMainClassHasExpected;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.TheDefinitionsSubschemaMustAppendTheCurrentPrefixWithTheDefsName;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual('my/defs', FImporter.GetPrefixName(FDefinition.id + '/definitions'));
end;

procedure TJSONDraft4SchemaConverterTeste.TheInitializationSectionMustLoadTheConverterInTheSchemaConverterClassList;
begin
  Assert.IsNotNil(TSchemaImporter.Converters[TSchemaType.JSONDraft4]);
end;

procedure TJSONDraft4SchemaConverterTeste.TheNamespaceInTheReferenceMustBeTheIdOfTheJSONSchemaPlusTheDefinitionsName;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual(FDefinition.id + '/definitions', ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Namespace);
end;

procedure TJSONDraft4SchemaConverterTeste.ThePropertyNameMustBeLoadedInThePropertyDefinition;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual('MyProp', GetMainClass.Classes[0].Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenLoadTheSchemaMustLoadTheIdFieldInTheNamespaceOfTheSchemaClass;
begin
  var Converter: ISchemaConverter := TJSONDraft4SchemaConverter.Create;
  FDefinition.id := 'My Test Schema';
  var Schema := TSchema.Create;
  Schema.SchemaText := GetDefinitionJSON;

  Converter.LoadSchema(Schema);

  Assert.AreEqual(FDefinition.id, Schema.Namespace);

  Schema.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.WhenLoadTheSchemaMustLoadTheSchemaValueWithTheJSONDefinition;
begin
  var Converter: ISchemaConverter := TJSONDraft4SchemaConverter.Create;
  var Schema := TSchema.Create;
  Schema.SchemaText := GetDefinitionJSON;

  Converter.LoadSchema(Schema);

  Assert.IsNotNil(Schema.SchemaValue.AsObject);

  Assert.AreEqual(TJSONSchema.TJSONSchema, Schema.SchemaValue.AsObject.ClassType);

  Schema.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheClassDefinitionHaveAPropertyMustLoadThePropertyInTheClass;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyIsAnArrayTypeMustLoadTheArrayTypeDefinition;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddPropertyWithTypeArray(ClassDefinition, 'MyProp', CreateSchema(TJSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual(TTypeArrayDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfBooleanTypeMustLoadThePropertyWithTheBuildInTypeBoolean;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.boolean);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.BooleanType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfIntegerTypeMustLoadThePropertyWithTheBuildInTypeInteger;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.integer);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfNumberTypeMustLoadThePropertyWithTheBuildInTypeDouble;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.number);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.DoubleType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfStringTypeMustLoadThePropertyWithTheBuildInTypeString;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', TJSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.StringType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaIsAReferenceMustCreateTheReferenceType;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual(TTypeReferenceDefinition, ClassDefinition.AsClassDefinition.Properties[0].PropertyType.ClassType);
end;

end.

