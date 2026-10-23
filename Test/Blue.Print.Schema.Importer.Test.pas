unit Blue.Print.Schema.Importer.Test;

interface

uses System.SysUtils, System.Rtti, System.Generics.Collections, Test.Insight.Framework, Blue.Print.Schema.Importer;

type
  TSchemaConverterMock = class;

  ESchemaNotLoaded = class(Exception)
  public
    constructor Create;
  end;

  EMainClassMustBeLoaded = class(Exception)
  public
    constructor Create;
  end;

  ESchemaFileConfigurationMustBeLoaded = class(Exception)
  public
    constructor Create;
  end;

  EImporterNotLoaded = class(Exception)
  public
    constructor Create;
  end;

  [TestFixture]
  TSchemaImporterTest = class
  private
    FConverter: TSchemaConverterMock;
    FConfiguration: TConfiguration;
    FImporter: TSchemaImporter;

    function CreateNamespace(const Namespace, Prefix: String): TNamespaceConfiguration;

    procedure CompareUnitDeclaration(const UnitDeclaration: String; const UnitConfiguration: TUnitConfiguration);
    procedure LinesCompareUnitDeclaration(const LinesToCompare: String; const UnitConfiguration: TUnitConfiguration);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenTryToImportWithoutAConfigurationLoadedMustRaiseError;
    [Test]
    procedure IfTheConfigurationDoesntHaveTheUnitsConfigurationMustRaiseAnError;
    [Test]
    procedure IfAnUnitDontHaveTheNameLoadedMustRaiseError;
    [Test]
    procedure IfTheUnitConfigurationDoesntHaveAConfiguredFiledMustRaiseAnError;
    [Test]
    procedure IfTheUnitSchemaFileDontHaveTheSchemaTypeLoadedMustRaiseAnError;
    [Test]
    procedure IfTheUnitSchemaFileDontHaveTheFileNameLoadedMustRaiseAnError;
    [Test]
    procedure IfTheUnitSchemaFileDontHaveTheMainModuleNameLoadedMustRaiseAnError;
    [Test]
    procedure WhenTheConverterDoesntExistsMustRaiseAnError;
    [Test]
    procedure WhenImportMustLoadTheSchemaOfAllUnitConfigurated;
    [Test]
    procedure EverySchemaFileMustBeConverted;
    [Test]
    procedure WhenConvertingTheSchemaFileMustUseTheRightConverterForEveryFileHasExpected;
    [Test]
    procedure BeforeConvertingMustCallTheLoadSchemaFunctionFromTheConverter;
    [Test]
    procedure WhenLoadTheSchemaFileFromSistemaMustPassTheTextToTheLoadLoadSchemaFunction;
    [Test]
    procedure WhenAnUnitConfigurationHasTheSameNameFromAnotherConfigurationMustRaiseAnError;
    [Test]
    procedure WhenTryToAddAClassDefinitionAndTheNamespaceDoesntExistsMustRaiseAnError;
    [Test]
    procedure TheKeyValueFromTypeMustBeTheNamespaceWithTheClassNameHasExpected;
    [Test]
    procedure MustAppenTheClassInTheValueOsTheTypes;
    [Test]
    procedure TheTryFindTypeMustReturnFalseIfDontFindTheType;
    [Test]
    procedure IfTheTryFindTypeFoundTheTypeMustReturnTrue;
    [Test]
    procedure WhenTheTypeIsFoundMustLoadTheTypeInTheParameterAsExpected;
    [Test]
    procedure WhenFindTheAndTheTypeIsFoundedMustReturnTheTypeHasExpected;
    [Test]
    procedure IfTheTypeIsntFoundMustRaiseAnError;
    [Test]
    procedure TheUnitNameCantBeAppendedToTheTypeNameInTheTypesList;
    [Test]
    procedure MustCreateTheMainClassWithTheNameInTheSchemaFileConfiguration;
    [Test]
    procedure WhenTheNameOfMainClassIsTheSameInAnotherSchemaFileMustUseTheSameClassDeclaration;
    [Test]
    procedure WhenTheMainClassHasTheSameNameInTwoDifferentConfigurationsTheyCannotShareTheSameClassInstance;
    [Test]
    procedure WhenLoadTheConverterLoadTheSchemaAndDontLoadTheNamespaceInformationMustRaiseAnError;
    [Test]
    procedure WhenTheNamespaceDoesntHaveThePrefixNameConfigurationMustRaiseAnError;
    [Test]
    procedure IfTheOutputFolderDoesntExistsMustCreateTheFolder;
    [Test]
    procedure WhenGenerateTheUnitFileMustBeSavedInTheOutputFolderConfiguration;
    [Test]
    procedure MustSaveAllUnitsInTheOutputFolderHasExpected;
    [Test]
    procedure WhenGenerateTheUnitMustLoadTheFileHasExpected;
    [Test]
    procedure WhenTheUnitHasMoreThanOneClassMustLoadAllClassesInTheUnit;
    [Test]
    procedure WhenTheMainClassHasAnotherClassAppendedMustLoadThisClassInPublicTypeSectionFromTheMainClass;
    [Test]
    procedure WhenAClassHasMoreThanOneClassMustLoadAllClassesInThePublicTypeDefinition;
    [Test]
    procedure ThePublicTypeDeclarationMustBeRecursive;
    [Test]
    procedure WhenTheClassHasEnumerationDeclaredMustLoadInThePublicTypeOfTheClassDeclaration;
    [Test]
    procedure MustDeclareAllEnumerationsInTheClassDefinition;
    [Test]
    procedure WhenTheTypeHasAReservedNameTheTypeMustUseTheAmpersandBeforeTheName;
    [Test]
    procedure IfTheEnumeratorValueHasAReservedNameMustAppendTheAmpersandBeforeTheName;
    [Test]
    procedure WhenTheEnumeratorValueHaveOnlyNumberMustInsertALetterBeforeTheNumberAndAppendTheEnumValueAttribute;
    [Test]
    procedure WhenTheClassNameHasAnySpecialCharacterMustFormatTheNameToRemoveThisCharatersAndFixTheNameToCompileTheUnitCorrectly;
    [Test]
    procedure WhenTheClassDefinitionHaveAPropertyMustDeclareThePropertyInTheUnit;
    [Test]
    procedure MustDeclareAllPropertiesOfTheClassHasExpected;
    [Test]
    procedure WhenThePropertyHasAnSpecialCharacterMustAppendTheAmpersandBeforeTheClassName;
    [Test]
    procedure WhenTheClassTypeIsAClassDefinitionMustDeclareTheGetFunctionAndCreateTheClassIfTheValueIsntLoaded;
    [Test]
    procedure WhenThePropertyNeedTheGetFunctionMustDeclareAllFunctionsHasExpected;
    [Test]
    procedure WhenThePropertyTypeIsAnArrayMustDeclareTheTypeWithTheTArraySystemType;
    [Test]
    procedure WhenTheArrayTypeIsAnObjectMustCreateTheAddFunctionForTheType;
    [Test]
    procedure WhenThePropertyIsOptionalMustCreateTheFieldForStoreTheIsStoredInfoAndCreateTheSetFunctionForTheProperty;
    [Test]
    procedure MustAppendTheUnitNameBeforeTheTypeNameToAvoidDuplicateNames;
    [Test]
    procedure MustLoadTheImporterPropertyToAvoidError;
    [Test]
    procedure WhenThePropertyHasntATypeLoadedMustRaiseAnError;
    [Test]
    procedure TheBuildInTypeMustBeLoadedWhenImportTheSchemaSpecification;
    [Test]
    procedure TheSystemTypesMustBeLoadedInTheTypeUnitDefinitionOfTheSystem;
    [Test]
    procedure TheTValueBuildInTypeMustBeLoadedInTheSystemRttiUnit;
    [Test]
    procedure TheDynamicPropertyMustBeLoadedInTheBluePrintTypesUnit;
    [Test]
    procedure TheBuildInTypesNamesMustBeHasExpected;
    [Test]
    procedure WhenAPropertyUseATypeOutSideOfTheUnitBeenDeclaretedMustLoadTheUsesSectionWithTheNameOfTheUnitOfTheTypeUsed;
    [Test]
    procedure WhenTheTypeOfAPropertyIsFromSystemCantAddTheSystemInTheUsesList;
    [Test]
    procedure TheSelfUnitCantBeLoadedInTheUsesList;
    [Test]
    procedure CantDuplicateTheUsesList;
    [Test]
    procedure WhenThePropertyHasASubTypeCantLoadTheClassNameInTheUsesList;
    [Test]
    procedure IfTheTypeDoesntHaveTheParentModuleLoadedMustRaiseAnError;
    [Test]
    procedure WhenCreateAnArrayTypeMustReturnTheClassCreated;
    [Test]
    procedure MustLoadTheArrayTypeItemWithTheParameter;
    [Test]
    procedure MustLoadTheParentModuleWithTheValueInTheParameter;
    [Test]
    procedure MustLoadTheArrayInTheTypeOfTheParentModule;
    [Test]
    procedure WhenCreateTheTypeReferenceMustReturnTheClassCreated;
    [Test]
    procedure MustLoadTheReferenceInfoWhenCreateTheReferenceClass;
    [Test]
    procedure MustLoadTheNamespaceInTheReferenceClassWithTheParameterValue;
    [Test]
    procedure MustLoadTheParentModuleWithTheMainClassVariable;
    [Test]
    procedure MustAppendTheClassInTheTypesArrayFromTheMainClass;
    [Test]
    procedure WhenCreateTheClassTypeMustReturnTheClassTypeCreated;
    [Test]
    procedure MustLoadTheClassNameWithTheValueInTheParameter;
    [Test]
    procedure MustLoadTheParentModulePropertyFromTheClassType;
    [Test]
    procedure MustAddTheClassTypeInTheTypesFromTheParentModule;
    [Test]
    procedure MustAddTheClassTypeInTheClassesListFromParentModule;
    [Test]
    procedure WhenCreateAnEnumeratorMustReturnTheCreatedClass;
    [Test]
    procedure MustLoadTheEnumeratorNameWithTheParameter;
    [Test]
    procedure MustLoadTheParentModuleOfTheEnumeratorWithTheParameter;
    [Test]
    procedure TheEnumeratorMustBeAppendedInTheTypesOfTheParentModule;
    [Test]
    procedure TheEnumeratorMustBeAppendedInTheEnumeratorListOfTheParentModule;
    [Test]
    procedure WhenThePropertyHasAReferenceTypeMustFindTheReferenceAndLoadThePropertyValue;
    [Test]
    procedure ThePublicTypeSectionMustBeDeclaredBeforeThePrivateSection;
    [Test]
    procedure WhenImportTheSchemaWithAFileConfigurationMustLoadTheConfigurationAndImportTheSchemaHasExpected;
    [Test]
    procedure WhenCreateTheTypeAliasMustReturnTheClassLoaded;
    [Test]
    procedure WhenCreateTheTypeAliasMustLoadTheNameInTheType;
    [Test]
    procedure WhenCreateTheTypeAliasMustLoadParentModule;
    [Test]
    procedure WhenCreateTheTypeAliasMustLoadTypeAlias;
    [Test]
    procedure WhenCreateTheTypeAliasMustAppendTheTypeInTheTypesListFromParentModule;
    [Test]
    procedure WhenCreateTheTypeAliasMustAppendTheAliasInTheAliasListFromParentModule;
    [Test]
    procedure WhenTheClassHasAnAliasDeclaredMustBuildTheUnitWithTheDefinitionHasExpected;
    [Test]
    procedure TheAliasTypeMustBeDeclaredWithTheFullTypeName;
    [Test]
    procedure WhenTheSchemaHasEnumerationsMustLoadTheScopedEnumsCompilerDirective;
    [Test]
    procedure MustLoadTheForwardClassDeclarationInTheUnitDeclaration;
    [Test]
    procedure TheAliasDeclarationMustBeLoadedAfterTheForwardClassDeclaration;
    [Test]
    procedure WhenAnArrayIsDeclaredTheArrayTypeMustBeFromSystemAndTheArrayTypeItemMustHaveTheFullPathToTheTypeName;
    [Test]
    procedure WhenThePropertyNameHasASpecialNameMustAppendTheFieldNameAttribute;
    [Test]
    procedure WhenThePropertyHasInvalidCharacteresInTheNameMustFixTheNameAndApplyTheFieldNameAttribute;
    [Test]
    procedure WhenTheStringTypeIsDeclaredCantUseTheEscapeCharacterInTheName;
    [Test]
    procedure WhenTheTypeIsAnAliasToAnArrayTypeMustCreateTheAddFunctionWithTheInternalAliasType;
    [Test]
    procedure WhenTheArrayTypeIsAReferenceMustLoadTheReferenceAndLoadTheArrayHasExpected;
    [Test]
    procedure WhenDeclareThePropertyFieldMustFormatTheNameToFixTheLowerCaseFirstCharactere;
    [Test]
    procedure WhenDeclareThePropertyGetFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
    [Test]
    procedure WhenDeclareThePropertySetFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
    [Test]
    procedure WhenDeclareThePropertyAddFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
    [Test]
    procedure WhenThePropertyTypeIsAReferenceToAnArrayWithAClassDefinitionTypeMustLoadTheAddFunctionHasExpected;
    [Test]
    procedure WhenThePropertyHasAnArrayTypeOfAConcretTypeMustCreateTheAddProcedureWithAParameterOsTheArrayType;
    [Test]
    procedure NeedToGroupTheAddFunctionsAndTheIsStoredFunctions;
    [Test]
    procedure WhenAClassTypeDefinitionIsFlatMustAppendTheFlatAttributeInTheClassDeclaration;
    [Test]
    procedure WhenCreateADynamicPropertyClassMustReturnTheClassAsExpected;
    [Test]
    procedure WhenCreateTheDynamicPropertyTypeMustLoadTheParentModuleInTheType;
    [Test]
    procedure WhenCreateTheDynamicPropertyTypeMustLoadTheTypeInTheTypesListFromParentModule;
    [Test]
    procedure WhenCreateTheDynamicPropertyTypeMustLoadTheDynamicPropertyOfTheParameter;
    [Test]
    procedure WhenDeclareADynamicTypeMustLoadThePropertyAsExpected;
    [Test]
    procedure WhenTheTypeOfDynamicPropertyIsAClassDefinitionMustCreateTheAddFunctionToAddThePropertyNameAndReturntTheClassDefinitionInTheReturnOfTheFunction;
    [Test]
    procedure WhenTheTypeOfDynamicPropertyIsAnIntegralTypeMustCreateAProcedureToLoadTheDynamicPropertyValue;
    [Test]
    procedure WhenCreateAReferenceTypeInsideASubClassDeclarationMustLoadTheFullTypeNameUsingTheParentModuleFromTheReferenceNotTheTypeReferece;
    [Test]
    procedure WhenAClassHasSubClassesMustLoadTheImplementationsOfGetFunctionFromTheSubClassesToo;
    [Test]
    procedure WhenAClassHasSubClassesMustLoadTheImplementationsOfSetFunctionFromTheSubClassesToo;
  end;

  [TestFixture]
  TSchemaConverterMockTeste = class
  private
    FConverter: ISchemaConverter;
    FConverterClass: TSchemaConverterMock;
    FMainClass: TTypeClassDefinition;
    FSchema: TSchema;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure BeforeCallConvertProcedureMustRaiseAnErrorIfNotLoadedTheSchemaBefore;
    [Test]
    procedure WhenCallTheLoadSchemaMustLoadThePayloadInThePropertyHasExpected;
    [Test]
    procedure WhenCallTheConvertFunctionWithoutAMainsClassLoadedMustRaiseAnError;
    [Test]
    procedure WhenTheSchemaDoesntHaveTheSchemaFileLoadedMustRaiseAnError;
    [Test]
    procedure WhenCallTheLoadSchemaProcedureMustLoadTheNamespacePropertyOfTheSchema;
    [Test]
    procedure WhenLoadTheSchemaMustLoadTheNamespacePropertyInTheSchemaNamespace;
    [Test]
    procedure WhenTheImporterIsntLoadedMustRaiseAnError;
  end;

  [TestFixture]
  TSchemaTest = class
  private
    FSchema: TSchema;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure IfTheSchemaValueIsAnObjectMustDestroyTheValueWhenTheSchemaIsDestroyed;
    [Test]
    procedure IfTheSchemaValueIsntAnObjectCantBeDestroyedWhenTheSchemaIsDestroyed;
  end;

  TSchemaConverterMock = class(TInterfacedObject, ISchemaConverter)
  private
    FTimesCalled: Integer;
    FSchemaText: String;
    FNamespace: String;
    FWhenExecuteConvert: TProc<TTypeClassDefinition, TSchema>;
    FWhenExecuteLoadSchema: TProc<TSchema>;

    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  public
    constructor Create;

    property WhenExecuteConvert: TProc<TTypeClassDefinition, TSchema> read FWhenExecuteConvert write FWhenExecuteConvert;
    property WhenExecuteLoadSchema: TProc<TSchema> read FWhenExecuteLoadSchema write FWhenExecuteLoadSchema;

    property Namespace: String read FNamespace write FNamespace;
    property SchemaText: String read FSchemaText write FSchemaText;
    property TimesCalled: Integer read FTimesCalled write FTimesCalled;
  end;

  TObjectSchema = class
  public
    constructor Create;

    destructor Destroy; override;
  public class var
    DestroyCalled: Boolean;
  end;

