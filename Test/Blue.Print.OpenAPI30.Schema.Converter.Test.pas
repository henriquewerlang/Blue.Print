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
    function GetInterfaceService: TTypeInterfaceDefinition;

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
    [Test]
    procedure WhenTheDefinitionHasPathsMustLoadTheMethodInTheInterfaceList;
    [Test]
    procedure ThePathStringMustBeTheMethodName;
    [Test]
    procedure WhenThePathHasMoreThanOneSlashMustReplaceByAnUnderline;
    [Test]
    procedure WhenThePatchSchemaIsLoadedMustAppendThePatchAttributeInTheMethod;
    [Test]
    procedure WhenTheGetSchemaIsLoadedMustAppendTheGetAttributeInTheMethod;
    [Test]
    procedure WhenThePostSchemaIsLoadedMustAppendThePostAttributeInTheMethod;
    [Test]
    procedure WhenTheDeleteSchemaIsLoadedMustAppendTheDeleteAttributeInTheMethod;
    [Test]
    procedure WhenTheOptionsSchemaIsLoadedMustAppendTheOptionsAttributeInTheMethod;
    [Test]
    procedure WhenThePutSchemaIsLoadedMustAppendThePutAttributeInTheMethod;
    [Test]
    procedure WhenThePathWithPostHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePathWithPatchHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePathWithGetHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePathWithDeleteHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePathWithOptionsHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePutWithOptionsHasParametersMustLoadAllInTheMethod;
    [Test]
    procedure WhenThePathItemDoesntHaveAnOperationMustRaiseAnError;
    [Test]
    procedure WhenTheOperationHasParametersMustLoadTheNameHasExpected;
    [Test]
    procedure MustLoadTheParameterTypeUsingTheSchemaInformationHasExpected;
    [Test]
    procedure WhenTheParameterSchemaGenerateATypeMustLoadTheTypeNameWithTheMethodNameAndParameterNamePlusTypeInTheName;
    [Test]
    procedure WhenTheParameterIsAReferenceMustLoadAReferenceTypeInTheParameterType;
    [Test]
    procedure WhenTheServiceInterfaceNameIsEmptyMustRaiseAnErrorWhenTryLoadTheMethods;
    [Test]
    procedure WhenThePathItemHasTheRequestBodyLoadedAndTheContentTypeIsApplicationJSONMustAppendAParameterInTheMethod;
    [Test]
    procedure WhenTheRequestBodyDontHaveAValidContentTypeMustRaiseAnError;
    [Test]
    procedure TheContentTypeParameterMustHaveTheNameCalledBody;
    [Test]
    procedure WhenTheContentTypeHasATypeDefinitionMustCreateTheTypeWithTheMethodNameAndParameterNamePlusTypeInTheName;
    [Test]
    procedure WhenTheContentTypeIsAReferenceMustLoadTheReferenceTypeInTheParameterType;
    [Test]
    procedure WhenTheRequestBodiesHasAContentTypeOfApplicationJSONMustLoadTheTypeInTheMainClassTypes;
    [Test]
    procedure WhenTheRequestBodiesHasAContentTypeOfApplicationJSONMustLoadTheAllTypesInTheMainClassTypes;
    [Test]
    procedure MustLoadTheClassNameInTheRequestBodiesWithThePatternName;
    [Test]
    procedure IfInTheComponentRequestBodiesHasAnInvalidContentTypeMustRaiseAnError;
    [Test]
    procedure MustAppendTheTypeCreatedInTheComponentsRequestBodiesInTheNamespaceHasExpected;
    [Test]
    procedure WhenAParameterInAnOperationHasAReferenteToARequestBodiesMustLoadTheReferenceToTheTypeHasExpected;
    [Test]
    procedure WhenTheRequestBodiesIsAMultipartFormDataCantRaiseAnyError;
    [Test]
    procedure WhenCreateAReferenceMustLoadTheReferenceTypeNameWithTheRequestBodiesName;
    [Test]
    procedure WhenTheContentOfARequestBodiesIsAReferenceMustAppendTheReferenceToTheTypesListWithTheNameOfRequestBodies;
    [Test]
    procedure WhenTheParameterIsABodyParameterMustLoadTheBodyAttributeInTheParameter;
    [Test]
    procedure WhenTheParameterIsHeaderTypeMustLoadTheHeaderAttributeInTheParameter;
    [Test]
    procedure WhenTheParameterIsPathTypeMustLoadThePathNameAttributeInTheParameter;
    [Test]
    procedure WhenTheParameterIsQueryTypeMustLoadTheQueryAttributeInTheParameter;
    [Test]
    procedure WhenThePathChangeTheNameOfTheMethodMustLoadTheRemoteNameAttribute;
    [Test]
    procedure TheRemoteNameOfTheMethodMustBeTheValueOfThePathItem;
    [Test]
    procedure WhenTheDefinitionHasServersLoadedMustLoadTheFirstValueInTheRemoteNameOfTheServiceInterface;
    [Test]
    procedure MustAddTheServerInformationInTheRemoteNameOfTheInterface;
    [Test]
    procedure WhenTheDefinitionDontHaveAnyServerInformationMustLoadTheRemoteNameOfTheInterfaceWithAnEmptyRemoteName;
    [Test]
    procedure WhenTheParameterIsntRequiredMustLoadTheParameterHasOptional;
    [Test]
    procedure WhenTheBodyParameterIsntRequiredMustLoadTheParamaterHasOptional;
    [Test]
    procedure WhenTheBodyParameterIsAReferenceTypeCantBeOptional;
    [Test]
    procedure WhenTheComponentIsAnArraySchemaMustLoadAnAliasWithTheNameOfTheComponent;
    [Test]
    procedure TheAliasTypeMustBeAnArrayDefinition;
    [Test]
    procedure TheArrayTypeMustBeTheTypeDefinedInTheSchemaHasExpected;
    [Test]
    procedure WhenTheArrayTypeIsAnObjectMustCreateTheTypeWithTheComponentNamePlusArrayTypeName;
    [Test]
    procedure WhenTheArrayItemsSchemaIsAReferenceMustLoadTheReferenceTypeHasExpected;
  end;

