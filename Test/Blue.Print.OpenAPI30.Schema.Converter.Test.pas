unit Blue.Print.OpenAPI30.Schema.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema, Blue.Print.OpenAPI30.Schema.Converter, Blue.Print.Types;

type
  [TestFixture]
  TOpenAPI30SchemaConverterTest = class
  private
    FConfiguration: TConfiguration;
    FDefinition: OpenAPIDefinition;
    FImporter: TSchemaImporter;

    function GetDefinitionJSON: String;
    function GetMainClass: TTypeClassDefinition;

    procedure ImportDefinition;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure MustLoadTheOpenAPIConverterInTheConverterListOfTheSchemaImporterInTheInitialization;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheTitleOfInfoPropertyInTheSchemaNamespace;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheDefinitionInTheSchemaValueHasExpected;
    [Test]
    procedure WhenHasASchemaObjectDeclaredInTheComponentsMustAppendTheClassInTheTypesListInTheSchemaNamespace;
    [Test]
    procedure WhenHasASchemaObjectDeclaredInTheComponentsMustAppendTheClassInMainClassList;
    [Test]
    procedure AllObjectsDeclaredInTheSchemaComponentsMustBeLoadedInTheTypesList;
    [Test]
    procedure WhenTheSchemaTypeHasPropertiesMustLoadThePropertyInTheClassDefinitionHasExcepted;
    [Test]
    procedure TheSchemaTypeMustLoadThePropertyNameHasExpected;
    [Test]
    procedure WhenThePropertyTypeIsABuildInTypeMustLoadThePropertyTypeWithTypeExpected;
    [Test]
    procedure WhenTheSchemaTypeHasPropertiesMustLoadAnClassDefinitionInTheClassesListOfTheMainClassHasExpected;
    [Test]
    procedure IfThePropertyTypeSchemaHasntAnyInformationMustReturnATValueTypeForPropertyType;
    [Test]
    procedure WhenThePropertyTypeIsAnObjectMustCreateAClassDefinitionForThePropertyType;
    [Test]
    procedure WhenThePropertySchemaHasAnObjectDefinitionMustLoadTheClassInsideTheClassOfTheProperty;
    [Test]
    procedure TheSubclassNameMustBeThePropertyPlusTheTypeName;
    [Test]
    procedure WhenThePropertyTypeIsAnReferenceMustLoadAReferenceType;
    [Test]
    procedure MustLoadTheReferenceNamespaceWithTheValueInTheReferenceSchemaChangingTheSharpByTheMainNamespace;
    [Test]
    procedure MustLoadTheReferenceNameWithTheLastNameInTheReferenceHasExpected;
    [Test]
    procedure WhenTheSchemaHasTheAllOfDefinitionMustLoadAClassTypeDefinitionForThePropertyType;
    [Test]
    procedure MustCreateAPropertyForEveryAllOfSchemaInTheSchema;
    [Test]
    procedure ThePropertyNameOfAllOfSchemaMustBeAllOf;
    [Test]
    procedure WhenHasMoreThanOneAllOfDefinitionMustCreateThePropertiesNamesUsingASequenceValueHasExpected;
    [Test]
    procedure TheAllOfPropertyMustLoadThePropertyTypeUsingTheSchemaInfoOfAllOfSchema;
    [Test]
    procedure IfTheAllOfDefinitionIsForANewTypeSchemaThisTypeMustHaveTheNameAllOfType;
    [Test]
    procedure WhenCreateAClassInTheComponentSchemaCantCreateAnAliasFromTheType;
    [Test]
    procedure WhenAComponentSchemaIsAReferenceToAnotherTypeMustCreateAnAliasType;
    [Test]
    procedure TheAliasTypeFromAReferenceMustBeTheReferenceClass;
    [Test]
    procedure TheReferenceComponentMustLoadTheReferenceInfoWithTheValuesOfTheSchemaAsExpected;
    [Test]
    procedure WhenTheComponentSchemaHasTheEnumPropertyLoadedMustAppendTheTypeInTheEnumeratorsList;
    [Test]
    procedure TheComponentSchemaEnumeratorMustBeLoadedInTheTypesList;
    [Test]
    procedure WhenAPropertyHasTheEnumPropertyLoadedMustCreateTheEnumeratorTypeInTheParentClassHasExpected;
    [Test]
    procedure TheEnumeratorFromComponentsSchemaMustLoadTheNameOfThePropertyHasExpected;
    [Test]
    procedure MustLoadTheEnumeratorsValuesFromTheSchemaHasExpected;
    [Test]
    procedure MustLoadTheEnumeratorsValuesNamesHasExpected;
  end;

