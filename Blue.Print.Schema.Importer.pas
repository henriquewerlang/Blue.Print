unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Generics.Collections, Xml.XMLSchema, Blue.Print.JSON.Schema, Blue.Print.Types;

type
  TClassDefinition = class;
  TSchemaImporter = class;
  TTypeAlias = class;
  TTypeArrayDefinition = class;
  TTypeDefinition = class;
  TTypeDelayed = class;
  TTypeEnumeration = class;
  TTypeExternal = class;
  TTypeModuleDefinition = class;
  TUnitDefinition = class;
  TXSDImporter = class;

  TImplementationInformation = (NeedDestructor, NeedGetFunction, NeedAddFunction, NeedIsStoredFunction);
  TImplementationInformations = set of TImplementationInformation;

  TUnitFileConfiguration = class
  private
    FUnitClassName: String;
    FReference: String;
  public
    property Reference: String read FReference write FReference;
    property UnitClassName: String read FUnitClassName write FUnitClassName;
  end;

  TUnitDefinitionConfiguration = class
  private
    FName: String;
    FFiles: TArray<TUnitFileConfiguration>;
  public
    destructor Destroy; override;

    property Files: TArray<TUnitFileConfiguration> read FFiles write FFiles;
    property Name: String read FName write FName;
  end;

  TTypeDefinitionConfiguration = class
  private
    FName: String;
    FAttribute: String;
    FModuleName: String;
    FInheritance: String;
    FChangeType: String;
    FParentAttribute: String;
  public
    property Name: String read FName write FName;
    property Attribute: String read FAttribute write FAttribute;
    property ChangeType: String read FChangeType write FChangeType;
    property Inheritance: String read FInheritance write FInheritance;
    property ModuleName: String read FModuleName write FModuleName;
    property ParentAttribute: String read FParentAttribute write FParentAttribute;
  end;

  TConfiguration = class
  private
    FOutputFolder: String;
    FSchemaFolder: String;
    FUnitConfiguration: TArray<TUnitDefinitionConfiguration>;
    FTypeDefinition: TArray<TTypeDefinitionConfiguration>;
    FMaxColumnSize: Integer;
  public
    constructor Create;

    destructor Destroy; override;

    property MaxColumnSize: Integer read FMaxColumnSize write FMaxColumnSize;
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeDefinition: TArray<TTypeDefinitionConfiguration> read FTypeDefinition write FTypeDefinition;
    property UnitConfiguration: TArray<TUnitDefinitionConfiguration> read FUnitConfiguration write FUnitConfiguration;
  end;

  TPropertyDefinition = class
  private
    FAttributes: TList<String>;
    FInformations: TImplementationInformations;
    FName: String;
    FOptional: Boolean;
    FPropertyType: TTypeDefinition;

    function GetNeedAddFunction: Boolean;
    function GetNeedDestructor: Boolean;
    function GetNeedGetFunction: Boolean;
    function GetNeedIsStoredFunction: Boolean;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddAtribute(const Attribute: String); overload;
    procedure AddAtribute(const Attribute: String; const Params: array of const); overload;
    procedure AddFieldAttribute(const Name: String);
    procedure AddXMLAttributeFixed(const Name, Value: String);
    procedure AddXMLAttributeValue;
    procedure AddXMLValueAttribute;

    property Attributes: TList<String> read FAttributes write FAttributes;
    property Informations: TImplementationInformations read FInformations write FInformations;
    property Name: String read FName write FName;
    property NeedAddFunction: Boolean read GetNeedAddFunction;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property NeedGetFunction: Boolean read GetNeedGetFunction;
    property NeedIsStoredFunction: Boolean read GetNeedIsStoredFunction;
    property Optional: Boolean read FOptional write FOptional;
    property PropertyType: TTypeDefinition read FPropertyType write FPropertyType;
  end;

  TTypeDefinition = class
  private
    FAttributes: TList<String>;
    FIsNumericType: Boolean;
    FIsObjectType: Boolean;
    FIsStringType: Boolean;
    FName: String;
    FParentAttributes: TList<String>;
    FParentModule: TTypeModuleDefinition;

    function GetAsArrayType: TTypeArrayDefinition;
    function GetAsClassDefinition: TClassDefinition;
    function GetAsDelayedType: TTypeDelayed;
    function GetAsTypeEnumeration: TTypeEnumeration;
    function GetAsTypeExternal: TTypeExternal;
    function GetAsUnitDefinition: TUnitDefinition;
    function GetIsArrayType: Boolean;
    function GetIsClassDefinition: Boolean;
    function GetIsDelayedType: Boolean;
    function GetIsEnumeration: Boolean;
    function GetIsExternal: Boolean;
    function GetIsTypeAlias: Boolean;
    function GetIsUnitDefinition: Boolean;
    function GetAsTypeAlias: TTypeAlias;
  public
    constructor Create(const ParentModule: TTypeModuleDefinition);

    destructor Destroy; override;

    property AsArrayType: TTypeArrayDefinition read GetAsArrayType;
    property AsClassDefinition: TClassDefinition read GetAsClassDefinition;
    property AsDelayedType: TTypeDelayed read GetAsDelayedType;
    property AsTypeAlias: TTypeAlias read GetAsTypeAlias;
    property AsTypeEnumeration: TTypeEnumeration read GetAsTypeEnumeration;
    property AsTypeExternal: TTypeExternal read GetAsTypeExternal;
    property AsUnitDefinition: TUnitDefinition read GetAsUnitDefinition;
    property Attributes: TList<String> read FAttributes write FAttributes;
    property IsArrayType: Boolean read GetIsArrayType;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property IsDelayedType: Boolean read GetIsDelayedType;
    property IsEnumeration: Boolean read GetIsEnumeration;
    property IsExternal: Boolean read GetIsExternal;
    property IsNumericType: Boolean read FIsNumericType;
    property IsObjectType: Boolean read FIsObjectType;
    property IsStringType: Boolean read FIsStringType;
    property IsTypeAlias: Boolean read GetIsTypeAlias;
    property IsUnitDefinition: Boolean read GetIsUnitDefinition;
    property Name: String read FName write FName;
    property ParentAttributes: TList<String> read FParentAttributes;
    property ParentModule: TTypeModuleDefinition read FParentModule;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FClasses: TList<TClassDefinition>;
    FEnumerations: TList<TTypeEnumeration>;
  public
    constructor Create(const Module: TTypeModuleDefinition); virtual;

    destructor Destroy; override;

    property Classes: TList<TClassDefinition> read FClasses;
    property Enumerations: TList<TTypeEnumeration> read FEnumerations write FEnumerations;
  end;

  TClassDefinition = class(TTypeModuleDefinition)
  private
    FInformations: TImplementationInformations;
    FInheritedFrom: TClassDefinition;
    FParentClass: TClassDefinition;
    FProperties: TList<TPropertyDefinition>;
    FTargetNamespace: String;

    function GetNeedAddFunction: Boolean;
    function GetNeedDestructor: Boolean;
    function GetNeedImplementation: Boolean;
    function GetUnitDefinition: TUnitDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition); overload; override;
    constructor Create(const Module: TTypeModuleDefinition; const TargetNamespace: String); reintroduce; overload;

    destructor Destroy; override;

    function AddProperty(const Name: String): TPropertyDefinition;

    procedure AddAtribute(const Value: String);
    procedure AddNamespaceAttribute(const Namespace: String);
    procedure AddClassType(const ClassDefinition: TClassDefinition);

    property Informations: TImplementationInformations read FInformations write FInformations;
    property InheritedFrom: TClassDefinition read FInheritedFrom write FInheritedFrom;
    property NeedAddFunction: Boolean read GetNeedAddFunction;
    property NeedImplementation: Boolean read GetNeedImplementation;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property ParentClass: TClassDefinition read FParentClass write FParentClass;
    property Properties: TList<TPropertyDefinition> read FProperties write FProperties;
    property TargetNamespace: String read FTargetNamespace write FTargetNamespace;
    property UnitDefinition: TUnitDefinition read GetUnitDefinition;
  end;

  TTypeAlias = class(TTypeDefinition)
  private
    FTypeDefinition: TTypeDefinition;
  public
    property TypeDefinition: TTypeDefinition read FTypeDefinition write FTypeDefinition;
  end;

  TTypeDelayed = class(TTypeDefinition)
  private
    FImporter: TSchemaImporter;
    FTypeName: String;
    FType: TTypeDefinition;
  public
    constructor Create(const Importer: TSchemaImporter; const TypeName: String; const Module: TTypeModuleDefinition);

    function ResolveType: TTypeDefinition;
  end;

  TUndefinedType = class(TTypeDefinition)
  public
    constructor Create(const TypeName: String);
  end;

  TTypeExternal = class(TTypeDefinition)
  private
    FModuleName: String;
  public
    constructor Create(const ModuleName, TypeName: String);

    property ModuleName: String read FModuleName write FModuleName;
  end;

  TTypeEnumeration = class(TTypeDefinition)
  private
    FValues: TList<String>;
    function GetEnumeratorName: String;
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    property EnumeratorName: String read GetEnumeratorName;
    property Values: TList<String> read FValues write FValues;
  end;

  TTypeArrayDefinition = class(TTypeDefinition)
  private
    FArrayType: TTypeDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition; const ArrayType: TTypeDefinition);

    property ArrayType: TTypeDefinition read FArrayType write FArrayType;
  end;

  TUnitDefinition = class(TTypeModuleDefinition)
  private
    FUses: TList<TUnitDefinition>;
    FTypeAlias: TList<TTypeAlias>;
    FUnitConfiguration: TUnitDefinitionConfiguration;
  public
    constructor Create; reintroduce;

    destructor Destroy; override;

    procedure AddTypeAlias(const AType: TTypeAlias);
    procedure AddUses(const SchemaUnit: TUnitDefinition);
    procedure GenerateFile(const Importer: TSchemaImporter);

    property TypeAlias: TList<TTypeAlias> read FTypeAlias;
    property UnitConfiguration: TUnitDefinitionConfiguration read FUnitConfiguration write FUnitConfiguration;
  end;

  TSchemaImporter = class
  private
    FBooleanType: TTypeDefinition;
    FBuildInType: TDictionary<String, TTypeDefinition>;
    FCardinalType: TTypeDefinition;
    FConfiguration: TConfiguration;
    FDateTimeType: TTypeDefinition;
    FDateType: TTypeDefinition;
    FDelayedTypes: TDictionary<String, TTypeDefinition>;
    FDoubleType: TTypeDefinition;
    FInt64Type: TTypeDefinition;
    FIntegerType: TTypeDefinition;
    FObjectType: TTypeDefinition;
    FStringType: TTypeDefinition;
    FTimeType: TTypeDefinition;
    FTypeExternal: TDictionary<String, TTypeDefinition>;
    FUnits: TDictionary<TUnitDefinitionConfiguration, TUnitDefinition>;
    FUnitFiles: TDictionary<TUnitFileConfiguration, TUnitDefinition>;
    FWordType: TTypeDefinition;
  protected
    function AddDelayedType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
    function CreateUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition; virtual;
    function GetFileNameFromSchemaFolder(const FileName: String): String;
    function LoadFile(const UnitFile: TUnitFileConfiguration): String;
    function LoadUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;

    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); virtual; abstract;
    procedure LoadInternalTypes;
    procedure LoadUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadUnitFromReference(const Reference: String);

    property BooleanType: TTypeDefinition read FBooleanType;
    property CardinalType: TTypeDefinition read FCardinalType;
    property DateType: TTypeDefinition read FDateType;
    property DateTimeType: TTypeDefinition read FDateTimeType;
    property DoubleType: TTypeDefinition read FDoubleType;
    property Int64Type: TTypeDefinition read FInt64Type;
    property IntegerType: TTypeDefinition read FIntegerType;
    property ObjectType: TTypeDefinition read FObjectType;
    property StringType: TTypeDefinition read FStringType;
    property TimeType: TTypeDefinition read FTimeType;
    property WordType: TTypeDefinition read FWordType;
  public
    constructor Create;

    destructor Destroy; override;

    function AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;

    procedure Import;
    procedure LoadConfig(const FileName: String);

    property Configuration: TConfiguration read FConfiguration write FConfiguration;
  end;

  TXSDImporter = class(TSchemaImporter)
  private
    FXMLBuildInType: TDictionary<String, TTypeDefinition>;

    function AddProperty(const ClassDefinition: TClassDefinition; const Name: String): TPropertyDefinition;
    function AddPropertyWithType(const ClassDefinition: TClassDefinition; const Name: String; const &Type: IXMLTypeDef): TPropertyDefinition;
    function CanGenerateClass(const Element: IXMLElementDef): Boolean;
    function CheckPropertyTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
    function CheckEnumeration(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeEnumeration;
    function FindBaseType(TypeDefinition: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function GenerateClassDefinition(const UnitDeclaration: TUnitDefinition; const ComplexType: IXMLComplexTypeDef; const TargetNamespace: String): TClassDefinition;
    function IsReferenceType(const Element: IXMLElementDef): Boolean;

    procedure AddPropertyAttribute(const &Property: TPropertyDefinition; const Attribute: IXMLAttributeDef);
    procedure GenerateProperty(const ClassDefinition: TClassDefinition; const ElementDefinition: IXMLElementDef; const TargetNamespace: String);
    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const ElementDefs: IXMLElementDefList; const TargetNamespace: String);
    procedure LoadXSDTypes;
  protected
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition; override;

    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); override;
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TJSONSchemaImport = class(TSchemaImporter)
  private
    FJSONSchema: TSchema;
    FReferenceClassDefinition: TClassDefinition;

    function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
    function GetReferenceName(const Schema: TSchema): String;
    function GetReferenceSchema(const Schema: TSchema): TSchema;
    function GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;

    procedure DefineProperty(const ClassDefinition: TClassDefinition; const PropertyName: String; const PropertySchemaType: TSchema);
    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);
  protected
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); override;
  end;

  TSchemaHelper = class helper for TSchema
  private
    function GetIsArray: Boolean;
  public
    property IsArray: Boolean read GetIsArray;
  end;