implementation

uses System.IOUtils, System.Classes, Blue.Print.Serializer, Blue.Print.Types;

const
  EMPTY_SCHEMA_FILE = 'Empty Schema.json';

{ TSchemaImporterTest }

procedure TSchemaImporterTest.BeforeConvertingMustCallTheLoadSchemaFunctionFromTheConverter;
begin
  Assert.WillNotRaise(
    procedure
    begin
      var Converter := TSchemaConverterMock.Create;
      TSchemaImporter.Converters[TSchemaType.OpenAPI20] := Converter;

      FImporter.Import(FConfiguration);
    end);
end;

procedure TSchemaImporterTest.CantDuplicateTheUsesList;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.ValueType]);

      MainClass.AddProperty('MyProperty2', FImporter.BuildInTypes[TBuildInType.ValueType]);

      MainClass.AddProperty('MyProperty3', FImporter.BuildInTypes[TBuildInType.ValueType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    uses System.Rtti;

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Rtti.TValue;
        FMyProperty2: System.Rtti.TValue;
        FMyProperty3: System.Rtti.TValue;
      published
        property MyProperty: System.Rtti.TValue read FMyProperty write FMyProperty;
        property MyProperty2: System.Rtti.TValue read FMyProperty2 write FMyProperty2;
        property MyProperty3: System.Rtti.TValue read FMyProperty3 write FMyProperty3;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.CompareUnitDeclaration(const UnitDeclaration: String; const UnitConfiguration: TUnitConfiguration);

  function FormatFileName(const UnitConfiguration: TUnitConfiguration): String;
  begin
    Result := Format('%s\%s.pas', [FConfiguration.OutputFolder, UnitConfiguration.Name]);
  end;

begin
  Assert.AreEqual(UnitDeclaration, TFile.ReadAllText(FormatFileName(UnitConfiguration)));
end;

function TSchemaImporterTest.CreateNamespace(const Namespace, Prefix: String): TNamespaceConfiguration;
begin
  Result := TNamespaceConfiguration.Create;
  Result.Namespace := Namespace;
  Result.Prefix := Prefix;
end;

procedure TSchemaImporterTest.EverySchemaFileMustBeConverted;
begin
  var Converter := TSchemaConverterMock.Create;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[1].SchemaType := TSchemaType.OpenAPI30;

  FImporter.Import(FConfiguration);

  Assert.AreEqual(3, Converter.TimesCalled);
end;

procedure TSchemaImporterTest.IfAnUnitDontHaveTheNameLoadedMustRaiseError;
begin
  FConfiguration.Units[1].Name := EmptyStr;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, EUnitConfigurationWithoutName);
end;

procedure TSchemaImporterTest.IfTheConfigurationDoesntHaveTheUnitsConfigurationMustRaiseAnError;
begin
  for var UnitConfiguration in FConfiguration.Units do
    UnitConfiguration.Free;

  FConfiguration.Units := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ENeedUnitsConfiguration);
