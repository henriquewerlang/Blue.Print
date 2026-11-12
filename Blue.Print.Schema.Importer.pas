unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Classes, System.SysUtils, System.Rtti, System.Generics.Collections;

type
  TPropertyConfiguration = class;
  TSchemaImporter = class;
  TTypeAliasDefinition = class;
  TTypeAttributeDefinition = class;
  TTypeClassDefinition = class;
  TTypeDefinition = class;
  TTypeEnumerationDefinition = class;
  TTypeGenericDefinition = class;
  TTypeInterfaceDefinition = class;
  TTypeMethodDefinition = class;
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

  ESchemaNamespaceAlreadyExists = class(Exception)
  public
    constructor Create(const Namespace: String);
  end;

  ESchemaNamespaceWithSamePrefix = class(Exception)
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

  ETypeDuplicateNameInTheNamespace = class(Exception)
  public
    constructor Create(const Namespace: String; const TypeDefinition: TTypeDefinition);
  end;

  EPropertyConfigurationNotFound = class(Exception)
  public
    constructor Create(const Configuration: TPropertyConfiguration);
  end;

  TBuildInType = (StringType, IntegerType, DoubleType, DateType, TimeType, DateTimeType, BooleanType, ArrayType, ValueType, DynamicPropertyType);
  TMethodType = (Method, &Destructor, AddFunction, GetFunction, SetProcedure);
  TSchemaType = (Undefined, XSD, WSDL, JSONDraft4, OpenAPI20, OpenAPI30, OpenAPI31, OpenAPI32);

  TTypeAttributeDefinition = class
  private
    FDeclaration: String;
  public
    constructor Create(const Declaration: String);

    property Declaration: String read FDeclaration;
  end;

  TTypePatchAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeDeleteAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeGetAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypePostAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypePutAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeOptionsAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeBodyAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeQueryAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypePathAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypePathNameAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeFormURLEncodedAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeJSONAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeMultiPartFormDataAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeHeaderValueAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeFieldNameAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypePatternPropertyAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeRemoteNameAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeFlatAttribute = class(TTypeAttributeDefinition)
  public
    constructor Create;
  end;

  TTypeCommonDefinition = class
  private
    FAttributes: TArray<TTypeAttributeDefinition>;
    FName: String;
  public
    destructor Destroy; override;

    function HasAttributes: Boolean;

    procedure AddAttribute(const Value: TTypeAttributeDefinition);

    property Attributes: TArray<TTypeAttributeDefinition> read FAttributes;
    property Name: String read FName;
  end;

  TTypeDefinition = class(TTypeCommonDefinition)
  private
    FParentModule: TTypeModuleDefinition;

    function GetIsAliasDefinition: Boolean;
    function GetIsArrayDefinition: Boolean;
    function GetIsClassDefinition: Boolean;
    function GetIsDynamicPropertyDefinition: Boolean;
    function GetIsEnumeratorDefinition: Boolean;
    function GetIsGenericDefinition: Boolean;
    function GetIsReferenceDefinition: Boolean;
    function GetIsUnitDefinition: Boolean;
    function GetParentModule: TTypeModuleDefinition;
  public
    function AsAliasDefinition: TTypeAliasDefinition;
    function AsClassDefinition: TTypeClassDefinition;
    function AsEnumeratorDefinition: TTypeEnumerationDefinition;
    function AsGenericDefinition: TTypeGenericDefinition;
    function AsInterfaceDefinition: TTypeInterfaceDefinition;
    function AsReferenceDefinition: TTypeReferenceDefinition;

    property IsAliasDefinition: Boolean read GetIsAliasDefinition;
    property IsArrayDefinition: Boolean read GetIsArrayDefinition;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property IsDynamicPropertyDefinition: Boolean read GetIsDynamicPropertyDefinition;
    property IsEnumeratorDefinition: Boolean read GetIsEnumeratorDefinition;
    property IsGenericDefinition: Boolean read GetIsGenericDefinition;
    property IsReferenceDefinition: Boolean read GetIsReferenceDefinition;
    property IsUnitDefinition: Boolean read GetIsUnitDefinition;
    property ParentModule: TTypeModuleDefinition read GetParentModule write FParentModule;
  end;

  TTypeEnumerationDefinition = class(TTypeDefinition)
  private
    FValues: TStringList;
    function GetValues: TStringList;
  public
    destructor Destroy; override;

    procedure AddEnumeration(const Value: String);

    property Values: TStringList read GetValues;
  end;

  TTypeGenericDefinition = class(TTypeDefinition)
  private
    FBuildInType: TBuildInType;
  protected
    FGenericType: TTypeDefinition;
  public
    constructor Create(const BuildInType: TBuildInType);

    property BuildInType: TBuildInType read FBuildInType;
    property GenericType: TTypeDefinition read FGenericType;
  end;

  TTypeArrayDefinition = class(TTypeGenericDefinition)
  public
    constructor Create;

    property ArrayType: TTypeDefinition read FGenericType;
  end;

  TTypeDynamicPropertyDefinition = class(TTypeGenericDefinition)
  public
    constructor Create;

    property DynamicType: TTypeDefinition read FGenericType;
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
    property Types: TArray<TTypeDefinition> read FTypes;
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
    FPrivateMethods: TArray<TTypeMethodDefinition>;
    FProperties: TArray<TTypePropertyDefinition>;
    FPublicMethods: TArray<TTypeMethodDefinition>;

    function GetHasProperties: Boolean;
  public
    destructor Destroy; override;

    function AddProperty(const Name: String; const PropertyType: TTypeDefinition): TTypePropertyDefinition;
    function AllMethods: TArray<TTypeMethodDefinition>;

    procedure AddMethod(const Method: TTypeMethodDefinition; const PrivateMethod: Boolean);

    property HasProperties: Boolean read GetHasProperties;
    property PrivateMethods: TArray<TTypeMethodDefinition> read FPrivateMethods;
    property Properties: TArray<TTypePropertyDefinition> read FProperties;
    property PublicMethods: TArray<TTypeMethodDefinition> read FPublicMethods;
  end;

  TTypeParameterDefinition = class(TTypeCommonDefinition)
  private
    FIsOptional: Boolean;
    FParameterType: TTypeDefinition;
  public
    property IsOptional: Boolean read FIsOptional write FIsOptional;
    property ParameterType: TTypeDefinition read FParameterType;
  end;

  TTypeMethodDefinition = class(TTypeCommonDefinition)
  private
    FParameters: TArray<TTypeParameterDefinition>;
    FPropertyDefinition: TTypePropertyDefinition;
    FReturnValue: TTypeDefinition;
    FMethodType: TMethodType;

    function GetIsDestructor: Boolean;
    function GetIsFunction: Boolean;
  public
    destructor Destroy; override;

    procedure AddParameter(const Parameter: TTypeParameterDefinition);

    property IsDestructor: Boolean read GetIsDestructor;
    property IsFunction: Boolean read GetIsFunction;
    property MethodType: TMethodType read FMethodType;
    property Parameters: TArray<TTypeParameterDefinition> read FParameters;
    property PropertyDefinition: TTypePropertyDefinition read FPropertyDefinition;
    property ReturnValue: TTypeDefinition read FReturnValue;
  end;

  TTypeInterfaceDefinition = class(TTypeDefinition)
  private
    FMethods: TArray<TTypeMethodDefinition>;
  public
    destructor Destroy; override;

    procedure AddMethod(const Method: TTypeMethodDefinition);

    property Methods: TArray<TTypeMethodDefinition> read FMethods;
  end;

  TTypeUnitDefinition = class(TTypeModuleDefinition)
  private
    FInterfaces: TArray<TTypeInterfaceDefinition>;
    function GetHasInterfaces: Boolean;
  public
    property HasInterfaces: Boolean read GetHasInterfaces;

    property Interfaces: TArray<TTypeInterfaceDefinition> read FInterfaces write FInterfaces;
  end;

  TSchemaFileConfiguration = class
  private
    FSchemaType: TSchemaType;
    FFileName: String;
    FMainModuleName: String;
    FServiceInterfaceName: String;
  published
    property SchemaType: TSchemaType read FSchemaType write FSchemaType;
    property FileName: String read FFileName write FFileName;
    property MainModuleName: String read FMainModuleName write FMainModuleName;
    property ServiceInterfaceName: String read FServiceInterfaceName write FServiceInterfaceName;
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

  TAppendProperty = class
  private
    FTypeName: String;
    FName: String;
    FPropertyType: String;
    FOptional: Boolean;
  public
    constructor Create;
  published
    property TypeName: String read FTypeName write FTypeName;
    property Name: String read FName write FName;
    property PropertyType: String read FPropertyType write FPropertyType;
    property Optional: Boolean read FOptional write FOptional;
  end;

  TTypeConfiguration = class
  private
    FChangeName: String;
    FName: String;
  published
    property ChangeName: String read FChangeName write FChangeName;
    property Name: String read FName write FName;
  end;

  TPropertyConfiguration = class
  private
    FChangeName: String;
    FName: String;
    FTypeName: String;
  published
    property TypeName: String read FTypeName write FTypeName;
    property Name: String read FName write FName;
    property ChangeName: String read FChangeName write FChangeName;
  end;

  TConfiguration = class
  private
    FAppendProperties: TArray<TAppendProperty>;
    FNamespaces: TArray<TNamespaceConfiguration>;
    FUnits: TArray<TUnitConfiguration>;
    FOutputFolder: String;
    FTypeConfiguration: TArray<TTypeConfiguration>;
    FPropertyConfiguration: TArray<TPropertyConfiguration>;
  public
    destructor Destroy; override;
  published
    property AppendProperties: TArray<TAppendProperty> read FAppendProperties write FAppendProperties;
    property Namespaces: TArray<TNamespaceConfiguration> read FNamespaces write FNamespaces;
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property PropertyConfiguration: TArray<TPropertyConfiguration> read FPropertyConfiguration write FPropertyConfiguration;
    property TypeConfiguration: TArray<TTypeConfiguration> read FTypeConfiguration write FTypeConfiguration;
    property Units: TArray<TUnitConfiguration> read FUnits write FUnits;
  end;

  TSchema = class
  private
    FCurrentUnit: TTypeUnitDefinition;
    FImporter: TSchemaImporter;
    FNamespace: String;
    FSchemaText: String;
    FSchemaFile: TSchemaFileConfiguration;
    FSchemaValue: TValue;
    FMainClass: TTypeClassDefinition;
    FServiceInterface: TTypeInterfaceDefinition;
  public
    destructor Destroy; override;

    property CurrentUnit: TTypeUnitDefinition read FCurrentUnit;
    property Importer: TSchemaImporter read FImporter;
    property MainClass: TTypeClassDefinition read FMainClass;
    property Namespace: String read FNamespace write FNamespace;
    property SchemaFile: TSchemaFileConfiguration read FSchemaFile;
    property SchemaText: String read FSchemaText write FSchemaText;
    property SchemaValue: TValue read FSchemaValue write FSchemaValue;
    property ServiceInterface: TTypeInterfaceDefinition read FServiceInterface;
  end;

  ISchemaConverter = interface
    procedure Convert(const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

  TConverters = array[TSchemaType] of ISchemaConverter;

  TSchemaImporter = class
  private
    FBuildInTypes: array[TBuildInType] of TTypeDefinition;
    FBuildInUnits: TList<TTypeUnitDefinition>;
    FNamespaces: TDictionary<String, String>;
    FNamespacesPrefix: TDictionary<String, String>;
    FTypes: TDictionary<String, TTypeDefinition>;
    FUnits: TDictionary<String, TTypeUnitDefinition>;

    class function CreateStringListForItems: TStringList;

    function CreateTypeAttribute<T: TTypeAttributeDefinition, constructor>(const TypeDefinition: TTypeCommonDefinition): T;
    function CreateTypeAttributeWithValue<T: TTypeAttributeDefinition, constructor>(const TypeDefinition: TTypeCommonDefinition; const Value: String): T;
    function CreateTypeDefinition<T: TTypeDefinition, constructor>(const ParentModule: TTypeModuleDefinition): T;
    function CreateTypeDefinitionWithName<T: TTypeDefinition, constructor>(const ParentModule: TTypeModuleDefinition; const Name: String): T;
    function FormatTypeNamespace(const Namespace, TypeName: String): String;
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
    function CreateBodyAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypeBodyAttribute;
    function CreateClassType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeClassDefinition;
    function CreateDeleteAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeDeleteAttribute;
    function CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const DynamicType: TTypeDefinition): TTypeDynamicPropertyDefinition;
    function CreateEnumeratorType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeEnumerationDefinition;
    function CreateFieldNameType(const PropertyDefinition: TTypePropertyDefinition; const FieldName: String): TTypeFieldNameAttribute;
    function CreateFlatAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeFlatAttribute;
    function CreateFormURLEncodedAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeFormURLEncodedAttribute;
    function CreateGetAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeGetAttribute;
    function CreateHeaderValueAttribute(const ParameterDefinition: TTypeParameterDefinition; const HeaderName: String): TTypeHeaderValueAttribute;
    function CreateInterfaceType(const ParentModule: TTypeUnitDefinition; const Name: String): TTypeInterfaceDefinition;
    function CreateJSONAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeAttributeDefinition;
    function CreateMultiPartFormDataAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeMultiPartFormDataAttribute;
    function CreateOptionsAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeOptionsAttribute;
    function CreateParameter(const MethodDefinition: TTypeMethodDefinition; const Name: String; const ParameterType: TTypeDefinition): TTypeParameterDefinition;
    function CreatePatchAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePatchAttribute;
    function CreatePathAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypePathAttribute;
    function CreatePathNameAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypePathNameAttribute;
    function CreatePatternPropertyAttribute(const PropertyDefinition: TTypePropertyDefinition; const Pattern: String): TTypePatternPropertyAttribute;
    function CreatePostAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePostAttribute;
    function CreatePutAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePutAttribute;
    function CreateQueryAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypeQueryAttribute;
    function CreateReferenceType(const ParentModule: TTypeModuleDefinition; const Name, Namespace, Reference: String): TTypeReferenceDefinition;
    function CreateRemoteNameAttribute(const TypeDefinition: TTypeCommonDefinition; const Name: String): TTypeRemoteNameAttribute;
    function CreateServiceMethod(const InterfaceDefinition: TTypeInterfaceDefinition; const Name: String; const ReturnType: TTypeDefinition): TTypeMethodDefinition;
    function FindType(const Namespace, Name: String): TTypeDefinition;
    function FindTypeWithPrefix(const Fullname: String): TTypeDefinition;
    function GetPrefixName(const Namespace: String): String;
    function TryFindType(const Namespace, Name: String; var TypeDefinition: TTypeDefinition): Boolean;
    function TryFindTypeWithPrefix(const FullName: String; var TypeDefinition: TTypeDefinition): Boolean;

    procedure AddNamespace(const Name, Prefix: String);
    procedure AddType(const Namespace: String; const TypeDefinition: TTypeDefinition);
    procedure Import(const Configuration: TConfiguration); overload;
    procedure Import(const ConfigurationFileName: String); overload;

    property BuildInTypes[const BuildInType: TBuildInType]: TTypeDefinition read GetBuildInTypes write SetBuildInTypes;
    property Namespaces: TDictionary<String, String> read FNamespaces;
    property NamespacesPrefix: TDictionary<String, String> read FNamespacesPrefix;
    property Types: TDictionary<String, TTypeDefinition> read FTypes;
    property Units: TDictionary<String, TTypeUnitDefinition> read FUnits;
  end;

