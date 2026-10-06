unit Blue.Print.Schema.Importer.Test;

interface

uses System.SysUtils, System.Rtti, Test.Insight.Framework, Blue.Print.Schema.Importer;

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

  [TestFixture]
  TSchemaImporterTest = class
  private
    FConverter: TSchemaConverterMock;
    FConfiguration: TConfiguration;
    FImporter: TSchemaImporter;

    function CreateNamespace(const Namespace, Prefix: String): TNamespaceConfiguration;

    procedure CompareUnitDeclaration(const UnitDeclaration: String; const UnitConfiguration: TUnitConfiguration);
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
    procedure WhenLoadTheMainClassMustLoadThePrefixNameInTheMainClassName;
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

implementation

uses System.IOUtils;

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
      var Enumerator := TTypeEnumerationDefinition.Create;
      Enumerator.Name := 'ens:MyEnum';

      Enumerator.AddEnumeration('if');

      MainClass.AddEnumerationDefinition(Enumerator);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
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

procedure TSchemaImporterTest.MustCreateTheMainClassWithTheNameInTheSchemaFileConfiguration;
begin
  var Converter := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  Converter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      Assert.AreEqual('my:MyMainClassName', MainClass.Name);
    end;

  FImporter.Import(FConfiguration);
end;

procedure TSchemaImporterTest.MustDeclareAllEnumerationsInTheClassDefinition;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      var Enumerator := TTypeEnumerationDefinition.Create;
      Enumerator.Name := 'MyEnumerator';

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');

      MainClass.AddEnumerationDefinition(Enumerator);

      Enumerator := TTypeEnumerationDefinition.Create;

      Enumerator.Name := 'MyEnumerator2';

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');

      MainClass.AddEnumerationDefinition(Enumerator);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
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
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', SimpleType);
      MainClass.AddProperty('MyProperty2', SimpleType);
      MainClass.AddProperty('MyProperty3', SimpleType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      private
        FMyProperty: SimpleType;
        FMyProperty2: SimpleType;
        FMyProperty3: SimpleType;
      published
        property MyProperty: SimpleType read FMyProperty write FMyProperty;
        property MyProperty2: SimpleType read FMyProperty2 write FMyProperty2;
        property MyProperty3: SimpleType read FMyProperty3 write FMyProperty3;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.MustSaveAllUnitsInTheOutputFolderHasExpected;
begin
  FImporter.Import(FConfiguration);

  Assert.IsTrue(TFile.Exists(Format('%s\%s.pas', [FConfiguration.OutputFolder, FConfiguration.Units[0].Name])));
  Assert.IsTrue(TFile.Exists(Format('%s\%s.pas', [FConfiguration.OutputFolder, FConfiguration.Units[1].Name])));
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

procedure TSchemaImporterTest.ThePublicTypeDeclarationMustBeRecursive;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      function AddClass(const Name: String; const Parent: TTypeModuleDefinition): TTypeClassDefinition;
      begin
        Result := TTypeClassDefinition.Create;
        Result.Name := Name;

        Parent.AddClassDefinition(Result);
      end;

    begin
      AddClass('ns3:TMyClass3', AddClass('ns2:TMyClass2', AddClass('ns:TMyClass', MainClass)));
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      public type
        TMyClass = class
        public type
          TMyClass2 = class
          public type
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

procedure TSchemaImporterTest.WhenAClassHasMoreThanOneClassMustLoadAllClassesInThePublicTypeDefinition;
begin
  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)

      procedure AddClass(const Name: String);
      begin
        var MyClass := TTypeClassDefinition.Create;
        MyClass.Name := Name;

        MainClass.AddClassDefinition(MyClass);
      end;

    begin
      AddClass('ns:TMyClass');

      AddClass('ns2:TMyClass2');

      AddClass('ns3:TMyClass3');
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      public type
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

    type
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

