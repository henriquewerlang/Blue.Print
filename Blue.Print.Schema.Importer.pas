unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Classes, System.SysUtils, System.Rtti, System.Generics.Collections;

type
  TSchemaImporter = class;
  TTypeArrayDefinition = class;
  TTypeClassDefinition = class;
  TTypeDefinition = class;
  TTypeEnumerationDefinition = class;
  TTypeModuleDefinition = class;
  TTypePropertyDefinition = class;
  TTypeReferenceDefinition = class;
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

  ESchemaNamespaceWithoutConfiguraton = class(Exception)
  public
    constructor Create(const Namespace: String);
  end;

  ETypeNotFound = class(Exception)
  public
    constructor Create(const TypeName: String);
  end;

  EPropertyWithoutType = class(Exception)
  public
    constructor Create(const PropertyDefinition: TTypePropertyDefinition);
  end;

  ETypeWithoutParentModule = class(Exception)
  public
    constructor Create(const TypeDefinition: TTypeDefinition);
  end;

  TBuildInType = (StringType, IntegerType, DoubleType, DateType, TimeType, DateTimeType, BooleanType, ArrayType, ValueType, DynamicPropertyType);
  TSchemaType = (Undefined, XSD, WSDL, JSONDraft4, OpenAPI20, OpenAPI30, OpenAPI31, OpenAPI32);

  TTypeCommonDefinition = class
  private
    FName: String;
  public
    property Name: String read FName write FName;
  end;

  TTypeDefinition = class(TTypeCommonDefinition)
  private
    FParentModule: TTypeModuleDefinition;

    function GetIsArrayDefinition: Boolean;
    function GetIsClassDefinition: Boolean;
    function GetIsReferenceDefinition: Boolean;
    function GetIsUnitDefinition: Boolean;
    function GetParentModule: TTypeModuleDefinition;
    function GetIsEnumeratorDefinition: Boolean;
  public
    function AsArrayDefinition: TTypeArrayDefinition;
    function AsClassDefinition: TTypeClassDefinition;
    function AsReferenceDefinition: TTypeReferenceDefinition;

    property IsArrayDefinition: Boolean read GetIsArrayDefinition;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property IsEnumeratorDefinition: Boolean read GetIsEnumeratorDefinition;
    property IsReferenceDefinition: Boolean read GetIsReferenceDefinition;
    property IsUnitDefinition: Boolean read GetIsUnitDefinition;
    property ParentModule: TTypeModuleDefinition read GetParentModule write FParentModule;
  end;

  TTypeEnumerationDefinition = class(TTypeDefinition)
  private
    FValues: TStringList;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddEnumeration(const Value: String);

    property Values: TStringList read FValues;
  end;

  TTypeArrayDefinition = class(TTypeDefinition)
  private
    FArrayType: TTypeDefinition;
  public
    property ArrayType: TTypeDefinition read FArrayType;
  end;

  TTypeReferenceDefinition = class(TTypeDefinition)
  private
    FReference: String;
    FNamespace: String;
  public
    property Namespace: String read FNamespace;
    property Reference: String read FReference;
  end;

  TTypeAliasDefinition = class(TTypeDefinition)
  private
    FTypeAlias: TTypeDefinition;
  public
    property TypeAlias: TTypeDefinition read FTypeAlias;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FAlias: TArray<TTypeAliasDefinition>;
    FClasses: TArray<TTypeClassDefinition>;
    FEnumerations: TArray<TTypeEnumerationDefinition>;
    FTypes: TArray<TTypeDefinition>;

    function GetHasTypes: Boolean;
  public
    destructor Destroy; override;

    procedure AddType(const TypeDefinition: TTypeDefinition);

    property Alias: TArray<TTypeAliasDefinition> read FAlias;
    property Classes: TArray<TTypeClassDefinition> read FClasses;
    property Enumerations: TArray<TTypeEnumerationDefinition> read FEnumerations;
    property HasTypes: Boolean read GetHasTypes;
    property Types: TArray<TTypeDefinition> read FTypes write FTypes;
  end;

  TTypePropertyDefinition = class(TTypeCommonDefinition)
  private
    FPropertyType: TTypeDefinition;
    FOptional: Boolean;

    function GetPropertyType: TTypeDefinition;
  public
    property Optional: Boolean read FOptional write FOptional;
    property PropertyType: TTypeDefinition read GetPropertyType write FPropertyType;
  end;

  TTypeClassDefinition = class(TTypeModuleDefinition)
  private
    FProperties: TArray<TTypePropertyDefinition>;

    function GetHasProperties: Boolean;
  public
    destructor Destroy; override;

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
    FImporter: TSchemaImporter;
    FNamespace: String;
    FSchemaText: String;
    FSchemaFile: TSchemaFileConfiguration;
    FSchemaValue: TValue;
  public
    destructor Destroy; override;

    property Importer: TSchemaImporter read FImporter write FImporter;
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
  private
    FBuildInTypes: array[TBuildInType] of TTypeDefinition;
    FBuildInUnits: TList<TTypeUnitDefinition>;
    FNamespaces: TDictionary<String, String>;
    FTypes: TDictionary<String, TTypeDefinition>;
    FUnits: TDictionary<String, TTypeUnitDefinition>;

    class function CreateStringListForItems: TStringList;

    function CreateTypeDefinition<T: TTypeDefinition, constructor>(const ParentModule: TTypeModuleDefinition): T;
    function CreateTypeDefinitionWithName<T: TTypeDefinition, constructor>(const ParentModule: TTypeModuleDefinition; const Name: String): T;
    function FormatTypeName(const Namespace, TypeName: String): String;
    function GetBuildInTypes(const BuildInType: TBuildInType): TTypeDefinition;

    procedure LoadBuildInTypes;
    procedure SetBuildInTypes(const BuildInType: TBuildInType; const Value: TTypeDefinition);
  public
    class var Converters: TConverters;
  public
    constructor Create;

    destructor Destroy; override;

    function CreateAliasType(const ParentModule: TTypeModuleDefinition; const Name: String; const TypeAlias: TTypeDefinition): TTypeAliasDefinition;
    function CreateArrayType(const ParentModule: TTypeModuleDefinition; const ArrayType: TTypeDefinition): TTypeArrayDefinition;
    function CreateClassType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeClassDefinition;
    function CreateEnumeratorType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeEnumerationDefinition;
    function CreateReferenceType(const ParentModule: TTypeModuleDefinition; const Namespace, Reference: String): TTypeReferenceDefinition;
    function FindType(const Namespace, Name: String): TTypeDefinition;
    function GetPrefixName(const Namespace: String): String;
    function TryFindType(const Namespace, Name: String; var TypeDefinition: TTypeDefinition): Boolean;

    procedure AddNamespace(const Name, Prefix: String);
    procedure AddType(const Namespace: String; const TypeDefinition: TTypeDefinition);
    procedure Import(const Configuration: TConfiguration); overload;
    procedure Import(const ConfigurationFileName: String); overload;

    property BuildInTypes[const BuildInType: TBuildInType]: TTypeDefinition read GetBuildInTypes write SetBuildInTypes;
    property Namespaces: TDictionary<String, String> read FNamespaces;
    property Types: TDictionary<String, TTypeDefinition> read FTypes;
    property Units: TDictionary<String, TTypeUnitDefinition> read FUnits;
  end;