implementation

uses System.IOUtils, System.Character, System.Hash, Blue.Print.Types, Blue.Print.Serializer, System.Generics.Defaults;

const
  SYSTEM_BLUE_PRINT_TYPES_UNIT_NAME = 'Blue.Print.Types';
  SYSTEM_UNIT_NAME = 'System';
  TYPE_NAME_SEPARATOR = '.';

type
  TTypeCommonComparer<T: TTypeCommonDefinition> = class(TNoRefCountObject, IComparer<T>)
  private class var
    FComparer: TTypeCommonComparer<T>;
  private
    class destructor Destroy;

    class function Comparer: IComparer<T>;
  protected
    function Compare(const Left, Right: T): Integer; virtual;
  end;

  TTypeMethodComparer = class(TTypeCommonComparer<TTypeMethodDefinition>, IComparer<TTypeMethodDefinition>)
  protected
    function Compare(const Left, Right: TTypeMethodDefinition): Integer; override;
  end;

{ TSchemaImporter }

procedure TSchemaImporter.AddNamespace(const Name, Prefix: String);
begin
  if not Namespaces.TryAdd(Name, Prefix) then
    raise ESchemaNamespaceAlreadyExists.Create(Name);

  if not NamespacesPrefix.TryAdd(Prefix, Name) then
    raise ESchemaNamespaceWithSamePrefix.Create(Name);