implementation

uses System.JSON, System.SysUtils, System.IOUtils, System.Rtti, Rest.Types, Blue.Print.Serializer;

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

function TOpenAPI30SchemaConverterTest.GetInterfaceService: TTypeInterfaceDefinition;
begin
  Result := FImporter.FindTypeWithPrefix('my:ServiceInterface').AsInterfaceDefinition;
end;

function TOpenAPI30SchemaConverterTest.GetMainClass: TTypeClassDefinition;
begin
  Result := FImporter.FindTypeWithPrefix('my:MainClass').AsClassDefinition;
end;

procedure TOpenAPI30SchemaConverterTest.IfInTheComponentRequestBodiesHasAnInvalidContentTypeMustRaiseAnError;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties('invalid/content').schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  Assert.WillRaise(ImportDefinition, EInvalidContentType);
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

procedure TOpenAPI30SchemaConverterTest.MustAddTheServerInformationInTheRemoteNameOfTheInterface;
begin
  FDefinition.AddServers.url := 'MyServer';
  FDefinition.AddServers.url := 'MyServer2';
  FDefinition.AddServers.url := 'MyServer3';

  ImportDefinition;

  Assert.AreEqual('RemoteName(''MyServer'')', GetInterfaceService.Attributes[0].Declaration);
end;

procedure TOpenAPI30SchemaConverterTest.MustAppendTheTypeCreatedInTheComponentsRequestBodiesInTheNamespaceHasExpected;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/bodies:MyBody'));
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

procedure TOpenAPI30SchemaConverterTest.MustLoadTheClassNameInTheRequestBodiesWithThePatternName;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual('MyBody', GetMainClass.Classes[0].Name);
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