implementation

uses System.IOUtils, System.Character, Blue.Print.Types, Blue.Print.Serializer;

const
  SYSTEM_UNIT_NAME = 'System';
  TYPE_NAME_SEPARATOR = '.';
  TYPE_NAMESPACE_SEPARATOR = ':';

{ TSchemaImporter }

procedure TSchemaImporter.AddNamespace(const Name, Prefix: String);
begin
  Namespaces.Add(Name, Prefix);
end;

procedure TSchemaImporter.AddType(const Namespace: String; const TypeDefinition: TTypeDefinition);
begin
  Types.Add(FormatTypeName(Namespace, TypeDefinition.Name), TypeDefinition);
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInUnits := TObjectList<TTypeUnitDefinition>.Create(True);
  FNamespaces := TDictionary<String, String>.Create;
  FTypes := TDictionary<String, TTypeDefinition>.Create;
  FUnits := TObjectDictionary<String, TTypeUnitDefinition>.Create([doOwnsValues]);
end;

function TSchemaImporter.CreateAliasType(const ParentModule: TTypeModuleDefinition; const Name: String; const TypeAlias: TTypeDefinition): TTypeAliasDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeAliasDefinition>(ParentModule, Name);
  Result.FTypeAlias := TypeAlias;

  ParentModule.FAlias := ParentModule.FAlias + [Result];
end;