procedure TSchemaImporterTest.WhenLoadTheMainClassMustLoadThePrefixNameInTheMainClassName;
begin
  var Converter := TSchemaConverterMock.Create;
  Converter.Namespace := 'Another Namespace';
  FConfiguration.Namespaces := FConfiguration.Namespaces + [CreateNamespace(Converter.Namespace, 'Prefix')];
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;

  Converter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      Assert.AreEqual('Prefix:MyMainClassName', MainClass.Name);
    end;

  FImporter.Import(FConfiguration);
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
  var SimpleType := TTypeClassDefinition.Create;
  SimpleType.Name := 'SimpleType';
  var TheArrray := TTypeArrayDefinition.Create;
  TheArrray.ArrayType := SimpleType;

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

    type
      MainModule = class
      private
        FMyProperty: TArray<SimpleType>;
        FMyProperty2: TArray<SimpleType>;
      public
        function AddMyProperty: SimpleType;
        function AddMyProperty2: SimpleType;
      published
        property MyProperty: TArray<SimpleType> read FMyProperty write FMyProperty;
        property MyProperty2: TArray<SimpleType> read FMyProperty2 write FMyProperty2;
      end;

    implementation

    { MainModule }

    function MainModule.AddMyProperty: SimpleType;
    begin
      Result := SimpleType.Create;

      FMyProperty := FMyProperty + [Result];
    end;

    function MainModule.AddMyProperty2: SimpleType;
    begin
      Result := SimpleType.Create;

      FMyProperty2 := FMyProperty2 + [Result];
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenTheClassDefinitionHaveAPropertyMustDeclareThePropertyInTheUnit;
begin
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';

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

    type
      MainModule = class
      private
        FMyProperty: SimpleType;
      published
        property MyProperty: SimpleType read FMyProperty write FMyProperty;
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
      var Enumerator := TTypeEnumerationDefinition.Create;
      Enumerator.Name := 'MyEnumerator';

      Enumerator.AddEnumeration('a');

      Enumerator.AddEnumeration('b');

      Enumerator.AddEnumeration('c');

      MainClass.AddEnumerationDefinition(Enumerator);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
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
      var MyClass := TTypeClassDefinition.Create;
      MyClass.Name := 'ns:my.special-class;name';

      MainClass.AddClassDefinition(MyClass);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      public type
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
  var SimpleType := TTypeClassDefinition.Create;
  SimpleType.Name := 'SimpleType';

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

    type
      MainModule = class
      private
        FMyProperty: SimpleType;
        function GetMyProperty: SimpleType;
      published
        property MyProperty: SimpleType read GetMyProperty write FMyProperty;
      end;

    implementation

    { MainModule }

    function MainModule.GetMyProperty: SimpleType;
    begin
      if not Assigned(FMyProperty) then
        FMyProperty := SimpleType.Create;

      Result := FMyProperty;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
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
      var Enumerator := TTypeEnumerationDefinition.Create;
      Enumerator.Name := 'ens:MyEnum';

      Enumerator.AddEnumeration('1');

      Enumerator.AddEnumeration('2');

      Enumerator.AddEnumeration('3');

      MainClass.AddEnumerationDefinition(Enumerator);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
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
      var MyClass := TTypeClassDefinition.Create;
      MyClass.Name := 'ns:TMyClass';

      MainClass.AddClassDefinition(MyClass);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      public type
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
    end, ESchemaNamespaceWithouConfiguraton);
end;

procedure TSchemaImporterTest.WhenThePropertyHasAnSpecialCharacterMustAppendTheAmpersandBeforeTheClassName;
begin
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('if', SimpleType);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      private
        FIf: SimpleType;
      published
        property &if: SimpleType read FIf write FIf;
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyIsOptionalMustCreateTheFieldForStoreTheIsStoredInfoAndCreateTheSetFunctionForTheProperty;
begin
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';

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

    type
      MainModule = class
      private
        FMyProperty: SimpleType;
        FMyPropertyStored: Boolean;
        FMyProperty2: SimpleType;
        FMyProperty2Stored: Boolean;
        procedure SetMyProperty(const Value: SimpleType);
        procedure SetMyProperty2(const Value: SimpleType);
      public
        property IsMyPropertyStored: Boolean read FMyPropertyStored;
        property IsMyProperty2Stored: Boolean read FMyProperty2Stored;
      published
        property MyProperty: SimpleType read FMyProperty write SetMyProperty stored FMyPropertyStored;
        property MyProperty2: SimpleType read FMyProperty2 write SetMyProperty2 stored FMyProperty2Stored;
      end;

    implementation

    { MainModule }

    procedure MainModule.SetMyProperty(const Value: SimpleType);
    begin
      FMyProperty := Value;
      FMyPropertyStored := True;
    end;

    procedure MainModule.SetMyProperty2(const Value: SimpleType);
    begin
      FMyProperty2 := Value;
      FMyProperty2Stored := True;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyNeedTheGetFunctionMustDeclareAllFunctionsHasExpected;