implementation

uses System.JSON, System.SysUtils, System.IOUtils, System.Rtti, Blue.Print.Serializer;

{ TOpenAPI30SchemaConverterTest }

procedure TOpenAPI30SchemaConverterTest.AllObjectsDeclaredInTheSchemaComponentsMustBeLoadedInTheTypesList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;
  FDefinition.components.schemas.AddPatternProperty('MyClass2').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;
  FDefinition.components.schemas.AddPatternProperty('MyClass3').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyClass'));

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyClass2'));

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyClass3'));
end;

function TOpenAPI30SchemaConverterTest.GetDefinitionJSON: String;
begin
  var Serializer: IBluePrintSerializer := TBluePrintJSONSerializer.Create;

  Result := Serializer.Serialize(FDefinition);
end;

function TOpenAPI30SchemaConverterTest.GetMainClass: TTypeClassDefinition;
begin
  Result := FImporter.FindTypeWithPrefix('my:MainClass').AsClassDefinition;
end;

procedure TOpenAPI30SchemaConverterTest.IfTheAllOfDefinitionIsForANewTypeSchemaThisTypeMustHaveTheNameAllOfType;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.AddAllOf.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual('.AllOfType', GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.Name);
end;

procedure TOpenAPI30SchemaConverterTest.IfThePropertyTypeSchemaHasntAnyInformationMustReturnATValueTypeForPropertyType;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.ValueType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TOpenAPI30SchemaConverterTest.ImportDefinition;
begin
  TFile.WriteAllText(FConfiguration.Units[0].SchemaFiles[0].FileName, GetDefinitionJSON);

  FImporter.Import(FConfiguration);
end;

procedure TOpenAPI30SchemaConverterTest.MustCreateAPropertyForEveryAllOfSchemaInTheSchema;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  var PropertyDefinition := ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  PropertyDefinition.AddAllOf.Schema;

  PropertyDefinition.AddAllOf.Schema;

  PropertyDefinition.AddAllOf.Schema;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties));
end;

procedure TOpenAPI30SchemaConverterTest.MustLoadTheEnumeratorsValuesFromTheSchemaHasExpected;
begin
  var EnumeratorSchema := FDefinition.components.schemas.AddPatternProperty('MyEnum').Schema;

  EnumeratorSchema.AddEnum('Value');

  EnumeratorSchema.AddEnum('Value2');

  EnumeratorSchema.AddEnum('Value3');

  ImportDefinition;

  Assert.AreEqual(3, GetMainClass.Enumerations[0].Values.Count);
end;

procedure TOpenAPI30SchemaConverterTest.MustLoadTheEnumeratorsValuesNamesHasExpected;
begin
  var EnumeratorSchema := FDefinition.components.schemas.AddPatternProperty('MyEnum').Schema;

  EnumeratorSchema.AddEnum('Value');

  EnumeratorSchema.AddEnum('Value2');

  EnumeratorSchema.AddEnum('Value3');

  ImportDefinition;

  Assert.AreEqual('Value', GetMainClass.Enumerations[0].Values[0]);
  Assert.AreEqual('Value2', GetMainClass.Enumerations[0].Values[1]);
  Assert.AreEqual('Value3', GetMainClass.Enumerations[0].Values[2]);
end;

procedure TOpenAPI30SchemaConverterTest.MustLoadTheOpenAPIConverterInTheConverterListOfTheSchemaImporterInTheInitialization;
begin
  Assert.IsNotNil(TSchemaImporter.Converters[TSchemaType.OpenAPI30]);