implementation

uses System.SysUtils, System.Classes, System.IOUtils, System.Variants, System.Net.HttpClient, System.Rtti, XML.XMLDom, Xml.XMLSchemaTags, Blue.Print.Serializer;

const
  WHITE_SPACE_IDENT = '  ';

function GetTypePrefixName(const Name: String): String;
begin
  Result := 'T' + Name;
end;

function CheckReservedName(const Name: String): String;
const
  SPECIAL_NAMES: array[0..7] of String = ('type', 'mod', 'to', 'if', 'then', 'else', 'type', 'class');

begin
  Result := Name;

  for var SpecialName in SPECIAL_NAMES do
    if CompareText(Name, SpecialName) = 0 then
      Exit('&' + Result);
end;

function OnlyValidChars(const Value: String): String;
begin
  Result := EmptyStr;

  for var Char in Value do
    if CharInSet(Char, ['0'..'9', 'a'..'z', 'A'..'Z']) then
      Result := Result + Char;
end;

function FormatName(Name: String): String;
begin
  Name := OnlyValidChars(Name);
  Result := Name.Substring(0, 1).ToUpper + Name.Substring(1);
end;

function FormatEnumeratorValue(Value: String): String;
begin
  Result := EmptyStr;

  for var Split in Value.Split([' ']) do
      Result := Result + CheckReservedName(FormatName(Split));

  if CharInSet(Result[1], ['0'..'9']) then
    Result := 't' + Result;
end;

function FormatPropertyName(const PropertyName: String): String;
begin
  Result := CheckReservedName(OnlyValidChars(PropertyName));
end;

function NotFormatEnumeratorValue(Value: String): String;
begin
  Result := Value;
end;

{ TSchemaImporter }

function TSchemaImporter.AddDelayedType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  if not FDelayedTypes.TryGetValue(TypeName, Result) then
  begin
    Result := TTypeDelayed.Create(Self, TypeName, Module);

    FDelayedTypes.Add(TypeName, Result);
  end;
end;

function TSchemaImporter.AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;
begin
  Result := TTypeExternal.Create(ModuleName, TypeName);

  FTypeExternal.Add(TypeName, Result);
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create;
  FDelayedTypes := TDictionary<String, TTypeDefinition>.Create;
  FTypeExternal := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues]);
  FUnits := TObjectDictionary<TUnitDefinitionConfiguration, TUnitDefinition>.Create([doOwnsValues]);
  FUnitFiles := TDictionary<TUnitFileConfiguration, TUnitDefinition>.Create;

  LoadInternalTypes;
end;

function TSchemaImporter.CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
begin
  Result := TTypeAlias.Create(Module);
  Result.Name := Alias;
  Result.TypeDefinition := TypeDefinition;
end;

function TSchemaImporter.CreateUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
begin
  Result := TUnitDefinition.Create;
  Result.UnitConfiguration := UnitConfiguration;

  FUnits.Add(UnitConfiguration, Result);
end;

