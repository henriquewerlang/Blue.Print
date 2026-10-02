unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.SysUtils, System.Rtti, System.Generics.Collections;

type
  TTypeClassDefinition = class;
  TUnitConfiguration = class;

  ENeedConfiguration = class(Exception)
  public
    constructor Create;
  end;

  ENeedUnitsConfiguration = class(Exception)
  public
    constructor Create;
  end;

  EUnitConfigurationWithoutName = class(Exception)
  public
    constructor Create;
  end;

  EUnitConfigurationWithoutSchemaFiles = class(Exception)
  public
    constructor Create(const UnitConfiguration: TUnitConfiguration);
  end;

  EUnitConfigurationDuplicatedName = class(Exception)
  public
    constructor Create(const Name: String);
  end;

  ESchemaFileConfigurationWithoutSchemaType = class(Exception)
  public
    constructor Create(const UnitConfiguration: TUnitConfiguration);
  end;

  ESchemaFileConfigurationWithoutFileName = class(Exception)
  public
    constructor Create(const UnitConfiguration: TUnitConfiguration);
  end;

  ESchemaFileConfigurationWithoutMainModuleName = class(Exception)
  public
    constructor Create(const UnitConfiguration: TUnitConfiguration);
  end;

  ESchemaConverterNotRegistered = class(Exception)
  public
    constructor Create;
  end;

  ESchemaNamespaceNotLoaded = class(Exception)
  public
    constructor Create;
  end;

  ESchemaNamespaceWithouConfiguraton = class(Exception)
  public
    constructor Create(const Namespace: String);
  end;

  TSchemaType = (Undefined, XSD, WSDL, OpenAPI20, OpenAPI30, OpenAPI31, OpenAPI32);

  TTypeCommonDefinition = class
  private
    FName: String;
  public
    property Name: String read FName write FName;
  end;

  TTypeDefinition = class(TTypeCommonDefinition)
  public
    function AsClassDefinition: TTypeClassDefinition;
  end;

  TTypeEnumerationDefinition = class(TTypeDefinition)
  private
    FValues: TArray<String>;
  public
    procedure AddEnumeration(const Value: String);

    property Values: TArray<String> read FValues;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FClasses: TArray<TTypeClassDefinition>;
    FEnumerations: TArray<TTypeEnumerationDefinition>;

    function GetHasTypes: Boolean;
  public
    destructor Destroy; override;

    procedure AddClassDefinition(const ClassDefinition: TTypeClassDefinition);
    procedure AddEnumerationDefinition(const EnumerationDefinition: TTypeEnumerationDefinition);

    property Classes: TArray<TTypeClassDefinition> read FClasses;
    property Enumerations: TArray<TTypeEnumerationDefinition> read FEnumerations;
    property HasTypes: Boolean read GetHasTypes;
  end;

  TTypeClassDefinition = class(TTypeModuleDefinition)
  end;

  TTypeUnitDefinition = class(TTypeModuleDefinition)
  end;

  TSchemaFileConfiguration = class
  private
    FSchemaType: TSchemaType;
    FFileName: String;
    FMainModuleName: String;
  published
    property SchemaType: TSchemaType read FSchemaType write FSchemaType;
    property FileName: String read FFileName write FFileName;
    property MainModuleName: String read FMainModuleName write FMainModuleName;
  end;

  TUnitConfiguration = class
  private
    FName: String;
    FSchemaFiles: TArray<TSchemaFileConfiguration>;
  public
    destructor Destroy; override;
  published
    property Name: String read FName write FName;
    property SchemaFiles: TArray<TSchemaFileConfiguration> read FSchemaFiles write FSchemaFiles;
  end;

  TNamespaceConfiguration = class
  private
    FNamespace: String;
    FPrefix: String;
  published
    property Namespace: String read FNamespace write FNamespace;
    property Prefix: String read FPrefix write FPrefix;
  end;

  TConfiguration = class
  private
    FNamespaces: TArray<TNamespaceConfiguration>;
    FUnits: TArray<TUnitConfiguration>;
    FOutputFolder: String;
  public
    destructor Destroy; override;
  published
    property Namespaces: TArray<TNamespaceConfiguration> read FNamespaces write FNamespaces;
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property Units: TArray<TUnitConfiguration> read FUnits write FUnits;
  end;

  TSchema = class
  private
    FNamespace: String;
    FSchemaText: String;
    FSchemaFile: TSchemaFileConfiguration;
  public
    property Namespace: String read FNamespace write FNamespace;
    property SchemaFile: TSchemaFileConfiguration read FSchemaFile write FSchemaFile;
    property SchemaText: String read FSchemaText write FSchemaText;
  end;

  ISchemaConverter = interface
    procedure Convert(const MainClass: TTypeClassDefinition; const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

  TConverters = array[TSchemaType] of ISchemaConverter;

  TSchemaImporter = class
  public
    class var Converters: TConverters;

    procedure Import(const Configuration: TConfiguration); overload;
    procedure Import(const ConfigurationFileName: String); overload;
  end;

implementation

uses System.IOUtils, System.Classes;

{ TSchemaImporter }

procedure TSchemaImporter.Import(const Configuration: TConfiguration);
const
  TYPE_NAME_SEPARATOR = ':';
var
  Namespaces: TDictionary<String, String>;
  Types: TDictionary<String, TTypeDefinition>;
  Units: TDictionary<String, TTypeUnitDefinition>;

  procedure VerifyConfiguration(const Check: Boolean; const Exception: Exception);
  begin
    if Check then
      Exception.Free
    else
      raise Exception;
  end;

  procedure CheckConfiguration;
  begin
    VerifyConfiguration(Assigned(Configuration), ENeedConfiguration.Create);

    VerifyConfiguration(Assigned(Configuration.Units), ENeedUnitsConfiguration.Create);

    for var UnitConfiguration in Configuration.Units do
    begin
      VerifyConfiguration(not UnitConfiguration.Name.IsEmpty, EUnitConfigurationWithoutName.Create);

      VerifyConfiguration(Assigned(UnitConfiguration.SchemaFiles), EUnitConfigurationWithoutSchemaFiles.Create(UnitConfiguration));

      for var SchemaFile in UnitConfiguration.SchemaFiles do
      begin
        VerifyConfiguration(SchemaFile.SchemaType <> TSchemaType.Undefined, ESchemaFileConfigurationWithoutSchemaType.Create(UnitConfiguration));

        VerifyConfiguration(not SchemaFile.FileName.IsEmpty, ESchemaFileConfigurationWithoutFileName.Create(UnitConfiguration));

        VerifyConfiguration(not SchemaFile.MainModuleName.IsEmpty, ESchemaFileConfigurationWithoutMainModuleName.Create(UnitConfiguration));

        VerifyConfiguration(Assigned(Converters[SchemaFile.SchemaType]), ESchemaConverterNotRegistered.Create);
      end;
    end;
  end;

  function CreateUnitDefinition(const UnitConfiguration: TUnitConfiguration): TTypeUnitDefinition;
  begin
    Result := TTypeUnitDefinition.Create;
    Result.Name := UnitConfiguration.Name;

    Units.Add(UnitConfiguration.Name, Result);
  end;

  function LoadUnitDefinition(const UnitConfiguration: TUnitConfiguration): TTypeUnitDefinition;
  begin
    if Units.TryGetValue(UnitConfiguration.Name, Result) then
      raise EUnitConfigurationDuplicatedName.Create(UnitConfiguration.Name)
    else
      Result := CreateUnitDefinition(UnitConfiguration);
  end;

  function CreateMainClass(const UnitDefinition: TTypeUnitDefinition; const Name: String): TTypeClassDefinition;
  begin
    Result := TTypeClassDefinition.Create;
    Result.Name := Name;

    UnitDefinition.AddClassDefinition(Result);

    Types.Add(Name, Result);
  end;

  function GetNamespacePrefix(const Schema: TSchema): String;
  begin
    if not Namespaces.TryGetValue(Schema.Namespace, Result) then
      raise ESchemaNamespaceWithouConfiguraton.Create(Schema.Namespace);
  end;

  function MakeTypeName(const Prefix, Name: String): String;
  begin
    Result := Prefix + TYPE_NAME_SEPARATOR + Name;
  end;

  function LoadMainClass(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeClassDefinition;
  begin
    var Name := MakeTypeName(GetNamespacePrefix(Schema), Schema.SchemaFile.MainModuleName);

    if Types.ContainsKey(Name) then
      Result := Types[Name].AsClassDefinition
    else
      Result := CreateMainClass(UnitDefinition, Name);
  end;

  function CreateSchema(const SchemaFile: TSchemaFileConfiguration): TSchema;
  begin
    Result := TSchema.Create;
    Result.SchemaFile := SchemaFile;
    Result.SchemaText := TFile.ReadAllText(SchemaFile.FileName);
  end;

  procedure CheckSchema(const Schema: TSchema);
  begin
    if Schema.Namespace.IsEmpty then
      raise ESchemaNamespaceNotLoaded.Create;
  end;

  procedure GenerateUnitDeclaration(const UnitDefinition: TTypeUnitDefinition);
  var
    UnitFile: TStringList;

    procedure AddLine(const IndentationLevel: Integer; const Line: String); overload;

      function Indentation(const Level: Integer): String;
      const
        INDENTATION_SIZE = 2;
        WHITE_SPACE = ' ';

      begin
        Result := StringOfChar(WHITE_SPACE, Level * INDENTATION_SIZE);
      end;

    begin
      UnitFile.Add(Indentation(IndentationLevel) + Line);
    end;

    procedure AddLine(const IndentationLevel: Integer; const Line: String; Args: array of const); overload;
    begin
      AddLine(IndentationLevel, Format(Line, Args));
    end;

    procedure AddWhiteLine;
    const
      NO_IDENTATION_LEVEL = 0;

    begin
      AddLine(NO_IDENTATION_LEVEL, EmptyStr);
    end;

    procedure RemoveLastLine;
    begin
      UnitFile.Delete(Pred(UnitFile.Count));
    end;

    function FormatTypeName(const TypeDefinition: TTypeDefinition): String;
    begin
      Result := TypeDefinition.Name.Substring(Succ(TypeDefinition.Name.IndexOf(TYPE_NAME_SEPARATOR)));
    end;

    procedure GenerateEnumerationsDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    const
      ENUMERATION_SEPARATOR = ', ';

    begin
      if Assigned(ModuleDefinition.Enumerations) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);
        var EnumerationList := TStringList.Create;
        EnumerationList.LineBreak := ENUMERATION_SEPARATOR;
        EnumerationList.TrailingLineBreak := False;

        for var Enumerator in ModuleDefinition.Enumerations do
        begin
          EnumerationList.Clear;

          EnumerationList.AddStrings(Enumerator.Values);

          AddLine(CurrentIndentation, '%s = (%s);', [FormatTypeName(Enumerator), EnumerationList.Text]);

          AddWhiteLine;
        end;

        EnumerationList.Free;
      end;
    end;

    procedure GenerateModuleDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      for var ClassDefinition in ModuleDefinition.Classes do
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(CurrentIndentation, '%s = class', [FormatTypeName(ClassDefinition)]);

        if ClassDefinition.HasTypes then
        begin
          AddLine(CurrentIndentation, 'public type');

          GenerateEnumerationsDeclaration(CurrentIndentation, ClassDefinition);

          GenerateModuleDeclaration(CurrentIndentation, ClassDefinition);

          RemoveLastLine;
        end;

        AddLine(CurrentIndentation, 'end;');

        AddWhiteLine;
      end;
    end;

  const
    INDENTATION_STARTING_LEVEL = 0;

  begin
    var UnitFileName := IncludeTrailingPathDelimiter(Configuration.OutputFolder) + UnitDefinition.Name + '.pas';
    UnitFile := TStringList.Create;

    ForceDirectories(ExtractFilePath(UnitFileName));

    AddLine(INDENTATION_STARTING_LEVEL, 'unit %s;', [UnitDefinition.Name]);

    AddWhiteLine;

    AddLine(INDENTATION_STARTING_LEVEL, 'interface');

    AddWhiteLine;

    AddLine(INDENTATION_STARTING_LEVEL, 'type');

    GenerateModuleDeclaration(INDENTATION_STARTING_LEVEL, UnitDefinition);

    AddLine(INDENTATION_STARTING_LEVEL, 'implementation');

    AddWhiteLine;

    AddLine(INDENTATION_STARTING_LEVEL, 'end.');

    UnitFile.SaveToFile(UnitFileName, TEncoding.UTF8);

    UnitFile.Free;
  end;

begin
  CheckConfiguration;

  Namespaces := TDictionary<String, String>.Create;
  Types := TDictionary<String, TTypeDefinition>.Create;
  Units := TObjectDictionary<String, TTypeUnitDefinition>.Create([doOwnsValues]);

  for var Namespace in Configuration.Namespaces do
    Namespaces.Add(Namespace.Namespace, Namespace.Prefix);

  try
    for var UnitConfiguration in Configuration.Units do
    begin
      var UnitDefinition := LoadUnitDefinition(UnitConfiguration);

      for var SchemaFile in UnitConfiguration.SchemaFiles do
      begin
        var Schema := CreateSchema(SchemaFile);
        var SchemaConverter := Converters[SchemaFile.SchemaType];

        try
          SchemaConverter.LoadSchema(Schema);

          CheckSchema(Schema);

          SchemaConverter.Convert(LoadMainClass(UnitDefinition, Schema), Schema);
        finally
          Schema.Free;
        end;
      end;
    end;

    for var UnitDefinition in Units.Values do
      GenerateUnitDeclaration(UnitDefinition);
  finally
    Namespaces.Free;

    Types.Free;

    Units.Free;
  end;
end;

procedure TSchemaImporter.Import(const ConfigurationFileName: String);
begin

end;

{ ENeedConfiguration }

constructor ENeedConfiguration.Create;
begin
  inherited Create('To import a schema must load the configuration first!');
end;

{ ENeedUnitsConfiguration }

constructor ENeedUnitsConfiguration.Create;
begin
  inherited Create('To import a schema must load the units configuration!');
end;

{ EUnitConfigurationWithoutName }

constructor EUnitConfigurationWithoutName.Create;
begin
  inherited Create('The unit configuration must have a name!');
end;

{ TConfiguration }

destructor TConfiguration.Destroy;
begin
  for var UnitConfiguration in Units do
    UnitConfiguration.Free;

  for var Namespace in Namespaces do
    Namespace.Free;

  inherited;
end;

{ EUnitConfigurationWithoutSchemaFiles }

constructor EUnitConfigurationWithoutSchemaFiles.Create(const UnitConfiguration: TUnitConfiguration);
begin
  inherited CreateFmt('The unit %s don''t have the schema files configured!', [UnitConfiguration.Name]);
end;

{ ESchemaFileConfigurationWithoutSchemaType }

constructor ESchemaFileConfigurationWithoutSchemaType.Create(const UnitConfiguration: TUnitConfiguration);
begin
  inherited CreateFmt('The unit %s don''t have the schema type loaded!', [UnitConfiguration.Name]);
end;

{ TUnitConfiguration }

destructor TUnitConfiguration.Destroy;
begin
  for var SchemaFile in SchemaFiles do
    SchemaFile.Free;

  inherited;
end;

{ ESchemaFileConfigurationWithoutFileName }

constructor ESchemaFileConfigurationWithoutFileName.Create(const UnitConfiguration: TUnitConfiguration);
begin
  inherited CreateFmt('The unit %s don''t have the schema file name loaded!', [UnitConfiguration.Name]);
end;

{ ESchemaFileConfigurationWithoutMainModuleName }

constructor ESchemaFileConfigurationWithoutMainModuleName.Create(const UnitConfiguration: TUnitConfiguration);
begin
  inherited CreateFmt('The unit %s don''t have the main module name loaded!', [UnitConfiguration.Name]);
end;

{ ESchemaConverterNotRegistered }

constructor ESchemaConverterNotRegistered.Create;
begin
  inherited Create('Converter not registered!');
end;

{ EUnitConfigurationDuplicatedName }

constructor EUnitConfigurationDuplicatedName.Create(const Name: String);
begin
  inherited CreateFmt('Unit with name %s is duplicated!', [Name]);
end;

{ TTypeDefinition }

function TTypeDefinition.AsClassDefinition: TTypeClassDefinition;
begin
  Result := Self as TTypeClassDefinition;
end;

{ ESchemaNamespaceNotLoaded }

constructor ESchemaNamespaceNotLoaded.Create;
begin
  inherited Create('Must load the namespace information in the schema class!');
end;

{ ESchemaNamespaceWithouConfiguraton }

constructor ESchemaNamespaceWithouConfiguraton.Create(const Namespace: String);
begin
  inherited CreateFmt('The namespace %s doesn''t have prefix configuration, must configurate the "Namespaces" configuration!', [Namespace]);
end;

{ TTypeModuleDefinition }

procedure TTypeModuleDefinition.AddClassDefinition(const ClassDefinition: TTypeClassDefinition);
begin
  FClasses := FClasses + [ClassDefinition];
end;

procedure TTypeModuleDefinition.AddEnumerationDefinition(const EnumerationDefinition: TTypeEnumerationDefinition);
begin
  FEnumerations := FEnumerations + [EnumerationDefinition];
end;

destructor TTypeModuleDefinition.Destroy;
begin
  for var ClassDefinition in Classes do
    ClassDefinition.Free;

  for var EnumerationDefinition in Enumerations do
    EnumerationDefinition.Free;

  inherited;
end;

function TTypeModuleDefinition.GetHasTypes: Boolean;
begin
  Result := Assigned(Classes) or Assigned(Enumerations);
end;

{ TTypeEnumerationDefinition }

procedure TTypeEnumerationDefinition.AddEnumeration(const Value: String);
begin
  FValues := FValues + [Value];
end;

end.