procedure TOpenAPI30SchemaConverterTest.MustLoadTheParameterTypeUsingTheSchemaInformationHasExpected;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;

  Parameter.name := 'MyParameter';
  Parameter.schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.number;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.DoubleType], GetInterfaceService.Methods[0].Parameters[0].ParameterType);
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
    Result.Namespace := FDefinition.info.title + Namespace;
    Result.Prefix := Prefix;
  end;

  function CreateSchemaFile: TSchemaFileConfiguration;
  begin
    Result := TSchemaFileConfiguration.Create;
    Result.FileName := TPath.GetTempFileName;
    Result.MainModuleName := 'MainClass';
    Result.SchemaType := TSchemaType.OpenAPI30;
    Result.ServiceInterfaceName := 'ServiceInterface';
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

  FConfiguration.Namespaces := [CreateNamespaceConfiguration(EmptyStr, 'my'), CreateNamespaceConfiguration('/components/schemas', 'my/schema'), CreateNamespaceConfiguration('/components/requestBodies', 'my/bodies')];
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

procedure TOpenAPI30SchemaConverterTest.TheAliasTypeMustBeAnArrayDefinition;
begin
  var ArraySchema := FDefinition.components.schemas.AddPatternProperty('MyArray').Schema;
  ArraySchema.items.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;
  ArraySchema.&type := OpenAPIDefinition.Schema.TTypeType.array;

  ImportDefinition;

  Assert.AreEqual(TTypeArrayDefinition, GetMainClass.Alias[0].TypeAlias.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.TheAllOfPropertyMustLoadThePropertyTypeUsingTheSchemaInfoOfAllOfSchema;
begin
  var ClassSchema := FDefinition.components.schemas.AddPatternProperty('MyClass').Schema;

  ClassSchema.properties.AddAdditionalProperties('MyProp').Schema.AddAllOf.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.IntegerType], GetMainClass.Classes[0].Properties[0].PropertyType.AsClassDefinition.Properties[0].PropertyType);
end;

procedure TOpenAPI30SchemaConverterTest.TheArrayTypeMustBeTheTypeDefinedInTheSchemaHasExpected;
begin
  var ArraySchema := FDefinition.components.schemas.AddPatternProperty('MyArray').Schema;
  ArraySchema.items.Schema.&type := OpenAPIDefinition.Schema.TTypeType.string;
  ArraySchema.&type := OpenAPIDefinition.Schema.TTypeType.array;

  ImportDefinition;

  Assert.AreEqual(FImporter.BuildInTypes[TBuildInType.StringType], GetMainClass.Alias[0].TypeAlias.AsGenericDefinition.GenericType);
end;

procedure TOpenAPI30SchemaConverterTest.TheComponentSchemaEnumeratorMustBeLoadedInTheTypesList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnumerator').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/schema:MyEnumerator'));
end;