destructor TSchemaImporter.Destroy;
begin
  FTypeExternal.Free;

  FBuildInType.Free;

  FDelayedTypes.Free;

  FUnits.Free;

  FUnitFiles.Free;

  inherited;
end;

function TSchemaImporter.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;

  function FindTypeDefinitionModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
  begin
    Result := False;

    for var ClassDefinition in Module.Classes do
    begin
      Result := ClassDefinition.Name = TypeName;

      if Result then
      begin
        TypeDefinition := ClassDefinition;

        Exit;
      end;
    end;

    for var Enumerator in Module.Enumerations do
    begin
      Result := Enumerator.Name = TypeName;

      if Result then
      begin
        TypeDefinition := Enumerator;

        Exit;
      end;
    end;

    if Module.IsUnitDefinition then
      for var TypeAlias in Module.AsUnitDefinition.TypeAlias do
      begin
        Result := TypeAlias.Name = TypeName;

        if Result then
        begin
          TypeDefinition := TypeAlias;

          Exit;
        end;
      end;
  end;

begin
  Result := nil;

  if FTypeExternal.TryGetValue(TypeName, Result) then
    Exit;

  if FBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  var ClassModule := Module;

  while Assigned(ClassModule) and not FindTypeDefinitionModule(ClassModule, TypeName, Result) do
    if ClassModule.IsClassDefinition then
      ClassModule := ClassModule.AsClassDefinition.ParentClass
    else
      ClassModule := nil;

  if not Assigned(Result) then
  begin
    var CurrentModule: TTypeModuleDefinition := nil;

    for var SplitTypeName in TypeName.Split(['.']) do
    begin
      if Assigned(CurrentModule) then
        FindTypeDefinitionModule(CurrentModule, SplitTypeName, Result)
      else if not Assigned(Result) then
        for var UnitDefinition in FUnits.Values do
          if FindTypeDefinitionModule(UnitDefinition, SplitTypeName, Result) then
            Break;

      if Assigned(Result) and Result.IsClassDefinition then
        CurrentModule := Result.AsClassDefinition
      else
        Break;
    end;
  end;

  if not Assigned(Result) and Assigned(Module) then
  begin
    var UnitDefintion: TUnitDefinition;

    if Module.IsUnitDefinition then
      UnitDefintion := Module.AsUnitDefinition
    else
      UnitDefintion := Module.AsClassDefinition.UnitDefinition;

    for var TypeDefinitionConfig in Configuration.TypeDefinition do
      if TypeDefinitionConfig.Name = TypeName then
      begin
        var TypeAlias := CreateTypeAlias(UnitDefintion, TypeDefinitionConfig.Name, AddDelayedType(TypeDefinitionConfig.ChangeType, nil));

        UnitDefintion.TypeAlias.Add(TypeAlias);

        Exit(TypeAlias);
      end;
  end;
end;

procedure TSchemaImporter.GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
begin
  var UnitDefinition := LoadUnit(UnitConfiguration);

  for var UnitFile in UnitConfiguration.Files do
    LoadUnitFileDefinition(UnitDefinition, UnitFile);
end;

function TSchemaImporter.GetFileNameFromSchemaFolder(const FileName: String): String;
begin
  Result := Format('%s\%s', [Configuration.SchemaFolder, FileName]);
end;

procedure TSchemaImporter.Import;
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
    GenerateUnitDefinition(UnitConfiguration);

  for var TypeDefinitionConfig in Configuration.TypeDefinition do
  begin
    var TypeDefinition := FindType(TypeDefinitionConfig.Name, nil);

    if Assigned(TypeDefinition) then
    begin
      if not TypeDefinitionConfig.Attribute.IsEmpty then
        TypeDefinition.Attributes.Add(TypeDefinitionConfig.Attribute);

      if not TypeDefinitionConfig.ParentAttribute.IsEmpty then
        TypeDefinition.ParentAttributes.Add(TypeDefinitionConfig.ParentAttribute);

      if not TypeDefinitionConfig.Inheritance.IsEmpty then
      begin
        var ClassDefinition := TypeDefinition as TClassDefinition;

        ClassDefinition.InheritedFrom := FindType(TypeDefinitionConfig.Inheritance, nil) as TClassDefinition;
      end;
    end;
  end;

  for var UnitDefinition in FUnits.Values do
    UnitDefinition.GenerateFile(Self);
end;

procedure TSchemaImporter.LoadConfig(const FileName: String);

  function FixFolderPath(const Folder: String): String;
  begin
    Result := Folder;

    if TDirectory.IsRelativePath(Result) then
      Result := TPath.GetFullPath(Format('%s%s', [ExtractFilePath(FileName), Result]));
  end;

begin
  if TFile.Exists(FileName) then
  begin
    var Serializer: IBluePrintSerializer := TBluePrintJsonSerializer.Create;

    Configuration := Serializer.Deserialize(TFile.ReadAllText(FileName), TypeInfo(TConfiguration)).AsType<TConfiguration>;
    Configuration.OutputFolder := FixFolderPath(Configuration.OutputFolder);
    Configuration.SchemaFolder := FixFolderPath(Configuration.SchemaFolder);

    for var TypeExternal in Configuration.TypeDefinition do
      if not TypeExternal.ModuleName.IsEmpty then
        AddTypeExternal(TypeExternal.ModuleName, TypeExternal.Name);
  end;
end;

function TSchemaImporter.LoadFile(const UnitFile: TUnitFileConfiguration): String;

  function DownloadFile(const URL: String): String;
  begin
    var Connection := THTTPClient.Create;
    var Response := Connection.Execute('GET', URL) as IHTTPResponse;

    if Response.StatusCode = 200 then
      Result := Response.ContentAsString
    else
      raise Exception.CreateFmt('Error downloading the file %s', [URL]);

    Connection.Free;
  end;

begin
  if UnitFile.Reference.StartsWith('http') then
    Result := DownloadFile(UnitFile.Reference)
  else
    Result := TFile.ReadAllText(GetFileNameFromSchemaFolder(UnitFile.Reference));
end;

procedure TSchemaImporter.LoadInternalTypes;

  function AddType(const TypeName: String): TTypeDefinition;
  begin
    Result := TTypeDefinition.Create(nil);
    Result.Name := 'System.' + TypeName;

    FBuildInType.Add(Result.Name, Result);

    FBuildInType.Add(TypeName, CreateTypeAlias(nil, TypeName, Result));
  end;

  function AddNumberType(const TypeName: String): TTypeDefinition;
  begin
    Result := AddType(TypeName);
    Result.FIsNumericType := True;
  end;

begin
  FBooleanType := AddType('Boolean');
  FCardinalType := AddNumberType('Cardinal');
  FDateTimeType := AddNumberType('TDateTime');
  FDateType := AddNumberType('TDate');
  FDoubleType := AddNumberType('Double');
  FInt64Type := AddNumberType('Int64');
  FIntegerType := AddNumberType('Integer');
  FObjectType := AddType(TObject.ClassName);
  FObjectType.FIsObjectType := True;
  FStringType := AddType('String');
  FStringType.FIsStringType := True;
  FTimeType := AddNumberType('TTime');
  FWordType := AddNumberType('Word');
end;

function TSchemaImporter.LoadUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
begin
  if not FUnits.TryGetValue(UnitConfiguration, Result) then
    Result := CreateUnit(UnitConfiguration);
end;

procedure TSchemaImporter.LoadUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  if not FUnitFiles.ContainsKey(UnitFileConfiguration) then
  begin
    FUnitFiles.Add(UnitFileConfiguration, UnitDefinition);

    GenerateUnitFileDefinition(UnitDefinition, UnitFileConfiguration);
  end;
end;

procedure TSchemaImporter.LoadUnitFromReference(const Reference: String);
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
    for var UnitFileConfiguration in UnitConfiguration.Files do
      if UnitFileConfiguration.Reference = Reference then
      begin
        LoadUnitFileDefinition(LoadUnit(UnitConfiguration), UnitFileConfiguration);

        Exit;
      end;

  raise Exception.CreateFmt('Schema file without unit configuration %s!', [ExtractFileName(Reference)]);
end;

{ TXSDImporter }

function TXSDImporter.AddProperty(const ClassDefinition: TClassDefinition; const Name: String): TPropertyDefinition;
begin
  Result := ClassDefinition.AddProperty(Name);
end;

procedure TXSDImporter.AddPropertyAttribute(const &Property: TPropertyDefinition; const Attribute: IXMLAttributeDef);
begin
  if Attribute.Fixed = NULL then
    &Property.AddXMLAttributeValue
  else
    &Property.AddXMLAttributeFixed(Attribute.Name, Attribute.Fixed);

  &Property.Optional := (Attribute.Use <> NULL) and (Attribute.Use = 'optional');