function TSchemaImporter.CreateArrayType(const ParentModule: TTypeModuleDefinition; const ArrayType: TTypeDefinition): TTypeArrayDefinition;
begin
  Result := CreateTypeDefinition<TTypeArrayDefinition>(ParentModule);
  Result.FArrayType := ArrayType;
end;

function TSchemaImporter.CreateClassType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeClassDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeClassDefinition>(ParentModule, Name);

  ParentModule.FClasses := ParentModule.FClasses + [Result];
end;

function TSchemaImporter.CreateEnumeratorType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeEnumerationDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeEnumerationDefinition>(ParentModule, Name);

  ParentModule.FEnumerations := ParentModule.FEnumerations + [Result];
end;

function TSchemaImporter.CreateReferenceType(const ParentModule: TTypeModuleDefinition; const Namespace, Reference: String): TTypeReferenceDefinition;
begin
  Result := CreateTypeDefinition<TTypeReferenceDefinition>(ParentModule);
  Result.FNamespace := Namespace;
  Result.FReference := Reference;
end;

class function TSchemaImporter.CreateStringListForItems: TStringList;
const
  LIST_SEPARATOR = ', ';

begin
  Result := TStringList.Create;
  Result.LineBreak := LIST_SEPARATOR;
  Result.TrailingLineBreak := False;
end;

function TSchemaImporter.CreateTypeDefinition<T>(const ParentModule: TTypeModuleDefinition): T;
begin
  Result := T.Create;
  Result.FParentModule := ParentModule;

  ParentModule.AddType(Result);
end;

function TSchemaImporter.CreateTypeDefinitionWithName<T>(const ParentModule: TTypeModuleDefinition; const Name: String): T;
begin
  Result := CreateTypeDefinition<T>(ParentModule);
  Result.Name := Name;
end;

destructor TSchemaImporter.Destroy;
begin
  FBuildInUnits.Free;

  FNamespaces.Free;

  FTypes.Free;

  FUnits.Free;

  inherited;
end;

function TSchemaImporter.FindType(const Namespace, Name: String): TTypeDefinition;
begin
  if not TryFindType(Namespace, Name, Result) then
    raise ETypeNotFound.Create(Name);
end;

function TSchemaImporter.FormatTypeName(const Namespace, TypeName: String): String;
begin
  Result := Format('%s:%s', [GetPrefixName(Namespace), TypeName]);
end;

function TSchemaImporter.GetBuildInTypes(const BuildInType: TBuildInType): TTypeDefinition;
begin
  Result := FBuildInTypes[BuildInType];
end;

function TSchemaImporter.GetPrefixName(const Namespace: String): String;
begin
  if not Namespaces.TryGetValue(Namespace, Result) then
    raise ESchemaNamespaceWithoutConfiguraton.Create(Namespace);
end;