end;

procedure TSchemaImporterTest.IfTheEnumeratorValueHasAReservedNameMustAppendTheAmpersandBeforeTheName;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnum');

      Enumerator.AddEnumeration('if');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        [EnumValue('if')]
        MyEnum = (&if);
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.IfTheOutputFolderDoesntExistsMustCreateTheFolder;
begin
  FConfiguration.OutputFolder := FConfiguration.OutputFolder + 'MyFolder\MyFolder';

  Assert.WillNotRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end);
end;

procedure TSchemaImporterTest.IfTheTryFindTypeFoundTheTypeMustReturnTrue;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  var TypeDefinition: TTypeDefinition;

  var CurrentClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', CurrentClassDefinition);

  Assert.IsTrue(FImporter.TryFindType('My Namespace', 'AClassName', TypeDefinition));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.IfTheTypeDoesntHaveTheParentModuleLoadedMustRaiseAnError;
begin
  var SimpleType := TTypeDefinition.Create;

  Assert.WillRaise(
    procedure
    begin
      if SimpleType.ParentModule <> nil then;
    end, ETypeWithoutParentModule);

  SimpleType.Free;
end;

procedure TSchemaImporterTest.IfTheTypeIsntFoundMustRaiseAnError;
begin
  FImporter.AddNamespace('My Namespace', 'my');

  Assert.WillRaise(
    procedure
    begin
      FImporter.FindType('My Namespace', 'AClassName');
    end, ETypeNotFound);
end;

procedure TSchemaImporterTest.IfTheUnitConfigurationDoesntHaveAConfiguredFiledMustRaiseAnError;
begin
  for var SchemaFile in FConfiguration.Units[1].SchemaFiles do
    SchemaFile.Free;

  FConfiguration.Units[1].SchemaFiles := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, EUnitConfigurationWithoutSchemaFiles);
end;

procedure TSchemaImporterTest.IfTheUnitSchemaFileDontHaveTheFileNameLoadedMustRaiseAnError;
begin
  FConfiguration.Units[1].SchemaFiles[1].FileName := EmptyStr;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaFileConfigurationWithoutFileName);
end;

procedure TSchemaImporterTest.IfTheUnitSchemaFileDontHaveTheMainModuleNameLoadedMustRaiseAnError;
begin
  FConfiguration.Units[1].SchemaFiles[1].MainModuleName := EmptyStr;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaFileConfigurationWithoutMainModuleName);
end;

procedure TSchemaImporterTest.IfTheUnitSchemaFileDontHaveTheSchemaTypeLoadedMustRaiseAnError;
begin
  FConfiguration.Units[1].SchemaFiles[1].SchemaType := TSchemaType.Undefined;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaFileConfigurationWithoutSchemaType);
end;

procedure TSchemaImporterTest.LinesCompareUnitDeclaration(const LinesToCompare: String; const UnitConfiguration: TUnitConfiguration);

  function FormatFileName(const UnitConfiguration: TUnitConfiguration): String;
  begin
    Result := Format('%s\%s.pas', [FConfiguration.OutputFolder, UnitConfiguration.Name]);
  end;

begin
  var CurrentLine: NativeInt := 0;
  var Lines := TStringList.Create;
  var UnitFile := TStringList.Create;

  Lines.Text := LinesToCompare;

  UnitFile.LoadFromFile(FormatFileName(UnitConfiguration));

  for var A := 0 to Pred(UnitFile.Count) do
    if CurrentLine = Lines.Count then
      Break
    else if UnitFile[A] = Lines[CurrentLine] then
      Inc(CurrentLine)
    else
      CurrentLine := 0;

  Assert.IsTrue(CurrentLine = Lines.Count, LinesToCompare);

  Lines.Free;

  UnitFile.Free;
end;

procedure TSchemaImporterTest.MustAddTheClassTypeInTheClassesListFromParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateClassType(ParentModule, 'MyClass');

  Assert.AreEqual(1, Length(ParentModule.Classes));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustAddTheClassTypeInTheTypesFromTheParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateClassType(ParentModule, 'MyClass');

  Assert.AreEqual(1, Length(ParentModule.Types));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustAppendTheClassInTheTypesArrayFromTheMainClass;
begin
  var MainClass := TTypeClassDefinition.Create;

  FImporter.CreateReferenceType(MainClass, 'My Namespace', 'myReference');

  Assert.AreEqual(1, Length(MainClass.Types));

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustAppendTheUnitNameBeforeTheTypeNameToAvoidDuplicateNames;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Integer;
      published
        property MyProperty: System.Integer read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.MustAppenTheClassInTheValueOsTheTypes;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var ClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', ClassDefinition);

  Assert.AreEqual(ClassDefinition, FImporter.Types['my:AClassName']);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustCreateTheMainClassWithTheNameInTheSchemaFileConfiguration;
begin
  var Converter := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  Converter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      Assert.AreEqual('MyMainClassName', MainClass.Name);
    end;

  FImporter.Import(FConfiguration);
end;

procedure TSchemaImporterTest.MustDeclareAllEnumerationsInTheClassDefinition;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnumerator');

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');

      Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnumerator2');

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        MyEnumerator = (a, b, c);

        MyEnumerator2 = (a, b, c);
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.MustDeclareAllPropertiesOfTheClassHasExpected;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.IntegerType]);
      MainClass.AddProperty('MyProperty2', FImporter.BuildInTypes[TBuildInType.IntegerType]);
      MainClass.AddProperty('MyProperty3', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Integer;
        FMyProperty2: System.Integer;
        FMyProperty3: System.Integer;
      published
        property MyProperty: System.Integer read FMyProperty write FMyProperty;
        property MyProperty2: System.Integer read FMyProperty2 write FMyProperty2;
        property MyProperty3: System.Integer read FMyProperty3 write FMyProperty3;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.MustLoadTheArrayInTheTypeOfTheParentModule;
begin
  var MainClass := TTypeClassDefinition.Create;
  var ArrayType := TTypeDefinition.Create;

  FImporter.CreateArrayType(MainClass, ArrayType);

  Assert.AreEqual(1, Length(MainClass.Types));

  ArrayType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustLoadTheArrayTypeItemWithTheParameter;
begin
  var MainClass := TTypeClassDefinition.Create;
  var ArrayType := TTypeDefinition.Create;

  Assert.AreEqual(ArrayType, FImporter.CreateArrayType(MainClass, ArrayType).ArrayType);

  ArrayType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustLoadTheClassNameWithTheValueInTheParameter;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var ClassDefinition := FImporter.CreateClassType(ParentModule, 'MyClass');

  Assert.AreEqual('MyClass', ClassDefinition.Name);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustLoadTheEnumeratorNameWithTheParameter;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Enumerator := FImporter.CreateEnumeratorType(ParentModule, 'MyEnumerator');

  Assert.AreEqual('MyEnumerator', Enumerator.Name);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustLoadTheForwardClassDeclarationInTheUnitDeclaration;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      procedure AddClass(const Name: String);
      begin
        FImporter.CreateClassType(MainClass, Name);
      end;

    begin
      AddClass('TMyClass');

      AddClass('TMyClass2');

      AddClass('TMyClass3');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;
        TMyClass2 = class;
        TMyClass3 = class;

        TMyClass = class
        end;

        TMyClass2 = class
        end;

        TMyClass3 = class
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.MustLoadTheImporterPropertyToAvoidError;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end);
end;

procedure TSchemaImporterTest.MustLoadTheNamespaceInTheReferenceClassWithTheParameterValue;
begin
  var MainClass := TTypeClassDefinition.Create;
  var TypeReference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'myReference');

  Assert.AreEqual('My Namespace', TypeReference.Namespace);

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustLoadTheParentModuleOfTheEnumeratorWithTheParameter;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Enumerator := FImporter.CreateEnumeratorType(ParentModule, 'MyEnumerator');

  Assert.AreEqual(ParentModule, Enumerator.ParentModule);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustLoadTheParentModulePropertyFromTheClassType;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var ClassDefinition := FImporter.CreateClassType(ParentModule, 'MyClass');

  Assert.AreEqual(ParentModule, ClassDefinition.ParentModule);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.MustLoadTheParentModuleWithTheMainClassVariable;
begin
  var MainClass := TTypeClassDefinition.Create;
  var TypeReference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'myReference');

  Assert.AreEqual(MainClass, TypeReference.ParentModule);

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustLoadTheParentModuleWithTheValueInTheParameter;
begin
  var MainClass := TTypeClassDefinition.Create;
  var ArrayType := TTypeDefinition.Create;

  Assert.AreEqual(MainClass, FImporter.CreateArrayType(MainClass, ArrayType).ParentModule);

  ArrayType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustLoadTheReferenceInfoWhenCreateTheReferenceClass;
begin
  var MainClass := TTypeClassDefinition.Create;
  var TypeReference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'myReference');

  Assert.AreEqual('myReference', TypeReference.Reference);

  MainClass.Free;