end;

function TXSDImporter.AddPropertyWithType(const ClassDefinition: TClassDefinition; const Name: String; const &Type: IXMLTypeDef): TPropertyDefinition;
begin
  Result := AddProperty(ClassDefinition, Name);
  Result.PropertyType := CheckPropertyTypeDefinition(&Type, ClassDefinition);
end;

function TXSDImporter.CanGenerateClass(const Element: IXMLElementDef): Boolean;
begin
  Result := Element.DataType.IsComplex and not IsReferenceType(Element);
end;

constructor TXSDImporter.Create;
begin
  inherited;

  FXMLBuildInType := TDictionary<String, TTypeDefinition>.Create;

  LoadXSDTypes;
end;

destructor TXSDImporter.Destroy;
begin
  FXMLBuildInType.Free;

  inherited;
end;

function TXSDImporter.FindBaseType(TypeDefinition: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := nil;

  if not TypeDefinition.IsComplex and Assigned(TypeDefinition.BaseType) then
    repeat
      TypeDefinition := TypeDefinition.BaseType as IXMLSimpleTypeDef;

      Result := FindType(TypeDefinition.Name, Module);
    until Assigned(Result) or not Assigned(TypeDefinition);
end;

function TXSDImporter.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  if FXMLBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  Result := inherited;
end;

function TXSDImporter.CheckEnumeration(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeEnumeration;
var
  EnumValues: TStringList;

begin
  if &Type.Enumerations.Count > 0 then
  begin
    EnumValues := TStringList.Create(dupIgnore, False, False);
    Result := TTypeEnumeration.Create(Module);
    Result.Name := &Type.Name;

    for var A := 0 to Pred(&Type.Enumerations.Count) do
    begin
      var EnumValue := &Type.Enumerations[A].Value;

      if EnumValues.IndexOf(EnumValue) = -1 then
        EnumValues.Add(EnumValue);
    end;

    for var EnumValue in EnumValues do
      Result.Values.Add(EnumValue);

    if Assigned(Module) then
      Module.Enumerations.Add(Result);
  end
  else
    Result := nil;
end;

function TXSDImporter.CheckPropertyTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := CheckTypeDefinition(&Type, Module);

  if not Assigned(Result) then
    Result := FindBaseType(&Type, Module);

  if not Assigned(Result) then
    Result := AddDelayedType(&Type.Name, Module);
end;

function TXSDImporter.CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := FindType(&Type.Name, Module);

  if not Assigned(Result) then
    Result := CheckEnumeration(&Type, Module);
end;

function TXSDImporter.CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
begin
  Result := CheckTypeDefinition(&Type, UnitDefinition);

  if not Assigned(Result) then
  begin
    var TypeAlias := CreateTypeAlias(UnitDefinition, &Type.Name, FindBaseType(&Type, UnitDefinition));

    Result := TypeAlias;

    UnitDefinition.AddTypeAlias(TypeAlias);
  end;
end;

function TXSDImporter.GenerateClassDefinition(const UnitDeclaration: TUnitDefinition; const ComplexType: IXMLComplexTypeDef; const TargetNamespace: String): TClassDefinition;
var
  ClassDefinition: TClassDefinition absolute Result;

begin
  Result := TClassDefinition.Create(UnitDeclaration, TargetNamespace);
  Result.Name := ComplexType.Name;

  GenerateProperties(ClassDefinition, ComplexType.ElementDefList, TargetNamespace);

  for var A := 0 to Pred(ComplexType.AttributeDefs.Count) do
  begin
    var Attribute := ComplexType.AttributeDefs[A];
    var &Property := AddPropertyWithType(ClassDefinition, Attribute.Name, Attribute.DataType);

    AddPropertyAttribute(&Property, Attribute);
  end;

  if Assigned(ComplexType.BaseType) then
  begin
    var &Property := AddPropertyWithType(ClassDefinition, 'Value', ComplexType.BaseType);

    &Property.AddXMLValueAttribute;
  end;
end;

procedure TXSDImporter.GenerateProperties(const ClassDefinition: TClassDefinition; const ElementDefs: IXMLElementDefList; const TargetNamespace: String);
begin
  for var A := 0 to Pred(ElementDefs.Count) do
    GenerateProperty(ClassDefinition, ElementDefs[A], TargetNamespace);
end;

procedure TXSDImporter.GenerateProperty(const ClassDefinition: TClassDefinition; const ElementDefinition: IXMLElementDef; const TargetNamespace: String);

  function IsOptional(const ElementDefinition: IXMLElementDef): Boolean;
  var
    Compositor: IXMLElementCompositor;

  begin
    Result := ElementDefinition.MinOccurs <= 0;

    if not Result and Supports(ElementDefinition.ParentNode, IXMLElementCompositor, Compositor) then
      Result := (Compositor.CompositorType = ctChoice) or (Compositor.MinOccurs <= 0);
  end;

begin
  var NewProperty := AddProperty(ClassDefinition, ElementDefinition.Name);
  NewProperty.Optional := IsOptional(ElementDefinition);
  var PropertyType := ElementDefinition.DataType;

  if CanGenerateClass(ElementDefinition) then
  begin
    var ComplexType := ElementDefinition.DataType as IXMLComplexTypeDef;

    if (ComplexType.ElementDefs.Count = 0) and (ComplexType.AttributeDefs.Count = 1) and ComplexType.AttributeDefs[0].HasAttribute(SFixed) then
    begin
      var Attribute := ComplexType.AttributeDefs[0];
      PropertyType := Attribute.DataType;

      AddPropertyAttribute(NewProperty, Attribute);
    end
    else
    begin
      PropertyType := ComplexType;

      ClassDefinition.AddClassType(GenerateClassDefinition(ClassDefinition.UnitDefinition, ComplexType, TargetNamespace));
    end;
  end;

  NewProperty.PropertyType := CheckPropertyTypeDefinition(PropertyType, ClassDefinition);

  if ElementDefinition.IsRepeating then
    NewProperty.PropertyType := TTypeArrayDefinition.Create(ClassDefinition, NewProperty.PropertyType);
end;

procedure TXSDImporter.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);

  procedure ProcessReferences(const UnitDefinition: TUnitDefinition; const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      LoadUnitFromReference(Reference.SchemaLocation);
    end;
  end;

begin
  var Schema := LoadXMLSchema(GetFileNameFromSchemaFolder(UnitFileConfiguration.Reference));

  ProcessReferences(UnitDefinition, Schema.SchemaDef.SchemaIncludes);

  ProcessReferences(UnitDefinition, Schema.SchemaDef.SchemaImports);

  for var A := 0 to Pred(Schema.SchemaDef.SimpleTypes.Count) do
    CheckUnitTypeDefinition(Schema.SchemaDef.SimpleTypes[A], UnitDefinition);

  for var A := 0 to Pred(Schema.SchemaDef.ComplexTypes.Count) do
  begin
    var ClassDefinition := GenerateClassDefinition(UnitDefinition, Schema.SchemaDef.ComplexTypes[A], Schema.SchemaDef.TargetNamespace);

    UnitDefinition.Classes.Add(ClassDefinition);
  end;

  if Schema.SchemaDef.ElementDefs.Count > 0 then
  begin
    var ClassDefinition := TClassDefinition.Create(UnitDefinition, EmptyStr);
    ClassDefinition.Name := UnitFileConfiguration.UnitClassName;

    for var A := 0 to Pred(Schema.SchemaDef.ElementDefs.Count) do
      GenerateProperty(ClassDefinition, Schema.SchemaDef.ElementDefs[A], Schema.SchemaDef.TargetNamespace);

    UnitDefinition.Classes.Add(ClassDefinition);
  end;
end;

function TXSDImporter.IsReferenceType(const Element: IXMLElementDef): Boolean;
begin
  Result := Assigned(Element.Ref) or Assigned(Element.AttributeNodes.FindNode('type'));
end;

procedure TXSDImporter.LoadXSDTypes;

  function AddBuildInType(const TypeName: String; const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    FXMLBuildInType.Add(TypeName, TypeDefinition);
  end;

begin
  AddBuildInType('anyURI', StringType);
  AddBuildInType('base64Binary', StringType);
  AddBuildInType('boolean', BooleanType);
  AddBuildInType('date', DateType);
  AddBuildInType('dateTime', DateTimeType);
  AddBuildInType('decimal', DoubleType);
  AddBuildInType('ID', StringType);
  AddBuildInType('int', IntegerType);
  AddBuildInType('long', Int64Type);
  AddBuildInType('string', StringType);
  AddBuildInType('time', TimeType);
  AddBuildInType('token', StringType);
  AddBuildInType('unsignedShort', WordType);
  AddBuildInType('unsignedInt', CardinalType);
end;

{ TUnitDefinition }

procedure TUnitDefinition.AddTypeAlias(const AType: TTypeAlias);
begin
  TypeAlias.Add(AType);
end;

procedure TUnitDefinition.AddUses(const SchemaUnit: TUnitDefinition);
begin
  FUses.Add(SchemaUnit);
end;

constructor TUnitDefinition.Create;
begin
  inherited Create(nil);

  FTypeAlias := TList<TTypeAlias>.Create;
  FUses := TList<TUnitDefinition>.Create;
end;

destructor TUnitDefinition.Destroy;
begin
  FTypeAlias.Free;

  FUses.Free;

  inherited;
end;

procedure TUnitDefinition.GenerateFile(const Importer: TSchemaImporter);
var
  UnitDefinition: TStringList;

  procedure AddLine(const Value: String; const Params: array of const); overload;
  begin
    UnitDefinition.Add(Format(Value, Params));
  end;

  procedure AddLine(const Value: String); overload;
  begin
    AddLine(Value, []);
  end;

  procedure AddLine; overload;
  begin
    AddLine(EmptyStr);
  end;

  function GetStoredFunctionName(const &Property: TPropertyDefinition): String;
  begin
    Result := Format('Get%sStored', [FormatName(&Property.Name)]);
  end;

  function GetClassName(const ClassDefinition: TClassDefinition): String;
  begin
    Result := FormatName(ClassDefinition.Name);

    if Assigned(ClassDefinition.ParentClass) then
      Result := GetTypePrefixName(Result);
  end;

  function ResolveTypeDefinition(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    if Result.IsDelayedType then
      Result := ResolveTypeDefinition(Result.AsDelayedType.ResolveType);
  end;

  function ResolveTypeAlias(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(TypeDefinition);

    if Result.IsTypeAlias then
      Result := ResolveTypeAlias(Result.AsTypeAlias.TypeDefinition);
  end;

  function GetPropertyType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(&Property.PropertyType);
  end;

  function GetArrayType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    if TypeDefinition.IsArrayType then
      Result := ResolveTypeDefinition(TypeDefinition.AsArrayType.ArrayType)
    else
      Result := TypeDefinition;
  end;

  function GetClassImplementationName(ClassDefinition: TClassDefinition): String;
  begin
    Result := GetClassName(ClassDefinition);

    while Assigned(ClassDefinition.ParentClass) do
    begin
      Result := Format('%s.%s', [GetClassName(ClassDefinition.ParentClass), Result]);

      ClassDefinition := ClassDefinition.ParentClass;
    end;
  end;

  function GetPropertyFieldName(const &Property: TPropertyDefinition): String;
  begin
    Result := 'F' + FormatName(&Property.Name);
  end;

  function GetPropertyGetFunction(const &Property: TPropertyDefinition): String;
  begin
    if &Property.NeedGetFunction then
      Result := 'Get' + FormatName(&Property.Name)
    else
      Result := GetPropertyFieldName(&Property);
  end;

  function GetTypeName(const TypeDefinition: TTypeDefinition): String;
  begin
    if TypeDefinition.IsArrayType then
      Result := Format('TArray<%s>', [GetTypeName(GetArrayType(TypeDefinition))])
    else if TypeDefinition.IsClassDefinition then
      Result := GetClassImplementationName(TypeDefinition.AsClassDefinition)
    else if TypeDefinition.IsEnumeration then
      Result := TypeDefinition.AsTypeEnumeration.EnumeratorName
    else if TypeDefinition is TUndefinedType then
      Result := Format('Undefined { %s }', [TypeDefinition.Name])
    else
      Result := ResolveTypeDefinition(TypeDefinition).Name;
  end;

  function GetPropertyTypeName(const &Property: TPropertyDefinition): String;
  begin
    Result := GetTypeName(GetPropertyType(&Property));
  end;

  function GetAddFuntionName(const &Property: TPropertyDefinition): String;
  begin
    Result := Format('Add%s: %s', [FormatName(&Property.Name), GetTypeName(GetArrayType(GetPropertyType(&Property)))]);
  end;

  procedure LoadAttributes(const Ident: String; const AttributesList: TArray<String>);
  begin
    for var Attribute in AttributesList do
      AddLine('%s[%s]', [Ident, Attribute]);
  end;

  procedure GenerateEnumerators(const Ident: String; const Module: TTypeModuleDefinition);

    function GetEnumeratorValues(const Enumerator: TTypeEnumeration; const LineBreak: String; const FormatFunction: TFunc<String, String>): String;
    begin
      var LineBreakCount := 1;
      Result := EmptyStr;

      for var Value in Enumerator.Values do
      begin
        var FormatedValue := FormatFunction(Value);

        if not Result.IsEmpty then
          Result := Result + ', ';

        if Result.Length + FormatedValue.Length - LineBreak.Length * Pred(LineBreakCount) > Importer.Configuration.MaxColumnSize * LineBreakCount then
        begin
          Result := Result + LineBreak;

          Inc(LineBreakCount);
        end;

        Result := Result + FormatedValue;
      end;
    end;

  begin
    var FirstEnumerator := True;

    for var Enumerator in Module.Enumerations do
    begin
      if not FirstEnumerator then
        AddLine;

      LoadAttributes(Ident, Enumerator.Attributes.ToArray);

      AddLine('%s[EnumValue(''%s'')]', [Ident, GetEnumeratorValues(Enumerator, ''' +' + sLineBreak + Ident + WHITE_SPACE_IDENT + '''', NotFormatEnumeratorValue)]);

      AddLine('%s%s = (%s);', [Ident, Enumerator.EnumeratorName, GetEnumeratorValues(Enumerator, sLineBreak + Ident + WHITE_SPACE_IDENT, FormatEnumeratorValue)]);

      FirstEnumerator := False;
    end;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

    function GetStoredPropertyDeclaration(const &Property: TPropertyDefinition): String;
    begin
      Result := EmptyStr;

      if &Property.NeedIsStoredFunction then
        Result := Format(' stored %s', [GetStoredFunctionName(&Property)]);
    end;

    function GetInheritence: String;
    begin
      if Assigned(ClassDefinition.InheritedFrom) then
        Result := Format('(%s)', [GetClassImplementationName(ClassDefinition.InheritedFrom)])
      else
        Result := EmptyStr;
    end;

    procedure LoadClassInformation;

      function GetNeedAddFunction(const PropertyType: TTypeDefinition): Boolean;
      begin
        Result := PropertyType.IsArrayType;

        if Result then
          Result := ResolveTypeAlias(GetArrayType(PropertyType)).IsClassDefinition;
      end;

      function GetIsOptional(const &Property: TPropertyDefinition; const PropertyType: TTypeDefinition): Boolean;
      begin
        Result := &Property.Optional and not PropertyType.IsArrayType;
      end;

      function GetNeedDestructor(const PropertyType: TTypeDefinition): Boolean;
      begin
        var ResolvedPropertyType := ResolveTypeAlias(GetArrayType(PropertyType));

        Result := ResolvedPropertyType.IsClassDefinition and not ResolvedPropertyType.IsObjectType;
      end;

      function GetNeedGetFunction(const PropertyType: TTypeDefinition): Boolean;
      begin
        var ResolvedPropertyType := ResolveTypeAlias(PropertyType);

        Result := ResolvedPropertyType.IsClassDefinition and not ResolvedPropertyType.IsArrayType and not ResolvedPropertyType.IsObjectType;
      end;

      procedure AppendInformation(const NeedAdd: Boolean; const &Property: TPropertyDefinition; const Information: TImplementationInformation);
      begin
        if NeedAdd then
        begin
          ClassDefinition.Informations := ClassDefinition.Informations + [Information];
          &Property.Informations := &Property.Informations + [Information];
        end;
      end;

    begin
      var ClassInformation: TImplementationInformations := [];

      for var &Property in ClassDefinition.Properties do
      begin
        var PropertyType := GetPropertyType(&Property);

        AppendInformation(GetNeedAddFunction(PropertyType), &Property, TImplementationInformation.NeedAddFunction);

        AppendInformation(GetIsOptional(&Property, PropertyType), &Property, TImplementationInformation.NeedIsStoredFunction);

        AppendInformation(GetNeedDestructor(PropertyType), &Property, TImplementationInformation.NeedDestructor);

        AppendInformation(GetNeedGetFunction(PropertyType), &Property, TImplementationInformation.NeedGetFunction);
      end;
    end;

    procedure CheckAddLine(const Information: TImplementationInformation; const Informations: TImplementationInformations);
    begin
      if (Information in ClassDefinition.Informations) and (Informations * ClassDefinition.Informations <> []) then
        AddLine;
    end;

  begin
    LoadClassInformation;

    LoadAttributes(Ident, ClassDefinition.Attributes.ToArray);

    AddLine('%s%s = class%s', [Ident, GetClassName(ClassDefinition), GetInheritence]);

    if not ClassDefinition.Classes.IsEmpty or not ClassDefinition.Enumerations.IsEmpty then
    begin
      AddLine('%spublic type', [Ident]);

      GenerateEnumerators(Ident + WHITE_SPACE_IDENT, ClassDefinition);

      for var SubClass in ClassDefinition.Classes do
      begin
        GenerateClassDeclaration(Ident + WHITE_SPACE_IDENT, SubClass);

        if SubClass <> ClassDefinition.Classes.Last then
          AddLine;
      end;
    end;

    if not ClassDefinition.Properties.IsEmpty then
    begin
      AddLine('%sprivate', [Ident]);

      for var &Property in ClassDefinition.Properties do
        AddLine('%s  %s: %s;', [Ident, GetPropertyFieldName(&Property), GetPropertyTypeName(&Property)]);

      for var &Property in ClassDefinition.Properties do
        if &Property.NeedGetFunction then
          AddLine('%s  function %s: %s;', [Ident, GetPropertyGetFunction(&Property), GetPropertyTypeName(&Property)]);

      for var &Property in ClassDefinition.Properties do
        if &Property.NeedIsStoredFunction then
          AddLine('%s  function %s: Boolean;', [Ident, GetStoredFunctionName(&Property)]);

      if ClassDefinition.NeedImplementation then
      begin
        AddLine('%spublic', [Ident]);

        if ClassDefinition.NeedDestructor then
          AddLine('%s  destructor Destroy; override;', [Ident]);

        CheckAddLine(TImplementationInformation.NeedAddFunction, [TImplementationInformation.NeedDestructor]);

        for var &Property in ClassDefinition.Properties do
          if &Property.NeedAddFunction then
            AddLine('%s  function %s;', [Ident, GetAddFuntionName(&Property)]);

        CheckAddLine(TImplementationInformation.NeedIsStoredFunction, [TImplementationInformation.NeedDestructor, TImplementationInformation.NeedAddFunction]);

        for var &Property in ClassDefinition.Properties do
          if &Property.NeedIsStoredFunction then
            AddLine('%s  property Is%sStored: Boolean read %s;', [Ident, FormatName(&Property.Name), GetStoredFunctionName(&Property)]);
      end;

      AddLine('%spublished', [Ident]);

      for var &Property in ClassDefinition.Properties do
      begin
        LoadAttributes(Ident + WHITE_SPACE_IDENT, &Property.Attributes.ToArray + GetPropertyType(&Property).ParentAttributes.ToArray);

        AddLine('%s  property %s: %s read %s write %s%s;', [Ident, FormatPropertyName(&Property.Name), GetPropertyTypeName(&Property), GetPropertyGetFunction(&Property), GetPropertyFieldName(&Property), GetStoredPropertyDeclaration(&Property)]);
      end;
    end;

    AddLine('%send;', [Ident]);
  end;

  function GetIsStoredFunctionValue(const &Property: TPropertyDefinition): String;
  begin
    var PropertyType := ResolveTypeAlias(GetPropertyType(&Property));

    if PropertyType.IsClassDefinition then
      Result := Format('Assigned(%s)', [GetPropertyFieldName(&Property)])
    else if PropertyType.IsStringType then
      Result := Format('not %s.IsEmpty', [GetPropertyFieldName(&Property)])
    else if PropertyType.IsNumericType then
      Result := Format('%s <> 0', [GetPropertyFieldName(&Property)])
    else
      Result := 'False';
  end;

  procedure GenerateClassImplementation(const ClassDefinition: TClassDefinition);
  begin
    if ClassDefinition.NeedImplementation then
    begin
      AddLine('{ %s }', [GetClassImplementationName(ClassDefinition)]);

      AddLine;

      if ClassDefinition.NeedDestructor then
      begin
        AddLine('destructor %s.Destroy;', [GetClassImplementationName(ClassDefinition)]);

        AddLine('begin');

        for var &Property in ClassDefinition.Properties do
        begin
          var PropertyType := GetPropertyType(&Property);

          if &Property.NeedDestructor then
            if PropertyType.IsArrayType then
            begin
              AddLine('  for var AObject in %s do', [GetPropertyFieldName(&Property)]);
              AddLine('    AObject.Free;');

              AddLine;
            end
            else
            begin
              AddLine('  %s.Free;', [GetPropertyFieldName(&Property)]);

              AddLine;
            end;
          end;

        AddLine('  inherited;');

        AddLine('end;');

        AddLine;
      end;

      for var &Property in ClassDefinition.Properties do
      begin
        var PropertyFieldName := GetPropertyFieldName(&Property);
        var PropertyType := GetPropertyType(&Property);

        if &Property.NeedGetFunction then
        begin
          var PropertyTypeName := GetTypeName(PropertyType);

          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetPropertyGetFunction(&Property), PropertyTypeName]);

          AddLine('begin');

          AddLine('  if not Assigned(%s) then', [PropertyFieldName]);

          AddLine('    %s := %s.Create;', [PropertyFieldName, PropertyTypeName]);

          AddLine;

          AddLine('  Result := %s;', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.NeedAddFunction then
        begin
          AddLine('function %s.%s;', [GetClassImplementationName(ClassDefinition), GetAddFuntionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s.Create;', [GetTypeName(GetArrayType(PropertyType))]);

          AddLine;

          AddLine('  %0:s := %0:s + [Result];', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.NeedIsStoredFunction then
        begin
          AddLine('function %s.%s: Boolean;', [GetClassImplementationName(ClassDefinition), GetStoredFunctionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s;', [GetIsStoredFunctionValue(&Property)]);

          AddLine('end;');

          AddLine;
        end;
      end;
    end;

    for var SubClassDefinition in ClassDefinition.Classes do
      GenerateClassImplementation(SubClassDefinition);
  end;

  function LoadUnitUses: String;
  var
    UsesList: TList<String>;

    procedure AddUses(const Value: String);
    begin
      if not UsesList.Contains(Value) then
        UsesList.Add(Value);
    end;

    procedure CheckType(const TypeDefinition: TTypeDefinition);

      procedure AddUnitDefinition(const UnitDefinition: TUnitDefinition);
      begin
        AddUses(UnitDefinition.UnitConfiguration.Name);
      end;

      procedure CheckUses(const TypeDefinition: TTypeDefinition);
      begin
        if TypeDefinition.IsExternal then
          AddUses(TypeDefinition.AsTypeExternal.ModuleName)
        else if TypeDefinition.IsClassDefinition then
        begin
          var ClassDefinition := TypeDefinition.AsClassDefinition;

          AddUnitDefinition(ClassDefinition.UnitDefinition);

          if Assigned(ClassDefinition.InheritedFrom) then
            AddUnitDefinition(ClassDefinition.InheritedFrom.UnitDefinition);
        end
        else if TypeDefinition.IsEnumeration and TypeDefinition.ParentModule.IsUnitDefinition then
          AddUnitDefinition(TypeDefinition.ParentModule.AsUnitDefinition)
        else if TypeDefinition.IsTypeAlias and Assigned(TypeDefinition.AsTypeAlias.ParentModule) then
          AddUnitDefinition(TypeDefinition.AsTypeAlias.ParentModule.AsUnitDefinition);
      end;

    begin
      if TypeDefinition.IsDelayedType then
        CheckType(ResolveTypeDefinition(TypeDefinition))
      else
        CheckUses(TypeDefinition);
    end;

    procedure CheckClasses(const Classes: TList<TClassDefinition>);
    begin
      for var ClassDefinition in Classes do
      begin
        for var &Property in ClassDefinition.Properties do
          CheckType(GetPropertyType(&Property));

        CheckClasses(ClassDefinition.Classes);
      end;
    end;

  begin
    Result := EmptyStr;
    UsesList := TList<String>.Create;

    AddUses('Blue.Print.Types');

    for var AUnit in FUses do
      AddUses(AUnit.UnitConfiguration.Name);

    CheckClasses(Classes);

    for var TypeAlias in TypeAlias do
      CheckType(TypeAlias.TypeDefinition);

    UsesList.Remove(UnitConfiguration.Name);

    for var Value in UsesList do
    begin
      if not Result.IsEmpty then
        Result := Result + ', ';

      Result := Result + Value;
    end;

    UsesList.Free;
  end;

  function GetUnitReferencesNames(const UnitConfiguration: TUnitDefinitionConfiguration): String;
  begin
    Result := EmptyStr;

    for var UnitFile in UnitConfiguration.Files do
    begin
      if not Result.IsEmpty then
        Result := Result + ', ';

      Result := Result + UnitFile.Reference;
    end;
  end;

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [UnitConfiguration.Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  AddLine('{$M+}');

  if not Enumerations.IsEmpty then
    AddLine('{$SCOPEDENUMS ON}');

  AddLine;

  AddLine('// File generated from %s;', [GetUnitReferencesNames(UnitConfiguration)]);

  AddLine;

  AddLine('uses %s;', [LoadUnitUses]);

  AddLine;

  if not TypeAlias.IsEmpty or not Classes.IsEmpty then
    AddLine('type');

  if not Enumerations.IsEmpty then
  begin
    AddLine('  // Enumerations declaration');

    GenerateEnumerators(WHITE_SPACE_IDENT, Self);
  end;

  if not Classes.IsEmpty then
  begin
    AddLine('  // Forward class declaration');

    for var AClass in Classes do
      AddLine('  %s = class;', [GetClassName(AClass)]);

    AddLine;
  end;

  if not TypeAlias.IsEmpty then
  begin
    AddLine('  // Forward type alias');

    for var TypeAlias in TypeAlias do
      AddLine('  %s = %s;', [TypeAlias.Name, GetTypeName(ResolveTypeAlias(TypeAlias))]);

    AddLine;
  end;

  for var AClass in Classes do
  begin
    GenerateClassDeclaration(WHITE_SPACE_IDENT, AClass);

    AddLine;
  end;

  AddLine('implementation');

  AddLine;

  AddLine('uses System.SysUtils;');

  AddLine;

  for var ClassDefinition in Classes do
    GenerateClassImplementation(ClassDefinition);

  AddLine('end.');

  UnitDefinition.SaveToFile(Format('%s\%s.pas', [Importer.Configuration.OutputFolder, UnitConfiguration.Name]), TEncoding.UTF8);
end;

{ TClassDefinition }

procedure TClassDefinition.AddAtribute(const Value: String);
begin
  Attributes.Add(Value);
end;

procedure TClassDefinition.AddClassType(const ClassDefinition: TClassDefinition);
begin
  ClassDefinition.ParentClass := Self;

  FClasses.Add(ClassDefinition);
end;

procedure TClassDefinition.AddNamespaceAttribute(const Namespace: String);
begin
  if not Namespace.IsEmpty then
   AddAtribute(Format('XMLNamespace(''%s'')', [Namespace]));
end;

function TClassDefinition.AddProperty(const Name: String): TPropertyDefinition;
begin
  for var &Property in Properties do
    if &Property.Name = Name then
      Exit(&Property);

  Result := TPropertyDefinition.Create;
  Result.Name := Name;

  FProperties.Add(Result);
end;

constructor TClassDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited Create(Module);

  FProperties := TObjectList<TPropertyDefinition>.Create;
  FTargetNamespace := TargetNamespace;
end;

constructor TClassDefinition.Create(const Module: TTypeModuleDefinition; const TargetNamespace: String);
begin
  Create(Module);

  AddNamespaceAttribute(TargetNamespace);
end;

destructor TClassDefinition.Destroy;
begin
  FProperties.Free;

  inherited;
end;

function TClassDefinition.GetNeedAddFunction: Boolean;
begin
  Result := TImplementationInformation.NeedAddFunction in Informations;
end;

function TClassDefinition.GetNeedDestructor: Boolean;
begin
  Result := TImplementationInformation.NeedDestructor in Informations;
end;

function TClassDefinition.GetNeedImplementation: Boolean;
begin
  Result := Informations <> [];
end;

function TClassDefinition.GetUnitDefinition: TUnitDefinition;
begin
  var Parent := ParentModule;

  while not (Parent is TUnitDefinition) do
    Parent := Parent.ParentModule;

  Result := Parent as TUnitDefinition;
end;

{ TPropertyDefinition }

procedure TPropertyDefinition.AddAtribute(const Attribute: String; const Params: array of const);
begin
  AddAtribute(Format(Attribute, Params));
end;

procedure TPropertyDefinition.AddAtribute(const Attribute: String);
begin
  Attributes.Add(Attribute);
end;

procedure TPropertyDefinition.AddFieldAttribute(const Name: String);
begin
  AddAtribute('FieldName(''%s'')', [Name]);
end;

procedure TPropertyDefinition.AddXMLAttributeFixed(const Name, Value: String);
begin
  AddAtribute('XMLAttribute(''%s'', ''%s'')', [Name, value]);
end;

procedure TPropertyDefinition.AddXMLAttributeValue;
begin
  AddAtribute('XMLAttributeValue');
end;

procedure TPropertyDefinition.AddXMLValueAttribute;
begin
  AddAtribute('XMLValue');
end;

constructor TPropertyDefinition.Create;
begin
  FAttributes := TList<String>.Create;
end;

destructor TPropertyDefinition.Destroy;
begin
  FAttributes.Free;

  inherited;
end;

function TPropertyDefinition.GetNeedAddFunction: Boolean;
begin
  Result := TImplementationInformation.NeedAddFunction in Informations;
end;

function TPropertyDefinition.GetNeedDestructor: Boolean;
begin
  Result := TImplementationInformation.NeedDestructor in Informations;
end;

function TPropertyDefinition.GetNeedGetFunction: Boolean;
begin
  Result :=  TImplementationInformation.NeedGetFunction in Informations;
end;

function TPropertyDefinition.GetNeedIsStoredFunction: Boolean;
begin
  Result := TImplementationInformation.NeedIsStoredFunction in Informations;
end;

{ TTypeDefinition }

constructor TTypeDefinition.Create(const ParentModule: TTypeModuleDefinition);
begin
  inherited Create;

  FAttributes := TList<String>.Create;
  FParentAttributes := TList<String>.Create;
  FParentModule := ParentModule;
end;

destructor TTypeDefinition.Destroy;
begin
  FAttributes.Free;

  FParentAttributes.Free;

  inherited;
end;

function TTypeDefinition.GetAsArrayType: TTypeArrayDefinition;
begin
  Result := Self as TTypeArrayDefinition;
end;

function TTypeDefinition.GetAsClassDefinition: TClassDefinition;
begin
  Result := Self as TClassDefinition;
end;

function TTypeDefinition.GetAsDelayedType: TTypeDelayed;
begin
  Result := Self as TTypeDelayed;
end;

function TTypeDefinition.GetAsTypeAlias: TTypeAlias;
begin
  Result := Self as TTypeAlias;
end;

function TTypeDefinition.GetAsTypeEnumeration: TTypeEnumeration;
begin
  Result := Self as TTypeEnumeration;
end;

function TTypeDefinition.GetAsTypeExternal: TTypeExternal;
begin
  Result := Self as TTypeExternal;
end;

function TTypeDefinition.GetAsUnitDefinition: TUnitDefinition;
begin
  Result := Self as TUnitDefinition;
end;

function TTypeDefinition.GetIsArrayType: Boolean;
begin
  Result := Self is TTypeArrayDefinition;
end;

function TTypeDefinition.GetIsClassDefinition: Boolean;
begin
  Result := Self is TClassDefinition;
end;

function TTypeDefinition.GetIsDelayedType: Boolean;
begin
  Result := Self is TTypeDelayed;
end;

function TTypeDefinition.GetIsEnumeration: Boolean;
begin
  Result := Self is TTypeEnumeration;
end;

function TTypeDefinition.GetIsExternal: Boolean;
begin
  Result := Self is TTypeExternal;
end;

function TTypeDefinition.GetIsTypeAlias: Boolean;
begin
  Result := Self is TTypeAlias;
end;

function TTypeDefinition.GetIsUnitDefinition: Boolean;
begin
  Result := Self is TUnitDefinition;
end;

{ TTypeDelayed }

constructor TTypeDelayed.Create(const Importer: TSchemaImporter; const TypeName: String; const Module: TTypeModuleDefinition);
begin
  inherited Create(Module);

  FName := 'Delayed';
  FImporter := Importer;
  FTypeName := TypeName;
end;

function TTypeDelayed.ResolveType: TTypeDefinition;
begin
  if not Assigned(FType) then
    FType := FImporter.FindType(FTypeName, ParentModule);

  if not Assigned(FType) then
    FType := TUndefinedType.Create(FTypeName);

  Result := FType;
end;

{ TUndefinedType }

constructor TUndefinedType.Create(const TypeName: String);
begin
  inherited Create(nil);

  FName := TypeName;
end;

{ TConfiguration }

constructor TConfiguration.Create;
begin
  inherited;

  FMaxColumnSize := 80;
end;

destructor TConfiguration.Destroy;
begin
  for var AUnit in FUnitConfiguration do
    AUnit.Free;

  for var TypeDefinitionConfig in TypeDefinition do
    TypeDefinitionConfig.Free;

  inherited;
end;

{ TTypeExternal }

constructor TTypeExternal.Create(const ModuleName, TypeName: String);
begin
  inherited Create(nil);

  FModuleName := ModuleName;
  Name := TypeName;
end;

{ TJSONSchemaImport }

function TJSONSchemaImport.CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
begin
  Result := TClassDefinition.Create(ParentModule);
  Result.Name := ClassTypeName;

  ParentModule.Classes.Add(Result);
end;

procedure TJSONSchemaImport.DefineProperty(const ClassDefinition: TClassDefinition; const PropertyName: String; const PropertySchemaType: TSchema);
begin
  var Prop := TPropertyDefinition.Create;
  Prop.Name := PropertyName;
  Prop.PropertyType := GenerateTypeDefinition(ClassDefinition.UnitDefinition, PropertySchemaType, Prop.Name);

  if FormatPropertyName(Prop.Name) <> Prop.Name then
    Prop.AddFieldAttribute(Prop.Name);

  if not Assigned(Prop.PropertyType) then
    raise Exception.Create('Property type not found!');

  ClassDefinition.Properties.Add(Prop);
end;

function TJSONSchemaImport.GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
begin
  Result := CreateClassDefinition(ParentModule, ClassTypeName);

  GenerateProperties(Result, Schema);
end;

procedure TJSONSchemaImport.GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);
begin
  for var Pair in Schema.Properties do
    DefineProperty(ClassDefinition, Pair.Key, Pair.Value);
end;

function TJSONSchemaImport.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
var
  UnitDefinition: TUnitDefinition;

  function GetAnyTypeDefinition: TTypeDefinition;
  const
    ANY_TYPE_NAME = 'any';

  begin
    Result := FindType(ANY_TYPE_NAME, Module);

    if not Assigned(Result) then
    begin
      var AnyType := CreateTypeAlias(UnitDefinition, ANY_TYPE_NAME, AddTypeExternal('System.Rtti', 'TValue'));
      Result := AnyType;

      UnitDefinition.AddTypeAlias(AnyType);
    end;
  end;

  function GetItemArrayTypeDefinition(const ArraySchema: TSchema): TTypeDefinition;
  begin
    if Assigned(ArraySchema.items) then
      Result := GenerateTypeDefinition(Module, Schema.items, TypeName)
    else
      Result := GetAnyTypeDefinition;
  end;

  function CreateEnumerator: TTypeEnumeration;
  begin
    Result := TTypeEnumeration.Create(Module);
    Result.Name := TypeName;

    Result.Values.AddRange(Schema.enum);
  end;

  function GetPropertyName(const Schema: TSchema; var PropertyName: String): Boolean;
  begin
    if not Schema.ref.IsEmpty then
      PropertyName := GetReferenceName(Schema)
    else if Schema.&type <> TPropertyType.Undefined then
      PropertyName := TRttiEnumerationType.GetName(Schema.&type)
    else
      PropertyName := EmptyStr;

    Result := not PropertyName.IsEmpty;
  end;

begin
  Result := FindType(TypeName, Module);

  if not Assigned(Result) then
  begin
    if Module.IsUnitDefinition then
      UnitDefinition := Module.AsUnitDefinition
    else
      UnitDefinition := Module.AsClassDefinition.UnitDefinition;

    if not Schema.ref.IsEmpty then
      Result := GenerateTypeDefinition(Module, GetReferenceSchema(Schema), GetReferenceName(Schema))
    else if Schema = FJSONSchema then
      Result := FReferenceClassDefinition
    else
      case Schema.&type of
        TPropertyType.&array: Result := TTypeArrayDefinition.Create(UnitDefinition, GetItemArrayTypeDefinition(Schema));
        TPropertyType.boolean: Result := BooleanType;
        TPropertyType.null: Result := nil;
        TPropertyType.integer: Result := IntegerType;
        TPropertyType.number: Result := DoubleType;
        TPropertyType.&object: Result := GenerateClassDefinition(Module, TypeName, Schema);
        TPropertyType.&string: Result := StringType;
        else
        begin
          if Assigned(Schema.enum) then
            Result := CreateEnumerator
          else if Assigned(Schema.allOf + Schema.oneOf + Schema.anyOf) then
          begin
            var InnerClassDefinition := CreateClassDefinition(Module, TypeName);
            var PropertyName := EmptyStr;

            InnerClassDefinition.AddAtribute('SingleObject');

            for var SchemaProperty in Schema.allOf + Schema.oneOf + Schema.anyOf do
              if GetPropertyName(SchemaProperty, PropertyName) then
                DefineProperty(InnerClassDefinition, PropertyName, SchemaProperty);

            Result := InnerClassDefinition;
          end
          else
            Result := GetAnyTypeDefinition;
        end;
      end;
  end;
end;

procedure TJSONSchemaImport.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;
  var UnitClass := TClassDefinition.Create(UnitDefinition);
  UnitClass.Name := UnitFileConfiguration.UnitClassName;

  FJSONSchema := Serializer.Deserialize(LoadFile(UnitFileConfiguration), TypeInfo(TSchema)).AsType<TSchema>;

  if not FJSONSchema.schema.IsEmpty then
    LoadUnitFromReference(FJSONSchema.schema);

  UnitDefinition.Classes.Add(UnitClass);

  FReferenceClassDefinition := UnitClass;

  for var Definition in FJSONSchema.defs do
  begin
    var TypeDefinition := GenerateTypeDefinition(UnitClass, Definition.Value, Definition.Key);

    if TypeDefinition.IsEnumeration then
      UnitDefinition.Enumerations.Add(TypeDefinition.AsTypeEnumeration)
    else if not TypeDefinition.IsClassDefinition then
      UnitDefinition.AddTypeAlias(CreateTypeAlias(UnitDefinition, Definition.Key, TypeDefinition));
  end;

  GenerateProperties(UnitClass, FJSONSchema);

  FJSONSchema.Free;
end;

function TJSONSchemaImport.GetReferenceName(const Schema: TSchema): String;
begin
  var Values := Schema.ref.Split(['/']);

  Result := Values[High(Values)];

  if Result = '#' then
    Result := 'Schema';
end;

function TJSONSchemaImport.GetReferenceSchema(const Schema: TSchema): TSchema;
begin
  var List: TMap<String, TSchema> := nil;
  Result := nil;

  for var ReferenceName in Schema.ref.Split(['/']) do
    if ReferenceName = '#' then
      Result := FJSONSchema
    else if (ReferenceName = 'definitions') or (ReferenceName = 'defs') then
      List := Result.defs
    else if ReferenceName = 'properties' then
      List := Result.properties
    else
      Result := List[ReferenceName];

  if not Assigned(Result) then
    raise Exception.CreateFmt('Reference not found %s', [Schema.ref]);
end;

{ TTypeEnumeration }

constructor TTypeEnumeration.Create(const Module: TTypeModuleDefinition);
begin
  inherited;

  FValues := TList<String>.Create;
end;

destructor TTypeEnumeration.Destroy;
begin
  FValues.Free;

  inherited;
end;

function TTypeEnumeration.GetEnumeratorName: String;
begin
  if ParentModule.IsClassDefinition then
    Result := GetTypePrefixName(Name)
  else
    Result := Name;
end;

{ TTypeModuleDefinition }

constructor TTypeModuleDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited;

  FClasses := TObjectList<TClassDefinition>.Create;
  FEnumerations := TObjectList<TTypeEnumeration>.Create;
end;

destructor TTypeModuleDefinition.Destroy;
begin
  FClasses.Free;

  FEnumerations.Free;

  inherited;
end;

{ TSchemaHelper }

function TSchemaHelper.GetIsArray: Boolean;
begin
  Result := &type = TPropertyType.&array;
end;

{ TTypeArrayDefinition }

constructor TTypeArrayDefinition.Create(const Module: TTypeModuleDefinition; const ArrayType: TTypeDefinition);
begin
  inherited Create(Module);

  FArrayType := ArrayType;
end;

{ TUnitDefinitionConfiguration }

destructor TUnitDefinitionConfiguration.Destroy;
begin
  for var UnitFile in Files do
    UnitFile.Free;

  inherited;
end;

end.