procedure TSchemaImporter.Import(const Configuration: TConfiguration);

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
    Result.FName := UnitConfiguration.Name;

    Units.Add(UnitConfiguration.Name, Result);
  end;

  function LoadUnitDefinition(const UnitConfiguration: TUnitConfiguration): TTypeUnitDefinition;
  begin
    if Units.TryGetValue(UnitConfiguration.Name, Result) then
      raise EUnitConfigurationDuplicatedName.Create(UnitConfiguration.Name)
    else
      Result := CreateUnitDefinition(UnitConfiguration);
  end;

  function CreateMainClass(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema; const Name: String): TTypeClassDefinition;
  begin
    Result := CreateClassType(UnitDefinition, Name);

    AddType(Schema.Namespace, Result);
  end;

  function LoadMainClass(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeClassDefinition;
  begin
    var MainModuleName := Schema.SchemaFile.MainModuleName;
    var TypeFound: TTypeDefinition;

    if TryFindType(Schema.Namespace, MainModuleName, TypeFound) then
      Result := TypeFound.AsClassDefinition
    else
      Result := CreateMainClass(UnitDefinition, Schema, MainModuleName);
  end;

  function CreateSchema(const SchemaFile: TSchemaFileConfiguration): TSchema;
  begin
    Result := TSchema.Create;
    Result.FImporter := Self;
    Result.FSchemaFile := SchemaFile;
    Result.FSchemaText := TFile.ReadAllText(SchemaFile.FileName);
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
      Result := Name.Substring(Succ(Name.IndexOf(TYPE_NAMESPACE_SEPARATOR)));

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
      Result := EmptyStr;

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

      function GetReferenceType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
      begin
        var ReferenceDefinition := TypeDefinition.AsReferenceDefinition;

        Result := FindType(ReferenceDefinition.Namespace, ReferenceDefinition.Reference);
      end;

    begin
      if TypeDefinition.IsReferenceDefinition then
        Result := FormatTypeName(GetReferenceType(TypeDefinition), GetSubtypeName)
      else if TypeDefinition.IsArrayDefinition then
        if GetSubtypeName then
          Result := FormatArrayTypeName(TypeDefinition)
        else
          Result := Format('TArray<%s>', [FormatArrayTypeName(TypeDefinition)])
      else
        Result := CheckSpecialCharacter(FormatName(TypeDefinition.Name));
    end;

    function FormatFullTypeName(const TypeDefinition: TTypeDefinition; const GetSubtypeName: Boolean = False): String;

      function GetParentModuleName(const TypeDefinition: TTypeDefinition): String;
      begin
        Result := EmptyStr;

        if not TypeDefinition.IsUnitDefinition and Assigned(TypeDefinition.ParentModule) then
          Result := GetParentModuleName(TypeDefinition.ParentModule) + TypeDefinition.ParentModule.Name + TYPE_NAME_SEPARATOR;
      end;

    begin
      Result := GetParentModuleName(TypeDefinition) + FormatTypeName(TypeDefinition, GetSubtypeName);
    end;

    function FormaClassName(const ClassDefinition: TTypeClassDefinition): String;
    begin
      Result := FormatTypeName(ClassDefinition);
    end;

    procedure GenerateEnumerationsDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      if Assigned(ModuleDefinition.Enumerations) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);
        var EnumerationList := CreateStringListForItems;
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
      Result := FormatFullTypeName(PropertyDefinition.PropertyType, GetSubtypeName);
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

    procedure GenerateAliasDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if Assigned(ClassDefinition.Alias) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        for var AliasType in ClassDefinition.Alias do
          AddLine(CurrentIndentation, '%s = %s;', [AliasType.Name, FormatFullTypeName(AliasType.TypeAlias, False)]);

        AddWhiteLine;
      end;
    end;

    procedure GenerateForwardClassesDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      if Assigned(ModuleDefinition.Classes) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        for var ClassDefinition in ModuleDefinition.Classes do
          AddLine(CurrentIndentation, '%s = class;', [FormaClassName(ClassDefinition)]);

        AddWhiteLine;
      end;
    end;

    procedure GenerateModuleDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      var CurrentIndentation := Succ(IndentationLevel);

      for var ClassDefinition in ModuleDefinition.Classes do
      begin
        AddLine(CurrentIndentation, '%s = class', [FormaClassName(ClassDefinition)]);

        if ClassDefinition.HasTypes then
        begin
          AddLine(CurrentIndentation, 'public type');

          GenerateEnumerationsDeclaration(CurrentIndentation, ClassDefinition);

          GenerateForwardClassesDeclaration(CurrentIndentation, ClassDefinition);

          GenerateAliasDeclaration(CurrentIndentation, ClassDefinition);

          GenerateModuleDeclaration(CurrentIndentation, ClassDefinition);

          RemoveLastLine;
        end;

        GenerateFieldsDeclaration(CurrentIndentation, ClassDefinition);

        GeneratePublicFunctions(CurrentIndentation, ClassDefinition);

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

    procedure AddUsesList(const IndentationLevel: Integer);
    var
      UsesList: TStringList;

      procedure CheckUses(const Module: TTypeModuleDefinition);
      begin
        var ParentModule: TTypeModuleDefinition;

        for var ClassDefinition in Module.Classes do
          for var PropertyDefinition in ClassDefinition.Properties do
          begin
            ParentModule := PropertyDefinition.PropertyType.ParentModule;

            if ParentModule.IsUnitDefinition and (SYSTEM_UNIT_NAME <> ParentModule.Name) and (ParentModule <> UnitDefinition) then
              UsesList.Add(ParentModule.Name);
          end;
      end;

    begin
      UsesList := CreateStringListForItems;
      UsesList.Duplicates := dupIgnore;
      UsesList.Sorted := True;

      try
        CheckUses(UnitDefinition);

        if not UsesList.IsEmpty then
        begin
          AddLine(IndentationLevel, 'uses %s;', [UsesList.Text]);

          AddWhiteLine;
        end;
      finally
        UsesList.Free;
      end;
    end;

    procedure LoadCompilerDirectives(const IndentationLevel: Integer);

      function CheckEnumerationDeclarations(const ParentModule: TTypeModuleDefinition): Boolean;
      begin
        Result := Assigned(ParentModule.Enumerations);

        if not Result then
          for var ClassDefinition in ParentModule.Classes do
            if CheckEnumerationDeclarations(ClassDefinition) then
              Exit(True);
      end;

      function HasEnumerationDeclarations: Boolean;
      begin
        Result := CheckEnumerationDeclarations(UnitDefinition);
      end;

    begin
      AddLine(IndentationLevel, '{$M+}');

      if HasEnumerationDeclarations then
        AddLine(IndentationLevel, '{$SCOPEDENUMS ON}');

      AddWhiteLine;
    end;

  const
    INDENTATION_STARTING_LEVEL = 0;

  begin
    var IndentationLevel := INDENTATION_STARTING_LEVEL;
    var UnitFileName := IncludeTrailingPathDelimiter(Configuration.OutputFolder) + UnitDefinition.Name + '.pas';
    UnitFile := TStringList.Create;

    try
      ForceDirectories(ExtractFilePath(UnitFileName));

      AddLine(IndentationLevel, 'unit %s;', [UnitDefinition.Name]);

      AddWhiteLine;

      AddLine(IndentationLevel, 'interface');

      AddWhiteLine;

      LoadCompilerDirectives(IndentationLevel);

      AddUsesList(IndentationLevel);

      AddLine(IndentationLevel, 'type');

      GenerateForwardClassesDeclaration(IndentationLevel, UnitDefinition);

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
    finally
      UnitFile.Free;
    end;
  end;