end;

procedure TSchemaImporterTest.MustSaveAllUnitsInTheOutputFolderHasExpected;
begin
  FImporter.Import(FConfiguration);

  Assert.IsTrue(TFile.Exists(Format('%s\%s.pas', [FConfiguration.OutputFolder, FConfiguration.Units[0].Name])));
  Assert.IsTrue(TFile.Exists(Format('%s\%s.pas', [FConfiguration.OutputFolder, FConfiguration.Units[1].Name])));
end;

procedure TSchemaImporterTest.NeedToGroupTheAddFunctionsAndTheIsStoredFunctions;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProp', FImporter.CreateArrayType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType])).Optional := True;
      MainClass.AddProperty('MyProp2', FImporter.CreateArrayType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType])).Optional := True;
      MainClass.AddProperty('MyProp3', FImporter.CreateArrayType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType])).Optional := True;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProp: System.TArray<System.Integer>;
        FMyPropStored: Boolean;
        FMyProp2: System.TArray<System.Integer>;
        FMyProp2Stored: Boolean;
        FMyProp3: System.TArray<System.Integer>;
        FMyProp3Stored: Boolean;
        procedure SetMyProp(const Value: System.TArray<System.Integer>);
        procedure SetMyProp2(const Value: System.TArray<System.Integer>);
        procedure SetMyProp3(const Value: System.TArray<System.Integer>);
      public
        procedure AddMyProp(const Value: System.Integer);
        procedure AddMyProp2(const Value: System.Integer);
        procedure AddMyProp3(const Value: System.Integer);

        property IsMyPropStored: Boolean read FMyPropStored;
        property IsMyProp2Stored: Boolean read FMyProp2Stored;
        property IsMyProp3Stored: Boolean read FMyProp3Stored;
      published
        property MyProp: System.TArray<System.Integer> read FMyProp write SetMyProp stored FMyPropStored;
        property MyProp2: System.TArray<System.Integer> read FMyProp2 write SetMyProp2 stored FMyProp2Stored;
        property MyProp3: System.TArray<System.Integer> read FMyProp3 write SetMyProp3 stored FMyProp3Stored;
      end;

    implementation

    { MainModule }

    procedure MainModule.AddMyProp(const Value: System.Integer);
    begin
      FMyProp := FMyProp + [Value];
    end;

    procedure MainModule.SetMyProp(const Value: System.TArray<System.Integer>);
    begin
      FMyProp := Value;
      FMyPropStored := True;
    end;

    procedure MainModule.AddMyProp2(const Value: System.Integer);
    begin
      FMyProp2 := FMyProp2 + [Value];
    end;

    procedure MainModule.SetMyProp2(const Value: System.TArray<System.Integer>);
    begin
      FMyProp2 := Value;
      FMyProp2Stored := True;
    end;

    procedure MainModule.AddMyProp3(const Value: System.Integer);
    begin
      FMyProp3 := FMyProp3 + [Value];
    end;

    procedure MainModule.SetMyProp3(const Value: System.TArray<System.Integer>);
    begin
      FMyProp3 := Value;
      FMyProp3Stored := True;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.Setup;

  function CreateUnit(const Name: String; const SchemaFiles: TArray<TSchemaFileConfiguration>): TUnitConfiguration;
  begin
    Result := TUnitConfiguration.Create;
    Result.Name := Name;
    Result.SchemaFiles := SchemaFiles;
  end;

  function CreateSchemaFile(const MainModuleName: String): TSchemaFileConfiguration;
  begin
    Result := TSchemaFileConfiguration.Create;
    Result.FileName := TPath.GetTempFileName;
    Result.MainModuleName := MainModuleName;
    Result.SchemaType := TSchemaType.OpenAPI20;
  end;

begin
  inherited;

  FConfiguration := TConfiguration.Create;
  FConfiguration.Namespaces := [CreateNamespace('My Namespace', 'my')];
  FConfiguration.OutputFolder := TPath.GetTempPath + ChangeFileExt(ExtractFileName(TPath.GetTempFileName), EmptyStr);
  FConfiguration.Units := [CreateUnit('MyUnit', [CreateSchemaFile('MainModule')]), CreateUnit('MyUnit2', [CreateSchemaFile('MainModule2'), CreateSchemaFile('MainModule3')])];
  FConverter := TSchemaConverterMock.Create;
  FImporter := TSchemaImporter.Create;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := FConverter;
end;

procedure TSchemaImporterTest.TearDown;
begin
  FConfiguration.Free;

  FImporter.Free;

  inherited;
end;

procedure TSchemaImporterTest.TheAliasDeclarationMustBeLoadedAfterTheForwardClassDeclaration;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(MainClass, Name);
      end;

    begin
      AddClass('TMyClass');

      FImporter.CreateAliasType(MainClass, 'MyAlias', AddClass('TMyClass2'));

      AddClass('TMyClass3');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;
        TMyClass2 = class;
        TMyClass3 = class;

        MyAlias = MyUnit.MainModule.TMyClass2;

        TMyClass = class
        end;

        TMyClass2 = class
        end;

        TMyClass3 = class
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.TheAliasTypeMustBeDeclaredWithTheFullTypeName;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateAliasType(MainClass, 'Alias', FImporter.BuildInTypes[TBuildInType.IntegerType]);
      FImporter.CreateAliasType(MainClass, 'Alias2', FImporter.BuildInTypes[TBuildInType.ValueType]);
      FImporter.CreateAliasType(MainClass, 'Alias3', MainClass);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        Alias = System.Integer;
        Alias2 = System.Rtti.TValue;
        Alias3 = MyUnit.MainModule;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.TheBuildInTypeMustBeLoadedWhenImportTheSchemaSpecification;
begin
  FImporter.Import(FConfiguration);

  for var BuildInType := Low(TBuildInType) to High(TBuildInType) do
    Assert.IsNotNil(FImporter.BuildInTypes[BuildInType], 'Type not registered ' + TRttiEnumerationType.GetName(BuildInType));
end;

procedure TSchemaImporterTest.TheBuildInTypesNamesMustBeHasExpected;
const
  BUILD_IN_TYPE_NAMES: array[TBuildInType] of String = ('String', 'Integer', 'Double', 'TDate', 'TTime', 'TDateTime', 'Boolean', 'TArray<%s>', 'TValue', 'TDynamicProperty<%s>');

begin
  FImporter.Import(FConfiguration);

  for var BuildInType := Low(TBuildInType) to High(TBuildInType) do
    Assert.AreEqual(BUILD_IN_TYPE_NAMES[BuildInType], FImporter.BuildInTypes[BuildInType].Name);
end;

procedure TSchemaImporterTest.TheDynamicPropertyMustBeLoadedInTheBluePrintTypesUnit;
begin
  FImporter.Import(FConfiguration);

  Assert.AreEqual('Blue.Print.Types', FImporter.BuildInTypes[TBuildInType.DynamicPropertyType].ParentModule.Name);
end;

procedure TSchemaImporterTest.TheEnumeratorMustBeAppendedInTheEnumeratorListOfTheParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateEnumeratorType(ParentModule, 'MyEnumerator');

  Assert.AreEqual(1, Length(ParentModule.Enumerations));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.TheEnumeratorMustBeAppendedInTheTypesOfTheParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateEnumeratorType(ParentModule, 'MyEnumerator');

  Assert.AreEqual(1, Length(ParentModule.Types));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.TheKeyValueFromTypeMustBeTheNamespaceWithTheClassNameHasExpected;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var CurrentClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', CurrentClassDefinition);

  Assert.AreEqual('my:AClassName', FImporter.Types.Keys.ToArray[0]);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.ThePublicTypeDeclarationMustBeRecursive;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(Parent, Name);
      end;

    begin
      AddClass('TMyClass3', AddClass('TMyClass2', AddClass('TMyClass', MainClass)));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        public type
          TMyClass2 = class;

          TMyClass2 = class
          public type
            TMyClass3 = class;

            TMyClass3 = class
            end;
          end;
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.ThePublicTypeSectionMustBeDeclaredBeforeThePrivateSection;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      if MainClass.Name = 'MainModule' then
      begin
        var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnumerator');

        Enumerator.AddEnumeration('Value');

        FImporter.AddType('My Namespace', Enumerator);

        var Reference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'MyEnumerator');

        MainClass.AddProperty('MyProperty', Reference);
      end;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        MyEnumerator = (Value);
      private
        FMyProperty: MyUnit.MainModule.MyEnumerator;
      published
        property MyProperty: MyUnit.MainModule.MyEnumerator read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.TheSelfUnitCantBeLoadedInTheUsesList;
begin
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      if MainClass.ParentModule.Name = 'MyUnit' then
        SimpleType.ParentModule := MainClass.ParentModule;

      MainClass.AddProperty('MyProperty', SimpleType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: MyUnit.SimpleType;
      published
        property MyProperty: MyUnit.SimpleType read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);

  SimpleType.Free;
end;

procedure TSchemaImporterTest.TheSystemTypesMustBeLoadedInTheTypeUnitDefinitionOfTheSystem;
begin
  FImporter.Import(FConfiguration);

  for var BuildInType in [TBuildInType.StringType, TBuildInType.IntegerType, TBuildInType.DoubleType, TBuildInType.DateType, TBuildInType.TimeType, TBuildInType.DateTimeType] do
    Assert.AreEqual('System', FImporter.BuildInTypes[BuildInType].ParentModule.Name);
end;

procedure TSchemaImporterTest.TheTryFindTypeMustReturnFalseIfDontFindTheType;
begin
  var TypeDefinition: TTypeDefinition;

  FImporter.AddNamespace('My Namespace', 'my');

  Assert.IsFalse(FImporter.TryFindType('My Namespace', 'AClassName', TypeDefinition));