end;

procedure TSchemaImporter.AddType(const Namespace: String; const TypeDefinition: TTypeDefinition);
begin
  if not Types.TryAdd(FormatTypeNamespace(Namespace, TypeDefinition.Name), TypeDefinition) then
    raise ETypeDuplicateNameInTheNamespace.Create(Namespace, TypeDefinition);
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInUnits := TObjectList<TTypeUnitDefinition>.Create(True);
  FNamespaces := TDictionary<String, String>.Create;
  FNamespacesPrefix := TDictionary<String, String>.Create;
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
  Result.FGenericType := ArrayType;
end;

function TSchemaImporter.CreateBodyAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypeBodyAttribute;
begin
  Result := CreateTypeAttribute<TTypeBodyAttribute>(ParameterDefinition);
end;

function TSchemaImporter.CreateClassType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeClassDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeClassDefinition>(ParentModule, Name);

  ParentModule.FClasses := ParentModule.FClasses + [Result];
end;

function TSchemaImporter.CreateDeleteAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeDeleteAttribute;
begin
  Result := CreateTypeAttribute<TTypeDeleteAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const DynamicType: TTypeDefinition): TTypeDynamicPropertyDefinition;
begin
  Result := CreateTypeDefinition<TTypeDynamicPropertyDefinition>(ParentModule);
  Result.FGenericType := DynamicType;
end;

function TSchemaImporter.CreateEnumeratorType(const ParentModule: TTypeModuleDefinition; const Name: String): TTypeEnumerationDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeEnumerationDefinition>(ParentModule, Name);

  ParentModule.FEnumerations := ParentModule.FEnumerations + [Result];
end;

function TSchemaImporter.CreateFieldNameType(const PropertyDefinition: TTypePropertyDefinition; const FieldName: String): TTypeFieldNameAttribute;
begin
  Result := CreateTypeAttributeWithValue<TTypeFieldNameAttribute>(PropertyDefinition, FieldName);
end;

function TSchemaImporter.CreateFlatAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeFlatAttribute;
begin
  Result := CreateTypeAttribute<TTypeFlatAttribute>(TypeDefinition);
end;

function TSchemaImporter.CreateFormURLEncodedAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeFormURLEncodedAttribute;
begin
  Result := CreateTypeAttribute<TTypeFormURLEncodedAttribute>(TypeDefinition);
end;

function TSchemaImporter.CreateGetAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeGetAttribute;
begin
  Result := CreateTypeAttribute<TTypeGetAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreateHeaderValueAttribute(const ParameterDefinition: TTypeParameterDefinition; const HeaderName: String): TTypeHeaderValueAttribute;
begin
  Result := CreateTypeAttributeWithValue<TTypeHeaderValueAttribute>(ParameterDefinition, HeaderName);
end;

function TSchemaImporter.CreateInterfaceType(const ParentModule: TTypeUnitDefinition; const Name: String): TTypeInterfaceDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeInterfaceDefinition>(ParentModule, Name);

  ParentModule.Interfaces := ParentModule.Interfaces + [Result];
end;

function TSchemaImporter.CreateJSONAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeAttributeDefinition;
begin
  Result := CreateTypeAttribute<TTypeJSONAttribute>(TypeDefinition);
end;

function TSchemaImporter.CreateMultiPartFormDataAttribute(const TypeDefinition: TTypeCommonDefinition): TTypeMultiPartFormDataAttribute;
begin
  Result := CreateTypeAttribute<TTypeMultiPartFormDataAttribute>(TypeDefinition);
end;

function TSchemaImporter.CreateOptionsAttribute(const MethodDefinition: TTypeMethodDefinition): TTypeOptionsAttribute;
begin
  Result := CreateTypeAttribute<TTypeOptionsAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreateParameter(const MethodDefinition: TTypeMethodDefinition; const Name: String; const ParameterType: TTypeDefinition): TTypeParameterDefinition;
begin
  Result := TTypeParameterDefinition.Create;
  Result.FName := Name;
  Result.FParameterType := ParameterType;

  MethodDefinition.AddParameter(Result);
end;

function TSchemaImporter.CreatePatchAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePatchAttribute;
begin
  Result := CreateTypeAttribute<TTypePatchAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreatePathAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypePathAttribute;
begin
  Result := CreateTypeAttribute<TTypePathAttribute>(ParameterDefinition);
end;

function TSchemaImporter.CreatePathNameAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypePathNameAttribute;
begin
  Result := CreateTypeAttribute<TTypePathNameAttribute>(ParameterDefinition)
end;

function TSchemaImporter.CreatePatternPropertyAttribute(const PropertyDefinition: TTypePropertyDefinition; const Pattern: String): TTypePatternPropertyAttribute;
begin
  Result := CreateTypeAttributeWithValue<TTypePatternPropertyAttribute>(PropertyDefinition, Pattern);
end;

function TSchemaImporter.CreatePostAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePostAttribute;
begin
  Result := CreateTypeAttribute<TTypePostAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreatePutAttribute(const MethodDefinition: TTypeMethodDefinition): TTypePutAttribute;
begin
  Result := CreateTypeAttribute<TTypePutAttribute>(MethodDefinition);
end;

function TSchemaImporter.CreateQueryAttribute(const ParameterDefinition: TTypeParameterDefinition): TTypeQueryAttribute;
begin
  Result := CreateTypeAttribute<TTypeQueryAttribute>(ParameterDefinition);
end;

function TSchemaImporter.CreateReferenceType(const ParentModule: TTypeModuleDefinition; const Name, Namespace, Reference: String): TTypeReferenceDefinition;
begin
  Result := CreateTypeDefinitionWithName<TTypeReferenceDefinition>(ParentModule, Name);
  Result.FNamespace := Namespace;
  Result.FReference := Reference;
end;

function TSchemaImporter.CreateRemoteNameAttribute(const TypeDefinition: TTypeCommonDefinition; const Name: String): TTypeRemoteNameAttribute;
begin
  Result := CreateTypeAttributeWithValue<TTypeRemoteNameAttribute>(TypeDefinition, Name);
end;

function TSchemaImporter.CreateServiceMethod(const InterfaceDefinition: TTypeInterfaceDefinition; const Name: String; const ReturnType: TTypeDefinition): TTypeMethodDefinition;
begin
  Result := TTypeMethodDefinition.Create;
  Result.FName := Name;
  Result.FReturnValue := ReturnType;

  InterfaceDefinition.AddMethod(Result);
end;

class function TSchemaImporter.CreateStringListForItems: TStringList;
const
  LIST_SEPARATOR = ', ';

begin
  Result := TStringList.Create;
  Result.LineBreak := LIST_SEPARATOR;
  Result.TrailingLineBreak := False;
end;

function TSchemaImporter.CreateTypeAttribute<T>(const TypeDefinition: TTypeCommonDefinition): T;
begin
  Result := T.Create;

  TypeDefinition.AddAttribute(Result);
end;

function TSchemaImporter.CreateTypeAttributeWithValue<T>(const TypeDefinition: TTypeCommonDefinition; const Value: String): T;
begin
  Result := CreateTypeAttribute<T>(TypeDefinition);
  Result.FDeclaration := Format(Result.FDeclaration, [Value]);
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
  Result.FName := Name;
end;

destructor TSchemaImporter.Destroy;
begin
  FBuildInUnits.Free;

  FNamespaces.Free;

  FNamespacesPrefix.Free;

  FTypes.Free;

  FUnits.Free;

  inherited;
end;

function TSchemaImporter.FindType(const Namespace, Name: String): TTypeDefinition;
begin
  if not TryFindType(Namespace, Name, Result) then
    raise ETypeNotFound.Create(Name);
end;

function TSchemaImporter.FindTypeWithPrefix(const Fullname: String): TTypeDefinition;
begin
  if not TryFindTypeWithPrefix(Fullname, Result) then
    raise ETypeNotFound.Create(Fullname);
end;

