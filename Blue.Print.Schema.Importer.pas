unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Classes, System.SysUtils, System.Rtti, System.Generics.Collections;

type
  TTypeArrayDefinition = class;
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
  private
    function GetIsClassDefinition: Boolean;
    function GetIsArrayDefinition: Boolean;
  public
    function AsArrayDefinition: TTypeArrayDefinition;
    function AsClassDefinition: TTypeClassDefinition;

    property IsArrayDefinition: Boolean read GetIsArrayDefinition;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
  end;

  TTypeEnumerationDefinition = class(TTypeDefinition)
  private
    FValues: TStringList;
  public
    constructor Create;

    destructor Destroy; override;

    class function CreateEnumeratorList: TStringList;

    procedure AddEnumeration(const Value: String);

    property Values: TStringList read FValues;
  end;

  TTypeArrayDefinition = class(TTypeDefinition)
  private
    FArrayType: TTypeDefinition;
  public
    property ArrayType: TTypeDefinition read FArrayType write FArrayType;
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

  TTypePropertyDefinition = class(TTypeCommonDefinition)
  private
    FPropertyType: TTypeDefinition;
    FOptional: Boolean;
  public
    property Optional: Boolean read FOptional write FOptional;
    property PropertyType: TTypeDefinition read FPropertyType write FPropertyType;
  end;

  TTypeClassDefinition = class(TTypeModuleDefinition)
  private
    FProperties: TArray<TTypePropertyDefinition>;
    function GetHasProperties: Boolean;
  public
    function AddProperty(const Name: String; const PropertyType: TTypeDefinition): TTypePropertyDefinition;

    property HasProperties: Boolean read GetHasProperties;
    property Properties: TArray<TTypePropertyDefinition> read FProperties write FProperties;
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
    FSchemaValue: TValue;
  public
    property Namespace: String read FNamespace write FNamespace;
    property SchemaFile: TSchemaFileConfiguration read FSchemaFile write FSchemaFile;
    property SchemaText: String read FSchemaText write FSchemaText;
    property SchemaValue: TValue read FSchemaValue write FSchemaValue;
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