end;

procedure TSchemaImporterTest.TheTValueBuildInTypeMustBeLoadedInTheSystemRttiUnit;
begin
  FImporter.Import(FConfiguration);

  Assert.AreEqual('System.Rtti', FImporter.BuildInTypes[TBuildInType.ValueType].ParentModule.Name);
end;

procedure TSchemaImporterTest.TheUnitNameCantBeAppendedToTheTypeNameInTheTypesList;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'MyUnit';

  var ClassDefinition := FImporter.CreateClassType(ParentModule, 'MainClass');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', ClassDefinition);

  Assert.AreEqual(1, FImporter.Types.Count);

  Assert.AreEqual('my:MainClass', FImporter.Types.Keys.ToArray[0]);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenAClassHasMoreThanOneClassMustLoadAllClassesInThePublicTypeDefinition;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      procedure AddClass(const Name: String);
      begin
        FImporter.CreateClassType(MainClass, Name);
      end;

    begin
      AddClass('TMyClass');

      AddClass('TMyClass2');

      AddClass('TMyClass3');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;
        TMyClass2 = class;
        TMyClass3 = class;

        TMyClass = class
        end;

        TMyClass2 = class
        end;

        TMyClass3 = class
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenAClassHasSubClassesMustLoadTheImplementationsOfGetFunctionFromTheSubClassesToo;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(Parent, Name);
      end;

    begin
      var ClassDefinition := AddClass('TMyClass3', AddClass('TMyClass2', AddClass('TMyClass', MainClass)));

      ClassDefinition.AddProperty('MyProp', MainClass);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        public type
          TMyClass2 = class;

          TMyClass2 = class
          public type
            TMyClass3 = class;

            TMyClass3 = class
            private
              FMyProp: MyUnit.MainModule;
              function GetMyProp: MyUnit.MainModule;
            published
              property MyProp: MyUnit.MainModule read GetMyProp write FMyProp;
            end;
          end;
        end;
      end;

    implementation

    { MainModule.TMyClass.TMyClass2.TMyClass3 }

    function MainModule.TMyClass.TMyClass2.TMyClass3.GetMyProp: MyUnit.MainModule;
    begin
      if not Assigned(FMyProp) then
        FMyProp := MyUnit.MainModule.Create;

      Result := FMyProp;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenAClassHasSubClassesMustLoadTheImplementationsOfSetFunctionFromTheSubClassesToo;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(Parent, Name);
      end;

    begin
      var ClassDefinition := AddClass('TMyClass3', AddClass('TMyClass2', AddClass('TMyClass', MainClass)));

      ClassDefinition.AddProperty('MyProp', FImporter.BuildInTypes[TBuildInType.IntegerType]).Optional := True;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        public type
          TMyClass2 = class;

          TMyClass2 = class
          public type
            TMyClass3 = class;

            TMyClass3 = class
            private
              FMyProp: System.Integer;
              FMyPropStored: Boolean;
              procedure SetMyProp(const Value: System.Integer);
            public
              property IsMyPropStored: Boolean read FMyPropStored;
            published
              property MyProp: System.Integer read FMyProp write SetMyProp stored FMyPropStored;
            end;
          end;
        end;
      end;

    implementation

    { MainModule.TMyClass.TMyClass2.TMyClass3 }

    procedure MainModule.TMyClass.TMyClass2.TMyClass3.SetMyProp(const Value: System.Integer);
    begin
      FMyProp := Value;
      FMyPropStored := True;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenAClassTypeDefinitionIsFlatMustAppendTheFlatAttributeInTheClassDeclaration;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateClassType(MainClass, 'MyClass').Flat := True;

      FImporter.CreateClassType(MainClass, 'MyClass2');
    end;

  FImporter.Import(FConfiguration);

  LinesCompareUnitDeclaration(
    '''
      MainModule = class
      public type
        MyClass = class;
        MyClass2 = class;

        [Flat]
        MyClass = class
        end;

        MyClass2 = class
        end;
    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenAnArrayIsDeclaredTheArrayTypeMustBeFromSystemAndTheArrayTypeItemMustHaveTheFullPathToTheTypeName;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var ArrayType := FImporter.CreateArrayType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType]);

      FImporter.CreateAliasType(MainClass, 'MyArray', ArrayType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        MyArray = System.TArray<System.Integer>;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenAnUnitConfigurationHasTheSameNameFromAnotherConfigurationMustRaiseAnError;
begin
  FConfiguration.Units[0].Name := 'Unit1';
  FConfiguration.Units[1].Name := 'Unit1';

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, EUnitConfigurationDuplicatedName);
end;

procedure TSchemaImporterTest.WhenAPropertyUseATypeOutSideOfTheUnitBeenDeclaretedMustLoadTheUsesSectionWithTheNameOfTheUnitOfTheTypeUsed;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.ValueType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    uses System.Rtti;

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Rtti.TValue;
      published
        property MyProperty: System.Rtti.TValue read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenConvertingTheSchemaFileMustUseTheRightConverterForEveryFileHasExpected;
begin
  var Converter := TSchemaConverterMock.Create;
  var Converter2 := TSchemaConverterMock.Create;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;
  TSchemaImporter.Converters[TSchemaType.OpenAPI31] := Converter2;

  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[1].SchemaType := TSchemaType.OpenAPI31;

  FImporter.Import(FConfiguration);

  Assert.AreEqual(1, Converter.TimesCalled);

  Assert.AreEqual(1, Converter2.TimesCalled);
end;

procedure TSchemaImporterTest.WhenCreateADynamicPropertyClassMustReturnTheClassAsExpected;
begin
  var MainClass := TTypeClassDefinition.Create;
  var DynamicType := TTypeDefinition.Create;

  var DynamicPropertyType := FImporter.CreateDynamicPropertyType(MainClass, DynamicType);

  Assert.IsNotNil(DynamicPropertyType);

  DynamicType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenCreateAnArrayTypeMustReturnTheClassCreated;
begin
  var MainClass := TTypeClassDefinition.Create;
  var ArrayType := TTypeDefinition.Create;

  Assert.IsNotNil(FImporter.CreateArrayType(MainClass, ArrayType));

  ArrayType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenCreateAnEnumeratorMustReturnTheCreatedClass;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Enumerator := FImporter.CreateEnumeratorType(ParentModule, 'MyEnumerator');

  Assert.IsNotNil(Enumerator);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateAReferenceTypeInsideASubClassDeclarationMustLoadTheFullTypeNameUsingTheParentModuleFromTheReferenceNotTheTypeReferece;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(Parent, Name);
      end;

    begin
      var ClassDefinition := AddClass('TMyClass3', AddClass('TMyClass2', AddClass('TMyClass', MainClass)));

      ClassDefinition.AddProperty('MyProp', FImporter.CreateReferenceType(ClassDefinition, 'My Namespace', 'MainModule'));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        public type
          TMyClass2 = class;

          TMyClass2 = class
          public type
            TMyClass3 = class;

            TMyClass3 = class
            private
              FMyProp: MyUnit.MainModule;
            published
              property MyProp: MyUnit.MainModule read FMyProp write FMyProp;
            end;
          end;
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenCreateTheClassTypeMustReturnTheClassTypeCreated;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var ClassDefinition := FImporter.CreateClassType(ParentModule, 'MyClass');

  Assert.IsNotNil(ClassDefinition);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheDynamicPropertyTypeMustLoadTheDynamicPropertyOfTheParameter;
begin
  var MainClass := TTypeClassDefinition.Create;
  var DynamicType := TTypeDefinition.Create;

  var DynamicPropertyType := FImporter.CreateDynamicPropertyType(MainClass, DynamicType);

  Assert.AreEqual(DynamicType, DynamicPropertyType.DynamicType);

  DynamicType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheDynamicPropertyTypeMustLoadTheParentModuleInTheType;
begin
  var MainClass := TTypeClassDefinition.Create;
  var DynamicType := TTypeDefinition.Create;

  var DynamicPropertyType := FImporter.CreateDynamicPropertyType(MainClass, DynamicType);

  Assert.AreEqual(MainClass, DynamicPropertyType.ParentModule);

  DynamicType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheDynamicPropertyTypeMustLoadTheTypeInTheTypesListFromParentModule;
begin
  var MainClass := TTypeClassDefinition.Create;
  var DynamicType := TTypeDefinition.Create;

  var DynamicPropertyType := FImporter.CreateDynamicPropertyType(MainClass, DynamicType);

  Assert.AreEqual(1, Length(DynamicPropertyType.ParentModule.Types));

  DynamicType.Free;

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustAppendTheAliasInTheAliasListFromParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateAliasType(ParentModule, EmptyStr, nil);

  FImporter.CreateAliasType(ParentModule, EmptyStr, nil);

  FImporter.CreateAliasType(ParentModule, EmptyStr, nil);

  Assert.AreEqual(3, Length(ParentModule.Alias));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustAppendTheTypeInTheTypesListFromParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  FImporter.CreateAliasType(ParentModule, EmptyStr, nil);

  Assert.AreEqual(1, Length(ParentModule.Types));

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustLoadParentModule;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Alias := FImporter.CreateAliasType(ParentModule, 'Alias', nil);

  Assert.AreEqual(ParentModule, Alias.ParentModule);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustLoadTheNameInTheType;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Alias := FImporter.CreateAliasType(ParentModule, 'Alias', nil);

  Assert.AreEqual('Alias', Alias.Name);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustLoadTypeAlias;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  var AliasType := FImporter.CreateClassType(ParentModule, 'MyClass');

  var Alias := FImporter.CreateAliasType(ParentModule, 'Alias', AliasType);

  Assert.AreEqual(AliasType, Alias.TypeAlias);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeAliasMustReturnTheClassLoaded;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var Alias := FImporter.CreateAliasType(ParentModule, EmptyStr, nil);

  Assert.IsNotNil(Alias);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenCreateTheTypeReferenceMustReturnTheClassCreated;
begin
  var MainClass := TTypeClassDefinition.Create;
  var TypeReference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'myReference');

  Assert.IsNotNil(TypeReference);

  MainClass.Free;
end;

procedure TSchemaImporterTest.WhenDeclareADynamicTypeMustLoadThePropertyAsExpected;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyDynamic', FImporter.CreateDynamicPropertyType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType]));
    end;

  FImporter.Import(FConfiguration);

  LinesCompareUnitDeclaration(
    '''
      published
        property MyDynamic: Blue.Print.Types.TDynamicProperty<System.Integer> read FMyDynamic write FMyDynamic;
      end;

    implementation

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenDeclareThePropertyAddFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('myProperty', FImporter.CreateArrayType(MainClass, MainClass));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.TArray<MyUnit.MainModule>;
      public
        function AddMyProperty: MyUnit.MainModule;
      published
        property myProperty: System.TArray<MyUnit.MainModule> read FMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: MyUnit.MainModule;
    begin
      Result := MyUnit.MainModule.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenDeclareThePropertyFieldMustFormatTheNameToFixTheLowerCaseFirstCharactere;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('lower', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FLower: System.Integer;
      published
        property lower: System.Integer read FLower write FLower;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenDeclareThePropertyGetFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('myProperty', FImporter.CreateClassType(MainClass, 'MyClass'));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        MyClass = class;

        MyClass = class
        end;
      private
        FMyProperty: MyUnit.MainModule.MyClass;
        function GetMyProperty: MyUnit.MainModule.MyClass;
      published
        property myProperty: MyUnit.MainModule.MyClass read GetMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.GetMyProperty: MyUnit.MainModule.MyClass;
    begin
      if not Assigned(FMyProperty) then
        FMyProperty := MyUnit.MainModule.MyClass.Create;

      Result := FMyProperty;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenDeclareThePropertySetFunctionMustFormatTheNameToFixTheLowerCaseFirstCharactere;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('myProperty', FImporter.BuildInTypes[TBuildInType.IntegerType]).Optional := True;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Integer;
        FMyPropertyStored: Boolean;
        procedure SetMyProperty(const Value: System.Integer);
      public
        property IsMyPropertyStored: Boolean read FMyPropertyStored;
      published
        property myProperty: System.Integer read FMyProperty write SetMyProperty stored FMyPropertyStored;
      end;

    implementation

    { MainModule }

    procedure MainModule.SetMyProperty(const Value: System.Integer);
    begin
      FMyProperty := Value;
      FMyPropertyStored := True;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenFindTheAndTheTypeIsFoundedMustReturnTheTypeHasExpected;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var CurrentClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', CurrentClassDefinition);

  var ReturningType := FImporter.FindType('My Namespace', 'AClassName');

  Assert.IsNotNil(ReturningType);

  Assert.AreEqual(CurrentClassDefinition, ReturningType);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenGenerateTheUnitFileMustBeSavedInTheOutputFolderConfiguration;
begin
  FImporter.Import(FConfiguration);

  Assert.IsTrue(TFile.Exists(Format('%s\%s.pas', [FConfiguration.OutputFolder, FConfiguration.Units[0].Name])));
end;

procedure TSchemaImporterTest.WhenGenerateTheUnitMustLoadTheFileHasExpected;
begin
  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      end;

    implementation

    end.

    ''', FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenImportMustLoadTheSchemaOfAllUnitConfigurated;
begin
  var Converter := TSchemaConverterMock.Create;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := Converter;

  FImporter.Import(FConfiguration);

  Assert.AreEqual(3, Converter.TimesCalled);
end;

procedure TSchemaImporterTest.WhenImportTheSchemaWithAFileConfigurationMustLoadTheConfigurationAndImportTheSchemaHasExpected;
begin
  var Converter := TSchemaConverterMock.Create;
  var FileName := TPath.GetTempFileName;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[1].SchemaType := TSchemaType.OpenAPI30;

  TFile.WriteAllText(FileName, (TBluePrintJSONSerializer.Create as IBluePrintSerializer).Serialize(FConfiguration));

  FImporter.Import(FileName);

  Assert.AreEqual(3, Converter.TimesCalled);
end;

procedure TSchemaImporterTest.WhenLoadTheConverterLoadTheSchemaAndDontLoadTheNamespaceInformationMustRaiseAnError;
begin
  var Converter := TSchemaConverterMock.Create;
  Converter.Namespace := EmptyStr;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := Converter;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaNamespaceNotLoaded);
end;

procedure TSchemaImporterTest.WhenLoadTheSchemaFileFromSistemaMustPassTheTextToTheLoadLoadSchemaFunction;
begin
  var Converter := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  var Payload := 'My payload from file';
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  TFile.WriteAllText(FConfiguration.Units[0].SchemaFiles[0].FileName, Payload);

  FImporter.Import(FConfiguration);

  Assert.AreEqual(Payload, Converter.SchemaText);
end;

procedure TSchemaImporterTest.WhenTheArrayTypeIsAnObjectMustCreateTheAddFunctionForTheType;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'System';
  var SimpleType := FImporter.CreateClassType(ParentModule, 'SimpleType');
  var TheArrray := FImporter.CreateArrayType(ParentModule, SimpleType);

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', TheArrray);

      MainClass.AddProperty('MyProperty2', TheArrray);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.TArray<System.SimpleType>;
        FMyProperty2: System.TArray<System.SimpleType>;
      public
        function AddMyProperty: System.SimpleType;
        function AddMyProperty2: System.SimpleType;
      published
        property MyProperty: System.TArray<System.SimpleType> read FMyProperty write FMyProperty;
        property MyProperty2: System.TArray<System.SimpleType> read FMyProperty2 write FMyProperty2;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: System.SimpleType;
    begin
      Result := System.SimpleType.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    function MainModule.AddMyProperty2: System.SimpleType;
    begin
      Result := System.SimpleType.Create;

      FMyProperty2 := FMyProperty2 + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenTheArrayTypeIsAReferenceMustLoadTheReferenceAndLoadTheArrayHasExpected;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.CreateArrayType(MainClass, FImporter.CreateReferenceType(MainClass, 'My Namespace', MainClass.Name)));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.TArray<MyUnit.MainModule>;
      public
        function AddMyProperty: MyUnit.MainModule;
      published
        property MyProperty: System.TArray<MyUnit.MainModule> read FMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: MyUnit.MainModule;
    begin
      Result := MyUnit.MainModule.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassDefinitionHaveAPropertyMustDeclareThePropertyInTheUnit;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Integer;
      published
        property MyProperty: System.Integer read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassHasAnAliasDeclaredMustBuildTheUnitWithTheDefinitionHasExpected;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateAliasType(MainClass, 'Alias', FImporter.BuildInTypes[TBuildInType.IntegerType]);
      FImporter.CreateAliasType(MainClass, 'Alias2', FImporter.BuildInTypes[TBuildInType.IntegerType]);
      FImporter.CreateAliasType(MainClass, 'Alias3', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        Alias = System.Integer;
        Alias2 = System.Integer;
        Alias3 = System.Integer;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassHasEnumerationDeclaredMustLoadInThePublicTypeOfTheClassDeclaration;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnumerator');

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        MyEnumerator = (a, b, c);
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassNameHasAnySpecialCharacterMustFormatTheNameToRemoveThisCharatersAndFixTheNameToCompileTheUnitCorrectly;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateClassType(MainClass, 'my.special-class;name');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMySpecialClassName = class;

        TMySpecialClassName = class
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassTypeIsAClassDefinitionMustDeclareTheGetFunctionAndCreateTheClassIfTheValueIsntLoaded;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'System';
  var SimpleType := FImporter.CreateClassType(ParentModule, 'SimpleType');

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', SimpleType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.SimpleType;
        function GetMyProperty: System.SimpleType;
      published
        property MyProperty: System.SimpleType read GetMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.GetMyProperty: System.SimpleType;
    begin
      if not Assigned(FMyProperty) then
        FMyProperty := System.SimpleType.Create;

      Result := FMyProperty;
    end;

    end.

    ''',
    FConfiguration.Units[0]);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenTheConverterDoesntExistsMustRaiseAnError;
begin
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaConverterNotRegistered);
end;

