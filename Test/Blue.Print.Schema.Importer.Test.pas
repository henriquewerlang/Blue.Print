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
    FConfiguration: TConfiguration;
    FImporter: TSchemaImporter;

    function CreateNamespace(const Namespace, Prefix: String): TNamespaceConfiguration;
    function FormatFileName(const UnitConfiguration: TUnitConfiguration): String;
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
    procedure MustLoadTheMainClassPropertyWithTheParameterOfTheConvertFunction;
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
    FMainClass: TTypeClassDefinition;
    FSchemaText: String;
    FNamespace: String;

    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  public
    constructor Create;

    property MainClass: TTypeClassDefinition read FMainClass write FMainClass;
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

function TSchemaImporterTest.FormatFileName(const UnitConfiguration: TUnitConfiguration): String;
begin
  Result := Format('%s\%s.pas', [FConfiguration.OutputFolder, UnitConfiguration.Name]);
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

  FImporter.Import(FConfiguration);

  Assert.AreEqual('my:MyMainClassName', Converter.MainClass.Name);
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
  FImporter := TSchemaImporter.Create;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := TSchemaConverterMock.Create;
end;

procedure TSchemaImporterTest.TearDown;
begin
  FConfiguration.Free;

  FImporter.Free;

  inherited;
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

  Assert.AreEqual(
    '''
    unit MyUnit;

    interface

    type
      TMainModule = class
      end;

    implementation

    end.

    ''',
    TFile.ReadAllText(FormatFileName(FConfiguration.Units[0])));
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

  FImporter.Import(FConfiguration);

  Assert.AreEqual('Prefix:MyMainClassName', Converter.MainClass.Name);
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

procedure TSchemaImporterTest.WhenTheConverterDoesntExistsMustRaiseAnError;
begin
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaConverterNotRegistered);
end;

procedure TSchemaImporterTest.WhenTheMainClassHasTheSameNameInTwoDifferentConfigurationsTheyCannotShareTheSameClassInstance;
begin
  var Converter := TSchemaConverterMock.Create;
  var Converter2 := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI20;
  FConfiguration.Units[1].SchemaFiles[0].MainModuleName := 'MyMainClassName2';
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  TSchemaImporter.Converters[TSchemaType.OpenAPI20] := Converter;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter2;

  FImporter.Import(FConfiguration);

  Assert.IsFalse(Converter.MainClass = Converter2.MainClass);
end;

procedure TSchemaImporterTest.WhenTheNameOfMainClassIsTheSameInAnotherSchemaFileMustUseTheSameClassDeclaration;
begin
  var Converter := TSchemaConverterMock.Create;
  var Converter2 := TSchemaConverterMock.Create;
  FConfiguration.Units[0].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[0].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI30;
  FConfiguration.Units[1].SchemaFiles[0].MainModuleName := 'MyMainClassName';
  FConfiguration.Units[1].SchemaFiles[0].SchemaType := TSchemaType.OpenAPI31;
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := Converter;
  TSchemaImporter.Converters[TSchemaType.OpenAPI31] := Converter2;

  FImporter.Import(FConfiguration);

  Assert.AreEqual(Converter.MainClass, Converter2.MainClass);
end;

procedure TSchemaImporterTest.WhenTheNamespaceDoesntHaveThePrefixNameConfigurationMustRaiseAnError;
begin
  FConfiguration.Namespaces := nil;

  Assert.WillRaise(
    procedure
    begin
      FImporter.Import(FConfiguration);
    end, ESchemaNamespaceWithouConfiguraton);
end;

procedure TSchemaImporterTest.WhenTheUnitHasMoreThanOneClassMustLoadAllClassesInTheUnit;
begin
  FImporter.Import(FConfiguration);

  Assert.AreEqual(
    '''
    unit MyUnit2;

    interface

    type
      TMainModule2 = class
      end;

      TMainModule3 = class
      end;

    implementation

    end.

    ''',
    TFile.ReadAllText(FormatFileName(FConfiguration.Units[1])));
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

procedure TSchemaConverterMockTeste.MustLoadTheMainClassPropertyWithTheParameterOfTheConvertFunction;
begin
  FConverter.Convert(FMainClass, FSchema);

  Assert.AreEqual(FMainClass, FConverterClass.MainClass);
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
  if not Assigned(Schema) then
    raise ESchemaNotLoaded.Create;

  if not Assigned(Schema.SchemaFile) then
    raise ESchemaFileConfigurationMustBeLoaded.Create;

  if not Assigned(MainClass) then
    raise EMainClassMustBeLoaded.Create;

  FMainClass := MainClass;
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
  Schema.Namespace := Namespace;
end;

{ ESchemaFileConfigurationMustBeLoaded }

constructor ESchemaFileConfigurationMustBeLoaded.Create;
begin
  inherited Create('The schema file configuration must be loaded!');
end;

end.