uses System.IOUtils, System.Character;

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
  const
    SPECIAL_CHARACTER_SCAPE_CHAR = '&';

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

    function FormatName(const Name: String): String;
    begin
      var ReservedNames := ['type', 'mod', 'to', 'if', 'then', 'else', 'type', 'class', 'array', 'object', 'string', 'const', 'not', 'in', 'file', 'is', 'end', 'label'];
      Result := Name.Substring(Succ(Name.IndexOf(TYPE_NAME_SEPARATOR)));

      for var ReservedName in ReservedNames do
        if SameText(Result, ReservedName) then
          Result := SPECIAL_CHARACTER_SCAPE_CHAR + Result;
    end;

    function RemoveSpecialCharacters(const Name: String): String;
    begin
      var NormalChar :=
        function (const Char: Char): Char
        begin
          Result := Char;
        end;
      var UpperChar :=
        function (const Char: Char): Char
        begin
          Result := Char.ToUpper;
        end;

      var FormatChar := UpperChar;

      for var Character in Name do
        if Character.IsLetter or Character.IsNumber or (Character = SPECIAL_CHARACTER_SCAPE_CHAR) then
        begin
          Result := Result + FormatChar(Character);

          FormatChar := NormalChar;
        end
        else
          FormatChar := UpperChar;
    end;

    function FormatTypeName(const TypeDefinition: TTypeDefinition; const GetSubtypeName: Boolean = False): String;

      function CheckSpecialCharacter(const Name: String): String;
      begin
        Result := RemoveSpecialCharacters(Name);

        if not SameText(Result, Name) then
          Result := 'T' + Result;
      end;

      function FormatArrayTypeName(const TypeDefinition: TTypeDefinition): String;
      begin
        Result := FormatTypeName(TypeDefinition.AsArrayDefinition.ArrayType);
      end;

    begin
      if TypeDefinition.IsArrayDefinition then
        if GetSubtypeName then
          Result := FormatArrayTypeName(TypeDefinition)
        else
          Result := Format('TArray<%s>', [FormatArrayTypeName(TypeDefinition)])
      else
        Result := CheckSpecialCharacter(FormatName(TypeDefinition.Name));
    end;

    procedure GenerateEnumerationsDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      if Assigned(ModuleDefinition.Enumerations) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);
        var EnumerationList := TTypeEnumerationDefinition.CreateEnumeratorList;
        var ValueNameChanged := False;

        for var Enumerator in ModuleDefinition.Enumerations do
        begin
          EnumerationList.Clear;

          for var Value in Enumerator.Values do
          begin
            var FormattedValue := FormatName(Value);

            if FormattedValue[1].IsNumber then
              FormattedValue := 't' + FormattedValue;

            ValueNameChanged := ValueNameChanged or not SameText(FormattedValue, Value);
            EnumerationList.Add(FormattedValue);
          end;

          if ValueNameChanged then
            AddLine(CurrentIndentation, '[EnumValue(''%s'')]', [Enumerator.Values.Text]);

          AddLine(CurrentIndentation, '%s = (%s);', [FormatTypeName(Enumerator), EnumerationList.Text]);

          AddWhiteLine;
        end;

        EnumerationList.Free;
      end;
    end;

    function FormatFieldName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := 'F' + RemoveSpecialCharacters(PropertyDefinition.Name);
    end;

    function FormatPropertyName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := FormatName(PropertyDefinition.Name);
    end;

    function NeedGetFunction(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      Result := PropertyDefinition.PropertyType.IsClassDefinition;
    end;

    function NeedSetFunction(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      Result := PropertyDefinition.Optional;
    end;

    function NeedAddFunction(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      Result := PropertyDefinition.PropertyType.IsArrayDefinition and PropertyDefinition.PropertyType.AsArrayDefinition.ArrayType.IsClassDefinition;
    end;

    function FormatGetFunctionName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := 'Get' + FormatPropertyName(PropertyDefinition);
    end;

    function FormatSetFunctionName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := 'Set' + FormatPropertyName(PropertyDefinition);
    end;

    function FormatAddFunctionName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := 'Add' + FormatPropertyName(PropertyDefinition);
    end;

    function FormatPropertyTypeName(const PropertyDefinition: TTypePropertyDefinition; const GetSubtypeName: Boolean = False): String;
    begin
      Result := FormatTypeName(PropertyDefinition.PropertyType, GetSubtypeName);
    end;

    function FormatSetFunctionHeader(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := Format('%s(const Value: %s)', [FormatSetFunctionName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);
    end;

    function FormatPropertyReaderName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      if NeedGetFunction(PropertyDefinition) then
        Result := FormatGetFunctionName(PropertyDefinition)
      else
        Result := FormatFieldName(PropertyDefinition);
    end;

    function FormatPropertyWriterName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      if NeedSetFunction(PropertyDefinition) then
        Result := FormatSetFunctionName(PropertyDefinition)
      else
        Result := FormatFieldName(PropertyDefinition);
    end;

    function FormatStoredFieldName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := Format('%sStored', [FormatFieldName(PropertyDefinition)]);
    end;

    function FormatPropertyStoredName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      if PropertyDefinition.Optional then
        Result := Format(' stored %s', [FormatStoredFieldName(PropertyDefinition)])
      else
        Result := EmptyStr;
    end;

    procedure GenerateFieldsDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if ClassDefinition.HasProperties then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(IndentationLevel, 'private');

        for var PropertyDefinition in ClassDefinition.Properties do
        begin
          AddLine(CurrentIndentation, '%s: %s;', [FormatFieldName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

          if PropertyDefinition.Optional then
            AddLine(CurrentIndentation, '%s: Boolean;', [FormatStoredFieldName(PropertyDefinition)]);
        end;

        for var PropertyDefinition in ClassDefinition.Properties do
        begin
          if NeedGetFunction(PropertyDefinition) then
            AddLine(CurrentIndentation, 'function %s: %s;', [FormatGetFunctionName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

          if NeedSetFunction(PropertyDefinition) then
            AddLine(CurrentIndentation, 'procedure %s;', [FormatSetFunctionHeader(PropertyDefinition)]);
        end;
      end;
    end;

    procedure GeneratePublicFunctions(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);

      function NeedPublicSection: Boolean;
      begin
        for var PropertyDefinition in ClassDefinition.Properties do
          if PropertyDefinition.Optional or NeedAddFunction(PropertyDefinition) then
            Exit(True);

        Result := False;
      end;

    begin
      var CurrentIndentation := Succ(IndentationLevel);

      if NeedPublicSection then
      begin
        AddLine(IndentationLevel, 'public');

        for var PropertyDefinition in ClassDefinition.Properties do
        begin
          if NeedAddFunction(PropertyDefinition) then
            AddLine(CurrentIndentation, 'function %s: %s;', [FormatAddFunctionName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition, True)]);

          if PropertyDefinition.Optional then
            AddLine(CurrentIndentation, 'property Is%sStored: Boolean read %s;', [FormatPropertyName(PropertyDefinition), FormatStoredFieldName(PropertyDefinition)]);
        end;
      end;
    end;

    procedure GeneratePropertiesDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if ClassDefinition.HasProperties then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(IndentationLevel, 'published');

        for var PropertyDefinition in ClassDefinition.Properties do
          AddLine(CurrentIndentation, 'property %s: %s read %s write %s%s;', [FormatPropertyName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition), FormatPropertyReaderName(PropertyDefinition),
            FormatPropertyWriterName(PropertyDefinition), FormatPropertyStoredName(PropertyDefinition)]);
      end;
    end;

    procedure GenerateModuleDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      for var ClassDefinition in ModuleDefinition.Classes do
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(CurrentIndentation, '%s = class', [FormatTypeName(ClassDefinition)]);

        GenerateFieldsDeclaration(CurrentIndentation, ClassDefinition);

        GeneratePublicFunctions(CurrentIndentation, ClassDefinition);

        if ClassDefinition.HasTypes then
        begin
          AddLine(CurrentIndentation, 'public type');

          GenerateEnumerationsDeclaration(CurrentIndentation, ClassDefinition);

          GenerateModuleDeclaration(CurrentIndentation, ClassDefinition);

          RemoveLastLine;
        end;

        GeneratePropertiesDeclaration(CurrentIndentation, ClassDefinition);

        AddLine(CurrentIndentation, 'end;');

        AddWhiteLine;
      end;
    end;

    function ClassNeedImplementationSection(const ClassDefinition: TTypeClassDefinition): Boolean;
    begin
      for var PropertyDefinition in ClassDefinition.Properties do
        if NeedGetFunction(PropertyDefinition) or NeedSetFunction(PropertyDefinition) or NeedAddFunction(PropertyDefinition) then
          Exit(True);

      Result := False;
    end;

    function NeedImplementationSection(const ModuleDefinition: TTypeModuleDefinition): Boolean;
    begin
      Result := False;

      for var ClassDefinition in ModuleDefinition.Classes do
        Result := ClassNeedImplementationSection(ClassDefinition) or NeedImplementationSection(ClassDefinition);
    end;

  const
    INDENTATION_STARTING_LEVEL = 0;

  begin
    var IndentationLevel := INDENTATION_STARTING_LEVEL;
    var UnitFileName := IncludeTrailingPathDelimiter(Configuration.OutputFolder) + UnitDefinition.Name + '.pas';
    UnitFile := TStringList.Create;

    ForceDirectories(ExtractFilePath(UnitFileName));

    AddLine(IndentationLevel, 'unit %s;', [UnitDefinition.Name]);

    AddWhiteLine;

    AddLine(IndentationLevel, 'interface');

    AddWhiteLine;

    AddLine(IndentationLevel, 'type');

    GenerateModuleDeclaration(IndentationLevel, UnitDefinition);

    AddLine(IndentationLevel, 'implementation');

    AddWhiteLine;

    if NeedImplementationSection(UnitDefinition) then
      for var ClassDefinition in UnitDefinition.Classes do
      begin
        AddLine(IndentationLevel, '{ %s }', [FormatTypeName(ClassDefinition)]);

        AddWhiteLine;

        for var PropertyDefinition in ClassDefinition.Properties do
        begin
          if NeedGetFunction(PropertyDefinition) then
          begin
            AddLine(IndentationLevel, 'function %s.%s: %s;', [FormatTypeName(ClassDefinition), FormatGetFunctionName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

            AddLine(IndentationLevel, 'begin');

            AddLine(IndentationLevel, '  if not Assigned(%s) then', [FormatFieldName(PropertyDefinition)]);

            AddLine(IndentationLevel, '    %s := %s.Create;', [FormatFieldName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

            AddWhiteLine;

            AddLine(IndentationLevel, '  Result := %s;', [FormatFieldName(PropertyDefinition)]);

            AddLine(IndentationLevel, 'end;');

            AddWhiteLine;
          end;

          if NeedAddFunction(PropertyDefinition) then
          begin
            AddLine(IndentationLevel, 'function %s.%s: %s;', [FormatTypeName(ClassDefinition), FormatAddFunctionName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition, True)]);

            AddLine(IndentationLevel, 'begin');

            AddLine(IndentationLevel, '  Result := %s.Create;', [FormatPropertyTypeName(PropertyDefinition, True)]);

            AddWhiteLine;

            AddLine(IndentationLevel, '  %0:s := %0:s + [Result];', [FormatFieldName(PropertyDefinition)]);

            AddLine(IndentationLevel, 'end;');

            AddWhiteLine;
          end;

          if NeedSetFunction(PropertyDefinition) then
          begin
            AddLine(IndentationLevel, 'procedure %s.%s;', [FormatTypeName(ClassDefinition), FormatSetFunctionHeader(PropertyDefinition)]);

            AddLine(IndentationLevel, 'begin');

            AddLine(IndentationLevel, '  %s := Value;', [FormatFieldName(PropertyDefinition)]);
            AddLine(IndentationLevel, '  %s := True;', [FormatStoredFieldName(PropertyDefinition)]);

            AddLine(IndentationLevel, 'end;');

            AddWhiteLine;
          end;
        end;
      end;

    AddLine(IndentationLevel, 'end.');

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

function TTypeDefinition.AsArrayDefinition: TTypeArrayDefinition;
begin
  Result := Self as TTypeArrayDefinition;
end;

function TTypeDefinition.AsClassDefinition: TTypeClassDefinition;
begin
  Result := Self as TTypeClassDefinition;
end;

function TTypeDefinition.GetIsArrayDefinition: Boolean;
begin
  Result := Self is TTypeArrayDefinition;
end;

function TTypeDefinition.GetIsClassDefinition: Boolean;
begin
  Result := Self is TTypeClassDefinition;
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
  FValues.Add(Value);
end;

constructor TTypeEnumerationDefinition.Create;
begin
  inherited;

  FValues := CreateEnumeratorList;
end;

class function TTypeEnumerationDefinition.CreateEnumeratorList: TStringList;
const
  ENUMERATION_SEPARATOR = ', ';

begin
  Result := TStringList.Create;
  Result.LineBreak := ENUMERATION_SEPARATOR;
  Result.TrailingLineBreak := False;
end;

destructor TTypeEnumerationDefinition.Destroy;
begin
  FValues.Free;

  inherited;
end;

{ TTypeClassDefinition }

function TTypeClassDefinition.AddProperty(const Name: String; const PropertyType: TTypeDefinition): TTypePropertyDefinition;
begin
  Result := TTypePropertyDefinition.Create;
  Result.Name := Name;
  Result.PropertyType := PropertyType;

  FProperties := FProperties + [Result];
end;

function TTypeClassDefinition.GetHasProperties: Boolean;
begin
  Result := Assigned(FProperties);
end;

end.