begin
  var SimpleType := TTypeClassDefinition.Create;
  SimpleType.Name := 'SimpleType';

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

    type
      MainModule = class
      private
        FMyProperty: SimpleType;
        FMyProperty2: SimpleType;
        function GetMyProperty: SimpleType;
        function GetMyProperty2: SimpleType;
      published
        property MyProperty: SimpleType read GetMyProperty write FMyProperty;
        property MyProperty2: SimpleType read GetMyProperty2 write FMyProperty2;
      end;

    implementation

    { MainModule }

    function MainModule.GetMyProperty: SimpleType;
    begin
      if not Assigned(FMyProperty) then
        FMyProperty := SimpleType.Create;

      Result := FMyProperty;
    end;

    function MainModule.GetMyProperty2: SimpleType;
    begin
      if not Assigned(FMyProperty2) then
        FMyProperty2 := SimpleType.Create;

      Result := FMyProperty2;
    end;

    end.

    ''',
    FConfiguration.Units[0]);
end;

procedure TSchemaImporterTest.WhenThePropertyTypeIsAnArrayMustDeclareTheTypeWithTheTArraySystemType;
begin
  var SimpleType := TTypeDefinition.Create;
  SimpleType.Name := 'SimpleType';
  var TheArrray := TTypeArrayDefinition.Create;
  TheArrray.ArrayType := SimpleType;

  FConverter.WhenExecuteConvert :=
    procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
    begin
      MainClass.AddProperty('MyProperty', TheArrray);
    end;

  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit;

    interface

    type
      MainModule = class
      private
        FMyProperty: TArray<SimpleType>;
      published
        property MyProperty: TArray<SimpleType> read FMyProperty write FMyProperty;
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
    FConverter.WhenExecuteConvert :=
      procedure (MainClass: TTypeClassDefinition; Schema: TSchema)
      begin
        var Enumerator := TTypeEnumerationDefinition.Create;
        Enumerator.Name := 'ens:' + ReservedName;

        Enumerator.AddEnumeration('a');

        MainClass.AddEnumerationDefinition(Enumerator);

        var ClassDefinition := TTypeClassDefinition.Create;
        ClassDefinition.Name := 'cns:' + ReservedName;

        MainClass.AddClassDefinition(ClassDefinition);
      end;

    FImporter.Import(FConfiguration);

    CompareUnitDeclaration(Format(
      '''
      unit MyUnit;

      interface

      type
        MainModule = class
        public type
          &%0:s = (a);

          &%0:s = class
          end;
        end;

      implementation

      end.

      ''',
      [ReservedName]), FConfiguration.Units[0]);
  end;
end;

procedure TSchemaImporterTest.WhenTheUnitHasMoreThanOneClassMustLoadAllClassesInTheUnit;
begin
  FImporter.Import(FConfiguration);

  CompareUnitDeclaration(
    '''
    unit MyUnit2;

    interface

    type
      MainModule2 = class
      end;

      MainModule3 = class
      end;

    implementation

    end.

    ''',
    FConfiguration.Units[1]);
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
  FSchema.SchemaFile := TSchemaFileConfiguration.Create;

  FConverter := FConverterClass;
end;

procedure TSchemaConverterMockTeste.TearDown;
begin
  FConverter := nil;

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

procedure TSchemaConverterMockTeste.WhenTheSchemaDoesntHaveTheSchemaFileLoadedMustRaiseAnError;
begin
  FSchema.SchemaFile := nil;

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

end.