procedure TSchemaImporterTest.WhenTheEnumeratorValueHaveOnlyNumberMustInsertALetterBeforeTheNumberAndAppendTheEnumValueAttribute;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnum');

      Enumerator.AddEnumeration('1');

      Enumerator.AddEnumeration('2');

      Enumerator.AddEnumeration('3');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        [EnumValue('1, 2, 3')]
        MyEnum = (t1, t2, t3);
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheMainClassHasAnotherClassAppendedMustLoadThisClassInPublicTypeSectionFromTheMainClass;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateClassType(MainClass, 'TMyClass');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        end;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheMainClassHasTheSameNameInTwoDifferentConfigurationsTheyCannotShareTheSameClassInstance;
begin
  var Converter := TSchemaConverterMock.Create;
  var Converter2 := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI20;
  FConfiguration.Units[1].SchemaFiles[0].MainModuleName := 'MyMainClassName2';
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  var MainClassAssert: TTypeClassDefinition := nil;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := Converter;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter2;

  Converter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClassAssert := MainClass;
    end;

  Converter2.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      Assert.IsFalse(MainClassAssert = MainClass);
    end;

  FImporter.Import(FConfiguration);
end;

procedure TSchemaImporterTest.WhenTheNameOfMainClassIsTheSameInAnotherSchemaFileMustUseTheSameClassDeclaration;
begin
  var Converter := TSchemaConverterMock.Create;
  var Converter2 := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI31;
  var MainClassAssert: TTypeClassDefinition := nil;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;
  TSchemaImporter.Converters[TSchemaType.OpenAPI31] := Converter2;

  Converter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClassAssert := MainClass;
    end;

  Converter2.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      Assert.AreEqual(MainClassAssert, MainClass);
    end;

  FImporter.Import(FConfiguration);
