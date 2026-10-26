unit Blue.Print.JSON.Draft4.Schema.Converter.Test;

interface

uses System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer, Blue.Print.JSON.Draft4.Schema, Blue.Print.Types;

type
  [TestFixture]
  TJSONDraft4SchemaConverterTeste = class
  private
    FConfiguration: TConfiguration;
    FDefinition: JSONSchema;
    FImporter: TSchemaImporter;

    function AddProperty(const JSONSchemaType: JSONSchema; const Name: String; const SimpleType: JSONSchema.simpleTypes): JSONSchema;
    function AddPropertyWithTypeArray(const JSONSchemaType: JSONSchema; const Name: String; const ArrayType: JSONSchema): JSONSchema;
    function CreateArrayDefinition(const Name: String; const Items: JSONSchema): JSONSchema;
    function CreateClassDefinition(const Name: String): JSONSchema;
    function CreateEnumerationDefinition(const Name: String; const Values: TArray<String>): JSONSchema;
    function CreateSchema(const SimpleType: JSONSchema.simpleTypes): JSONSchema;
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
    [Test]
    procedure WhenTheMainSchemaHasPropertiesThisPropertiesMustBeLoadedInTheMainClass;
    [Test]
    procedure WhenTheSchemaDoesntHaveAnyDefinitionMustLoadThePropertyWithTheTValueType;
    [Test]
    procedure WhenTheReferenceIsOnlyASharpCharacterCantRaiseAnyError;
    [Test]
    procedure WhenTheReferenceIsOnlyASharpCharacterMustLoadTheReferenceToTheMainClassOfTheSchema;
    [Test]
    procedure WhenThePropertyTypeIsObjectCantRaiseError;
    [Test]
    procedure WhenThePropertyTypeIsObjectMustCreateAClassDefinitionForThePropertyType;
    [Test]
    procedure WhenThePropertyTypeIsObjectTheClassDefinitionMustHaveThePropertyNamePlusTheTypeName;
    [Test]
    procedure MustAppendADotInTheClassNameOfAPropertyToForceTheCorrectCaseInTheClassNameCreated;
    [Test]
    procedure WhenTheSchemaInTheDefinitionsIsAnArrayTypeMustCreateAnAliasToTheTypeCreated;
    [Test]
    procedure TheAliasNameMustBeTheFieldNameOfTheDefinition;
    [Test]
    procedure WhenDeclareTheAliasTypeMustLoadTheSchemaTypeInTheDefinitionHasExpected;
    [Test]
    procedure TheTypeAliasMustBeAppendedToTheTypesListInsideTheDefinitionsSchema;
    [Test]
    procedure WhenTheDefinitionHasTheEnumPropertyLoadedMustCreateTheEnumeratorInTheMainClass;
    [Test]
    procedure TheNameOfTheEnumeratorMustBeTheFieldNameOfTheDefinition;
    [Test]
    procedure MustLoadTheEnumeratorNamesInTheClass;
    [Test]
    procedure TheEnumerationCantCreateAnAliasFromTheType;
    [Test]
    procedure AllPropertiesMustBeOptional;
    [Test]
    procedure IfThePropertyIsInTheRequiredListCantBeOptional;
    [Test]
    procedure WhenDeclareAClassInTheSchemaTheClassNameMustBeLoadedWithTheNameInTheDefinitionsField;
    [Test]
    procedure WhenTheSchemaCreateAClassDefinitionCantCreateAnAliasTypeFromTheClass;
    [Test]
    procedure WhenTheSchemaHaveTheAllOfPropertyLoadedMustCreateAClassDefinitionForTheProperty;
    [Test]
    procedure MustCreateAPropertyForEveryItemInTheAllOfSchema;
    [Test]
    procedure WhenTheAllOfSchemaIsAReferenceMustLoadAPropertyWithTheReferenceName;
    [Test]
    procedure WhenTheAllOfIsAReferenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
    [Test]
    procedure WhenTheAllOfHasOnlyOneSchemaAndIsAReferenceMustCreateOnlyTheReferenceToTheTypeInThePropertyType;
    [Test]
    procedure WhenTheAllOfSchemaHasASchemaDefinitionMustCreateThePropertyNameStartingWithAllOfName;
    [Test]
    procedure WhenTheAllOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
    [Test]
    procedure WhenTheAnyOfIsLoadedAndHaveOnlyOneItemAndThisItemIsAReferecenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
    [Test]
    procedure WhenTheAnyOfHasMoreThanOneSchemaMustCreateAClassTypeDefinitionForTheProperty;
    [Test]
    procedure ForEveryAnyOfSchemaMustAppendAPropertyInTheClassDefinition;
    [Test]
    procedure WhenTheAnyOfSchemaIsAReferenceMustAppendTheReferenceNameToThePropertyName;
    [Test]
    procedure ThePropertyTypeOfAnyOfSchemaMustBeAReferenceIfTheSchemaIsAReference;
    [Test]
    procedure WhenTheSchemaOfAnyOfIsntAReferenceMustLoadThePropertyNameStartingWithAnyOfName;
    [Test]
    procedure WhenTheAnyOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
    [Test]
    procedure WhenTheOneOfIsLoadedAndHaveOnlyOneItemAndThisItemIsAReferecenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
    [Test]
    procedure WhenTheOneOfHasMoreThanOneSchemaMustCreateAClassTypeDefinitionForTheProperty;
    [Test]
    procedure ForEveryOneOfSchemaMustAppendAPropertyInTheClassDefinition;
    [Test]
    procedure WhenTheOneOfSchemaIsAReferenceMustAppendTheReferenceNameToThePropertyName;
    [Test]
    procedure ThePropertyTypeOfOneOfSchemaMustBeAReferenceIfTheSchemaIsAReference;
    [Test]
    procedure WhenTheSchemaOfOneOfIsntAReferenceMustLoadThePropertyNameStartingWithAnyOfName;
    [Test]
    procedure WhenTheOneOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
    [Test]
    procedure WhenCreateAnAllOfClassMustMarkTheClassHasFlat;
    [Test]
    procedure WhenCreateAnAnyOfClassMustMarkTheClassHasFlat;
    [Test]
    procedure WhenCreateAnOneOfClassMustMarkTheClassHasFlat;
    [Test]
    procedure WhenTheSchemaOfAllOfIsAnBuildInTypeMustCreateThePropertyWithTheNameOfEnumerator;
    [Test]
    procedure WhenTheSchemaIsAnObjectWithAdditionalPropertyMustCreateAProperty;
    [Test]
    procedure TheAdditionalPropertyMustHaveTheNameOfAddicionalProperties;
    [Test]
    procedure WhenTheSchemaIsAnObjectWithAdditionalPropertyMustAppendAPropertyWithTheDynamicPropertyType;
    [Test]
    procedure TheAdditionalPropertyMustHaveTheTypeDefinedByTheSchemaConfiguration;
    [Test]
    procedure TheAdditionalPropertyMustBeLoadedOnlyIfItIsDefinedInTheSchema;
    [Test]
    procedure WhenTheDynamicPropertyTypeIsAnClassDefinitionMustLoadTheClassNameWithTheNameAdditionalPropertyType;
    [Test]
    procedure WhenTheDynamicPropertyTypeIsntAClassDefinitionCantChangeTheNameType;
    [Test]
    procedure WhenTheAnyOfIsLoadedMustLoadAllPropertiesHasOptional;
    [Test]
    procedure WhenTheOneOfIsLoadedMustLoadAllPropertiesHasOptional;
    [Test]
    procedure WhenTheAllOfIsLoadedMustLoadAllPropertiesCantBeOptional;
    [Test]
    procedure WhenTheSchemaHasPropertiesAndAllOfDefinitionMustLoadTheProperties;
    [Test]
    procedure WhenTheClassDefinitionHasAdditionalPropertiesAndIsLoadedTheBooleanPropertyWithTheFalseValueCantLoadTheProperty;
    [Test]
    procedure MustLoadTheAdditionalOnlyIfTheSchemaIsLoaded;
  end;