function TSchemaImporter.FormatTypeNamespace(const Namespace, TypeName: String): String;
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

  function CreateMainClass(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeClassDefinition;
  begin
    Result := CreateClassType(UnitDefinition, Schema.SchemaFile.MainModuleName);

    AddType(Schema.Namespace, Result);
  end;

  function LoadMainClass(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeClassDefinition;
  begin
    var MainModuleName := Schema.SchemaFile.MainModuleName;
    var TypeFound: TTypeDefinition;

    if TryFindType(Schema.Namespace, MainModuleName, TypeFound) then
      Result := TypeFound.AsClassDefinition
    else
      Result := CreateMainClass(UnitDefinition, Schema);
  end;

  function CreateServiceInterface(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeInterfaceDefinition;
  begin
    Result := CreateInterfaceType(UnitDefinition, Schema.SchemaFile.ServiceInterfaceName);

    AddType(Schema.Namespace, Result);
  end;

  function LoadServiceInterface(const UnitDefinition: TTypeUnitDefinition; const Schema: TSchema): TTypeInterfaceDefinition;
  begin
    var ServiceInterfaceName := Schema.SchemaFile.ServiceInterfaceName;
    var TypeFound: TTypeDefinition;

    if ServiceInterfaceName.IsEmpty then
      Result := nil
    else if TryFindType(Schema.Namespace, ServiceInterfaceName, TypeFound) then
      Result := TypeFound.AsInterfaceDefinition
    else
      Result := CreateServiceInterface(UnitDefinition, Schema);
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

  procedure AppendProperties;
  begin
    for var AppendProperty in Configuration.AppendProperties do
    begin
      var ClassDefinition := FindTypeWithPrefix(AppendProperty.TypeName).AsClassDefinition;

      ClassDefinition.AddProperty(AppendProperty.Name, FindTypeWithPrefix(AppendProperty.PropertyType)).Optional := AppendProperty.Optional;
    end;
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

    function CheckReservedWord(const Name: String; const ReservedNames: TArray<String>): String;
    const
      SPECIAL_CHARACTER_SCAPE_CHAR = '&';

    begin
      for var ReservedName in ReservedNames do
        if SameText(Name, ReservedName) then
          Exit(SPECIAL_CHARACTER_SCAPE_CHAR + Name);

      Result := Name;
    end;

    function CheckReservedNames(const Name: String): String;
    begin
      Result := CheckReservedWord(Name, ['type', 'mod', 'to', 'if', 'then', 'else', 'type', 'class', 'array', 'object', 'const', 'not', 'in', 'file', 'is', 'end', 'label', 'function', 'procedure']);
    end;

    function RemoveInvalidCharecters(const Name: String): String;
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

      var FormatChar := NormalChar;
      Result := EmptyStr;

      for var Character in Name do
        if Character.IsLetter or Character.IsNumber or (Character = '_') then
        begin
          Result := Result + FormatChar(Character);

          FormatChar := NormalChar;
        end
        else
          FormatChar := UpperChar;
    end;

    function FormatTypeName(const Name: String): String; overload;
    begin
      Result := RemoveInvalidCharecters(Name);

      if not Result.IsEmpty and not SameText(Result, Name) then
        Result := RemoveInvalidCharecters('T.' + Result);

      Result := CheckReservedNames(Result);
    end;

    function CheckStringName(const Name: String): String;
    begin
      Result := CheckReservedWord(Name, ['string']);
    end;

    function FormatName(const Name: String): String;
    begin
      Result := CheckStringName(FormatTypeName(Name));
    end;

    function ResolveReferenceType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
    begin
      if TypeDefinition.IsReferenceDefinition then
      begin
        var ReferenceDefinition := TypeDefinition.AsReferenceDefinition;

        Result := FindType(ReferenceDefinition.Namespace, ReferenceDefinition.Reference);
      end
      else
        Result := TypeDefinition;
    end;

    function FormatTypeName(const TypeDefinition: TTypeDefinition): String; overload;
    begin
      Result := FormatTypeName(ResolveReferenceType(TypeDefinition).Name);
    end;

    function FormatModuleName(const ModuleTypeDefinition: TTypeModuleDefinition): String;
    begin
      Result := ModuleTypeDefinition.Name;

      if not ModuleTypeDefinition.IsUnitDefinition then
        Result := CheckReservedNames(FormatName(Result));
    end;

    function FormatParentModuleName(const TypeDefinition: TTypeDefinition; const AppendUnitName: Boolean): String;

      function FormatParentModule(ParentModule: TTypeModuleDefinition): String;
      begin
        Result := EmptyStr;

        if Assigned(ParentModule) then
        begin
          if not ParentModule.IsUnitDefinition then
            Result := FormatParentModule(ParentModule.ParentModule)
          else if not AppendUnitName then
            Exit;

          Result := Result + FormatModuleName(ParentModule) + TYPE_NAME_SEPARATOR;
        end;
      end;

    begin
      if Assigned(TypeDefinition) then
        Result := FormatParentModule(TypeDefinition.ParentModule)
      else
        Result := EmptyStr;
    end;

    function FormatFullTypeName(TypeDefinition: TTypeDefinition): String;
    begin
      TypeDefinition := ResolveReferenceType(TypeDefinition);

      if TypeDefinition.IsGenericDefinition then
      begin
        var GenericDefinition := TypeDefinition.AsGenericDefinition;
        Result := FormatFullTypeName(GenericDefinition.GenericType);
        TypeDefinition := BuildInTypes[GenericDefinition.BuildInType];

        Result := Format(TypeDefinition.Name, [Result])
      end
      else
        Result := FormatTypeName(TypeDefinition);

      Result := FormatParentModuleName(TypeDefinition, True) + Result;
    end;

    function GetGenericType(const TypeDefinition: TTypeDefinition; var GenericTypeDefinition: TTypeDefinition): Boolean;
    begin
      GenericTypeDefinition := ResolveReferenceType(TypeDefinition);
      Result := GenericTypeDefinition.IsGenericDefinition;

      if Result then
        GenericTypeDefinition := ResolveReferenceType(GenericTypeDefinition.AsGenericDefinition.GenericType)
      else if GenericTypeDefinition.IsAliasDefinition then
        Result := GetGenericType(GenericTypeDefinition.AsAliasDefinition.TypeAlias, GenericTypeDefinition);
    end;

    function FormatGenericItemTypeName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      var ArrayType: TTypeDefinition;

      GetGenericType(PropertyDefinition.PropertyType, ArrayType);

      Result := FormatFullTypeName(ArrayType);
    end;

    function FormatClassName(const ClassDefinition: TTypeClassDefinition): String;
    begin
      Result := Format('%s = class', [FormatModuleName(ClassDefinition)]);
    end;

    function FormatEnumerationName(const EnumerationDefinition: TTypeEnumerationDefinition): String;
    begin
      Result := CheckReservedNames(FormatName(EnumerationDefinition.Name));
    end;

    function FormatEnumerationValueName(const Value: String): String;
    begin
      Result := CheckStringName(RemoveInvalidCharecters(Value));

      if Result.IsEmpty then
        Result := 'tEmpty'
      else if Result[1].IsNumber then
        Result := 't' + Result;

      Result := CheckReservedNames(Result);
    end;

    procedure GenerateEnumerationsDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      if Assigned(ModuleDefinition.Enumerations) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);
        var EnumerationValues := CreateStringListForItems;
        var EnumerationValuesFormated := CreateStringListForItems;

        for var Enumerator in ModuleDefinition.Enumerations do
        begin
          EnumerationValues.Clear;

          EnumerationValuesFormated.Clear;

          for var Value in Enumerator.Values do
          begin
            var EnumeratorValue := FormatEnumerationValueName(Value);

            if not EnumerationValuesFormated.Contains(EnumeratorValue) then
              EnumerationValuesFormated.Add(EnumeratorValue);

            if not EnumerationValues.Contains(Value) then
              EnumerationValues.Add(Value);
          end;

          if not SameText(EnumerationValues.Text, EnumerationValuesFormated.Text) then
            AddLine(CurrentIndentation, '[EnumValue(''%s'')]', [EnumerationValues.Text]);

          AddLine(CurrentIndentation, '%s = (%s);', [FormatEnumerationName(Enumerator), EnumerationValuesFormated.Text]);

          AddWhiteLine;
        end;

        EnumerationValues.Free;

        EnumerationValuesFormated.Free;
      end;
    end;

    function FormatPropertyName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := FormatName(RemoveInvalidCharecters(PropertyDefinition.Name));
    end;

    function FormatFieldName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := RemoveInvalidCharecters('F.' + FormatPropertyName(PropertyDefinition));
    end;

    function FormatMethodName(const Method: TTypeMethodDefinition): String;
    begin
      Result := FormatName(RemoveInvalidCharecters(Method.Name));
    end;

    function FormatParameterName(const Parameter: TTypeParameterDefinition): String;
    begin
      Result := FormatName(RemoveInvalidCharecters(Parameter.Name));
    end;

    function NeedGetFunction(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      Result := ResolveReferenceType(PropertyDefinition.PropertyType).IsClassDefinition;
    end;

    function NeedSetFunction(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      Result := PropertyDefinition.Optional;
    end;

    function FunctionAddNeedReturnType(const PropertyDefinition: TTypePropertyDefinition): Boolean;
    begin
      var GenericType: TTypeDefinition;

      GetGenericType(PropertyDefinition.PropertyType, GenericType);

      Result := GenericType.IsClassDefinition;
    end;

    function FormatPropertyTypeName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := FormatFullTypeName(PropertyDefinition.PropertyType);
    end;

    function FormatGetFunctionName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := RemoveInvalidCharecters('Get.' + FormatPropertyName(PropertyDefinition));
    end;

    function FormatSetFunctionName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := RemoveInvalidCharecters('Set.' + FormatPropertyName(PropertyDefinition));
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

    function FormatIsStoredProperty(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      Result := RemoveInvalidCharecters(Format('Is.%sStored', [FormatPropertyName(PropertyDefinition)]));
    end;

    function FormatPropertyStoredName(const PropertyDefinition: TTypePropertyDefinition): String;
    begin
      if PropertyDefinition.Optional then
        Result := Format(' stored %s', [FormatStoredFieldName(PropertyDefinition)])
      else
        Result := EmptyStr;
    end;

    function CreateMethod(const ClassDefinition: TTypeClassDefinition; const PropertyDefinition: TTypePropertyDefinition; const Name: String; const MethodType: TMethodType; const PrivateMethod: Boolean): TTypeMethodDefinition;
    begin
      Result := TTypeMethodDefinition.Create;
      Result.FMethodType := MethodType;
      Result.FName := Name;
      Result.FPropertyDefinition := PropertyDefinition;

      ClassDefinition.AddMethod(Result, PrivateMethod);
    end;

    procedure CheckPropertiesExtraImplementations(const ClassDefinition: TTypeClassDefinition; const PropertyDefinition: TTypePropertyDefinition);
    begin
      var PropertyName := PropertyDefinition.Name;
      var PropertyType := ResolveReferenceType(PropertyDefinition.PropertyType);
      var ReturnTypeDefintion: TTypeDefinition;

      if not SameText(FormatPropertyName(PropertyDefinition), PropertyName) and not PropertyType.IsDynamicPropertyDefinition then
        CreateFieldNameType(PropertyDefinition, PropertyName);

      if GetGenericType(PropertyType, ReturnTypeDefintion) then
      begin
        var AddMethod := CreateMethod(ClassDefinition, PropertyDefinition, 'Add.' + PropertyDefinition.Name, TMethodType.AddFunction, False);

        if PropertyType.IsDynamicPropertyDefinition then
          CreateParameter(AddMethod, 'Name', BuildInTypes[TBuildInType.StringType]);

        if ReturnTypeDefintion.IsClassDefinition then
          AddMethod.FReturnValue := ReturnTypeDefintion
        else
          CreateParameter(AddMethod, 'Value', ReturnTypeDefintion);
      end
      else if NeedGetFunction(PropertyDefinition) then
      begin
        var GetMethod := CreateMethod(ClassDefinition, PropertyDefinition, FormatGetFunctionName(PropertyDefinition), TMethodType.GetFunction, True);
        GetMethod.FReturnValue := PropertyType;
      end;

      if NeedSetFunction(PropertyDefinition) then
      begin
        var SetMethod := CreateMethod(ClassDefinition, PropertyDefinition, FormatSetFunctionName(PropertyDefinition), TMethodType.SetProcedure, True);

        CreateParameter(SetMethod, 'Value', PropertyType);
      end;
    end;

    function SortProperties(const ClassDefinition: TTypeClassDefinition): TArray<TTypePropertyDefinition>;
    begin
      Result := Copy(ClassDefinition.Properties);

      TArray.Sort<TTypePropertyDefinition>(Result, TTypeCommonComparer<TTypePropertyDefinition>.Comparer);
    end;

    function FormatAttributes(const CommonDefinition: TTypeCommonDefinition): String;
    begin
      var AttributesList := CreateStringListForItems;

      for var Attribute in CommonDefinition.Attributes do
        AttributesList.Add(Attribute.Declaration);

      if not AttributesList.IsEmpty then
        Result := Format('[%s]', [AttributesList.Text]);

      AttributesList.Free;
    end;

    procedure GenerateAttributesDeclaration(const IndentationLevel: Integer; const CommonDefinition: TTypeCommonDefinition);
    begin
      var Attributes := FormatAttributes(CommonDefinition);

      if not Attributes.IsEmpty then
        AddLine(IndentationLevel, Attributes);
    end;

    function SortMethods(const Methods: TArray<TTypeMethodDefinition>): TArray<TTypeMethodDefinition>;
    begin
      Result := Methods;

      TArray.Sort<TTypeMethodDefinition>(Result, TTypeMethodComparer.Comparer);
    end;

    function FormatImplementation(const ModuleTypeDefinition: TTypeModuleDefinition): String;
    begin
      Result := FormatParentModuleName(ModuleTypeDefinition, False) + FormatModuleName(ModuleTypeDefinition);
    end;

    function FormatMethod(const MethodDefinition: TTypeMethodDefinition; const ModuleTypeDefinition: TTypeModuleDefinition; const ParameterLoadCount: NativeInt = -1): String;

      function GetParameterTypeName(const ParameterType: TTypeDefinition): String;
      begin
        Result := ': ' + FormatFullTypeName(ParameterType);
      end;

      function FormatParameters: String;
      var
        ParameterDefinition: TTypeParameterDefinition;
        ParameterType: TTypeDefinition;

        function GetAttributes(const Parameter: TTypeParameterDefinition): String;
        begin
          Result := FormatAttributes(Parameter);

          if not Result.IsEmpty then
            Result := Result + ' ';
        end;

        function GetLoadParametersCount: NativeInt;
        begin
          if ParameterLoadCount = -1 then
            Result := Length(MethodDefinition.Parameters)
          else
            Result := ParameterLoadCount;
        end;

      begin
        var ParameterPrefix: String;
        var ParameterSeparator: String;
        ParameterType := nil;
        Result := EmptyStr;

        for var A := 0 to Pred(GetLoadParametersCount) do
        begin
          ParameterDefinition := MethodDefinition.Parameters[A];

          if ParameterType = ParameterDefinition.ParameterType then
          begin
            ParameterPrefix := EmptyStr;
            ParameterSeparator := ',';
          end
          else
          begin
            ParameterPrefix := 'const ';
            ParameterSeparator := ';';

            if not Result.IsEmpty then
              Result := Result + GetParameterTypeName(ParameterType);

            ParameterType := ParameterDefinition.ParameterType;
          end;

          if not Result.IsEmpty then
            Result := Result + ParameterSeparator + ' ';

          Result := Result + ParameterPrefix + GetAttributes(ParameterDefinition) + FormatParameterName(ParameterDefinition);
        end;

        if not Result.IsEmpty then
          Result := Format('(%s%s)', [Result, GetParameterTypeName(ParameterType)])
      end;

      function GetMethodInstructions: String;

        function IsOverloaded: Boolean;
        begin
          for var ParameterDefinition in MethodDefinition.Parameters do
            if ParameterDefinition.IsOptional then
              Exit(True);

          Result := False;
        end;

      begin
        Result := EmptyStr;

        if not Assigned(ModuleTypeDefinition) then
        begin
          if MethodDefinition.IsDestructor then
            Result := 'override'
          else if IsOverloaded then
            Result := 'overload';

          if not Result.IsEmpty then
            Result := Format(' %s;', [Result]);
        end;
      end;

      function FormatImplementationName: String;
      begin
        if Assigned(ModuleTypeDefinition) then
          Result := FormatImplementation(ModuleTypeDefinition) + TYPE_NAME_SEPARATOR
        else
          Result := EmptyStr;
      end;

      function GetMethodType: String;
      begin
        if MethodDefinition.MethodType = TMethodType.Destructor then
          Result := 'destructor'
        else if MethodDefinition.IsFunction then
          Result := 'function'
        else
          Result := 'procedure';
      end;

      function GetReturnValue: String;
      begin
        if MethodDefinition.IsFunction then
          Result := GetParameterTypeName(MethodDefinition.ReturnValue)
        else
          Result := EmptyStr;
      end;

    begin
      Result := Format('%s %s%s%s%s;%s', [GetMethodType, FormatImplementationName, FormatMethodName(MethodDefinition), FormatParameters, GetReturnValue, GetMethodInstructions]);
    end;

    procedure GenerateMethodsDeclaration(const IndentationLevel: Integer; const Methods: TArray<TTypeMethodDefinition>);
    var
      MethodDefinition: TTypeMethodDefinition;

      function GetFirstOptionalParameter: Integer;
      begin
        Result := 0;

        for var ParameterDefinition in MethodDefinition.Parameters do
          if not ParameterDefinition.IsOptional then
            Inc(Result);
      end;

    begin
      for MethodDefinition in SortMethods(Methods) do
        for var LastParameter := GetFirstOptionalParameter to Length(MethodDefinition.Parameters) do
        begin
          GenerateAttributesDeclaration(IndentationLevel, MethodDefinition);

          AddLine(IndentationLevel, FormatMethod(MethodDefinition, nil, LastParameter));
        end;

      AddWhiteLine;
    end;

    procedure GenerateFieldsDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if ClassDefinition.HasProperties then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(IndentationLevel, 'private');

        for var PropertyDefinition in SortProperties(ClassDefinition) do
        begin
          AddLine(CurrentIndentation, '%s: %s;', [FormatFieldName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

          if PropertyDefinition.Optional then
            AddLine(CurrentIndentation, '%s: Boolean;', [FormatStoredFieldName(PropertyDefinition)]);
        end;

        GenerateMethodsDeclaration(CurrentIndentation, ClassDefinition.PrivateMethods);

        RemoveLastLine;
      end;
    end;

    procedure GeneratePublicFunctions(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);

      function NeedPublicSection: Boolean;
      begin
        Result := Assigned(ClassDefinition.PublicMethods);

        if not Result then
          for var PropertyDefinition in ClassDefinition.Properties do
            if PropertyDefinition.Optional then
              Exit(True);
      end;

      procedure GenerateStoredProperties(const CurrentIndentation: Integer);
      begin
        RemoveLastLine;

        for var PropertyDefinition in ClassDefinition.Properties do
          if PropertyDefinition.Optional then
            AddLine(CurrentIndentation, 'property %s: Boolean read %s;', [FormatIsStoredProperty(PropertyDefinition), FormatStoredFieldName(PropertyDefinition)]);

        AddWhiteLine;
      end;

    begin
      var CurrentIndentation := Succ(IndentationLevel);

      if NeedPublicSection then
      begin
        AddLine(IndentationLevel, 'public');

        GenerateMethodsDeclaration(CurrentIndentation, ClassDefinition.PublicMethods);

        GenerateStoredProperties(CurrentIndentation);

        RemoveLastLine;
      end;
    end;

    procedure GeneratePropertiesDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if ClassDefinition.HasProperties then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        AddLine(IndentationLevel, 'published');

        for var PropertyDefinition in ClassDefinition.Properties do
        begin
          GenerateAttributesDeclaration(CurrentIndentation, PropertyDefinition);

          AddLine(CurrentIndentation, 'property %s: %s read %s write %s%s;', [FormatPropertyName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition), FormatPropertyReaderName(PropertyDefinition),
            FormatPropertyWriterName(PropertyDefinition), FormatPropertyStoredName(PropertyDefinition)]);
        end;
      end;
    end;

    procedure GenerateAliasDeclaration(const IndentationLevel: Integer; const ClassDefinition: TTypeClassDefinition);
    begin
      if Assigned(ClassDefinition.Alias) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        for var AliasType in ClassDefinition.Alias do
          AddLine(CurrentIndentation, '%s = %s;', [FormatTypeName(AliasType), FormatFullTypeName(AliasType.TypeAlias)]);

        AddWhiteLine;
      end;
    end;

    procedure GenerateForwardClassesDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      if Assigned(ModuleDefinition.Classes) then
      begin
        var CurrentIndentation := Succ(IndentationLevel);

        for var ClassDefinition in ModuleDefinition.Classes do
          AddLine(CurrentIndentation, '%s;', [FormatClassName(ClassDefinition)]);

        AddWhiteLine;
      end;
    end;

    procedure GenerateModuleDeclaration(const IndentationLevel: Integer; const ModuleDefinition: TTypeModuleDefinition);
    begin
      var CurrentIndentation := Succ(IndentationLevel);

      for var ClassDefinition in ModuleDefinition.Classes do
      begin
        GenerateAttributesDeclaration(CurrentIndentation, ClassDefinition);

        AddLine(CurrentIndentation, '%s', [FormatClassName(ClassDefinition)]);

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

    procedure AddUsesList(const IndentationLevel: Integer);
    var
      UsesList: TStringList;

      procedure CheckUses(const Module: TTypeModuleDefinition);

        function GetUnitDefinition(const Module: TTypeModuleDefinition): TTypeModuleDefinition;
        begin
          if Module.IsUnitDefinition then
            Result := Module
          else
            Result := GetUnitDefinition(Module.ParentModule);
        end;

      begin
        var ParentModule: TTypeModuleDefinition;

        for var ClassDefinition in Module.Classes do
        begin
          for var PropertyDefinition in ClassDefinition.Properties do
          begin
            ParentModule := GetUnitDefinition(PropertyDefinition.PropertyType.ParentModule);

            CheckPropertiesExtraImplementations(ClassDefinition, PropertyDefinition);

            if (SYSTEM_UNIT_NAME <> ParentModule.Name) and (ParentModule <> UnitDefinition) then
              UsesList.Add(ParentModule.Name);

            if PropertyDefinition.HasAttributes then
              UsesList.Add(SYSTEM_BLUE_PRINT_TYPES_UNIT_NAME);
          end;

          for var MethodDefinition in ClassDefinition.AllMethods do
            if Assigned(MethodDefinition.ReturnValue) and MethodDefinition.ReturnValue.IsClassDefinition then
            begin
              CreateMethod(ClassDefinition, nil, 'Destroy', TMethodType.Destructor, False);

              Break;
            end;

          CheckUses(ClassDefinition);
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

    procedure GenerateImplementation(const ModuleDefinition: TTypeModuleDefinition);
    begin
      var IndentationLevel := 0;

      if ModuleDefinition.IsClassDefinition then
      begin
        var Methods := SortMethods(ModuleDefinition.AsClassDefinition.AllMethods);

        if Assigned(Methods) then
        begin
          AddLine(IndentationLevel, '{ %s }', [FormatImplementation(ModuleDefinition)]);

          AddWhiteLine;

          for var Method in Methods do
          begin
            var PropertyDefinition := Method.PropertyDefinition;

            AddLine(IndentationLevel, FormatMethod(Method, ModuleDefinition));

            AddLine(IndentationLevel, 'begin');

            case Method.MethodType of
              TMethodType.Method: ;
              TMethodType.Destructor:
              begin
                var CurrentIndentationLevel := Succ(IndentationLevel);

                for var FieldDefinition in ModuleDefinition.AsClassDefinition.Properties do
                begin
                  if NeedGetFunction(FieldDefinition) then
                  begin
                    AddLine(CurrentIndentationLevel, '%s.Free;', [FormatFieldName(FieldDefinition)]);

                    AddWhiteLine;
                  end
                  else if FunctionAddNeedReturnType(FieldDefinition) then
                  begin
                    var ObjectToDestroy := 'Item';

                    if FieldDefinition.PropertyType.IsDynamicPropertyDefinition then
                      ObjectToDestroy := ObjectToDestroy + '.Value';

                    AddLine(CurrentIndentationLevel, 'for var Item in %s do', [FormatFieldName(FieldDefinition)]);

                    AddLine(CurrentIndentationLevel, '  %s.Free;', [ObjectToDestroy]);

                    AddWhiteLine;
                  end;
                end;

                AddLine(CurrentIndentationLevel, 'inherited;');
              end;

              TMethodType.AddFunction:
              begin
                var VariableName: String;

                if FunctionAddNeedReturnType(PropertyDefinition) then
                begin
                  VariableName := 'Result';

                  AddLine(IndentationLevel, '  Result := %s.Create;', [FormatGenericItemTypeName(PropertyDefinition)]);

                  AddWhiteLine;
                end
                else
                  VariableName := 'Value';

                if PropertyDefinition.PropertyType.IsDynamicPropertyDefinition then
                  VariableName := Format('TDynamicPair<%s>.Create(Name, %s)', [FormatGenericItemTypeName(PropertyDefinition), VariableName]);

                AddLine(IndentationLevel, '  %0:s := %0:s + [%1:s];', [FormatPropertyName(PropertyDefinition), VariableName]);
              end;

              TMethodType.GetFunction:
              begin
                AddLine(IndentationLevel, '  if not Assigned(%s) then', [FormatFieldName(PropertyDefinition)]);

                AddLine(IndentationLevel, '    %s := %s.Create;', [FormatPropertyName(PropertyDefinition), FormatPropertyTypeName(PropertyDefinition)]);

                AddWhiteLine;

                AddLine(IndentationLevel, '  Result := %s;', [FormatFieldName(PropertyDefinition)]);
              end;

              TMethodType.SetProcedure:
              begin
                AddLine(IndentationLevel, '  %s := Value;', [FormatFieldName(PropertyDefinition)]);
                AddLine(IndentationLevel, '  %s := True;', [FormatStoredFieldName(PropertyDefinition)]);
              end;
            end;

            AddLine(IndentationLevel, 'end;');

            AddWhiteLine;
          end;
        end;
      end;

      for var ClassDefinition in ModuleDefinition.Classes do
        GenerateImplementation(ClassDefinition);
    end;

    procedure GenerateInterfacesDeclaration(const IndentationLevel: Integer);

      procedure GenerateInterfaceDeclaration(const IndentationLevel: Integer; const InterfaceDefinition: TTypeInterfaceDefinition);
      begin
        var CurrentIndentationLevel := Succ(IndentationLevel);
        var GUIDValue := THashSHA2.GetHashString(InterfaceDefinition.Name);
        GUIDValue := Format('[''{%s-%s-%s-%s-%s}'']', [GUIDValue.Substring(0, 8), GUIDValue.Substring(8, 4), GUIDValue.Substring(12, 4), GUIDValue.Substring(16, 4), GUIDValue.Substring(20, 12)]).ToUpper;

        GenerateAttributesDeclaration(IndentationLevel, InterfaceDefinition);

        AddLine(IndentationLevel, '%s = interface', [InterfaceDefinition.Name]);

        AddLine(CurrentIndentationLevel, GUIDValue);

        GenerateMethodsDeclaration(CurrentIndentationLevel, InterfaceDefinition.Methods);

        RemoveLastLine;

        AddLine(IndentationLevel, 'end;');

        AddWhiteLine;
      end;

    begin
      var CurrentIndentationLevel := Succ(IndentationLevel);

      for var InterfaceDefinition in UnitDefinition.Interfaces do
        GenerateInterfaceDeclaration(CurrentIndentationLevel, InterfaceDefinition);
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

      GenerateInterfacesDeclaration(IndentationLevel);

      AddLine(IndentationLevel, 'implementation');

      AddWhiteLine;

      GenerateImplementation(UnitDefinition);

      AddLine(IndentationLevel, 'end.');

      UnitFile.SaveToFile(UnitFileName, TEncoding.UTF8);
    finally
      UnitFile.Free;
    end;
  end;

  function FindPropertyConfiguration(const PropertyConfiguration: TPropertyConfiguration): TTypePropertyDefinition;
  begin
    var PropertyTypeDefinition := FindTypeWithPrefix(PropertyConfiguration.TypeName);

    for var PropertyDefinition in PropertyTypeDefinition.AsClassDefinition.Properties do
      if PropertyDefinition.Name = PropertyConfiguration.Name then
        Exit(PropertyDefinition);

    raise EPropertyConfigurationNotFound.Create(PropertyConfiguration);
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

        Schema.FCurrentUnit := UnitDefinition;
        Schema.FMainClass := LoadMainClass(UnitDefinition, Schema);
        Schema.FServiceInterface := LoadServiceInterface(UnitDefinition, Schema);

        SchemaConverter.Convert(Schema);
      finally
        Schema.Free;
      end;
    end;
  end;

  AppendProperties;

  for var TypeConfiguration in Configuration.TypeConfiguration do
    FindTypeWithPrefix(TypeConfiguration.Name).FName := TypeConfiguration.ChangeName;

  for var PropertyConfiguration in Configuration.PropertyConfiguration do
    FindPropertyConfiguration(PropertyConfiguration).FName := PropertyConfiguration.ChangeName;

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

  if TPath.IsRelativePath(Configuration.OutputFolder) then
    Configuration.OutputFolder := TPath.GetFullPath(ExtractFilePath(ConfigurationFileName) + Configuration.OutputFolder);

  for var UnitDefinition in Configuration.Units do
    for var SchemaFile in UnitDefinition.SchemaFiles do
      if TPath.IsRelativePath(SchemaFile.FileName) then
        SchemaFile.FileName := TPath.GetFullPath(ExtractFilePath(ConfigurationFileName) + SchemaFile.FileName);

  Import(Configuration);

  Configuration.Free;
end;

procedure TSchemaImporter.LoadBuildInTypes;
const
  BUILD_IN_TYPE_NAMES: array[TBuildInType] of String = ('String', 'Integer', 'Double', 'TDate', 'TTime', 'TDateTime', 'Boolean', 'TArray<%s>', 'TValue', 'TDynamicProperty<%s>');
  BUILD_IN_TYPE_NAMESPACE = 'Blue Print Buildin Types';
  SYSTEM_RTTI_UNIT_NAME = 'System.Rtti';

  procedure AddBuildInTypes(const UnitDefinition: TTypeUnitDefinition; const BuildInTypeList: TArray<TBuildInType>);
  begin
    var Namespace := BUILD_IN_TYPE_NAMESPACE + '/' + UnitDefinition.Name;

    AddNamespace(Namespace, UnitDefinition.Name);

    for var BuildInType in BuildInTypeList do
    begin
      var TypeDefinition := TTypeDefinition.Create;
      TypeDefinition.FParentModule := UnitDefinition;
      TypeDefinition.FName := BUILD_IN_TYPE_NAMES[BuildInType];

      BuildInTypes[BuildInType] := TypeDefinition;

      UnitDefinition.AddType(TypeDefinition);

      AddType(Namespace, TypeDefinition);
    end;
  end;

  function CreateUnit(const Name: String): TTypeUnitDefinition;
  begin
    Result := TTypeUnitDefinition.Create;
    Result.FName := Name;

    FBuildInUnits.Add(Result);
  end;

begin
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
  Result := TryFindTypeWithPrefix(FormatTypeNamespace(Namespace, Name), TypeDefinition);
end;

function TSchemaImporter.TryFindTypeWithPrefix(const FullName: String; var TypeDefinition: TTypeDefinition): Boolean;
begin
  Result := Types.TryGetValue(FullName, TypeDefinition);
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
  for var AppendedProperty in AppendProperties do
    AppendedProperty.Free;

  for var UnitConfiguration in Units do
    UnitConfiguration.Free;

  for var Namespace in Namespaces do
    Namespace.Free;

  for var Configuration in TypeConfiguration do
    Configuration.Free;

  for var PropertyConfiguration in PropertyConfiguration do
    PropertyConfiguration.Free;

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

function TTypeDefinition.AsAliasDefinition: TTypeAliasDefinition;
begin
  Result := Self as TTypeAliasDefinition;
end;

function TTypeDefinition.AsClassDefinition: TTypeClassDefinition;
begin
  Result := Self as TTypeClassDefinition;
end;

function TTypeDefinition.AsEnumeratorDefinition: TTypeEnumerationDefinition;
begin
  Result := Self as TTypeEnumerationDefinition;
end;

function TTypeDefinition.AsGenericDefinition: TTypeGenericDefinition;
begin
  Result := Self as TTypeGenericDefinition;
end;

function TTypeDefinition.AsInterfaceDefinition: TTypeInterfaceDefinition;
begin
  Result := Self as TTypeInterfaceDefinition;
end;

function TTypeDefinition.AsReferenceDefinition: TTypeReferenceDefinition;
begin
  Result := Self as TTypeReferenceDefinition;
end;

function TTypeDefinition.GetIsAliasDefinition: Boolean;
begin
  Result := Self is TTypeAliasDefinition;
end;

function TTypeDefinition.GetIsArrayDefinition: Boolean;
begin
  Result := Self is TTypeArrayDefinition;
end;

function TTypeDefinition.GetIsClassDefinition: Boolean;
begin
  Result := Self is TTypeClassDefinition;
end;

function TTypeDefinition.GetIsDynamicPropertyDefinition: Boolean;
begin
  Result := Self is TTypeDynamicPropertyDefinition;
end;

function TTypeDefinition.GetIsEnumeratorDefinition: Boolean;
begin
  Result := Self is TTypeEnumerationDefinition;
end;

function TTypeDefinition.GetIsGenericDefinition: Boolean;
begin
  Result := Self is TTypeGenericDefinition;
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
  Values.Add(Value);
end;

destructor TTypeEnumerationDefinition.Destroy;
begin
  FValues.Free;

  inherited;
end;

function TTypeEnumerationDefinition.GetValues: TStringList;
begin
  if not Assigned(FValues) then
    FValues := TSchemaImporter.CreateStringListForItems;

  Result := FValues;
end;

{ TTypeClassDefinition }

procedure TTypeClassDefinition.AddMethod(const Method: TTypeMethodDefinition; const PrivateMethod: Boolean);
begin
  if PrivateMethod then
    FPrivateMethods := FPrivateMethods + [Method]
  else
    FPublicMethods := FPublicMethods + [Method];
end;

function TTypeClassDefinition.AddProperty(const Name: String; const PropertyType: TTypeDefinition): TTypePropertyDefinition;
begin
  Result := TTypePropertyDefinition.Create;
  Result.FName := Name;
  Result.PropertyType := PropertyType;

  FProperties := FProperties + [Result];
end;

function TTypeClassDefinition.AllMethods: TArray<TTypeMethodDefinition>;
begin
  Result := PrivateMethods + PublicMethods;
end;

destructor TTypeClassDefinition.Destroy;
begin
  for var PropertyDefinition in Properties do
    PropertyDefinition.Free;

  for var Method in AllMethods do
    Method.Free;

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
  inherited CreateFmt('The property "%s" hasn''t the type loaded!', [PropertyDefinition.Name]);
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

{ TTypeGenericDefinition }

constructor TTypeGenericDefinition.Create(const BuildInType: TBuildInType);
begin
  inherited Create;

  FBuildInType := BuildInType;
end;

{ TTypeArrayDefinition }

constructor TTypeArrayDefinition.Create;
begin
  inherited Create(TBuildInType.ArrayType);
end;

{ TTypeDynamicPropertyDefinition }

constructor TTypeDynamicPropertyDefinition.Create;
begin
  inherited Create(TBuildInType.DynamicPropertyType);
end;

{ ESchemaNamespaceWithSamePrefix }

constructor ESchemaNamespaceWithSamePrefix.Create(const Namespace: String);
begin
  inherited CreateFmt('Namespace "%s" with the prefix duplicated!', [Namespace]);
end;

{ ESchemaNamespaceAlreadyExists }

constructor ESchemaNamespaceAlreadyExists.Create(const Namespace: String);
begin
  inherited CreateFmt('Namespace "%s" already exists!', [Namespace]);
end;

{ TAppendProperty }

constructor TAppendProperty.Create;
begin
  inherited;

  FOptional := True;
end;

{ ETypeDuplicateNameInTheNamespace }

constructor ETypeDuplicateNameInTheNamespace.Create(const Namespace: String; const TypeDefinition: TTypeDefinition);
begin
  inherited CreateFmt('Duplicate type name "%s" in the namespace "%s"!', [TypeDefinition.Name, Namespace]);
end;

{ TTypeInterfaceDefinition }

procedure TTypeInterfaceDefinition.AddMethod(const Method: TTypeMethodDefinition);
begin
  FMethods := FMethods + [Method];
end;

destructor TTypeInterfaceDefinition.Destroy;
begin
  for var Method in Methods do
    Method.Free;

  inherited;
end;

{ TTypeUnitDefinition }

function TTypeUnitDefinition.GetHasInterfaces: Boolean;
begin
  Result := Assigned(Interfaces);
end;

{ TTypeMethodDefinition }

procedure TTypeMethodDefinition.AddParameter(const Parameter: TTypeParameterDefinition);
begin
  FParameters := FParameters + [Parameter];
end;

destructor TTypeMethodDefinition.Destroy;
begin
  for var Parameter in Parameters do
    Parameter.Free;

  inherited;
end;

function TTypeMethodDefinition.GetIsDestructor: Boolean;
begin
  Result := MethodType = TMethodType.Destructor;
end;

function TTypeMethodDefinition.GetIsFunction: Boolean;
begin
  Result := (MethodType in [TMethodType.Method, TMethodType.AddFunction, TMethodType.GetFunction]) and Assigned(ReturnValue);
end;

{ TTypeCommonComparer<T> }

function TTypeCommonComparer<T>.Compare(const Left, Right: T): Integer;
begin
  Result := CompareText(Left.Name, Right.Name);
end;

class function TTypeCommonComparer<T>.Comparer: IComparer<T>;
begin
  if not Assigned(FComparer) then
    FComparer := Self.Create;

  Result := FComparer;
end;

class destructor TTypeCommonComparer<T>.Destroy;
begin
  FreeAndNil(FComparer);
end;

{ TTypeCommonDefinition }

procedure TTypeCommonDefinition.AddAttribute(const Value: TTypeAttributeDefinition);
begin
  FAttributes := FAttributes + [Value];
end;

destructor TTypeCommonDefinition.Destroy;
begin
  for var Attribute in FAttributes do
    Attribute.Free;

  inherited;
end;

function TTypeCommonDefinition.HasAttributes: Boolean;
begin
  Result := Assigned(FAttributes);
end;

{ TTypeAttributeDefinition }

constructor TTypeAttributeDefinition.Create(const Declaration: String);
begin
  inherited Create;

  FDeclaration := Declaration;
end;

{ TTypePatchAttribute }

constructor TTypePatchAttribute.Create;
begin
  inherited Create('Patch');
end;

{ TTypeDeleteAttribute }

constructor TTypeDeleteAttribute.Create;
begin
  inherited Create('Delete');
end;

{ TTypeGetAttribute }

constructor TTypeGetAttribute.Create;
begin
  inherited Create('Get');
end;

{ TTypePostAttribute }

constructor TTypePostAttribute.Create;
begin
  inherited Create('Post');
end;

{ TTypePutAttribute }

constructor TTypePutAttribute.Create;
begin
  inherited Create('Put');
end;

{ TTypeOptionsAttribute }

constructor TTypeOptionsAttribute.Create;
begin
  inherited Create('Options');
end;

{ TTypeFieldNameAttribute }

constructor TTypeFieldNameAttribute.Create;
begin
  inherited Create('FieldName(''%s'')');
end;

{ TTypePatternPropertyAttribute }

constructor TTypePatternPropertyAttribute.Create;
begin
  inherited Create('PatternProperty(''%s'')');
end;

{ TTypeMethodComparer }

function TTypeMethodComparer.Compare(const Left, Right: TTypeMethodDefinition): Integer;
const
  VALUE_TO_COMPARE: array[Boolean] of Integer = (1, 0);

begin
  Result := VALUE_TO_COMPARE[Left.IsDestructor] - VALUE_TO_COMPARE[Right.IsDestructor];

  if Result = 0 then
    Result := inherited Compare(Left, Right);
end;

{ TTypeBodyAttribute }

constructor TTypeBodyAttribute.Create;
begin
  inherited Create('Body');
end;

{ TTypeQueryAttribute }

constructor TTypeQueryAttribute.Create;
begin
  inherited Create('Query');
end;

{ TTypePathAttribute }

constructor TTypePathAttribute.Create;
begin
  inherited Create('Path');
end;

{ TTypePathNameAttribute }

constructor TTypePathNameAttribute.Create;
begin
  inherited Create('PathName');
end;

{ TTypeFormURLEncodedAttribute }

constructor TTypeFormURLEncodedAttribute.Create;
begin
  inherited Create('FormURLEncoded');
end;

{ TTypeHeaderValueAttribute }

constructor TTypeHeaderValueAttribute.Create;
begin
  inherited Create('HeaderValue(''%s'')');
end;

{ TTypeRemoteNameAttribute }

constructor TTypeRemoteNameAttribute.Create;
begin
  inherited Create('RemoteName(''%s'')');
end;

{ TTypeJSONAttribute }

constructor TTypeJSONAttribute.Create;
begin
  inherited Create('JSON');
end;

{ TTypeMultiPartFormDataAttribute }

constructor TTypeMultiPartFormDataAttribute.Create;
begin
  inherited Create('MultiPartFormData');
end;

{ TTypeFlatAttribute }

constructor TTypeFlatAttribute.Create;
begin
  inherited Create('Flat');
end;

{ EPropertyConfigurationNotFound }

constructor EPropertyConfigurationNotFound.Create(const Configuration: TPropertyConfiguration);
begin
  inherited CreateFmt('The property configuration for type "%s" and property name "%s" not found!', [Configuration.TypeName, Configuration.Name]);
end;

end.