end;

procedure TOpenAPI30SchemaConverterTest.MustLoadTheReferenceNamespaceWithTheValueInTheReferenceSchemaChangingTheSharpByTheMainNamespace;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual('Open API 3.0/components/schemas', GetMainClass.Classes[0].Properties[0].PropertyType.AsReferenceDefinition.Namespace);
end;

procedure TOpenAPI30SchemaConverterTest.MustLoadTheReferenceNameWithTheLastNameInTheReferenceHasExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass2');

  FDefinition.components.schemas.AddPatternProperty('MyClass2').Schema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual('MyClass2', GetMainClass.Classes[0].Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TOpenAPI30SchemaConverterTest.Setup;

  function CreateNamespaceConfiguration(const Namespace, Prefix: String): TNamespaceConfiguration;
  begin
    Result := TNamespaceConfiguration.Create;
    Result.Namespace := Namespace;
    Result.Prefix := Prefix;
  end;

  function CreateSchemaFile: TSchemaFileConfiguration;
  begin
    Result := TSchemaFileConfiguration.Create;
    Result.FileName := TPath.GetTempFileName;
    Result.MainModuleName := 'MainClass';
    Result.SchemaType := TSchemaType.OpenAPI30;
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
  FDefinition := OpenAPIDefinition.Create;
  FDefinition.info.title := 'Open API 3.0';
  FImporter := TSchemaImporter.Create;

  FConfiguration.Namespaces := [CreateNamespaceConfiguration(FDefinition.info.title, 'my'), CreateNamespaceConfiguration(FDefinition.info.title + '/components/schemas', 'my/schema')];
  FConfiguration.Units := [CreateUnitConfiguration];
end;

procedure TOpenAPI30SchemaConverterTest.TearDown;
begin
  FConfiguration.Free;

  FDefinition.Free;

  FImporter.Free;
end;

procedure TOpenAPI30SchemaConverterTest.TheAliasTypeFromAReferenceMustBeTheReferenceClass;
begin
  FDefinition.components.schemas.AddPatternProperty('MyRef').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Alias[0].TypeAlias.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.TheAllOfPropertyMustLoadThePropertyTypeUsingTheSchemaInfoOfAllOfSchema;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.AddAllOf.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType);
end;

procedure TOpenAPI30SchemaConverterTest.TheComponentSchemaEnumeratorMustBeLoadedInTheTypesList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnumerator').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyEnumerator'));
end;

procedure TOpenAPI30SchemaConverterTest.TheEnumeratorFromComponentsSchemaMustLoadTheNameOfThePropertyHasExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnum').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.AreEqual('MyEnum', GetMainClass.Enumerations[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.ThePropertyNameOfAllOfSchemaMustBeAllOf;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.AddAllOf.Schema;

  ImportDefinition;

  Assert.AreEqual('AllOf', GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.TheReferenceComponentMustLoadTheReferenceInfoWithTheValuesOfTheSchemaAsExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyRef').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual('Open API 3.0/components/schemas', GetMainClass.Alias[0].TypeAlias.AsReferenceDefinition.Namespace);
  Assert.AreEqual('MyClass', GetMainClass.Alias[0].TypeAlias.AsReferenceDefinition.Reference);
end;

procedure TOpenAPI30SchemaConverterTest.TheSchemaTypeMustLoadThePropertyNameHasExpected;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;
  ClassSchema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  ImportDefinition;

  Assert.AreEqual('MyProp', GetMainClass.Classes[0].Properties[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.TheSubclassNameMustBeThePropertyPlusTheTypeName;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual('.MyPropType', GetMainClass.Classes[0].Classes[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenAComponentSchemaIsAReferenceToAnotherTypeMustCreateAnAliasType;
begin
  FDefinition.components.schemas.AddPatternProperty('MyRef').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Alias));
end;

procedure TOpenAPI30SchemaConverterTest.WhenAPropertyHasTheEnumPropertyLoadedMustCreateTheEnumeratorTypeInTheParentClassHasExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes[0].Enumerations));
end;

procedure TOpenAPI30SchemaConverterTest.WhenCreateAClassInTheComponentSchemaCantCreateAnAliasFromTheType;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Alias));
end;