begin
  CheckConfiguration;

  LoadBuildInTypes;

  for var Namespace in Configuration.Namespaces do
    AddNamespace(Namespace.Namespace, Namespace.Prefix);

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
end;

procedure TSchemaImporter.Import(const ConfigurationFileName: String);

  function GetSerializer: IBluePrintSerializer;
  begin
    Result := TBluePrintJSONSerializer.Create;
  end;

begin
  var Configuration := GetSerializer.Deserialize(TFile.ReadAllText(ConfigurationFileName), TypeInfo(TConfiguration)).AsType<TConfiguration>;

  Import(Configuration);

  Configuration.Free;
end;

procedure TSchemaImporter.LoadBuildInTypes;
const
  BUILD_IN_TYPE_NAMES: array[TBuildInType] of String = ('String', 'Integer', 'Double', 'TDate', 'TTime', 'TDateTime', 'Boolean', 'TArray<%s>', 'TValue', 'TDynamicProperty<%s>');
  BUILD_IN_TYPE_NAMESPACE = 'Blue Print Buildin Types';
  SYSTEM_BLUE_PRINT_TYPES_UNIT_NAME = 'Blue.Print.Types';
  SYSTEM_RTTI_UNIT_NAME = 'System.Rtti';

  procedure AddBuildInTypes(const UnitDefinition: TTypeUnitDefinition; const BuildInTypeList: TArray<TBuildInType>);
  begin
    for var BuildInType in BuildInTypeList do
    begin
      var TypeDefinition := TTypeDefinition.Create;
      TypeDefinition.FParentModule := UnitDefinition;
      TypeDefinition.Name := BUILD_IN_TYPE_NAMES[BuildInType];

      BuildInTypes[BuildInType] := TypeDefinition;

      UnitDefinition.AddType(TypeDefinition);

      AddType(BUILD_IN_TYPE_NAMESPACE, TypeDefinition);
    end;
  end;

  function CreateUnit(const Name: String): TTypeUnitDefinition;
  begin
    Result := TTypeUnitDefinition.Create;
    Result.Name := Name;

    FBuildInUnits.Add(Result);
  end;

begin
  AddNamespace(BUILD_IN_TYPE_NAMESPACE, BUILD_IN_TYPE_NAMESPACE);

  AddBuildInTypes(CreateUnit(SYSTEM_UNIT_NAME), [TBuildInType.StringType, TBuildInType.IntegerType, TBuildInType.DoubleType, TBuildInType.DateType, TBuildInType.TimeType, TBuildInType.DateTimeType, TBuildInType.BooleanType,
    TBuildInType.ArrayType]);

  AddBuildInTypes(CreateUnit(SYSTEM_RTTI_UNIT_NAME), [TBuildInType.ValueType]);

  AddBuildInTypes(CreateUnit(SYSTEM_BLUE_PRINT_TYPES_UNIT_NAME), [TBuildInType.DynamicPropertyType]);