implementation

uses System.IOUtils, System.Rtti, Blue.Print.JSON.Draft4.Schema.Converter, Blue.Print.Serializer;

{ TJSONDraft4SchemaConverterTeste }

function TJSONDraft4SchemaConverterTeste.AddProperty(const JSONSchemaType: JSONSchema; const Name: String; const SimpleType: JSONSchema.simpleTypes): JSONSchema;
begin
  Result := JSONSchemaType.properties.AddAdditionalProperties(Name);
  Result.&type.simpleTypes := SimpleType;
end;

function TJSONDraft4SchemaConverterTeste.AddPropertyWithTypeArray(const JSONSchemaType: JSONSchema; const Name: String; const ArrayType: JSONSchema): JSONSchema;
begin
  Result := AddProperty(JSONSchemaType, name, JSONSchema.simpleTypes.array);
  Result.items.JSONSchema := ArrayType;
end;

procedure TJSONDraft4SchemaConverterTeste.AllPropertiesMustBeOptional;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Classes[0].Properties[0].Optional);
  Assert.IsTrue(GetMainClass.Classes[0].Properties[1].Optional);
  Assert.IsTrue(GetMainClass.Classes[0].Properties[2].Optional);
end;

function TJSONDraft4SchemaConverterTeste.CreateArrayDefinition(const Name: String; const Items: JSONSchema): JSONSchema;
begin
  Result := FDefinition.definitions.AddAdditionalProperties(Name);
  Result.items.JSONSchema := Items;
  Result.&type.simpleTypes := JSONSchema.simpleTypes.&array;