end;

procedure TSchemaImporterTest.WhenTheNamespaceDoesntHaveThePrefixNameConfigurationMustRaiseAnError;
begin
  FConfiguration.Namespaces[0].Free;

  FConfiguration.Namespaces := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaNamespaceWithoutConfiguraton);
end;

procedure TSchemaImporterTest.WhenThePropertyHasAnArrayTypeOfAConcretTypeMustCreateTheAddProcedureWithAParameterOsTheArrayType;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProp', FImporter.CreateArrayType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType]));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProp: System.TArray<System.Integer>;
      public
        procedure AddMyProp(const Value: System.Integer);
      published
        property MyProp: System.TArray<System.Integer> read FMyProp write FMyProp;
      end;

    implementation

    { MainModule }

    procedure MainModule.AddMyProp(const Value: System.Integer);
    begin
      FMyProp := FMyProp + [Value];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyHasAnSpecialCharacterMustAppendTheAmpersandBeforeTheClassName;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('if', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    uses Blue.Print.Types;

    type
      MainModule = class;

      MainModule = class
      private
        FIf: System.Integer;
      published
        [FieldName('if')]
        property &if: System.Integer read FIf write FIf;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyHasAReferenceTypeMustFindTheReferenceAndLoadThePropertyValue;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      if MainClass.Name = 'MainModule' then
      begin
        var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnumerator');

        Enumerator.AddEnumeration('Value');

        FImporter.AddType('My Namespace', Enumerator);

        var Reference := FImporter.CreateReferenceType(MainClass, 'My Namespace', 'MyEnumerator');

        MainClass.AddProperty('MyProperty', Reference);
      end;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        MyEnumerator = (Value);
      private
        FMyProperty: MyUnit.MainModule.MyEnumerator;
      published
        property MyProperty: MyUnit.MainModule.MyEnumerator read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyHasASubTypeCantLoadTheClassNameInTheUsesList;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Namespace, Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := FImporter.CreateClassType(Parent, Name);
      end;

    begin
      var ClassDefinition := AddClass('My Namespace', 'TMyClass', MainClass);
      var EnumeratorDefinition := FImporter.CreateEnumeratorType(ClassDefinition, 'MyEnumerator');

      EnumeratorDefinition.AddEnumeration('Value');

      MainClass.AddProperty('MyProperty', EnumeratorDefinition);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        TMyClass = class;

        TMyClass = class
        public type
          MyEnumerator = (Value);
        end;
      private
        FMyProperty: MyUnit.MainModule.TMyClass.MyEnumerator;
      published
        property MyProperty: MyUnit.MainModule.TMyClass.MyEnumerator read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyHasInvalidCharacteresInTheNameMustFixTheNameAndApplyTheFieldNameAttribute;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('%invalid.name@for|property.', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    uses Blue.Print.Types;

    type
      MainModule = class;

      MainModule = class
      private
        FInvalidNameForProperty: System.Integer;
      published
        [FieldName('%invalid.name@for|property.')]
        property InvalidNameForProperty: System.Integer read FInvalidNameForProperty write FInvalidNameForProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyHasntATypeLoadedMustRaiseAnError;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', nil);
    end;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, EPropertyWithoutType);
end;

procedure TSchemaImporterTest.WhenThePropertyIsOptionalMustCreateTheFieldForStoreTheIsStoredInfoAndCreateTheSetFunctionForTheProperty;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'System';
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';
  SimpleType.ParentModule := ParentModule;

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', SimpleType).Optional := True;

      MainClass.AddProperty('MyProperty2', SimpleType).Optional := True;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.SimpleType;
        FMyPropertyStored: Boolean;
        FMyProperty2: System.SimpleType;
        FMyProperty2Stored: Boolean;
        procedure SetMyProperty(const Value: System.SimpleType);
        procedure SetMyProperty2(const Value: System.SimpleType);
      public
        property IsMyPropertyStored: Boolean read FMyPropertyStored;
        property IsMyProperty2Stored: Boolean read FMyProperty2Stored;
      published
        property MyProperty: System.SimpleType read FMyProperty write SetMyProperty stored FMyPropertyStored;
        property MyProperty2: System.SimpleType read FMyProperty2 write SetMyProperty2 stored FMyProperty2Stored;
      end;

    implementation

    { MainModule }

    procedure MainModule.SetMyProperty(const Value: System.SimpleType);
    begin
      FMyProperty := Value;
      FMyPropertyStored := True;
    end;

    procedure MainModule.SetMyProperty2(const Value: System.SimpleType);
    begin
      FMyProperty2 := Value;
      FMyProperty2Stored := True;
    end;

    end.

    ''',
    FConfiguration.Units[0]);

  ParentModule.Free;

  SimpleType.Free;
end;

procedure TSchemaImporterTest.WhenThePropertyNameHasASpecialNameMustAppendTheFieldNameAttribute;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('if', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    uses Blue.Print.Types;

    type
      MainModule = class;

      MainModule = class
      private
        FIf: System.Integer;
      published
        [FieldName('if')]
        property &if: System.Integer read FIf write FIf;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyNeedTheGetFunctionMustDeclareAllFunctionsHasExpected;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'System';
  var SimpleType := FImporter.CreateClassType(ParentModule, 'SimpleType');

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', SimpleType);

      MainClass.AddProperty('MyProperty2', SimpleType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.SimpleType;
        FMyProperty2: System.SimpleType;
        function GetMyProperty: System.SimpleType;
        function GetMyProperty2: System.SimpleType;
      published
        property MyProperty: System.SimpleType read GetMyProperty write FMyProperty;
        property MyProperty2: System.SimpleType read GetMyProperty2 write FMyProperty2;
      end;

    implementation

    { MainModule }

    function MainModule.GetMyProperty: System.SimpleType;
    begin
      if not Assigned(FMyProperty) then
        FMyProperty := System.SimpleType.Create;

      Result := FMyProperty;
    end;

    function MainModule.GetMyProperty2: System.SimpleType;
    begin
      if not Assigned(FMyProperty2) then
        FMyProperty2 := System.SimpleType.Create;

      Result := FMyProperty2;
    end;

    end.

    ''',
    FConfiguration.Units[0]);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenThePropertyTypeIsAnArrayMustDeclareTheTypeWithTheTArraySystemType;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  ParentModule.Name := 'System';
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';
  SimpleType.ParentModule := ParentModule;
  var TheArrray := FImporter.CreateArrayType(ParentModule, SimpleType);

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', TheArrray);
    end;

  FImporter.Import(FConfiguration);

  LinesCompareUnitDeclaration(
    '''
      published
        property MyProperty: System.TArray<System.SimpleType> read FMyProperty write FMyProperty;
      end;

    implementation
    ''',
    FConfiguration.Units[0]);

  ParentModule.Free;

  SimpleType.Free;
end;