end;

procedure TSchemaImporter.SetBuildInTypes(const BuildInType: TBuildInType; const Value: TTypeDefinition);
begin
  FBuildInTypes[BuildInType] := Value;
end;

function TSchemaImporter.TryFindType(const Namespace, Name: String; var TypeDefinition: TTypeDefinition): Boolean;
begin
  Result := Types.TryGetValue(FormatTypeName(Namespace, Name), TypeDefinition);
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

function TTypeDefinition.AsReferenceDefinition: TTypeReferenceDefinition;
begin
  Result := Self as TTypeReferenceDefinition;
end;

function TTypeDefinition.GetIsArrayDefinition: Boolean;
begin
  Result := Self is TTypeArrayDefinition;
end;

function TTypeDefinition.GetIsClassDefinition: Boolean;
begin
  Result := Self is TTypeClassDefinition;
end;

function TTypeDefinition.GetIsEnumeratorDefinition: Boolean;
begin
  Result := Self is TTypeEnumerationDefinition;
end;

function TTypeDefinition.GetIsReferenceDefinition: Boolean;
begin
  Result := Self is TTypeReferenceDefinition;
end;

function TTypeDefinition.GetIsUnitDefinition: Boolean;
begin
  Result := Self is TTypeUnitDefinition;
end;

function TTypeDefinition.GetParentModule: TTypeModuleDefinition;
begin
  if Assigned(FParentModule) then
    Result := FParentModule
  else
    raise ETypeWithoutParentModule.Create(Self);
end;

{ ESchemaNamespaceNotLoaded }

constructor ESchemaNamespaceNotLoaded.Create;
begin
  inherited Create('Must load the namespace information in the schema class!');
end;

{ ESchemaNamespaceWithoutConfiguraton }

constructor ESchemaNamespaceWithoutConfiguraton.Create(const Namespace: String);
begin
  inherited CreateFmt('The namespace %s doesn''t have prefix configuration, must configurate the "Namespaces" configuration!', [Namespace]);
end;

{ TTypeModuleDefinition }

procedure TTypeModuleDefinition.AddType(const TypeDefinition: TTypeDefinition);
begin
  FTypes := FTypes + [TypeDefinition];
end;

destructor TTypeModuleDefinition.Destroy;
begin
  for var TypeDefinition in Types do
    TypeDefinition.Free;

  inherited;
end;

function TTypeModuleDefinition.GetHasTypes: Boolean;
begin
  Result := Assigned(Classes) or Assigned(Enumerations) or Assigned(Alias);
end;

{ TTypeEnumerationDefinition }

procedure TTypeEnumerationDefinition.AddEnumeration(const Value: String);
begin
  FValues.Add(Value);
end;

constructor TTypeEnumerationDefinition.Create;
begin
  inherited;

  FValues := TSchemaImporter.CreateStringListForItems;
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

destructor TTypeClassDefinition.Destroy;
begin
  for var PropertyDefinition in Properties do
    PropertyDefinition.Free;

  inherited;
end;

function TTypeClassDefinition.GetHasProperties: Boolean;
begin
  Result := Assigned(FProperties);
end;

{ TSchema }

destructor TSchema.Destroy;
begin
  if SchemaValue.IsObjectInstance then
    SchemaValue.AsObject.Free;

  inherited;
end;

{ ETypeNotFound }

constructor ETypeNotFound.Create(const TypeName: String);
begin
  inherited CreateFmt('Type with the name "%s" not found!', [TypeName]);
end;

{ EPropertyWithoutType }

constructor EPropertyWithoutType.Create(const PropertyDefinition: TTypePropertyDefinition);
begin
  inherited CreateFmt('The property "%s" in the class "%s" hasn''t the type loaded!', [PropertyDefinition.Name, '']);
end;

{ TTypePropertyDefinition }

function TTypePropertyDefinition.GetPropertyType: TTypeDefinition;
begin
  if Assigned(FPropertyType) then
    Result := FPropertyType
  else
    raise EPropertyWithoutType.Create(Self);
end;

{ ETypeWithoutParentModule }

constructor ETypeWithoutParentModule.Create(const TypeDefinition: TTypeDefinition);
begin
  inherited CreateFmt('The type "%s" doesn''t have the parent module loaded!', [TypeDefinition.Name]);
end;

end.