end;

function TJSONDraft4SchemaConverterTeste.CreateClassDefinition(const Name: String): JSONSchema;
begin
  Result := FDefinition.definitions.AddAdditionalProperties(Name);
  Result.&type.simpleTypes := JSONSchema.simpleTypes.&object;
end;

function TJSONDraft4SchemaConverterTeste.CreateEnumerationDefinition(const Name: String; const Values: TArray<String>): JSONSchema;
begin
  Result := FDefinition.definitions.AddAdditionalProperties(Name);

  for var EnumValue in Values do
    Result.enum := Result.enum + [EnumValue];
end;

function TJSONDraft4SchemaConverterTeste.CreateSchema(const SimpleType: JSONSchema.simpleTypes): JSONSchema;
begin
  Result := JSONSchema.Create;
  Result.&type.simpleTypes := SimpleType;
end;

procedure TJSONDraft4SchemaConverterTeste.ForEveryAnyOfSchemaMustAppendAPropertyInTheClassDefinition;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.ForEveryOneOfSchemaMustAppendAPropertyInTheClassDefinition;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties));
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

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.IfThePropertyIsInTheRequiredListCantBeOptional;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', JSONSchema.simpleTypes.string);

  ClassDefinition.AddRequired('MyProp2');

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Classes[0].Properties[0].Optional);
  Assert.IsFalse(GetMainClass.Classes[0].Properties[1].Optional);
  Assert.IsTrue(GetMainClass.Classes[0].Properties[2].Optional);
end;

procedure TJSONDraft4SchemaConverterTeste.IfTheSchemaHasDefinitionsMustAppendTheSubschemaValue;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

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

procedure TJSONDraft4SchemaConverterTeste.MustAppendADotInTheClassNameOfAPropertyToForceTheCorrectCaseInTheClassNameCreated;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'myProp', JSONSchema.simpleTypes.object);

  ImportDefinition;

  Assert.AreEqual('.myPropType', GetMainClass.Classes[0].Properties[0].PropertyType.Name);
end;