procedure TSchemaImporterTest.WhenThePropertyTypeIsAReferenceToAnArrayWithAClassDefinitionTypeMustLoadTheAddFunctionHasExpected;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      if MainClass.Name = 'MainModule' then
      begin
        FImporter.AddType('My Namespace', FImporter.CreateAliasType(MainClass, 'MyArray', FImporter.CreateArrayType(MainClass, MainClass)));

        MainClass.AddProperty('MyProperty', FImporter.CreateReferenceType(MainClass, 'My Namespace', 'MyArray'));
      end;
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        MyArray = System.TArray<MyUnit.MainModule>;
      private
        FMyProperty: MyUnit.MainModule.MyArray;
      public
        function AddMyProperty: MyUnit.MainModule;
      published
        property MyProperty: MyUnit.MainModule.MyArray read FMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: MyUnit.MainModule;
    begin
      Result := MyUnit.MainModule.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheSchemaHasEnumerationsMustLoadTheScopedEnumsCompilerDirective;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := FImporter.CreateEnumeratorType(MainClass, 'MyEnum');

      Enumerator.AddEnumeration('Value');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}
    {$SCOPEDENUMS ON}

    type
      MainModule = class;

      MainModule = class
      public type
        MyEnum = (Value);
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;
procedure TSchemaImporterTest.WhenTheStringTypeIsDeclaredCantUseTheEscapeCharacterInTheName;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      FImporter.CreateAliasType(MainClass, 'MyAlias', FImporter.BuildInTypes[TBuildInType.StringType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        MyAlias = System.String;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheTypeHasAReservedNameTheTypeMustUseTheAmpersandBeforeTheName;
begin
  var ReservedNames := ['type', 'mod', 'to', 'if', 'then', 'else', 'type', 'class', 'array', 'object', 'string', 'const', 'not', 'in', 'file', 'is', 'end', 'label'];

  for var ReservedName in ReservedNames do
  begin
    var Importer := TSchemaImporter.Create;

    FConverter.WhenExecuteConvert :=
      procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
      begin
        var Enumerator := FImporter.CreateEnumeratorType(MainClass, ReservedName);

        Enumerator.AddEnumeration('a');

        FImporter.CreateClassType(MainClass, ReservedName);
      end;

    Importer.Import(FConfiguration);

    CompareUnitDeclaration(Format(
      '''
      unit MyUnit;

      interface

      {$M+}
      {$SCOPEDENUMS ON}

      type
        MainModule = class;

        MainModule = class
        public type
          &%0:s = (a);

          &%0:s = class;

          &%0:s = class
          end;
        end;

      implementation

      end.

      ''',
      [ReservedName]), FConfiguration.Units[0]);

    Importer.Free;
  end;
end;

procedure TSchemaImporterTest.WhenTheTypeIsAnAliasToAnArrayTypeMustCreateTheAddFunctionWithTheInternalAliasType;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.CreateAliasType(MainClass, 'MyAlias', FImporter.CreateArrayType(MainClass, MainClass)));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      public type
        MyAlias = System.TArray<MyUnit.MainModule>;
      private
        FMyProperty: MyUnit.MainModule.MyAlias;
      public
        function AddMyProperty: MyUnit.MainModule;
      published
        property MyProperty: MyUnit.MainModule.MyAlias read FMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: MyUnit.MainModule;
    begin
      Result := MyUnit.MainModule.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheTypeIsFoundMustLoadTheTypeInTheParameterAsExpected;
begin
  var ParentModule := TTypeUnitDefinition.Create;
  var TypeDefinition: TTypeDefinition;

  var CurrentClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  FImporter.AddNamespace('My Namespace', 'my');

  FImporter.AddType('My Namespace', CurrentClassDefinition);

  FImporter.TryFindType('My Namespace', 'AClassName', TypeDefinition);

  Assert.AreEqual(TypeDefinition, CurrentClassDefinition);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenTheTypeOfAPropertyIsFromSystemCantAddTheSystemInTheUsesList;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', FImporter.BuildInTypes[TBuildInType.IntegerType]);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyProperty: System.Integer;
      published
        property MyProperty: System.Integer read FMyProperty write FMyProperty;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheTypeOfDynamicPropertyIsAClassDefinitionMustCreateTheAddFunctionToAddThePropertyNameAndReturntTheClassDefinitionInTheReturnOfTheFunction;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyDynamic', FImporter.CreateDynamicPropertyType(MainClass, MainClass));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyDynamic: Blue.Print.Types.TDynamicProperty<MyUnit.MainModule>;
      public
        function AddMyDynamic(const Name: String): MyUnit.MainModule;
      published
        property MyDynamic: Blue.Print.Types.TDynamicProperty<MyUnit.MainModule> read FMyDynamic write FMyDynamic;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyDynamic(const Name: String): MyUnit.MainModule;
    begin
      Result := MyUnit.MainModule.Create;

      FMyDynamic := FMyDynamic + [TDynamicPair<MyUnit.MainModule>.Create(Name, Result)];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheTypeOfDynamicPropertyIsAnIntegralTypeMustCreateAProcedureToLoadTheDynamicPropertyValue;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyDynamic', FImporter.CreateDynamicPropertyType(MainClass, FImporter.BuildInTypes[TBuildInType.IntegerType]));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    {$M+}

    type
      MainModule = class;

      MainModule = class
      private
        FMyDynamic: Blue.Print.Types.TDynamicProperty<System.Integer>;
      public
        procedure AddMyDynamic(const Name: String; const Value: System.Integer);
      published
        property MyDynamic: Blue.Print.Types.TDynamicProperty<System.Integer> read FMyDynamic write FMyDynamic;
      end;

    implementation

    { MainModule }

    procedure MainModule.AddMyDynamic(const Name: String; const Value: System.Integer);
    begin
      FMyDynamic := FMyDynamic + [TDynamicPair<System.Integer>.Create(Name, Value)];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheUnitHasMoreThanOneClassMustLoadAllClassesInTheUnit;
begin
  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit2;

    interface

    {$M+}

    type
      MainModule2 = class;
      MainModule3 = class;

      MainModule2 = class
      end;

      MainModule3 = class
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[1]);
end;

procedure TSchemaImporterTest.WhenTryToAddAClassDefinitionAndTheNamespaceDoesntExistsMustRaiseAnError;
begin
  var ParentModule := TTypeUnitDefinition.Create;

  var CurrentClassDefinition := FImporter.CreateClassType(ParentModule, 'AClassName');

  Assert.WillRaise(
    procedure
    begin
      FImporter.AddType('Invalid Namespace', CurrentClassDefinition);
    end, ESchemaNamespaceWithoutConfiguraton);

  ParentModule.Free;
end;

procedure TSchemaImporterTest.WhenTryToImportWithoutAConfigurationLoadedMustRaiseError;
begin
  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(nil);
    end, ENeedConfiguration);
end;

{ TSchemaConverterMockTeste }

procedure TSchemaConverterMockTeste.BeforeCallConvertProcedureMustRaiseAnErrorIfNotLoadedTheSchemaBefore;
begin
  Assert.WillRaise(
    procedure
    begin
      FConverter.Convert(FMainClass, nil);
    end, ESchemaNotLoaded);
end;

procedure TSchemaConverterMockTeste.Setup;
begin
  FConverterClass := TSchemaConverterMock.Create;
  FMainClass := TTypeClassDefinition.Create;
  FSchema := TSchema.Create;
  FSchema.Importer := TSchemaImporter.Create;
  FSchema.SchemaFile := TSchemaFileConfiguration.Create;

  FConverter := FConverterClass;
end;

procedure TSchemaConverterMockTeste.TearDown;
begin
  FConverter := nil;

  FSchema.Importer.Free;

  FSchema.SchemaFile.Free;

  FSchema.Free;

  FMainClass.Free;
end;

procedure TSchemaConverterMockTeste.WhenCallTheConvertFunctionWithoutAMainsClassLoadedMustRaiseAnError;
begin
  Assert.WillRaise(
    procedure
    begin
      FConverter.Convert(nil, FSchema);
    end, EMainClassMustBeLoaded);
end;

procedure TSchemaConverterMockTeste.WhenCallTheLoadSchemaMustLoadThePayloadInThePropertyHasExpected;
begin
  FSchema.SchemaText := 'My schema payload!';

  FConverter.Convert(FMainClass, FSchema);

  Assert.AreEqual('My schema payload!', FConverterClass.SchemaText);
end;

procedure TSchemaConverterMockTeste.WhenCallTheLoadSchemaProcedureMustLoadTheNamespacePropertyOfTheSchema;
begin
  FConverter.LoadSchema(FSchema);

  Assert.IsNotEmpty(FSchema.Namespace);
end;

procedure TSchemaConverterMockTeste.WhenLoadTheSchemaMustLoadTheNamespacePropertyInTheSchemaNamespace;
begin
  FConverter.LoadSchema(FSchema);

  Assert.AreEqual('My Namespace', FSchema.Namespace);
end;

procedure TSchemaConverterMockTeste.WhenTheImporterIsntLoadedMustRaiseAnError;
begin
  FSchema.Importer.Free;

  FSchema.Importer := nil;

  Assert.WillRaise(
    procedure
    begin
      FConverter.Convert(FMainClass, FSchema);
    end, EImporterNotLoaded)
end;

procedure TSchemaConverterMockTeste.WhenTheSchemaDoesntHaveTheSchemaFileLoadedMustRaiseAnError;
begin
  FreeAndNil(FSchema.SchemaFile);

  Assert.WillRaise(
    procedure
    begin
      FConverter.Convert(FMainClass, FSchema);
    end, ESchemaFileConfigurationMustBeLoaded);
end;

{ ESchemaNotLoaded }

constructor ESchemaNotLoaded.Create;
begin
  inherited Create('The schema isn''t loaded!');
end;

{ EMainClassMustBeLoaded }

constructor EMainClassMustBeLoaded.Create;
begin
  inherited Create('The main class parameter must be loaded!');
end;

{ TSchemaConverterMock }

procedure TSchemaConverterMock.Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
begin
  if Assigned(WhenExecuteConvert) then
    WhenExecuteConvert(MainClass, Schema);

  if not Assigned(Schema) then
    raise ESchemaNotLoaded.Create;

  if not Assigned(Schema.SchemaFile) then
    raise ESchemaFileConfigurationMustBeLoaded.Create;

  if not Assigned(MainClass) then
    raise EMainClassMustBeLoaded.Create;

  if not Assigned(Schema.Importer) then
    raise EImporterNotLoaded.Create;

  SchemaText := Schema.SchemaText;

  Inc(FTimesCalled);
end;

constructor TSchemaConverterMock.Create;
begin
  inherited;

  FNamespace := 'My Namespace';
end;

procedure TSchemaConverterMock.LoadSchema(const Schema: TSchema);
begin
  if Assigned(WhenExecuteLoadSchema) then
    WhenExecuteLoadSchema(Schema);

  Schema.Namespace := Namespace;
end;

{ ESchemaFileConfigurationMustBeLoaded }

constructor ESchemaFileConfigurationMustBeLoaded.Create;
begin
  inherited Create('The schema file configuration must be loaded!');
end;

{ TSchemaTest }

procedure TSchemaTest.IfTheSchemaValueIsAnObjectMustDestroyTheValueWhenTheSchemaIsDestroyed;
begin
  var Schema := TSchema.Create;
  Schema.SchemaValue := TObjectSchema.Create;

  Schema.Free;

  Assert.IsTrue(TObjectSchema.DestroyCalled);
end;

procedure TSchemaTest.IfTheSchemaValueIsntAnObjectCantBeDestroyedWhenTheSchemaIsDestroyed;
begin
  var Schema := TSchema.Create;
  Schema.SchemaValue := 'String';

  Assert.WillNotRaise(
    procedure
    begin
      Schema.Free;
    end);
end;

procedure TSchemaTest.Setup;
begin
  FSchema := TSchema.Create;
end;

procedure TSchemaTest.TearDown;
begin
  FSchema.Free;
end;

{ TObjectSchema }

constructor TObjectSchema.Create;
begin
  inherited;

  DestroyCalled := False;
end;

destructor TObjectSchema.Destroy;
begin
  DestroyCalled := True;

  inherited;
end;

{ EImporterNotLoaded }

constructor EImporterNotLoaded.Create;
begin
  inherited Create('The importer isn''t loaded!');
end;

end.