procedure TOpenAPI30SchemaConverterTest.WhenHasASchemaObjectDeclaredInTheComponentsMustAppendTheClassInMainClassList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.WhenHasASchemaObjectDeclaredInTheComponentsMustAppendTheClassInTheTypesListInTheSchemaNamespace;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyClass'));
end;

procedure TOpenAPI30SchemaConverterTest.WhenHasMoreThanOneAllOfDefinitionMustCreateThePropertiesNamesUsingASequenceValueHasExpected;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  var PropertyDefinition := ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  PropertyDefinition.AddAllOf.Schema;

  PropertyDefinition.AddAllOf.Schema;

  PropertyDefinition.AddAllOf.Schema;

  ImportDefinition;

  Assert.AreEqual('AllOf', GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('AllOf2', GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('AllOf3', GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheDefinitionInTheSchemaValueHasExpected;
begin
  var Converter: ISchemaConverter := TOpenAPI30SchemaConverter.Create;
  var Schema := TSchema.Create;
  Schema.SchemaText := GetDefinitionJSON;

  Converter.LoadSchema(Schema);

  Assert.IsNotNil(Schema.SchemaValue.AsObject);

  Assert.AreEqual(OpenAPIDefinition, Schema.SchemaValue.AsObject.ClassType);

  Schema.Free;
end;

procedure TOpenAPI30SchemaConverterTest.WhenLoadTheSchemaMustLoadTheTitleOfInfoPropertyInTheSchemaNamespace;
begin
  var Converter: ISchemaConverter := TOpenAPI30SchemaConverter.Create;
  FDefinition.info.title := 'My Test Schema';
  var Schema := TSchema.Create;
  Schema.SchemaText := GetDefinitionJSON;

  Converter.LoadSchema(Schema);

  Assert.AreEqual(FDefinition.info.title, Schema.Namespace);

  Schema.Free;
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheComponentSchemaHasTheEnumPropertyLoadedMustAppendTheTypeInTheEnumeratorsList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnumerator').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Enumerations));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePropertySchemaHasAnObjectDefinitionMustLoadTheClassInsideTheClassOfTheProperty;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes[0].Classes));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePropertyTypeIsABuildInTypeMustLoadThePropertyTypeWithTypeExpected;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;
  ClassSchema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  for var TypeName in [OpenAPIDefinition.Schema.TTypeType.boolean, OpenAPIDefinition.Schema.TTypeType.integer, OpenAPIDefinition.Schema.TTypeType.number, OpenAPIDefinition.Schema.TTypeType.string] do
    ClassSchema.properties.AddAdditionalProperties(TRttiEnumerationType.GetName(TypeName)).Schema.&type := TypeName;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.BooleanType].Name, GetMainClass.Classes[0].Properties[0].PropertyType.Name);
  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType].Name, GetMainClass.Classes[0].Properties[1].PropertyType.Name);
  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.DoubleType].Name, GetMainClass.Classes[0].Properties[2].PropertyType.Name);
  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.StringType].Name, GetMainClass.Classes[0].Properties[3].PropertyType.Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePropertyTypeIsAnObjectMustCreateAClassDefinitionForThePropertyType;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePropertyTypeIsAnReferenceMustLoadAReferenceType;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheSchemaHasTheAllOfDefinitionMustLoadAClassTypeDefinitionForThePropertyType;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.AddAllOf.Schema;

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheSchemaTypeHasPropertiesMustLoadAnClassDefinitionInTheClassesListOfTheMainClassHasExpected;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheSchemaTypeHasPropertiesMustLoadThePropertyInTheClassDefinitionHasExcepted;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;
  ClassSchema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp2').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp3').Schema;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes[0].Properties));
end;

end.