procedure TJSONDraft4SchemaConverterTeste.MustCreateAPropertyForEveryItemInTheAllOfSchema;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.MustFillTheReferencePropertyWithTheClassNameInTheJSONReference;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual('MyClass', ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheAdditionalOnlyIfTheSchemaIsLoaded;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  ClassDefinition.additionalProperties.boolean := True;

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheArrayTypeWithTheTypeDefinedInTheItemsSchema;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddPropertyWithTypeArray(ClassDefinition, 'MyProp', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType.AsGenericDefinition.GenericType);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheEnumeratorNamesInTheClass;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum1', 'Enum2', 'Enum3']);

  ImportDefinition;

  Assert.AreEqual(3, GetMainClass.Enumerations[0].Values.Count);
  Assert.AreEqual('Enum1', GetMainClass.Enumerations[0].Values[0]);
  Assert.AreEqual('Enum2', GetMainClass.Enumerations[0].Values[1]);
  Assert.AreEqual('Enum3', GetMainClass.Enumerations[0].Values[2]);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheReferenceInformation;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.IsNotEmpty(ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TJSONDraft4SchemaConverterTeste.MustLoadTheReferenceNamespaceInformation;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.IsNotEmpty(ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Namespace);
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
  FDefinition := JSONSchema.Create;
  FDefinition.id := 'My Namespace';
  FImporter := TSchemaImporter.Create;

  FConfiguration.Namespaces := [CreateNamespaceConfiguration];
  FConfiguration.Units := [CreateUnitConfiguration];
end;

procedure TJSONDraft4SchemaConverterTeste.TearDown;
begin
  inherited;

  for var UnitConfiguration in FConfiguration.Units do
    for var SchemaFile in UnitConfiguration.SchemaFiles do
      if TFile.Exists(SchemaFile.FileName) then
        TFile.Delete(SchemaFile.FileName);

  FConfiguration.Free;

  FImporter.Free;

  FDefinition.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.TheAdditionalPropertyMustBeLoadedOnlyIfItIsDefinedInTheSchema;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.TheAdditionalPropertyMustHaveTheNameOfAddicionalProperties;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.integer;

  ImportDefinition;

  Assert.AreEqual('additionalProperties', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.TheAdditionalPropertyMustHaveTheTypeDefinedByTheSchemaConfiguration;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.integer;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.AsGenericDefinition.GenericType);
end;

procedure TJSONDraft4SchemaConverterTeste.TheAliasNameMustBeTheFieldNameOfTheDefinition;
begin
  CreateArrayDefinition('MyArray', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual('MyArray', GetMainClass.Alias[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.TheClassDeclarationMustBeInsideTheDefsSchemaNamespace;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');
  var TypeDefinition: TTypeDefinition;

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.IsTrue(FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', TypeDefinition));
end;

procedure TJSONDraft4SchemaConverterTeste.TheClassMustBeAppendedInTheMainClassHasExpected;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes));
end;

procedure TJSONDraft4SchemaConverterTeste.TheDefinitionsSubschemaMustAppendTheCurrentPrefixWithTheDefsName;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual('my/defs', FImporter.GetPrefixName(FDefinition.id + '/definitions'));
end;

procedure TJSONDraft4SchemaConverterTeste.TheEnumerationCantCreateAnAliasFromTheType;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum1', 'Enum2', 'Enum3']);

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Alias));
end;

procedure TJSONDraft4SchemaConverterTeste.TheInitializationSectionMustLoadTheConverterInTheSchemaConverterClassList;
begin
  Assert.IsNotNil(TSchemaImporter.Converters[TSchemaType.JSONDraft4]);
end;

procedure TJSONDraft4SchemaConverterTeste.TheNameOfTheEnumeratorMustBeTheFieldNameOfTheDefinition;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum']);

  ImportDefinition;

  Assert.AreEqual('MyEnum', GetMainClass.Enumerations[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.TheNamespaceInTheReferenceMustBeTheIdOfTheJSONSchemaPlusTheDefinitionsName;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual(FDefinition.id + '/definitions', ClassDefinition.AsClassDefinition.Properties[0].PropertyType.AsReferenceDefinition.Namespace);
end;

procedure TJSONDraft4SchemaConverterTeste.ThePropertyNameMustBeLoadedInThePropertyDefinition;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual('MyProp', GetMainClass.Classes[0].Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.ThePropertyTypeOfAnyOfSchemaMustBeAReferenceIfTheSchemaIsAReference;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference2').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference3').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference';
  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference2';
  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference3';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.ClassType);
  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].PropertyType.ClassType);
  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.ThePropertyTypeOfOneOfSchemaMustBeAReferenceIfTheSchemaIsAReference;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference2').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference3').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddOneOf.ref := '#/definitions/MyReference';
  PropertySchema.AddOneOf.ref := '#/definitions/MyReference2';
  PropertySchema.AddOneOf.ref := '#/definitions/MyReference3';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.ClassType);
  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].PropertyType.ClassType);
  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.TheTypeAliasMustBeAppendedToTheTypesListInsideTheDefinitionsSchema;