procedure TOpenAPI30SchemaConverterTest.TheContentTypeParameterMustHaveTheNameCalledBody;
begin
  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual('Body', GetInterfaceService.Methods[0].Parameters[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.TheEnumeratorFromComponentsSchemaMustLoadTheNameOfThePropertyHasExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnum').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.AreEqual('MyEnum', GetMainClass.Enumerations[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.ThePathStringMustBeTheMethodName;
begin
  FDefinition.paths.AddPathItem('/MyProc').post;

  ImportDefinition;

  Assert.AreEqual('MyProc', GetInterfaceService.Methods[0].Name);
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

procedure TOpenAPI30SchemaConverterTest.TheRemoteNameOfTheMethodMustBeTheValueOfThePathItem;
begin
  FDefinition.paths.AddPathItem('/MyProc/MyPath/MyMethod').post;

  ImportDefinition;

  Assert.AreEqual('RemoteName(''/MyProc/MyPath/MyMethod'')', GetInterfaceService.Methods[0].Attributes[1].Declaration)
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

procedure TOpenAPI30SchemaConverterTest.WhenAParameterInAnOperationHasAReferenteToARequestBodiesMustLoadTheReferenceToTheTypeHasExpected;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').put;
  Operation.requestBody.Reference.AddString('$ref', '#/components/requestBodies/MyBody');

  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetInterfaceService.Methods[0].Parameters[0].ParameterType.ClassType);
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

procedure TOpenAPI30SchemaConverterTest.WhenCreateAReferenceMustLoadTheReferenceTypeNameWithTheRequestBodiesName;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual('MyBody', GetMainClass.Types[1].Name);
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

procedure TOpenAPI30SchemaConverterTest.WhenTheArrayItemsSchemaIsAReferenceMustLoadTheReferenceTypeHasExpected;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  var ArraySchema := FDefinition.components.schemas.AddPatternProperty('MyArray').Schema;
  ArraySchema.&type := OpenAPIDefinition.Schema.TTypeType.array;

  ArraySchema.items.Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetMainClass.Alias[0].TypeAlias.AsGenericDefinition.GenericType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheArrayTypeIsAnObjectMustCreateTheTypeWithTheComponentNamePlusArrayTypeName;
begin
  var ArraySchema := FDefinition.components.schemas.AddPatternProperty('MyArray').Schema;
  ArraySchema.items.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;
  ArraySchema.&type := OpenAPIDefinition.Schema.TTypeType.array;

  ImportDefinition;

  Assert.AreEqual('.MyArrayArrayType', GetMainClass.Classes[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheBodyParameterIsAReferenceTypeCantBeOptional;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.IsFalse(GetInterfaceService.Methods[0].Parameters[0].IsOptional);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheBodyParameterIsntRequiredMustLoadTheParamaterHasOptional;
begin
  var RequestBody := FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody;
  RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;
  RequestBody.required := False;

  RequestBody := FDefinition.paths.AddPathItem('/MyProc2').post.requestBody.RequestBody;
  RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;
  RequestBody.required := True;

  ImportDefinition;

  Assert.IsTrue(GetInterfaceService.Methods[0].Parameters[0].IsOptional);
  Assert.IsFalse(GetInterfaceService.Methods[1].Parameters[0].IsOptional);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheComponentIsAnArraySchemaMustLoadAnAliasWithTheNameOfTheComponent;
begin
  var ArraySchema := FDefinition.components.schemas.AddPatternProperty('MyArray').Schema;
  ArraySchema.items.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;
  ArraySchema.&type := OpenAPIDefinition.Schema.TTypeType.array;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Alias));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheComponentSchemaHasTheEnumPropertyLoadedMustAppendTheTypeInTheEnumeratorsList;
begin
  FDefinition.components.schemas.AddPatternProperty('MyEnumerator').Schema.AddEnum('Value');

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Enumerations));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheContentOfARequestBodiesIsAReferenceMustAppendTheReferenceToTheTypesListWithTheNameOfRequestBodies;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.IsTrue(FImporter.Types.ContainsKey('my/bodies:MyBody'));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheContentTypeHasATypeDefinitionMustCreateTheTypeWithTheMethodNameAndParameterNamePlusTypeInTheName;
begin
  var Schema := FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema;

  Schema.AddEnum('MyValue');

  ImportDefinition;

  Assert.AreEqual('.MyProc_BodyType', GetInterfaceService.Methods[0].Parameters[0].ParameterType.Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheContentTypeIsAReferenceMustLoadTheReferenceTypeInTheParameterType;
begin
  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetInterfaceService.Methods[0].Parameters[0].ParameterType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheDefinitionDontHaveAnyServerInformationMustLoadTheRemoteNameOfTheInterfaceWithAnEmptyRemoteName;
begin
  Assert.WillNotRaise(ImportDefinition);

  Assert.AreEqual('RemoteName('''')', GetInterfaceService.Attributes[0].Declaration);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheDefinitionHasPathsMustLoadTheMethodInTheInterfaceList;
begin
  FDefinition.paths.AddPathItem('/MyPath').post;

  FDefinition.paths.AddPathItem('/MyPath2').post;

  FDefinition.paths.AddPathItem('/MyPath3').post;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheDefinitionHasServersLoadedMustLoadTheFirstValueInTheRemoteNameOfTheServiceInterface;
begin
  FDefinition.AddServers.url := 'MyServer';
  FDefinition.AddServers.url := 'MyServer2';
  FDefinition.AddServers.url := 'MyServer3';

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Attributes));

  Assert.AreEqual(TTypeRemoteNameAttribute, GetInterfaceService.Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheDeleteSchemaIsLoadedMustAppendTheDeleteAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').Delete;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypeDeleteAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheGetSchemaIsLoadedMustAppendTheGetAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').get;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypeGetAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheOperationHasParametersMustLoadTheNameHasExpected;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').put;
  Operation.AddParameters.Parameter.name := 'MyParameter';

  ImportDefinition;

  Assert.AreEqual('MyParameter', GetInterfaceService.Methods[0].Parameters[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheOptionsSchemaIsLoadedMustAppendTheOptionsAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').Options;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypeOptionsAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsABodyParameterMustLoadTheBodyAttributeInTheParameter;
begin
  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Parameters[0].Attributes));

  Assert.AreEqual(TTypeBodyAttribute, GetInterfaceService.Methods[0].Parameters[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsAReferenceMustLoadAReferenceTypeInTheParameterType;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;
  Parameter.name := 'MyParameter';
  Parameter.schema.Reference.AddString('$ref', '#/components/schemas/MyClass');

  FDefinition.components.schemas.AddPatternProperty('MyClass').Schema.properties.AddAdditionalProperties('MyProp').Reference.AddString('$ref', '#/components/schemas/MyClass');

  ImportDefinition;

  Assert.AreEqual(TTypeReferenceDefinition, GetInterfaceService.Methods[0].Parameters[0].ParameterType.ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsHeaderTypeMustLoadTheHeaderAttributeInTheParameter;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;

  Parameter.&in := 'header';
  Parameter.name := 'MyParameter';
  Parameter.schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.number;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Parameters[0].Attributes));

  Assert.AreEqual(TTypeHeaderAttribute, GetInterfaceService.Methods[0].Parameters[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsntRequiredMustLoadTheParameterHasOptional;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').put;
  var ParameterSchema := Operation.AddParameters.Parameter;
  ParameterSchema.name := 'MyParameter';
  ParameterSchema.required := True;

  ParameterSchema := Operation.AddParameters.Parameter;
  ParameterSchema.name := 'MyParameter2';
  ParameterSchema.required := False;

  ImportDefinition;

  Assert.IsFalse(GetInterfaceService.Methods[0].Parameters[0].IsOptional);
  Assert.IsTrue(GetInterfaceService.Methods[0].Parameters[1].IsOptional);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsPathTypeMustLoadThePathNameAttributeInTheParameter;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;

  Parameter.&in := 'path';
  Parameter.name := 'MyParameter';
  Parameter.schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.number;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Parameters[0].Attributes));

  Assert.AreEqual(TTypePathNameAttribute, GetInterfaceService.Methods[0].Parameters[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterIsQueryTypeMustLoadTheQueryAttributeInTheParameter;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;

  Parameter.&in := 'query';
  Parameter.name := 'MyParameter';
  Parameter.schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.number;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Parameters[0].Attributes));

  Assert.AreEqual(TTypeQueryAttribute, GetInterfaceService.Methods[0].Parameters[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheParameterSchemaGenerateATypeMustLoadTheTypeNameWithTheMethodNameAndParameterNamePlusTypeInTheName;
begin
  var Parameter := FDefinition.paths.AddPathItem('/MyProc').put.AddParameters.Parameter;

  Parameter.name := 'MyParameter';
  Parameter.schema.Schema.AddEnum('MyValue');

  ImportDefinition;

  Assert.AreEqual('.MyProc_MyParameterType', GetInterfaceService.Methods[0].Parameters[0].ParameterType.Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePatchSchemaIsLoadedMustAppendThePatchAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').patch;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypePatchAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathChangeTheNameOfTheMethodMustLoadTheRemoteNameAttribute;
begin
  FDefinition.paths.AddPathItem('/MyProc/MyPath/MyMethod').post;

  ImportDefinition;

  Assert.AreEqual(2, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypeRemoteNameAttribute, GetInterfaceService.Methods[0].Attributes[1].ClassType)
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathHasMoreThanOneSlashMustReplaceByAnUnderline;
begin
  FDefinition.paths.AddPathItem('/MyProc/MyPath/MyMethod').post;

  ImportDefinition;

  Assert.AreEqual('MyProc_MyPath_MyMethod', GetInterfaceService.Methods[0].Name);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathItemDoesntHaveAnOperationMustRaiseAnError;
begin
  FDefinition.paths.AddPathItem('/MyProc');

  Assert.WillRaise(
    procedure
    begin
      ImportDefinition;
    end, EPathItemWithoutOperation);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathItemHasTheRequestBodyLoadedAndTheContentTypeIsApplicationJSONMustAppendAParameterInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathWithDeleteHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').delete;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathWithGetHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').get;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathWithOptionsHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').options;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathWithPatchHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').patch;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePathWithPostHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').post;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePostSchemaIsLoadedMustAppendThePostAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').post;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypePostAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
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

procedure TOpenAPI30SchemaConverterTest.WhenThePutSchemaIsLoadedMustAppendThePutAttributeInTheMethod;
begin
  FDefinition.paths.AddPathItem('/MyProc').Put;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetInterfaceService.Methods[0].Attributes));

  Assert.AreEqual(TTypePutAttribute, GetInterfaceService.Methods[0].Attributes[0].ClassType);
end;

procedure TOpenAPI30SchemaConverterTest.WhenThePutWithOptionsHasParametersMustLoadAllInTheMethod;
begin
  var Operation := FDefinition.paths.AddPathItem('/MyProc').put;
  Operation.AddParameters.Parameter.name := 'Parameter';
  Operation.AddParameters.Parameter.name := 'Parameter2';
  Operation.AddParameters.Parameter.name := 'Parameter3';

  ImportDefinition;

  Assert.AreEqual(3, Length(GetInterfaceService.Methods[0].Parameters));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheRequestBodiesHasAContentTypeOfApplicationJSONMustLoadTheAllTypesInTheMainClassTypes;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  FDefinition.components.requestBodies.AddPatternProperty('MyBody2').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  FDefinition.components.requestBodies.AddPatternProperty('MyBody3').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(3, Length(GetMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheRequestBodiesHasAContentTypeOfApplicationJSONMustLoadTheTypeInTheMainClassTypes;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_APPLICATION_JSON).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  ImportDefinition;

  Assert.AreEqual(1, Length(GetMainClass.Classes));
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheRequestBodiesIsAMultipartFormDataCantRaiseAnyError;
begin
  FDefinition.components.requestBodies.AddPatternProperty('MyBody').RequestBody.content.AddAdditionalProperties(CONTENTTYPE_MULTIPART_FORM_DATA).schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.object;

  Assert.WillNotRaise(ImportDefinition);
end;

procedure TOpenAPI30SchemaConverterTest.WhenTheRequestBodyDontHaveAValidContentTypeMustRaiseAnError;
begin
  FDefinition.paths.AddPathItem('/MyProc').post.requestBody.RequestBody.content.AddAdditionalProperties('invalid/content').schema.Schema.&type := OpenAPIDefinition.Schema.TTypeType.integer;

  Assert.WillRaise(ImportDefinition, EInvalidContentType);
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

procedure TOpenAPI30SchemaConverterTest.WhenTheServiceInterfaceNameIsEmptyMustRaiseAnErrorWhenTryLoadTheMethods;
begin
  FConfiguration.Units[0].SchemaFiles[0].ServiceInterfaceName := EmptyStr;

  Assert.WillRaise(ImportDefinition, EServiceInterfaceNameEmpty)
end;

end.