begin
  var TypeDefinition: TTypeDefinition;

  CreateArrayDefinition('MyArray', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.IsTrue(FImporter.TryFindType(FDefinition.id + '/definitions', 'MyArray', TypeDefinition));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenCreateAnAllOfClassMustMarkTheClassHasFlat;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf;

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Flat);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenCreateAnAnyOfClassMustMarkTheClassHasFlat;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf;

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Flat);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenCreateAnOneOfClassMustMarkTheClassHasFlat;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddOneOf;

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Flat);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenDeclareAClassInTheSchemaTheClassNameMustBeLoadedWithTheNameInTheDefinitionsField;
begin
  CreateClassDefinition('MyClass');

  ImportDefinition;

  Assert.AreEqual('MyClass', GetMainClass.Classes[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenDeclareTheAliasTypeMustLoadTheSchemaTypeInTheDefinitionHasExpected;
begin
  CreateArrayDefinition('MyArray', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Alias[0].TypeAlias.IsArrayDefinition);
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

  Assert.AreEqual(JSONSchema, Schema.SchemaValue.AsObject.ClassType);

  Schema.Free;
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfHasOnlyOneSchemaAndIsAReferenceMustCreateOnlyTheReferenceToTheTypeInThePropertyType;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfIsAReferenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference';

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference';

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfIsLoadedMustLoadAllPropertiesCantBeOptional;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf;

  ImportDefinition;

  Assert.IsFalse(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Optional);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf.ref := '#';
  PropertySchema.AddAllOf.ref := '#';
  PropertySchema.AddAllOf.ref := '#';

  ImportDefinition;

  Assert.AreEqual('MainClass', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfSchemaHasASchemaDefinitionMustCreateThePropertyNameStartingWithAllOfName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  ImportDefinition;

  Assert.AreEqual('AllOf1', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('AllOf2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('AllOf3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAllOfSchemaIsAReferenceMustLoadAPropertyWithTheReferenceName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference2').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference3').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference';

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference2';

  PropertySchema.AddAllOf.ref := '#/definitions/MyReference3';

  ImportDefinition;

  Assert.AreEqual('MyReference', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('MyReference2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('MyReference3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAnyOfHasMoreThanOneSchemaMustCreateAClassTypeDefinitionForTheProperty;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAnyOfIsLoadedAndHaveOnlyOneItemAndThisItemIsAReferecenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAnyOfIsLoadedMustLoadAllPropertiesHasOptional;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf;

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Optional);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAnyOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf.ref := '#';
  PropertySchema.AddAnyOf.ref := '#';
  PropertySchema.AddAnyOf.ref := '#';

  ImportDefinition;

  Assert.AreEqual('MainClass', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheAnyOfSchemaIsAReferenceMustAppendTheReferenceNameToThePropertyName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference2').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference3').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference';
  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference2';
  PropertySchema.AddAnyOf.ref := '#/definitions/MyReference3';

  ImportDefinition;

  Assert.AreEqual('MyReference', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('MyReference2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('MyReference3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheClassDefinitionHasAdditionalPropertiesAndIsLoadedTheBooleanPropertyWithTheFalseValueCantLoadTheProperty;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  ClassDefinition.additionalProperties.boolean := False;

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheClassDefinitionHaveAPropertyMustLoadThePropertyInTheClass;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheDefinitionHasTheEnumPropertyLoadedMustCreateTheEnumeratorInTheMainClass;
begin
  CreateEnumerationDefinition('MyEnum', ['Enum']);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Enumerations));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheDynamicPropertyTypeIsAnClassDefinitionMustLoadTheClassNameWithTheNameAdditionalPropertyType;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.object;

  ImportDefinition;

  Assert.AreEqual('TAdditionalPropertiesType', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.AsGenericDefinition.GenericType.Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheDynamicPropertyTypeIsntAClassDefinitionCantChangeTheNameType;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.integer;

  ImportDefinition;

  Assert.AreEqual('Integer', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.AsGenericDefinition.GenericType.Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheMainSchemaHasPropertiesThisPropertiesMustBeLoadedInTheMainClass;
begin
  AddProperty(FDefinition, 'MyProp', JSONSchema.simpleTypes.integer);

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheOneOfHasMoreThanOneSchemaMustCreateAClassTypeDefinitionForTheProperty;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheOneOfIsLoadedAndHaveOnlyOneItemAndThisItemIsAReferecenceMustLoadThePropertyTypeWithAReferenceTypeDefinition;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddOneOf.ref := '#/definitions/MyReference';

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheOneOfIsLoadedMustLoadAllPropertiesHasOptional;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddOneOf;

  ImportDefinition;

  Assert.IsTrue(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Optional);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheOneOfReferenceIsTheSharpMustLoadTheMainClassNameInThePropertyName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf.ref := '#';
  PropertySchema.AddAnyOf.ref := '#';
  PropertySchema.AddAnyOf.ref := '#';

  ImportDefinition;

  Assert.AreEqual('MainClass', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheOneOfSchemaIsAReferenceMustAppendTheReferenceNameToThePropertyName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  FDefinition.definitions.AddAdditionalProperties('MyReference').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference2').&type.simpleTypes := JSONSchema.simpleTypes.integer;
  FDefinition.definitions.AddAdditionalProperties('MyReference3').&type.simpleTypes := JSONSchema.simpleTypes.integer;

  PropertySchema.AddOneOf.ref := '#/definitions/MyReference';
  PropertySchema.AddOneOf.ref := '#/definitions/MyReference2';
  PropertySchema.AddOneOf.ref := '#/definitions/MyReference3';

  ImportDefinition;

  Assert.AreEqual('MyReference', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('MyReference2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('MyReference3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyIsAnArrayTypeMustLoadTheArrayTypeDefinition;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddPropertyWithTypeArray(ClassDefinition, 'MyProp', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual(TTypeArrayDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsObjectCantRaiseError;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.object);

  Assert.WillNotRaise(ImportDefinition);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsObjectMustCreateAClassDefinitionForThePropertyType;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.object);

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Classes[0].Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsObjectTheClassDefinitionMustHaveThePropertyNamePlusTheTypeName;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.object);

  ImportDefinition;

  Assert.AreEqual('.MyPropType', GetMainClass.Classes[0].Properties[0].PropertyType.Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfBooleanTypeMustLoadThePropertyWithTheBuildInTypeBoolean;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.boolean);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.BooleanType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfIntegerTypeMustLoadThePropertyWithTheBuildInTypeInteger;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.integer);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfNumberTypeMustLoadThePropertyWithTheBuildInTypeDouble;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.number);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.DoubleType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenThePropertyTypeIsOfStringTypeMustLoadThePropertyWithTheBuildInTypeString;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.StringType], GetMainClass.Classes[0].Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheReferenceIsOnlyASharpCharacterCantRaiseAnyError;
begin
  var PropertyDefintion := FDefinition.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#';

  Assert.WillNotRaise(ImportDefinition);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheReferenceIsOnlyASharpCharacterMustLoadTheReferenceToTheMainClassOfTheSchema;
begin
  var PropertyDefintion := FDefinition.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#';

  ImportDefinition;

  Assert.AreEqual(GetMainClass.Name, GetMainClass.Properties[0].PropertyType.AsReferenceDefinition.Reference);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaCreateAClassDefinitionCantCreateAnAliasTypeFromTheClass;
begin
  CreateClassDefinition('MyClass');

  ImportDefinition;

  Assert.AreEqual(0, Length(GetMainClass.Alias));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaDoesntHaveAnyDefinitionMustLoadThePropertyWithTheTValueType;
begin
  FDefinition.properties.AddAdditionalProperties('MyProp');

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.ValueType], GetMainClass.Properties[0].PropertyType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaHasPropertiesAndAllOfDefinitionMustLoadTheProperties;
begin
  var ClassDefinition := CreateClassDefinition('MyClass');

  AddProperty(ClassDefinition, 'MyProp', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp2', JSONSchema.simpleTypes.string);

  AddProperty(ClassDefinition, 'MyProp3', JSONSchema.simpleTypes.string);

  ClassDefinition.AddAllOf;

  ClassDefinition.AddAllOf;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes[0].Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaHaveTheAllOfPropertyLoadedMustCreateAClassDefinitionForTheProperty;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  PropertySchema.AddAllOf;

  ImportDefinition;

  Assert.AreEqual(TTypeClassDefinition, GetMainClass.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaInTheDefinitionsIsAnArrayTypeMustCreateAnAliasToTheTypeCreated;
begin
  CreateArrayDefinition('MyArray', CreateSchema(JSONSchema.simpleTypes.integer));

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Alias));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaIsAnObjectWithAdditionalPropertyMustAppendAPropertyWithTheDynamicPropertyType;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.integer;

  ImportDefinition;

  Assert.AreEqual(TTypeDynamicPropertyDefinition, GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaIsAnObjectWithAdditionalPropertyMustCreateAProperty;
begin
  var PropertyDefinition := FDefinition.properties.AddAdditionalProperties('MyProperty');
  PropertyDefinition.&type.simpleTypes := JSONSchema.simpleTypes.&object;
  PropertyDefinition.additionalProperties.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.integer;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties));
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaIsAReferenceMustCreateTheReferenceType;
begin
  var ClassDefinition: TTypeDefinition;
  var ClassSchema := CreateClassDefinition('MyClass');
  var PropertyDefintion := ClassSchema.properties.AddAdditionalProperties('MyProp');
  PropertyDefintion.ref := '#/definitions/MyClass';

  ImportDefinition;

  FImporter.TryFindType(FDefinition.id + '/definitions', 'MyClass', ClassDefinition);

  Assert.AreEqual(TTypeReferenceDefinition, ClassDefinition.AsClassDefinition.Properties[0].PropertyType.ClassType);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaOfAllOfIsAnBuildInTypeMustCreateThePropertyWithTheNameOfEnumerator;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  var ArrayType := PropertySchema.AddAllOf;

  ArrayType.&type.simpleTypes := JSONSchema.simpleTypes.array;
  ArrayType.items.JSONSchema.&type.simpleTypes := JSONSchema.simpleTypes.string;

  PropertySchema.AddAllOf.&type.simpleTypes := JSONSchema.simpleTypes.boolean;
  PropertySchema.AddAllOf.&type.simpleTypes := JSONSchema.simpleTypes.integer;
  PropertySchema.AddAllOf.&type.simpleTypes := JSONSchema.simpleTypes.number;
  PropertySchema.AddAllOf.&type.simpleTypes := JSONSchema.simpleTypes.object;
  PropertySchema.AddAllOf.&type.simpleTypes := JSONSchema.simpleTypes.string;

  ImportDefinition;

  var ClassDeclaration := GetMainClass.Classes[0];

  Assert.IsNotNil(ClassDeclaration);

  Assert.AreEqual('array', ClassDeclaration.Properties[0].Name);
  Assert.AreEqual('boolean', ClassDeclaration.Properties[1].Name);
  Assert.AreEqual('integer', ClassDeclaration.Properties[2].Name);
  Assert.AreEqual('number', ClassDeclaration.Properties[3].Name);
  Assert.AreEqual('object', ClassDeclaration.Properties[4].Name);
  Assert.AreEqual('string', ClassDeclaration.Properties[5].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaOfAnyOfIsntAReferenceMustLoadThePropertyNameStartingWithAnyOfName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  PropertySchema.AddAnyOf;

  ImportDefinition;

  Assert.AreEqual('AnyOf1', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('AnyOf2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('AnyOf3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

procedure TJSONDraft4SchemaConverterTeste.WhenTheSchemaOfOneOfIsntAReferenceMustLoadThePropertyNameStartingWithAnyOfName;
begin
  var PropertySchema := FDefinition.properties.AddAdditionalProperties('MyProperty');

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  PropertySchema.AddOneOf;

  ImportDefinition;

  Assert.AreEqual('OneOf1', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[0].Name);
  Assert.AreEqual('OneOf2', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[1].Name);
  Assert.AreEqual('OneOf3', GetMainClass.Properties[0].PropertyType.AsClassDefinition.Properties[2].Name);
end;

end.

