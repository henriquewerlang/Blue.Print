unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Generics.Collections, System.SysUtils, Xml.XMLSchema, Xml.XMLIntf, Blue.Print.JSON.Schema, Blue.Print.Types;

type
  TSchemaImporter = class;
  TTypeAlias = class;
  TTypeArrayDefinition = class;
  TTypeClassDefinition = class;
  TTypeDefinition = class;
  TTypeDelayedDefinition = class;
  TTypeDynamicPropertyDefinition = class;
  TTypeEnumeration = class;
  TTypeExternal = class;
  TTypeInterfaceDefinition = class;
  TTypeModuleDefinition = class;
  TTypeUnitDefinition = class;

  TImplementationInformation = (NeedDestructor, NeedGetFunction, NeedSetProcedure, NeedAddFunction, NeedIsStoredFunction, NeedIsStoredField);
  TImplementationInformations = set of TImplementationInformation;
  TSchemaType = (XML, XSD, JSON, OpenAPI20, OpenAPI30, OpenAPI31, WSDL, SOAP10);

  TUnitFileConfiguration = class
  private
    FUnitClassName: String;
    FFileType: TSchemaType;
    FIsFileTypeStored: Boolean;
    FInterfaceName: String;
    FBaseURL: String;
    FFileName: String;
    FReference: String;

    procedure SetFileType(const Value: TSchemaType);
  published
    property BaseURL: String read FBaseURL write FBaseURL;
    property FileName: String read FFileName write FFileName;
    property FileType: TSchemaType read FFileType write SetFileType stored FIsFileTypeStored;
    property InterfaceName: String read FInterfaceName write FInterfaceName;
    property IsFileTypeStored: Boolean read FIsFileTypeStored write FIsFileTypeStored;
    property Reference: String read FReference write FReference;
    property UnitClassName: String read FUnitClassName write FUnitClassName;
  end;

  TTypeUnitDefinitionConfiguration = class
  private
    FName: String;
    FFiles: TArray<TUnitFileConfiguration>;
    FDeclareTypesNamespace: Boolean;
  public
    destructor Destroy; override;
  published
    property DeclareTypesNamespace: Boolean read FDeclareTypesNamespace write FDeclareTypesNamespace;
    property Files: TArray<TUnitFileConfiguration> read FFiles write FFiles;
    property Name: String read FName write FName;
  end;

  TAppendPropertyConfiguration = class
  private
    FName: String;
    FType: String;
  public
    property Name: String read FName write FName;
    property &Type: String read FType write FType;
  end;

  TTypeDefinitionConfiguration = class
  private
    FName: String;
    FAttribute: String;
    FModuleName: String;
    FInheritance: String;
    FChangeType: String;
    FParentAttribute: String;
    FFlatEnumerator: String;
    FChangeName: String;
    FAppendProperty: TArray<TAppendPropertyConfiguration>;
  published
    property Name: String read FName write FName;
    property AppendProperty: TArray<TAppendPropertyConfiguration> read FAppendProperty write FAppendProperty;
    property Attribute: String read FAttribute write FAttribute;
    property ChangeName: String read FChangeName write FChangeName;
    property ChangeType: String read FChangeType write FChangeType;
    property FlatEnumerator: String read FFlatEnumerator write FFlatEnumerator;
    property Inheritance: String read FInheritance write FInheritance;
    property ModuleName: String read FModuleName write FModuleName;
    property ParentAttribute: String read FParentAttribute write FParentAttribute;
  end;

  TPropertyDefinitionConfiguration = class
  private
    FName: String;
    FChangeType: String;
    FTypeName: String;
    FOptional: Boolean;
    FOptionalStored: Boolean;
    FAttribute: String;

    procedure SetOptional(const Value: Boolean);
  public
    property OptionalStored: Boolean read FOptionalStored;
  published
    property TypeName: String read FTypeName write FTypeName;
    property Name: String read FName write FName;
    property Attribute: String read FAttribute write FAttribute;
    property ChangeType: String read FChangeType write FChangeType;
    property Optional: Boolean read FOptional write SetOptional stored FOptionalStored;
  end;

  TNamespaceConfiguration = class
  private
    FPrefix: String;
    FNamespace: String;
  published
    property Prefix: String read FPrefix write FPrefix;
    property Namespace: String read FNamespace write FNamespace;
  end;

  TConfiguration = class
  private
    FOutputFolder: String;
    FSchemaFolder: String;
    FUnitConfiguration: TArray<TTypeUnitDefinitionConfiguration>;
    FTypeDefinition: TArray<TTypeDefinitionConfiguration>;
    FMaxColumnSize: Integer;
    FImports: TArray<String>;
    FPropertyConfiguration: TArray<TPropertyDefinitionConfiguration>;
    FNamespaces: TArray<TNamespaceConfiguration>;
  public
    constructor Create;

    destructor Destroy; override;
  published
    property Imports: TArray<String> read FImports write FImports;
    property MaxColumnSize: Integer read FMaxColumnSize write FMaxColumnSize;
    property Namespaces: TArray<TNamespaceConfiguration> read FNamespaces write FNamespaces;
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property PropertyConfiguration: TArray<TPropertyDefinitionConfiguration> read FPropertyConfiguration write FPropertyConfiguration;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeDefinition: TArray<TTypeDefinitionConfiguration> read FTypeDefinition write FTypeDefinition;
    property UnitConfiguration: TArray<TTypeUnitDefinitionConfiguration> read FUnitConfiguration write FUnitConfiguration;
  end;

  TTypeCommonDefinition = class
  private
    FAttributes: TList<String>;
    FParentAttributes: TList<String>;
    FParentModule: TTypeModuleDefinition;

    function GetIsClassDefinition: Boolean;
  public
    constructor Create(const ParentModule: TTypeModuleDefinition);

    destructor Destroy; override;

    function FormatNamespaceAttribute(const Namespace: String): String;

    procedure AddAtribute(const Attribute: String); overload;
    procedure AddAtribute(const Attribute: String; const Params: array of const); overload;
    procedure AddFlatAttribute; overload;
    procedure AddFlatAttribute(const EnumeratorPropertyName: String); overload;
    procedure AddNamespaceAttribute(const Namespace: String);

    property Attributes: TList<String> read FAttributes;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property ParentAttributes: TList<String> read FParentAttributes;
    property ParentModule: TTypeModuleDefinition read FParentModule;
  end;

  TPropertyDefinition = class(TTypeCommonDefinition)
  private
    FInformations: TImplementationInformations;
    FName: String;
    FOptional: Boolean;
    FPropertyType: TTypeDefinition;
    FFixedValue: String;

    function GetNeedAddFunction: Boolean;
    function GetNeedDestructor: Boolean;
    function GetNeedGetFunction: Boolean;
    function GetNeedIsStoredField: Boolean;
    function GetNeedIsStoredFunction: Boolean;
    function GetNeedSetProcedure: Boolean;
  public
    procedure AddFieldAttribute(const Name: String);
    procedure AddXMLAttributeFixed(const Name, Value: String);
    procedure AddXMLAttributeValue;
    procedure AddXMLValueAttribute;

    property FixedValue: String read FFixedValue write FFixedValue;
    property Informations: TImplementationInformations read FInformations write FInformations;
    property Name: String read FName write FName;
    property NeedAddFunction: Boolean read GetNeedAddFunction;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property NeedGetFunction: Boolean read GetNeedGetFunction;
    property NeedIsStoredField: Boolean read GetNeedIsStoredField;
    property NeedIsStoredFunction: Boolean read GetNeedIsStoredFunction;
    property NeedSetProcedure: Boolean read GetNeedSetProcedure;
    property Optional: Boolean read FOptional write FOptional;
    property PropertyType: TTypeDefinition read FPropertyType write FPropertyType;
  end;

  TTypeDefinition = class(TTypeCommonDefinition)
  private
    FIsNumericType: Boolean;
    FIsObjectType: Boolean;
    FIsStringType: Boolean;
    FName: String;

    function GetAsArrayType: TTypeArrayDefinition;
    function GetAsClassDefinition: TTypeClassDefinition;
    function GetAsDelayedType: TTypeDelayedDefinition;
    function GetAsDynamicPropertyType: TTypeDynamicPropertyDefinition;
    function GetAsInterfaceType: TTypeInterfaceDefinition;
    function GetAsTypeAlias: TTypeAlias;
    function GetAsTypeEnumeration: TTypeEnumeration;
    function GetAsTypeExternal: TTypeExternal;
    function GetAsUnitDefinition: TTypeUnitDefinition;
    function GetIsArrayType: Boolean;
    function GetIsDelayedType: Boolean;
    function GetIsDynamicPropertyType: Boolean;
    function GetIsEnumeration: Boolean;
    function GetIsExternal: Boolean;
    function GetIsInterfaceType: Boolean;
    function GetIsTypeAlias: Boolean;
    function GetIsUnitDefinition: Boolean;
    function GetParentUnit: TTypeUnitDefinition;
  public
    property AsArrayType: TTypeArrayDefinition read GetAsArrayType;
    property AsClassDefinition: TTypeClassDefinition read GetAsClassDefinition;
    property AsInterfaceType: TTypeInterfaceDefinition read GetAsInterfaceType;
    property AsDelayedType: TTypeDelayedDefinition read GetAsDelayedType;
    property AsDynamicPropertyType: TTypeDynamicPropertyDefinition read GetAsDynamicPropertyType;
    property AsTypeAlias: TTypeAlias read GetAsTypeAlias;
    property AsTypeEnumeration: TTypeEnumeration read GetAsTypeEnumeration;
    property AsTypeExternal: TTypeExternal read GetAsTypeExternal;
    property AsUnitDefinition: TTypeUnitDefinition read GetAsUnitDefinition;
    property IsArrayType: Boolean read GetIsArrayType;
    property IsDelayedType: Boolean read GetIsDelayedType;
    property IsDynamicPropertyType: Boolean read GetIsDynamicPropertyType;
    property IsEnumeration: Boolean read GetIsEnumeration;
    property IsExternal: Boolean read GetIsExternal;
    property IsInterfaceType: Boolean read GetIsInterfaceType;
    property IsNumericType: Boolean read FIsNumericType;
    property IsObjectType: Boolean read FIsObjectType;
    property IsStringType: Boolean read FIsStringType;
    property IsTypeAlias: Boolean read GetIsTypeAlias;
    property IsUnitDefinition: Boolean read GetIsUnitDefinition;
    property Name: String read FName write FName;
    property ParentUnit: TTypeUnitDefinition read GetParentUnit;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FClasses: TList<TTypeClassDefinition>;
    FDelayedTypes: TList<TTypeDelayedDefinition>;
    FEnumerations: TList<TTypeEnumeration>;
    FInterfaces: TList<TTypeInterfaceDefinition>;
    FTypeAlias: TList<TTypeAlias>;
    FFullLoaded: Boolean;
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    function AddDelayedType(const TypeName: String): TTypeDelayedDefinition;

    procedure AddTypeAlias(const AType: TTypeAlias);

    property Classes: TList<TTypeClassDefinition> read FClasses;
    property DelayedTypes: TList<TTypeDelayedDefinition> read FDelayedTypes;
    property Enumerations: TList<TTypeEnumeration> read FEnumerations write FEnumerations;
    property FullLoaded: Boolean read FFullLoaded write FFullLoaded;
    property Interfaces: TList<TTypeInterfaceDefinition> read FInterfaces write FInterfaces;
    property TypeAlias: TList<TTypeAlias> read FTypeAlias;
  end;

  TTypeClassDefinition = class(TTypeModuleDefinition)
  private
    FInformations: TImplementationInformations;
    FInheritedFrom: TTypeDefinition;
    FProperties: TList<TPropertyDefinition>;

    function GetNeedAddFunction: Boolean;
    function GetNeedDestructor: Boolean;
    function GetNeedImplementation: Boolean;
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    function AddProperty(const Name: String): TPropertyDefinition;

    procedure AddAtribute(const Value: String); overload;
    procedure AddAtribute(const Value: String; const Values: array of const); overload;

    property Informations: TImplementationInformations read FInformations write FInformations;
    property InheritedFrom: TTypeDefinition read FInheritedFrom write FInheritedFrom;
    property NeedAddFunction: Boolean read GetNeedAddFunction;
    property NeedImplementation: Boolean read GetNeedImplementation;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property Properties: TList<TPropertyDefinition> read FProperties write FProperties;
  end;

  TTypeParameterDefinition = class(TTypeCommonDefinition)
  private
    FName: String;
    FParameterType: TTypeDefinition;
  public
    property Name: String read FName write FName;
    property ParameterType: TTypeDefinition read FParameterType write FParameterType;
  end;

  TTypeMethodDefinition = class(TTypeCommonDefinition)
  private
    FName: String;
    FReturn: TTypeDefinition;
    FParameters: TList<TTypeParameterDefinition>;
  public
    constructor Create(const ParentModule: TTypeModuleDefinition);

    destructor Destroy; override;

    function AddParameter: TTypeParameterDefinition;

    procedure AddDeleteAttribute;
    procedure AddGetAttribute;
    procedure AddOptionsAttribute;
    procedure AddPatchAttribute;
    procedure AddPostAttribute;
    procedure AddPutAttribute;

    property Name: String read FName write FName;
    property Parameters: TList<TTypeParameterDefinition> read FParameters;
    property Return: TTypeDefinition read FReturn write FReturn;
  end;

  TTypeInterfaceDefinition = class(TTypeDefinition)
  private
    FDefaultURL: String;
    FMethods: TList<TTypeMethodDefinition>;
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    property DefaultURL: String read FDefaultURL write FDefaultURL;
    property Methods: TList<TTypeMethodDefinition> read FMethods write FMethods;
  end;

  TTypeAlias = class(TTypeDefinition)
  private
    FTypeDefinition: TTypeDefinition;
  public
    property TypeDefinition: TTypeDefinition read FTypeDefinition write FTypeDefinition;
  end;

  TTypeDelayedDefinition = class(TTypeDefinition)
  private
    FTypeResolved: TTypeDefinition;
    FUnresolvedType: String;

    function GetIsResolved: Boolean;
  public
    constructor Create(const TypeName: String; const Module: TTypeModuleDefinition);

    property IsResolved: Boolean read GetIsResolved;
    property TypeResolved: TTypeDefinition read FTypeResolved write FTypeResolved;
    property UnresolvedType: String read FUnresolvedType write FUnresolvedType;
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
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    property Values: TList<String> read FValues write FValues;
  end;

  TTypeArrayDefinition = class(TTypeDefinition)
  private
    FArrayType: TTypeDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition; const ArrayType: TTypeDefinition);

    property ArrayType: TTypeDefinition read FArrayType write FArrayType;
  end;

  TTypeDynamicPropertyDefinition = class(TTypeDefinition)
  private
    FValueType: TTypeDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition; const ValueType: TTypeDefinition);

    property ValueType: TTypeDefinition read FValueType write FValueType;
  end;

  TTypeUnitDefinition = class(TTypeModuleDefinition)
  private
    FUses: TList<TTypeUnitDefinition>;
    FUnitConfiguration: TTypeUnitDefinitionConfiguration;
    FMainModule: TTypeModuleDefinition;

    function CheckNameDeclaration(const Name: String): String;
  public
    constructor Create; reintroduce;

    destructor Destroy; override;

    procedure AddUses(const SchemaUnit: TTypeUnitDefinition);
    procedure GenerateFile(const Importer: TSchemaImporter);

    property MainModule: TTypeModuleDefinition read FMainModule write FMainModule;
    property UnitConfiguration: TTypeUnitDefinitionConfiguration read FUnitConfiguration write FUnitConfiguration;
  end;

  ISchemaLoader = interface
    ['{CBCF837D-0032-46F0-865B-D18C93A6DA79}']
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  end;

  TSchemaImporter = class
  private
    FBooleanType: TTypeDefinition;
    FBuildInType: TDictionary<String, TTypeDefinition>;
    FCardinalType: TTypeDefinition;
    FConfiguration: TConfiguration;
    FDateTimeType: TTypeDefinition;
    FDateType: TTypeDefinition;
    FDoubleType: TTypeDefinition;
    FInt64Type: TTypeDefinition;
    FIntegerType: TTypeDefinition;
    FModuleReference: TDictionary<String, TTypeModuleDefinition>;
    FObjectType: TTypeDefinition;
    FSchemaNamespace: TDictionary<String, String>;
    FStringType: TTypeDefinition;
    FSystemRttiUnit: TTypeUnitDefinition;
    FSystemUnit: TTypeUnitDefinition;
    FTimeType: TTypeDefinition;
    FTValueType: TTypeDefinition;
    FTypeExternal: TDictionary<String, TTypeDefinition>;
    FUnitFiles: TDictionary<TUnitFileConfiguration, TTypeUnitDefinition>;
    FUnits: TList<TTypeUnitDefinition>;
    FWordType: TTypeDefinition;

    function AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;
    function CreateSchemaLoader(const UnitFileConfiguration: TUnitFileConfiguration): ISchemaLoader;
    function CreateUnit(const UnitConfiguration: TTypeUnitDefinitionConfiguration): TTypeUnitDefinition;
    function GetModuleDefinitionByReference(const Reference: String; var Module: TTypeModuleDefinition): Boolean;
    function FindTypeDefinitionInModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
    function FindTypeInUnits(const TypeName: String): TTypeDefinition;
    function LoadUnit(const UnitConfiguration: TTypeUnitDefinitionConfiguration): TTypeUnitDefinition;

    procedure GenerateUnitDefinition(const UnitConfiguration: TTypeUnitDefinitionConfiguration);
    procedure LoadInternalTypes;
  public
    constructor Create;

    destructor Destroy; override;

    function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TTypeClassDefinition;
    function CreateInterfaceDefinition(const ParentUnit: TTypeUnitDefinition; const InterfaceName: String): TTypeInterfaceDefinition;
    function CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function GetFileNameFromSchemaFolder(const FileName: String): String;
    function GetSchemaNamespaceFromTarget(const Target: String): String;
    function LoadFile(Reference: String): String;
    function LoadFileFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): String;
    function LoadRelativePath(const RelativeFolder, FileName: String): String;

    procedure Import;
    procedure LoadConfig(const FileName: String);

    property BooleanType: TTypeDefinition read FBooleanType;
    property BuildInType: TDictionary<String, TTypeDefinition> read FBuildInType;
    property CardinalType: TTypeDefinition read FCardinalType;
    property Configuration: TConfiguration read FConfiguration write FConfiguration;
    property DateType: TTypeDefinition read FDateType;
    property DateTimeType: TTypeDefinition read FDateTimeType;
    property DoubleType: TTypeDefinition read FDoubleType;
    property Int64Type: TTypeDefinition read FInt64Type;
    property IntegerType: TTypeDefinition read FIntegerType;
    property ObjectType: TTypeDefinition read FObjectType;
    property StringType: TTypeDefinition read FStringType;
    property SystemUnit: TTypeUnitDefinition read FSystemUnit write FSystemUnit;
    property SystemRttiUnit: TTypeUnitDefinition read FSystemRttiUnit write FSystemRttiUnit;
    property TimeType: TTypeDefinition read FTimeType;
    property TValueType: TTypeDefinition read FTValueType;
    property Units: TList<TTypeUnitDefinition> read FUnits;
    property WordType: TTypeDefinition read FWordType;
  end;

  TSchemaLoader = class(TInterfacedObject)
  private
    FImporter: TSchemaImporter;
  protected
    property Importer: TSchemaImporter read FImporter;
  public
    constructor Create(const Importer: TSchemaImporter); virtual;
  end;

  TSchemaLoaderClass = class of TSchemaLoader;

  TXMLSchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  end;

  TXSDSchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    FXMLBuildInType: TDictionary<String, TTypeDefinition>;

    function CheckTypeDefinition(const SchemaItem: IXMLTypedSchemaItem; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CompareClassInheritence(const Left, Right: TTypeClassDefinition): Integer;
    function CreateTypeDefinition(const SchemaItem: IXMLSchemaItem; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindTypeName(const SchemaItem: IXMLTypedSchemaItem; var TypeName: String): Boolean;
    function GetNameWithNamespace(const Name, Namespace: String): String; overload;
    function GetNameWithNamespace(const Node: IXMLNode; const Name: String): String; overload;
    function HasTypeName(const SchemaItem: IXMLTypedSchemaItem): Boolean;
    function IsElementOptional(const ElementDefinition: IXMLElementDef): Boolean;

    procedure GenerateClassDefinitionFromSchema(const ParentModule: TTypeModuleDefinition; const SchemaDefinition: IXMLSchemaDef);
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadXSDTypes;
  public
    constructor Create(const Importer: TSchemaImporter); override;

    destructor Destroy; override;
  end;

  TWSDLSchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter); override;
  end;

  TJSONSchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    FSchemas: TDictionary<String, TSchema>;

    function CheckTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
    function CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const ValueType: TTypeDefinition): TTypeDynamicPropertyDefinition;
    function DefineProperty(const ClassDefinition: TTypeClassDefinition; const Schema: TSchema; const PropertyName: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
    function FindAllTypes(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindTypeReference(const Module: TTypeModuleDefinition; const Schema: TSchema): TTypeDefinition;
    function IsConditionalSchema(const Schema: TSchema): Boolean;
    function IsReference(const Schema: TSchema): Boolean;
    function LoadSchema(const UnitFileConfiguration: TUnitFileConfiguration): TSchema;

    procedure GenerateDefinitions(const Module: TTypeModuleDefinition; const Schema: TSchema);
    procedure GenerateProperties(const ClassDefinition: TTypeClassDefinition; const Schema: TSchema);
    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter); override;

    destructor Destroy; override;
  end;

function OnlyValidChars(const Value: String): String;

implementation

uses System.Classes, System.IOUtils, System.Variants, System.Net.HttpClient, System.Rtti, System.Generics.Defaults, System.Math, XML.XMLDom, Xml.XMLSchemaTags, Soap.WSDLBind, Soap.WSDLIntf, System.Hash, Blue.Print.Serializer,
  Blue.Print.Schema.Importer.Open.API.v20, Blue.Print.Schema.Importer.Open.API.v30;

const
  REFERENCE_SEPARATOR = '#';
  WHITE_SPACE_IDENT = '  ';

type
  TCaseFunction = reference to function(const Value: String): String;

function CompareNames(const Name1, Name2: String): Boolean;
begin
  Result := SameText(ExtractLocalName(Name1), ExtractLocalName(Name2));
end;

function CheckReservedName(const Name: String): String;
const
  SPECIAL_NAMES: array[0..17] of String = ('type', 'mod', 'to', 'if', 'then', 'else', 'type', 'class', 'array', 'object', 'string', 'const', 'not', 'in', 'file', 'is', 'end', 'label');

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
    if CharInSet(Char, ['0'..'9', 'a'..'z', 'A'..'Z', '_']) then
      Result := Result + Char;
end;

function FormatName(Name: String): String;
begin
  Name := OnlyValidChars(ExtractLocalName(Name));
  Result := Name.Substring(0, 1).ToUpper + Name.Substring(1);
end;

function FormatEnumeratorValue(Value: String): String;
begin
  Result := EmptyStr;

  for var Split in Value.Split([' ']) do
    Result := Result + CheckReservedName(OnlyValidChars(Split));

  if CharInSet(Result[1], ['0'..'9']) then
    Result := 't' + Result;
end;

function NotFormatEnumeratorValue(Value: String): String;
begin
  Result := Value;
end;

{ TSchemaImporter }

function TSchemaImporter.AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;
begin
  Result := TTypeExternal.Create(ModuleName, TypeName);

  FTypeExternal.Add(TypeName, Result);
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create(TIStringComparer.Ordinal);
  FModuleReference := TDictionary<String, TTypeModuleDefinition>.Create;
  FSchemaNamespace := TDictionary<String, String>.Create;
  FTypeExternal := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues], TIStringComparer.Ordinal);
  FUnits := TObjectList<TTypeUnitDefinition>.Create;
  FUnitFiles := TDictionary<TUnitFileConfiguration, TTypeUnitDefinition>.Create;

  LoadInternalTypes;
end;

function TSchemaImporter.CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TTypeClassDefinition;
begin
  Result := TTypeClassDefinition.Create(ParentModule);
  Result.Name := ClassTypeName;

  ParentModule.Classes.Add(Result);
end;

function TSchemaImporter.CreateInterfaceDefinition(const ParentUnit: TTypeUnitDefinition; const InterfaceName: String): TTypeInterfaceDefinition;
begin
  Result := TTypeInterfaceDefinition.Create(ParentUnit);
  Result.Name := InterfaceName;

  ParentUnit.Interfaces.Add(Result);
end;

function TSchemaImporter.CreateSchemaLoader(const UnitFileConfiguration: TUnitFileConfiguration): ISchemaLoader;
const
  FILE_SCHEMA_CLASS: array[TSchemaType] of TSchemaLoaderClass = (TXMLSchemaLoader, TXSDSchemaLoader, TJSONSchemaLoader, TOpenAPI20SchemaLoader, TOpenAPI30SchemaLoader, nil, TWSDLSchemaLoader, TWSDLSchemaLoader);
  FILE_SCHEMA_EXTENSION: array[TSchemaType] of String = ('xml', 'xsd', 'json', 'oas2', 'oas3', 'oas31', 'wsdl', 'wsdl');

  function GetFileType: TSchemaType;
  begin
    var FileExtension := TPath.GetExtension(UnitFileConfiguration.FileName);

    for var SchemaExtension := Low(TSchemaType) to High(TSchemaType) do
      if FileExtension = '.' + FILE_SCHEMA_EXTENSION[SchemaExtension] then
        Exit(SchemaExtension);

    raise Exception.Create('Unable to define the file type schema!');
  end;

begin
  var FileType := UnitFileConfiguration.FileType;

  if not UnitFileConfiguration.IsFileTypeStored then
    FileType := GetFileType;

  FILE_SCHEMA_CLASS[FileType].Create(Self).QueryInterface(ISchemaLoader, Result);
end;

function TSchemaImporter.CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
begin
  if not Assigned(TypeDefinition) then
    raise Exception.CreateFmt('The alias %s as not type defined!', [Alias]);

  Result := TTypeAlias.Create(Module);
  Result.Name := Alias;
  Result.TypeDefinition := TypeDefinition;
end;

function TSchemaImporter.CreateUnit(const UnitConfiguration: TTypeUnitDefinitionConfiguration): TTypeUnitDefinition;
begin
  Result := TTypeUnitDefinition.Create;
  Result.Name := UnitConfiguration.Name;
  Result.UnitConfiguration := UnitConfiguration;

  Units.Add(Result);
end;

destructor TSchemaImporter.Destroy;
begin
  FModuleReference.Free;

  FTypeExternal.Free;

  FBuildInType.Free;

  FUnits.Free;

  FUnitFiles.Free;

  FSchemaNamespace.Free;

  inherited;
end;

function TSchemaImporter.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := nil;

  if FTypeExternal.TryGetValue(TypeName, Result) then
    Exit;

  if BuildInType.TryGetValue(TypeName, Result) then
    Exit;

  if FindTypeDefinitionInModule(Module, TypeName, Result) then
    Exit;
end;

function TSchemaImporter.FindTypeDefinitionInModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
begin
  TypeDefinition := nil;

  for var ClassDefinition in Module.Classes do
    if ClassDefinition.Name = TypeName then
    begin
      TypeDefinition := ClassDefinition;

      Exit(True);
    end;

  for var Enumerator in Module.Enumerations do
    if Enumerator.Name = TypeName then
    begin
      TypeDefinition := Enumerator;

      Exit(True);
    end;

  for var TypeAlias in Module.TypeAlias do
    if TypeAlias.Name = TypeName then
    begin
      TypeDefinition := TypeAlias;

      Exit(True);
    end;

  Result := False;
end;

function TSchemaImporter.FindTypeInUnits(const TypeName: String): TTypeDefinition;

  function FindAllClasses(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
  begin
    TypeDefinition := FindType(TypeName, Module);

    Result := Assigned(TypeDefinition);
  end;

begin
  var CurrentModule: TTypeModuleDefinition := nil;
  Result := nil;

  for var SplitTypeName in TypeName.Split(['.']) do
  begin
    if not Assigned(CurrentModule) then
    begin
      for var UnitDefinition in Units do
        if FindAllClasses(UnitDefinition, SplitTypeName, Result) and Result.IsClassDefinition then
        begin
          CurrentModule := Result.AsClassDefinition;

          Break;
        end;

      if not Assigned(Result) then
        Exit;
    end
    else if FindAllClasses(CurrentModule, SplitTypeName, Result) then
    begin
      if Result.IsClassDefinition then
        CurrentModule := Result.AsClassDefinition;
    end
    else
      Exit(nil);
  end;
end;

procedure TSchemaImporter.GenerateUnitDefinition(const UnitConfiguration: TTypeUnitDefinitionConfiguration);
var
  UnitFileConfiguration: TUnitFileConfiguration;

  function GetReference: String;
  begin
    Result := UnitFileConfiguration.Reference;

    if Result.IsEmpty then
      Result := UnitFileConfiguration.FileName;
  end;

begin
  var Module: TTypeModuleDefinition;

  for UnitFileConfiguration in UnitConfiguration.Files do
    if not GetModuleDefinitionByReference(GetReference, Module) then
    begin
      var Loader := CreateSchemaLoader(UnitFileConfiguration);

      Loader.GenerateUnitFileDefinition(Module, UnitFileConfiguration);
    end;
end;

function TSchemaImporter.GetFileNameFromSchemaFolder(const FileName: String): String;
begin
  Result := TPath.GetFullPath(Configuration.SchemaFolder + '\' + FileName);
end;

function TSchemaImporter.GetModuleDefinitionByReference(const Reference: String; var Module: TTypeModuleDefinition): Boolean;
var
  UnitConfiguration: TTypeUnitDefinitionConfiguration;

  function FindUnitFileConfigurationByReference: TUnitFileConfiguration;
  begin
    for var TypeUnitConfiguration in Configuration.UnitConfiguration do
      for var UnitFileConfiguration in TypeUnitConfiguration.Files do
        if (UnitFileConfiguration.Reference = Reference) or (UnitFileConfiguration.FileName = Reference) then
        begin
          UnitConfiguration := TypeUnitConfiguration;

          Exit(UnitFileConfiguration);
        end;

    raise Exception.CreateFmt('Can''t find the configuration for file reference %s!', [Reference]);
  end;

  function LoadModuleFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TTypeModuleDefinition;
  var
    UnitDefinition: TTypeUnitDefinition;

  begin
    if not FUnitFiles.TryGetValue(UnitFileConfiguration, UnitDefinition) then
    begin
      UnitDefinition := LoadUnit(UnitConfiguration);

      FUnitFiles.Add(UnitFileConfiguration, UnitDefinition);
    end;

    if UnitFileConfiguration.UnitClassName.IsEmpty then
      Exit(UnitDefinition)
    else
    begin
      var MainModule := FindTypeInUnits(UnitFileConfiguration.UnitClassName);

      if not Assigned(MainModule) then
        MainModule := CreateClassDefinition(UnitDefinition, UnitFileConfiguration.UnitClassName);

      Exit(MainModule.AsClassDefinition);
    end;
  end;

begin
  var UnitFileConfiguration := FindUnitFileConfigurationByReference;

  Result := FModuleReference.TryGetValue(UnitFileConfiguration.Reference, Module);

  if Result then
    Result := Module.FullLoaded
  else
  begin
    Module := LoadModuleFromConfiguration(UnitFileConfiguration);

    FModuleReference.Add(UnitFileConfiguration.Reference, Module);
  end;

  Module.FullLoaded := True;
end;

function TSchemaImporter.GetSchemaNamespaceFromTarget(const Target: String): String;
begin
  if not FSchemaNamespace.TryGetValue(Target, Result) then
  begin
    FSchemaNamespace.Add(Target, Format('blue%d', [Succ(FSchemaNamespace.Count)]));

    Result := FSchemaNamespace[Target];
  end;
end;

procedure TSchemaImporter.Import;
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
    GenerateUnitDefinition(UnitConfiguration);

  for var TypeDefinitionConfig in Configuration.TypeDefinition do
  begin
    var TypeDefinition := FindTypeInUnits(TypeDefinitionConfig.Name);

    if Assigned(TypeDefinition) then
    begin
      if not TypeDefinitionConfig.Attribute.IsEmpty then
        TypeDefinition.AddAtribute(TypeDefinitionConfig.Attribute);

      if not TypeDefinitionConfig.ParentAttribute.IsEmpty then
        TypeDefinition.ParentAttributes.Add(TypeDefinitionConfig.ParentAttribute);

      if not TypeDefinitionConfig.Inheritance.IsEmpty then
      begin
        var ClassDefinition := TypeDefinition.AsClassDefinition;

        ClassDefinition.InheritedFrom := ClassDefinition.AddDelayedType(TypeDefinitionConfig.Inheritance);
      end;

      if Assigned(TypeDefinitionConfig.AppendProperty) then
      begin
        var ClassDefinition := TypeDefinition.AsClassDefinition;

        ClassDefinition.AddFlatAttribute;

        for var AppendProperty in TypeDefinitionConfig.AppendProperty do
          ClassDefinition.AddProperty(AppendProperty.Name).PropertyType := FindTypeInUnits(AppendProperty.&Type);
      end;

      if TypeDefinition.IsTypeAlias and not TypeDefinitionConfig.ChangeType.IsEmpty then
        TypeDefinition.AsTypeAlias.TypeDefinition := FindTypeInUnits(TypeDefinitionConfig.ChangeType);
    end;
  end;

  for var PropertyConfiguration in Configuration.PropertyConfiguration do
  begin
    var TypeDefinition := FindTypeInUnits(PropertyConfiguration.TypeName);

    if Assigned(TypeDefinition) then
      for var PropertyDefinition in TypeDefinition.AsClassDefinition.Properties do
        if PropertyDefinition.Name = PropertyConfiguration.Name then
        begin
          if not PropertyConfiguration.Attribute.IsEmpty then
            PropertyDefinition.AddAtribute(PropertyConfiguration.Attribute);

          if not PropertyConfiguration.ChangeType.IsEmpty then
            PropertyDefinition.PropertyType := FindType(PropertyConfiguration.ChangeType, TypeDefinition.ParentModule);

          if PropertyConfiguration.OptionalStored then
            PropertyDefinition.Optional := PropertyConfiguration.Optional;
        end;
  end;

  for var UnitDefinition in Units do
    UnitDefinition.GenerateFile(Self);
end;

procedure TSchemaImporter.LoadConfig(const FileName: String);

  function LoadConfiguration(const FileName: String): TConfiguration;
  begin
    var Serializer: IBluePrintSerializer := TBluePrintJsonSerializer.Create;

    Result := Serializer.Deserialize(TFile.ReadAllText(FileName), TypeInfo(TConfiguration)).AsType<TConfiguration>;
  end;

  procedure LoadImports(const Imports: TConfiguration);
  begin
    for var Import in Imports.Imports do
    begin
      var ImportedConfiguration := LoadConfiguration(Configuration.OutputFolder + Import);

      LoadImports(ImportedConfiguration);

      Configuration.UnitConfiguration := ImportedConfiguration.UnitConfiguration + Configuration.UnitConfiguration;
    end;
  end;

begin
  if TFile.Exists(FileName) then
  begin
    Configuration := LoadConfiguration(FileName);
    Configuration.OutputFolder := LoadRelativePath(Configuration.OutputFolder, FileName);
    Configuration.SchemaFolder := LoadRelativePath(Configuration.SchemaFolder, FileName);

    for var TypeExternal in Configuration.TypeDefinition do
      if not TypeExternal.ModuleName.IsEmpty then
        AddTypeExternal(TypeExternal.ModuleName, TypeExternal.Name);

    for var Namespace in Configuration.Namespaces do
      FSchemaNamespace.Add(Namespace.Namespace, Namespace.Prefix);

    LoadImports(Configuration);
  end;
end;

function TSchemaImporter.LoadFile(Reference: String): String;

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
  if Reference.StartsWith('http') then
    Result := DownloadFile(Reference)
  else
  begin
    if TPath.IsRelativePath(Reference) then
      Reference := GetFileNameFromSchemaFolder(Reference);

    Result := TFile.ReadAllText(Reference);
  end;
end;

function TSchemaImporter.LoadFileFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): String;
begin
  var ReferenceName := UnitFileConfiguration.FileName;

  if not UnitFileConfiguration.BaseURL.IsEmpty then
    ReferenceName := UnitFileConfiguration.BaseURL + '/' + ReferenceName;

  Result := LoadFile(ReferenceName);
end;

procedure TSchemaImporter.LoadInternalTypes;

  function AddType(const UnitDefinition: TTypeUnitDefinition; const TypeName: String): TTypeDefinition;
  begin
    Result := TTypeDefinition.Create(UnitDefinition);
    Result.Name := TypeName;

    BuildInType.Add(TypeName, Result);
  end;

  function AddSystemType(const TypeName: String): TTypeDefinition;
  begin
    Result := AddType(SystemUnit, TypeName);
  end;

  function AddNumberType(const TypeName: String): TTypeDefinition;
  begin
    Result := AddSystemType(TypeName);
    Result.FIsNumericType := True;
  end;

begin
  FSystemRttiUnit := TTypeUnitDefinition.Create;
  FSystemRttiUnit.Name := 'System.Rtti';
  FSystemUnit := TTypeUnitDefinition.Create;
  FSystemUnit.Name := 'System';

  FBooleanType := AddSystemType('Boolean');
  FCardinalType := AddNumberType('Cardinal');
  FDateTimeType := AddNumberType('TDateTime');
  FDateType := AddNumberType('TDate');
  FDoubleType := AddNumberType('Double');
  FInt64Type := AddNumberType('Int64');
  FIntegerType := AddNumberType('Integer');
  FObjectType := AddSystemType(TObject.ClassName);
  FObjectType.FIsObjectType := True;
  FStringType := AddSystemType('String');
  FStringType.FIsStringType := True;
  FTimeType := AddNumberType('TTime');
  FTValueType := AddType(SystemRttiUnit, 'TValue');
  FWordType := AddNumberType('Word');
end;

function TSchemaImporter.LoadRelativePath(const RelativeFolder, FileName: String): String;
begin
  Result := TPath.GetFullPath(TPath.GetDirectoryName(FileName) + '\' + RelativeFolder);
end;

function TSchemaImporter.LoadUnit(const UnitConfiguration: TTypeUnitDefinitionConfiguration): TTypeUnitDefinition;
begin
  for var &Unit in Units do
    if &Unit.UnitConfiguration = UnitConfiguration then
      Exit(&Unit);

  Result := CreateUnit(UnitConfiguration);
end;

{ TXSDSchemaLoader }

function TXSDSchemaLoader.CompareClassInheritence(const Left, Right: TTypeClassDefinition): Integer;
begin
  Result := IfThen(Assigned(Left.InheritedFrom), 1, 0) - IfThen(Assigned(Right.InheritedFrom), 1, 0);

  if Result = 0 then
    Result := Left.ParentModule.Classes.IndexOf(Left) - Right.ParentModule.Classes.IndexOf(Right);
end;

constructor TXSDSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited;

  FXMLBuildInType := TDictionary<String, TTypeDefinition>.Create(TIStringComparer.Ordinal);

  LoadXSDTypes;
end;

function TXSDSchemaLoader.CreateTypeDefinition(const SchemaItem: IXMLSchemaItem; const Module: TTypeModuleDefinition): TTypeDefinition;
var
  AttributeType: IXMLAttributeDef;
  ComplexType: IXMLComplexTypeDef;
  ElementCompositor: IXMLElementCompositor;
  ElementType: IXMLElementDef;
  SimpleType: IXMLSimpleTypeDef;

  function MakeName(const SchemaItem: IXMLSchemaItem): String;

    function GetNamespace: String;
    begin
      Result := VarToStrDef(SchemaItem.SchemaDef.TargetNamespace, SchemaItem.NamespaceURI);
    end;

  begin
    Result := GetNameWithNamespace(SchemaItem.Name, GetNamespace);
  end;

  function CreateEnumeration: TTypeEnumeration;
  var
    EnumValues: TStringList;

  begin
    EnumValues := TStringList.Create(dupIgnore, False, False);
    Result := TTypeEnumeration.Create(Module);
    Result.Name := MakeName(SimpleType);

    for var A := 0 to Pred(SimpleType.Enumerations.Count) do
    begin
      var EnumValue := SimpleType.Enumerations[A].Value;

      if EnumValues.IndexOf(EnumValue) = -1 then
        EnumValues.Add(EnumValue);
    end;

    for var EnumValue in EnumValues do
      Result.Values.Add(EnumValue);

    if Assigned(Module) then
      Module.Enumerations.Add(Result);
  end;

  function CreateAlias(const ParentModule: TTypeModuleDefinition; const AliasName: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
  begin
    Result := FImporter.CreateTypeAlias(ParentModule, AliasName, TypeDefinition);

    ParentModule.AddTypeAlias(Result);
  end;

  function CheckRestriction: TTypeDefinition;
  begin
    if SimpleType.Enumerations.Count > 0 then
      Result := CreateEnumeration
    else
    begin
      var TypeName := GetNameWithNamespace(SimpleType, SimpleType.RestrictionNode.BaseName);

      var BaseType := FindType(TypeName, Module);

      if not Assigned(BaseType) then
        BaseType := Module.AddDelayedType(TypeName);

      Result := CreateAlias(Module, MakeName(SimpleType), BaseType);
    end;
  end;

  function CreateArray: TTypeAlias;
  begin
    Result := CreateAlias(Module, GetNameWithNamespace(SimpleType, SimpleType.Name), TTypeArrayDefinition.Create(Module, FindType((SimpleType.ContentNode as IXMLSimpleTypeList).ItemType, Module)));
  end;

  function CreateSimpleType: TTypeDefinition;
  begin
    Result := nil;

    case SimpleType.DerivationMethod of
      sdmNone: ;
      sdmRestriction: Result := CheckRestriction;
      sdmList: Result := CreateArray;
      sdmUnion: Abort;
    end;
  end;

  function IsOptional(const ElementDefinition: IXMLElementDef): Boolean;
  var
    Compositor: IXMLElementCompositor;
    ParentNode: IXMLNode;

  begin
    Result := IsElementOptional(ElementDefinition);

    if not Result then
    begin
      ParentNode := ElementDefinition.ParentNode;

      while Assigned(ParentNode) and Supports(ParentNode, IXMLElementCompositor, Compositor) and not Result do
      begin
        Result := Assigned(ParentNode) and ((Compositor.CompositorType = ctChoice) or (Compositor.MinOccurs <= 0));

        ParentNode := ParentNode.ParentNode;
      end;
    end;
  end;

  function CreateProperty(const ClassDefinition: TTypeClassDefinition; const Name: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
  begin
    Result := ClassDefinition.AddProperty(Name);
    Result.PropertyType := PropertyType;
  end;

  function AddProperty(const ClassDefinition: TTypeClassDefinition; const Element: IXMLElementDef; const TypeDefinition: TTypeDefinition): TPropertyDefinition;
  begin
    var PropertyName := MakeName(Element);

    if not ElementType.HasAttribute(SName) then
      PropertyName := 'Anonymous' + PropertyName;

    Result := CreateProperty(ClassDefinition, PropertyName, TypeDefinition);
    Result.Optional := IsOptional(Element);

    if Element.IsRepeating then
      Result.PropertyType := TTypeArrayDefinition.Create(ClassDefinition, Result.PropertyType);

    if Assigned(Element.Ref) and Assigned(Element.Ref.SchemaDef) and (Element.SchemaDef.TargetNamespace <> Element.Ref.SchemaDef.TargetNamespace) then
      Result.AddNamespaceAttribute(Element.Ref.SchemaDef.TargetNamespace);
  end;

  function AddPropertyAttribute(const ClassDefinition: TTypeClassDefinition; const Attribute: IXMLAttributeDef; const TypeDefinition: TTypeDefinition): TPropertyDefinition;
  begin
    Result := CreateProperty(ClassDefinition, GetNameWithNamespace(Attribute, Attribute.Name), TypeDefinition);

    if Attribute.Fixed = NULL then
      Result.AddXMLAttributeValue
    else
      Result.AddXMLAttributeFixed(Attribute.Name, Attribute.Fixed);

    Result.Optional := (Attribute.Use <> NULL) and (Attribute.Use = 'optional');
  end;

  procedure GenerateProperties(const ParentNode: IXMLNode; const Module: TTypeModuleDefinition);
  var
    BaseIndicator: IXMLBaseTypeIndicator;
    ComplexContent: IXMLComplexContent;
    SchemaItem: IXMLSchemaItem;

  begin
    var Node := ParentNode.ChildNodes.First;

    while Assigned(Node) do
    begin
      if Supports(Node, IXMLSchemaItem, SchemaItem) then
        CreateTypeDefinition(SchemaItem, Module)
      else if Supports(Node, IXMLBaseTypeIndicator, BaseIndicator) then
        GenerateProperties(BaseIndicator, Module)
      else if Supports(Node, IXMLComplexContent, ComplexContent) then
        GenerateProperties(ComplexContent, Module);

      Node := Node.NextSibling;
    end;
  end;

  function CreateComplexType: TTypeDefinition;

    function CreateClassDefinition: TTypeClassDefinition;
    begin
      Result := FImporter.CreateClassDefinition(Module, MakeName(ComplexType));

      Result.AddNamespaceAttribute(VarToStr(ComplexType.SchemaDef.TargetNamespace));

      case ComplexType.DerivationMethod of
        dmNone: ;
        dmComplexExtension: Result.InheritedFrom := Module.AddDelayedType(GetNameWithNamespace(ComplexType, TXMLComplexTypeDef(ComplexType).ContentNode.GetAttribute(SBase)));
        dmComplexRestriction: Abort;
        dmSimpleExtension: ;
        dmSimpleRestriction: Abort;
      end;

      GenerateProperties(ComplexType, Result);
    end;

  begin
    if ComplexType.DerivationMethod = dmSimpleExtension then
      Result := CreateAlias(Module, MakeName(ComplexType), FindType(GetNameWithNamespace(ComplexType, ComplexType.BaseTypeName), Module))
    else
      Result := CreateClassDefinition;
  end;

  function FindSchemaItem(const ChildNodes: IXMLNodeList): IXMLSchemaItem;
  begin
    var CurrentChild := ChildNodes.First;
    Result := nil;

    while Assigned(CurrentChild) and not Supports(CurrentChild, IXMLSchemaItem, Result) do
      CurrentChild := CurrentChild.NextSibling;
  end;

  function CreateElementType: TTypeDefinition;
  begin
    if HasTypeName(ElementType) then
      Result := CheckTypeDefinition(ElementType, Module)
    else if ElementType.ChildNodes.Count > 0 then
    begin
      var SchemaItem := FindSchemaItem(ElementType.ChildNodes);

      if Assigned(SchemaItem) then
      begin
        Result := CreateTypeDefinition(SchemaItem, Module);
        Result.Name := Result.Name + 'ElementType';
      end
      else
        Result := Importer.StringType;
    end
    else
      Result := CheckTypeDefinition(ElementType, Module);

    AddProperty(Module.AsClassDefinition, ElementType, Result);
  end;

  function CreateAttributeType: TTypeDefinition;
  begin
    if HasTypeName(AttributeType) then
      Result := CheckTypeDefinition(AttributeType, Module)
    else if AttributeType.ChildNodes.Count > 0 then
    begin
      var SchemaItem := FindSchemaItem(AttributeType.ChildNodes);

      if Assigned(SchemaItem) then
      begin
        Result := CreateTypeDefinition(SchemaItem, Module);
        Result.Name := Result.Name + 'Attribute';
      end
      else
      begin
        Abort;

        Exit(nil);
      end;
    end
    else
      Result := CheckTypeDefinition(AttributeType, Module);

    AddPropertyAttribute(Module.AsClassDefinition, AttributeType, Result);
  end;

  procedure CreateElementCompositor;
  begin
    GenerateProperties(ElementCompositor, Module);
  end;

begin
  if Supports(SchemaItem, IXMLSimpleTypeDef, SimpleType) then
    Result := CreateSimpleType
  else if Supports(SchemaItem, IXMLComplexTypeDef, ComplexType) then
    Result := CreateComplexType
  else if Supports(SchemaItem, IXMLElementDef, ElementType) then
    Result := CreateElementType
  else if Supports(SchemaItem, IXMLAttributeDef, AttributeType) then
    Result := CreateAttributeType
  else if Supports(SchemaItem, IXMLElementCompositor, ElementCompositor) then
  begin
    CreateElementCompositor;

    Result := nil;
  end
  else if Supports(SchemaItem, IXMLSchemaImport) or Supports(SchemaItem, IXMLSchemaInclude) or Supports(SchemaItem, IXMLAnnotation) then
    // Type to ignore
    Result := nil
  else
    Abort;
end;

destructor TXSDSchemaLoader.Destroy;
begin
  FXMLBuildInType.Free;

  inherited;
end;

function TXSDSchemaLoader.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
var
  BuildInType: TTypeDefinition;

begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) and FXMLBuildInType.TryGetValue(TypeName, BuildInType)  then
    Result := BuildInType;
end;

function TXSDSchemaLoader.FindTypeName(const SchemaItem: IXMLTypedSchemaItem; var TypeName: String): Boolean;
begin
  Result := True;

  if SchemaItem.Attributes[SRef] <> NULL then
    TypeName := SchemaItem.RefName
  else if SchemaItem.Attributes[SType] <> NULL then
    TypeName := SchemaItem.Attributes[SType]
  else
    Exit(False);

  TypeName := GetNameWithNamespace(SchemaItem, TypeName);
end;

function TXSDSchemaLoader.CheckTypeDefinition(const SchemaItem: IXMLTypedSchemaItem; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  var TypeName: String;

  if not FindTypeName(SchemaItem, TypeName) and (SchemaItem.ChildNodes.Count > 0) then
    Exit(CreateTypeDefinition(SchemaItem, Module));

  Result := FindType(TypeName, Module);

  if not Assigned(Result) then
    Result := Module.AddDelayedType(TypeName);
end;

procedure TXSDSchemaLoader.GenerateClassDefinitionFromSchema(const ParentModule: TTypeModuleDefinition; const SchemaDefinition: IXMLSchemaDef);

  procedure SortInheritenceClasses(const List: TList<TTypeClassDefinition>);
  begin
    List.Sort(TDelegatedComparer<TTypeClassDefinition>.Create(CompareClassInheritence));

    for var &Class in List do
      SortInheritenceClasses(&Class.Classes);
  end;

  procedure LoadSchema(const Reference: String; const SchemaDefinition: IXMLSchemaDef);
  begin
    var ParentModule: TTypeModuleDefinition;

    if not Importer.GetModuleDefinitionByReference(Reference, ParentModule) then
      GenerateClassDefinitionFromSchema(ParentModule, SchemaDefinition);
  end;

  procedure ProcessReferences(const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      if Assigned(Reference.SchemaRef) then
        LoadSchema(Reference.SchemaLocation, Reference.SchemaRef);
    end;
  end;

begin
  ProcessReferences(SchemaDefinition.SchemaImports);

  ProcessReferences(SchemaDefinition.SchemaIncludes);

  var CurrentChild := SchemaDefinition.ChildNodes.First;
  var SchemaItem: IXMLSchemaItem;

  while Assigned(CurrentChild) do
  begin
    if Supports(CurrentChild, IXMLSchemaItem, SchemaItem) then
      CreateTypeDefinition(SchemaItem, ParentModule);

    CurrentChild := CurrentChild.NextSibling;
  end;

  SortInheritenceClasses(ParentModule.Classes);
end;

procedure TXSDSchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);

  function LoadFile: IXMLSchemaDoc;
  begin
    if UnitFileConfiguration.FileName.StartsWith('http') then
      Result := LoadXMLSchemaStr(FImporter.LoadFileFromConfiguration(UnitFileConfiguration))
    else
      Result := LoadXMLSchema(FImporter.GetFileNameFromSchemaFolder(UnitFileConfiguration.FileName))
  end;

begin
  var Schema := LoadFile;

  MainModule.FullLoaded := Schema.DocumentElement.HasAttribute(SXMLNS);

  if MainModule.FullLoaded then
    GenerateClassDefinitionFromSchema(MainModule, Schema.SchemaDef);
end;

function TXSDSchemaLoader.GetNameWithNamespace(const Node: IXMLNode; const Name: String): String;

  function FindNamespace(const Node: IXMLNode): String;
  begin
    var CurrentNode := Node;
    Result := EmptyStr;

    repeat
      if CurrentNode.HasAttribute(SXMLNS) then
        Result := CurrentNode.Attributes[SXMLNS];

      CurrentNode := CurrentNode.ParentNode;
    until not Result.IsEmpty or not Assigned(CurrentNode);
  end;

  function GetNamespace: String;
  var
    SchemaNode: IXMLSchemaNode;

  begin
    Result := FindNamespace(Node);

    if Result.IsEmpty and Supports(Node, IXMLSchemaNode, SchemaNode) and (SchemaNode.SchemaDef.ParentRefType <> srNone) then
      Result := FindNamespace(SchemaNode.SchemaDef.ParentSchema);
  end;

begin
  var Namespace: String;

  if Name.Contains(NSDelim) then
    Namespace := Node.FindNamespaceURI(Name)
  else
    Namespace := GetNamespace;

  Result := GetNameWithNamespace(Name, Namespace);
end;

function TXSDSchemaLoader.GetNameWithNamespace(const Name, Namespace: String): String;
begin
  if Namespace.IsEmpty then
    Abort;

  Result := MakeNodeName(Importer.GetSchemanamespaceFromTarget(Namespace), ExtractLocalName(Name));
end;

function TXSDSchemaLoader.HasTypeName(const SchemaItem: IXMLTypedSchemaItem): Boolean;
begin
  var TypeName: String;

  Result := FindTypeName(SchemaItem, TypeName);
end;

function TXSDSchemaLoader.IsElementOptional(const ElementDefinition: IXMLElementDef): Boolean;
begin
  Result := ElementDefinition.MinOccurs <= 0;
end;

procedure TXSDSchemaLoader.LoadXSDTypes;

  function AddBuildInType(const TypeName: String; const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    FXMLBuildInType.Add(GetNameWithNamespace(TypeName, SXMLSchemaURI_2001), TypeDefinition);
  end;

begin
  AddBuildInType('anyURI', FImporter.StringType);
  AddBuildInType('base64Binary', FImporter.StringType);
  AddBuildInType('boolean', FImporter.BooleanType);
  AddBuildInType('byte', FImporter.IntegerType);
  AddBuildInType('date', FImporter.DateType);
  AddBuildInType('dateTime', FImporter.DateTimeType);
  AddBuildInType('decimal', FImporter.DoubleType);
  AddBuildInType('double', FImporter.DoubleType);
  AddBuildInType('duration', FImporter.StringType);
  AddBuildInType('ENTITIES', FImporter.StringType);
  AddBuildInType('ENTITY', FImporter.StringType);
  AddBuildInType('float', FImporter.DoubleType);
  AddBuildInType('gDay', FImporter.StringType);
  AddBuildInType('gMonth', FImporter.StringType);
  AddBuildInType('gMonthDay', FImporter.StringType);
  AddBuildInType('gYear', FImporter.StringType);
  AddBuildInType('gYearMonth', FImporter.StringType);
  AddBuildInType('ID', FImporter.StringType);
  AddBuildInType('IDREF', FImporter.StringType);
  AddBuildInType('IDREFS', FImporter.StringType);
  AddBuildInType('int', FImporter.IntegerType);
  AddBuildInType('integer', FImporter.IntegerType);
  AddBuildInType('lang', FImporter.StringType);
  AddBuildInType('language', FImporter.StringType);
  AddBuildInType('long', FImporter.Int64Type);
  AddBuildInType('Name', FImporter.StringType);
  AddBuildInType('NCName', FImporter.StringType);
  AddBuildInType('negativeInteger', FImporter.IntegerType);
  AddBuildInType('NMTOKEN', FImporter.StringType);
  AddBuildInType('NMTOKENS', FImporter.StringType);
  AddBuildInType('nonNegativeInteger', FImporter.CardinalType);
  AddBuildInType('nonPositiveInteger', FImporter.IntegerType);
  AddBuildInType('normalizedString', FImporter.StringType);
  AddBuildInType('NOTATION', FImporter.StringType);
  AddBuildInType('positiveInteger', FImporter.CardinalType);
  AddBuildInType('QName', FImporter.StringType);
  AddBuildInType('short', FImporter.IntegerType);
  AddBuildInType('string', FImporter.StringType);
  AddBuildInType('time', FImporter.TimeType);
  AddBuildInType('token', FImporter.StringType);
  AddBuildInType('unsignedByte', FImporter.IntegerType);
  AddBuildInType('unsignedInt', FImporter.CardinalType);
  AddBuildInType('unsignedLong', FImporter.Int64Type);
  AddBuildInType('unsignedShort', FImporter.WordType);
end;

{ TTypeUnitDefinition }

procedure TTypeUnitDefinition.AddUses(const SchemaUnit: TTypeUnitDefinition);
begin
  FUses.Add(SchemaUnit);
end;

function TTypeUnitDefinition.CheckNameDeclaration(const Name: String): String;
begin
  Result := ExtractLocalName(Name);

  if Name.Contains(NSDelim) and UnitConfiguration.DeclareTypesNamespace then
    Result := Result + '_' + ExtractPrefix(Name)
end;

constructor TTypeUnitDefinition.Create;
begin
  inherited Create(nil);

  FUses := TList<TTypeUnitDefinition>.Create;
end;

destructor TTypeUnitDefinition.Destroy;
begin
  FUses.Free;

  inherited;
end;

procedure TTypeUnitDefinition.GenerateFile(const Importer: TSchemaImporter);
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

  function GetClassName(const ClassDefinition: TTypeClassDefinition): String;

    function GetName: String;
    begin
      for var TypeConfiguration in Importer.Configuration.TypeDefinition do
        if (TypeConfiguration.Name = ClassDefinition.Name) and not TypeConfiguration.ChangeName.IsEmpty then
          Exit(TypeConfiguration.ChangeName);

      Result := CheckNameDeclaration(ClassDefinition.Name);
    end;

  begin
    Result := CheckReservedName(GetName);
  end;

  function GetMainModule(const Module: TTypeModuleDefinition): TTypeModuleDefinition;
  begin
    Result := Module;

    while Assigned(Result.ParentModule) and not Result.ParentModule.IsUnitDefinition do
      Result := Result.ParentModule;
  end;

  function ResolveTypeDefinition(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  var
    TypeName: String;

    function ResolveTypeInAllClasses(const Module: TTypeModuleDefinition): TTypeDefinition;
    begin
      if Module.Name = TypeName then
        Exit(Module);

      Result := Importer.FindType(TypeName, Module);

      if Assigned(Result) then
        Exit;

      if Module.IsClassDefinition then
        for var PropertyDefinition in Module.AsClassDefinition.Properties do
          if PropertyDefinition.Name = TypeName then
            Exit(PropertyDefinition.PropertyType);

      for var ClassDefinition in Module.Classes do
      begin
        Result := ResolveTypeInAllClasses(ClassDefinition);

        if Assigned(Result) then
          Exit;
      end;

      Result := nil;
    end;

    function ResolveTypeInModules(const Module: TTypeModuleDefinition): TTypeDefinition;
    begin
      Result := ResolveTypeInAllClasses(Module);

      if Assigned(Result) then
        Exit;

      var ParentUnit := Module.ParentUnit;

      for var UnitDefinition in Importer.Units do
        if UnitDefinition = ParentUnit then
        begin
          for var ClassDefinition in UnitDefinition.Classes do
            if ClassDefinition <> Module then
            begin
              Result := ResolveTypeInAllClasses(ClassDefinition);

              if Assigned(Result) then
                Exit;
            end;
        end
        else
        begin
          Result := ResolveTypeInAllClasses(UnitDefinition);

          if Assigned(Result) then
            Exit;
        end;

      Result := nil;
    end;

  begin
    Result := TypeDefinition;

    if Result.IsDelayedType then
    begin
      var DelayedType := Result.AsDelayedType;

      if not DelayedType.IsResolved or DelayedType.TypeResolved.IsDelayedType then
      begin
        TypeName := DelayedType.UnresolvedType;

        DelayedType.TypeResolved := ResolveTypeInModules(GetMainModule(DelayedType.ParentModule));

        if not DelayedType.IsResolved then
          DelayedType.TypeResolved := TUndefinedType.Create(TypeName);

        DelayedType.TypeResolved := ResolveTypeDefinition(DelayedType.TypeResolved);
      end;

      Result := DelayedType.TypeResolved;
    end;
  end;

  function ResolveTypeAlias(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(TypeDefinition);

    if not Assigned(Result) then
      raise Exception.CreateFmt('Cannot resolve the type alias %s!', [TypeDefinition.Name])
    else if Result.IsTypeAlias then
      Result := ResolveTypeAlias(Result.AsTypeAlias.TypeDefinition);
  end;

  function GetPropertyType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(&Property.PropertyType);
  end;

  function GetPropertyBaseType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeAlias(&Property.PropertyType);
  end;

  function GetArrayItemType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    var ResolvedType := ResolveTypeDefinition(TypeDefinition);

    if ResolvedType.IsArrayType then
      Result := ResolveTypeDefinition(ResolvedType.AsArrayType.ArrayType)
    else
      Result := TypeDefinition;
  end;

  function GetClassImplementationName(ClassDefinition: TTypeClassDefinition): String;
  begin
    Result := GetClassName(ClassDefinition);

    while Assigned(ClassDefinition.ParentModule) and ClassDefinition.ParentModule.IsClassDefinition do
    begin
      Result := Format('%s.%s', [GetClassName(ClassDefinition.ParentModule.AsClassDefinition), Result]);

      ClassDefinition := ClassDefinition.ParentModule.AsClassDefinition;
    end;
  end;

  function FormatPropertyName(const PropertyDefinition: TPropertyDefinition): String;

    function FindTypeWithSamePropertyName: Boolean;
    begin
      for var ClassDefinition in PropertyDefinition.ParentModule.Classes do
        if SameText(ClassDefinition.Name, PropertyDefinition.Name) then
          Exit(True);

      for var EnumeratorDefinition in PropertyDefinition.ParentModule.Enumerations do
        if SameText(EnumeratorDefinition.Name, PropertyDefinition.Name) then
          Exit(True);

      Result := False;
    end;

  begin
    Result := PropertyDefinition.Name;

    if PropertyDefinition.ParentModule = GetMainModule(PropertyDefinition.ParentModule) then
      Result := CheckNameDeclaration(Result);

    Result := CheckReservedName(OnlyValidChars(ExtractLocalName(Result)));

    if FindTypeWithSamePropertyName then
      Result := Result + 'Element';
  end;

  function GetPropertyFieldName(const PropertyDefinition: TPropertyDefinition): String;
  begin
    Result := 'F' + FormatName(OnlyValidChars(FormatPropertyName(PropertyDefinition)));
  end;

  function GetStoredFieldName(const PropertyDefinition: TPropertyDefinition): String;
  begin
    Result := Format('%sIsStored', [GetPropertyFieldName(PropertyDefinition)])
  end;

  function GetPropertyGetFunctionName(const PropertyDefinition: TPropertyDefinition): String;
  begin
    Result := 'Get' + FormatName(FormatPropertyName(PropertyDefinition));
  end;

  function GetPropertyReadMethod(const PropertyDefinition: TPropertyDefinition): String;
  begin
    if PropertyDefinition.NeedGetFunction then
      Result := GetPropertyGetFunctionName(PropertyDefinition)
    else
      Result := GetPropertyFieldName(PropertyDefinition);
  end;

  function GetPropertySetProcedureName(const PropertyDefinition: TPropertyDefinition): String;
  begin
    Result := 'Set' + FormatName(FormatPropertyName(PropertyDefinition));
  end;

  function GetPropertyWriteMethod(const &Property: TPropertyDefinition): String;
  begin
    if &Property.NeedSetProcedure then
      Result := GetPropertySetProcedureName(&Property)
    else
      Result := GetPropertyFieldName(&Property);
  end;

  function GetFullPathTypeName(const TypeName: String; const TypeDefinition: TTypeDefinition): String;
  begin
    Result := TypeName;

    if TypeDefinition.ParentModule.IsClassDefinition then
      Result := Format('%s.%s', [GetClassImplementationName(TypeDefinition.ParentModule.AsClassDefinition), Result]);
  end;

  function GetEnumerationName(const TypeEnumeration: TTypeEnumeration): String;
  begin
    Result := GetFullPathTypeName(CheckNameDeclaration(TypeEnumeration.Name), TypeEnumeration);
  end;

  function GetTypeName(const TypeDefinition: TTypeDefinition): String;
  begin
    if TypeDefinition.IsArrayType then
      Result := Format('TArray<%s>', [GetTypeName(GetArrayItemType(TypeDefinition))])
    else if TypeDefinition.IsDynamicPropertyType then
      Result := Format('TDynamicProperty<%s>', [GetTypeName(ResolveTypeDefinition(TypeDefinition.AsDynamicPropertyType.ValueType))])
    else if TypeDefinition.IsClassDefinition then
      Result := Format('%s', [GetClassImplementationName(TypeDefinition.AsClassDefinition)])
    else if TypeDefinition.IsEnumeration then
      Result := GetEnumerationName(TypeDefinition.AsTypeEnumeration)
    else if TypeDefinition is TUndefinedType then
      Result := Format('Undefined { %s }', [TypeDefinition.Name])
    else if TypeDefinition.IsTypeAlias then
      Result := GetFullPathTypeName(CheckNameDeclaration(TypeDefinition.Name), TypeDefinition)
    else if TypeDefinition.IsDelayedType then
      Result := GetTypeName(ResolveTypeDefinition(TypeDefinition))
    else
      Result := TypeDefinition.Name;

    if not TypeDefinition.IsArrayType and not TypeDefinition.IsDynamicPropertyType and Assigned(TypeDefinition.ParentUnit) and (TypeDefinition.ParentUnit <> Self) then
      Result := Format('%s.%s', [TypeDefinition.ParentUnit.Name, Result]);
  end;

  function GetFullTypeName(const TypeDefinition: TTypeDefinition): String;
  begin
    Result := GetTypeName(TypeDefinition);

    if not TypeDefinition.IsArrayType and not TypeDefinition.IsDynamicPropertyType and Assigned(TypeDefinition.ParentUnit) and (TypeDefinition.ParentUnit = Self) then
      Result := Format('%s.%s', [TypeDefinition.ParentUnit.Name, Result]);
  end;

  function GetBaseTypeFullName(const TypeDefinition: TTypeDefinition): String;
  begin
    var ResolvedTypeDefinition := ResolveTypeAlias(TypeDefinition);

    if ResolvedTypeDefinition.IsArrayType then
      Result := Format('TArray<%s>', [GetBaseTypeFullName(GetArrayItemType(ResolvedTypeDefinition))])
    else if ResolvedTypeDefinition.IsDynamicPropertyType then
      Result := Format('TDynamicProperty<%s>', [GetBaseTypeFullName(ResolvedTypeDefinition.AsDynamicPropertyType.ValueType)])
    else
      Result := GetFullTypeName(ResolvedTypeDefinition);
  end;

  function GetParameterTypeName(const Parameter: TTypeParameterDefinition): String;
  begin
    Result := GetTypeName(Parameter.ParameterType);
  end;

  function GetPropertyTypeName(const &Property: TPropertyDefinition): String;
  begin
    Result := GetTypeName(GetPropertyType(&Property));
  end;

  function GetSetProcedureValueName(const &Property: TPropertyDefinition): String;
  begin
    Result := Format('%s(const Value: %s)', [GetPropertySetProcedureName(&Property), GetPropertyTypeName(&Property)]);
  end;

  function GetAddFuntionName(const &Property: TPropertyDefinition): String;
  begin
    Result := Format('Add%s', [FormatName(&Property.Name)]);
  end;

  procedure LoadAtrributesList(const Ident: String; const List: TList<String>);
  begin
    for var Attribute in List do
      AddLine('%s[%s]', [Ident, Attribute]);
  end;

  procedure LoadAttributes(const Ident: String; const TypeDefinition: TTypeCommonDefinition);
  begin
    LoadAtrributesList(Ident, TypeDefinition.Attributes);
  end;

  procedure LoadParentAttributes(const Ident: String; const TypeDefinition: TTypeDefinition);
  begin
    LoadAtrributesList(Ident, TypeDefinition.ParentAttributes);
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

    function IsValidValuesNames(const Enumerator: TTypeEnumeration): Boolean;
    begin
      Result := True;

      for var EnumeratorValue in Enumerator.Values do
        if FormatEnumeratorValue(EnumeratorValue) <> NotFormatEnumeratorValue(EnumeratorValue) then
          Exit(False);
    end;

  begin
    var FirstEnumerator := True;

    for var Enumerator in Module.Enumerations do
    begin
      if not FirstEnumerator then
        AddLine;

      LoadAttributes(Ident, Enumerator);

      if not IsValidValuesNames(Enumerator) then
        AddLine('%s[EnumValue(''%s'')]', [Ident, GetEnumeratorValues(Enumerator, ''' +' + sLineBreak + Ident + WHITE_SPACE_IDENT + '''', NotFormatEnumeratorValue)]);

      AddLine('%s%s = (%s);', [Ident, CheckNameDeclaration(Enumerator.Name), GetEnumeratorValues(Enumerator, sLineBreak + Ident + WHITE_SPACE_IDENT, FormatEnumeratorValue)]);

      FirstEnumerator := False;
    end;
  end;

  procedure GenerateAliasDeclaration(const Ident: String; const TypesAlias: TList<TTypeAlias>);
  begin
    if not TypesAlias.IsEmpty then
    begin
      AddLine(Ident + '// Types alias');

      for var Alias in TypesAlias do
        AddLine('%s%s = %s;', [Ident, CheckNameDeclaration(Alias.Name), GetBaseTypeFullName(Alias)]);
    end;
  end;

  procedure DeclareForwardClassDeclaration(const Ident: String; const Module: TTypeModuleDefinition);
  begin
    if not Module.Classes.IsEmpty then
    begin
      AddLine(Ident + '// Forward class declaration');

      for var AClass in Module.Classes do
        AddLine(Ident + '%s = class;', [GetClassName(AClass)]);

      AddLine;
    end;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TTypeClassDefinition);

    function GetStoredMethodName(const &Property: TPropertyDefinition): String;
    begin
      if &Property.NeedIsStoredFunction then
        Result := GetStoredFunctionName(&Property)
      else if &Property.NeedIsStoredField then
        Result := GetStoredFieldName(&Property)
      else
        Result := EmptyStr;
    end;

    function GetStoredPropertyDeclaration(const &Property: TPropertyDefinition): String;
    begin
      Result := GetStoredMethodName(&Property);

      if not Result.IsEmpty then
        Result := Format(' stored %s', [Result]);
    end;

    function GetInheritence: String;
    begin
      if Assigned(ClassDefinition.InheritedFrom) then
        Result := Format('(%s)', [GetTypeName(ResolveTypeDefinition(ClassDefinition.InheritedFrom))])
      else
        Result := EmptyStr;
    end;

    procedure LoadClassInformation;

      function GetNeedAddFunction(const PropertyType: TTypeDefinition): Boolean;
      begin
        Result := PropertyType.IsArrayType and GetArrayItemType(PropertyType).IsClassDefinition;
      end;

      function GetNeedDestructor(const PropertyType: TTypeDefinition): Boolean;
      begin
        Result := PropertyType.IsClassDefinition and not PropertyType.IsObjectType or PropertyType.IsDynamicPropertyType or PropertyType.IsArrayType and GetNeedDestructor(GetArrayItemType(PropertyType));
      end;

      function GetNeedGetFunction(const PropertyType: TTypeDefinition): Boolean;
      begin
        Result := PropertyType.IsClassDefinition and not PropertyType.IsArrayType and not PropertyType.IsObjectType or PropertyType.IsDynamicPropertyType;
      end;

      procedure AppendInformations(const NeedAdd: Boolean; const &Property: TPropertyDefinition; const Informations: TImplementationInformations);
      begin
        if NeedAdd then
        begin
          ClassDefinition.Informations := ClassDefinition.Informations + Informations;
          &Property.Informations := &Property.Informations + Informations;
        end;
      end;

      procedure AppendInformation(const NeedAdd: Boolean; const &Property: TPropertyDefinition; const Information: TImplementationInformation);
      begin
        AppendInformations(NeedAdd, &Property, [Information]);
      end;

      function GetStoredInformation(const PropertyType: TTypeDefinition): TImplementationInformations;
      begin
        if PropertyType.IsEnumeration or PropertyType.IsExternal then
          Result := [TImplementationInformation.NeedIsStoredField, TImplementationInformation.NeedSetProcedure]
        else
          Result := [TImplementationInformation.NeedIsStoredFunction];
      end;

    begin
      var ClassInformation: TImplementationInformations := [];

      for var &Property in ClassDefinition.Properties do
      begin
        var PropertyType := GetPropertyBaseType(&Property);

        AppendInformation(GetNeedAddFunction(PropertyType), &Property, TImplementationInformation.NeedAddFunction);

        AppendInformations(&Property.Optional, &Property, GetStoredInformation(PropertyType));

        AppendInformation(GetNeedDestructor(PropertyType), &Property, TImplementationInformation.NeedDestructor);

        AppendInformation(GetNeedGetFunction(PropertyType) or not &Property.FixedValue.IsEmpty, &Property, TImplementationInformation.NeedGetFunction);

        if ExtractLocalName(FormatPropertyName(&Property)) <> ExtractLocalName(&Property.Name) then
          &Property.AddFieldAttribute(ExtractLocalName(&Property.Name));
      end;
    end;

    procedure CheckAddLine(const Information: TImplementationInformation; const Informations: TImplementationInformations);
    begin
      if (Information in ClassDefinition.Informations) and (Informations * ClassDefinition.Informations <> []) then
        AddLine;
    end;

  begin
    LoadClassInformation;

    LoadAttributes(Ident, ClassDefinition);

    AddLine('%s%s = class%s', [Ident, GetClassName(ClassDefinition), GetInheritence]);

    if not (ClassDefinition.Classes.IsEmpty and ClassDefinition.Enumerations.IsEmpty and ClassDefinition.TypeAlias.IsEmpty) then
    begin
      AddLine('%spublic type', [Ident]);

      if not ClassDefinition.Enumerations.IsEmpty then
      begin
        GenerateEnumerators(Ident + WHITE_SPACE_IDENT, ClassDefinition);

        if not (ClassDefinition.Classes.IsEmpty and ClassDefinition.TypeAlias.IsEmpty) then
          AddLine;
      end;

      DeclareForwardClassDeclaration(Ident + WHITE_SPACE_IDENT, ClassDefinition);

      if not ClassDefinition.TypeAlias.IsEmpty then
      begin
        GenerateAliasDeclaration(Ident + WHITE_SPACE_IDENT, ClassDefinition.TypeAlias);

        if not ClassDefinition.Classes.IsEmpty then
          AddLine;
      end;

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
        if &Property.NeedIsStoredField then
          AddLine('%s  %s: Boolean;', [Ident, GetStoredFieldName(&Property)]);

      if ClassDefinition.NeedImplementation then
        AddLine;

      for var &Property in ClassDefinition.Properties do
        if &Property.NeedGetFunction then
          AddLine('%s  function %s: %s;', [Ident, GetPropertyGetFunctionName(&Property), GetPropertyTypeName(&Property)]);

      for var &Property in ClassDefinition.Properties do
        if &Property.NeedIsStoredFunction then
          AddLine('%s  function %s: Boolean;', [Ident, GetStoredFunctionName(&Property)]);

      for var &Property in ClassDefinition.Properties do
        if &Property.NeedSetProcedure then
          AddLine('%s  procedure %s;', [Ident, GetSetProcedureValueName(&Property)]);

      if ClassDefinition.NeedImplementation then
      begin
        AddLine('%spublic', [Ident]);

        if ClassDefinition.NeedDestructor then
          AddLine('%s  destructor Destroy; override;', [Ident]);

        CheckAddLine(TImplementationInformation.NeedAddFunction, [TImplementationInformation.NeedDestructor]);

        for var &Property in ClassDefinition.Properties do
          if &Property.NeedAddFunction then
            AddLine('%s  function %s: %s;', [Ident, GetAddFuntionName(&Property), GetFullTypeName(GetArrayItemType(GetPropertyBaseType(&Property)))]);

        CheckAddLine(TImplementationInformation.NeedIsStoredFunction, [TImplementationInformation.NeedDestructor, TImplementationInformation.NeedAddFunction]);

        for var &Property in ClassDefinition.Properties do
        begin
          var StoredMethodName := GetStoredMethodName(&Property);

          if not StoredMethodName.IsEmpty then
            AddLine('%s  property Is%sStored: Boolean read %s;', [Ident, FormatName(&Property.Name), StoredMethodName]);
        end;
      end;

      AddLine('%spublished', [Ident]);

      for var &Property in ClassDefinition.Properties do
      begin
        LoadAttributes(Ident + WHITE_SPACE_IDENT, &Property);

        LoadParentAttributes(Ident + WHITE_SPACE_IDENT, GetPropertyType(&Property));

        AddLine('%s  property %s: %s read %s write %s%s;', [Ident, FormatPropertyName(&Property), GetPropertyTypeName(&Property), GetPropertyReadMethod(&Property), GetPropertyWriteMethod(&Property),
          GetStoredPropertyDeclaration(&Property)]);
      end;
    end;

    AddLine('%send;', [Ident]);
  end;

  function GetIsStoredFunctionValue(const &Property: TPropertyDefinition; const PropertyType: TTypeDefinition): String;
  begin
    if PropertyType.IsClassDefinition or PropertyType.IsArrayType or PropertyType.IsDynamicPropertyType then
      Result := Format('Assigned(%s)', [GetPropertyFieldName(&Property)])
    else if PropertyType.IsStringType then
      Result := Format('not %s.IsEmpty', [GetPropertyFieldName(&Property)])
    else if PropertyType.IsNumericType then
      Result := Format('%s <> 0', [GetPropertyFieldName(&Property)])
    else if PropertyType.IsEnumeration then
      Result := GetStoredFieldName(&Property)
    else
      Result := 'False';
  end;

  function CreateObjectClass(const TypeDefinition: TTypeDefinition): String;
  begin
    Result := Format('%s.Create', [GetBaseTypeFullName(TypeDefinition)]);
  end;

  function GetPropertyFixedValue(const &Property: TPropertyDefinition): String;
  begin
    if GetPropertyBaseType(&Property).IsStringType then
      Result := Format('''%s''', [&Property.FixedValue])
    else
      Result := &Property.FixedValue;
  end;

  procedure GenerateClassImplementation(const ClassDefinition: TTypeClassDefinition);
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
          var PropertyType := GetPropertyBaseType(&Property);

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
        var PropertyType := GetPropertyBaseType(&Property);

        if &Property.NeedGetFunction then
        begin
          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetPropertyGetFunctionName(&Property), GetFullTypeName(PropertyType)]);

          AddLine('begin');

          if &Property.FixedValue.IsEmpty then
          begin
            AddLine('  if not Assigned(%s) then', [PropertyFieldName]);

            AddLine('    %s := %s;', [PropertyFieldName, CreateObjectClass(PropertyType)]);

            AddLine;

            AddLine('  Result := %s;', [PropertyFieldName]);
          end
          else
            AddLine('  Result := %s;', [GetPropertyFixedValue(&Property)]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.NeedAddFunction then
        begin
          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetAddFuntionName(&Property), GetFullTypeName(GetArrayItemType(PropertyType))]);

          AddLine('begin');

          AddLine('  Result := %s;', [CreateObjectClass(GetArrayItemType(PropertyType))]);

          AddLine;

          AddLine('  %0:s := %0:s + [Result];', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.NeedIsStoredFunction then
        begin
          AddLine('function %s.%s: Boolean;', [GetClassImplementationName(ClassDefinition), GetStoredFunctionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s;', [GetIsStoredFunctionValue(&Property, PropertyType)]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.NeedSetProcedure then
        begin
          AddLine('procedure %s.%s;', [GetClassImplementationName(ClassDefinition), GetSetProcedureValueName(&Property)]);

          AddLine('begin');

          AddLine('  %s := Value;', [PropertyFieldName]);

          if &Property.NeedIsStoredField then
            AddLine('  %s := True;', [GetStoredFieldName(&Property)]);

          AddLine('end;');

          AddLine;
        end;
      end;
    end;

    for var SubClassDefinition in ClassDefinition.Classes do
      GenerateClassImplementation(SubClassDefinition);
  end;

  procedure LoadUses(const UnitList: TArray<String>);
  begin
    var UsesValue := EmptyStr;

    for var UnitName in UnitList do
    begin
      if not UsesValue.IsEmpty then
        UsesValue := UsesValue + ', ';

      UsesValue := UsesValue + UnitName;
    end;

    AddLine('uses %s;', [UsesValue]);
  end;

  procedure LoadUsesForImplementation;
  begin
    var UnitList: TArray<String> := ['System.SysUtils'];

    if not Interfaces.IsEmpty then
      UnitList := UnitList + ['Blue.Print.Remote.Service'];

    LoadUses(UnitList);
  end;

  procedure LoadInterfaceUses;
  var
    UsesList: TList<String>;

    procedure AddUses(const Value: String);
    begin
      if not UsesList.Contains(Value) then
        UsesList.Add(Value);
    end;

    procedure CheckType(const TypeDefinition: TTypeDefinition);

      procedure AddUnitDefinition(const UnitDefinition: TTypeUnitDefinition);
      begin
        if Assigned(UnitDefinition) then
          AddUses(UnitDefinition.Name);
      end;

      procedure CheckUses(const TypeDefinition: TTypeDefinition);
      begin
        if TypeDefinition.IsExternal then
          AddUses(TypeDefinition.AsTypeExternal.ModuleName)
        else if TypeDefinition.IsClassDefinition then
        begin
          var ClassDefinition := TypeDefinition.AsClassDefinition;

          AddUnitDefinition(ClassDefinition.ParentUnit);

          if Assigned(ClassDefinition.InheritedFrom) then
          begin
            var InheritedFrom := ResolveTypeDefinition(ClassDefinition.InheritedFrom);

            if InheritedFrom.IsClassDefinition then
              AddUnitDefinition(InheritedFrom.ParentUnit)
            else if InheritedFrom.IsExternal then
              AddUses(InheritedFrom.AsTypeExternal.ModuleName);
          end;
        end
        else if TypeDefinition.IsEnumeration and TypeDefinition.ParentModule.IsUnitDefinition then
          AddUnitDefinition(TypeDefinition.ParentModule.AsUnitDefinition)
        else if TypeDefinition.IsTypeAlias or (TypeDefinition.ParentUnit <> Self) and (TypeDefinition.ParentUnit <> Importer.SystemUnit) then
          AddUnitDefinition(TypeDefinition.ParentUnit)
      end;

    begin
      if TypeDefinition.IsDelayedType then
        CheckType(ResolveTypeDefinition(TypeDefinition))
      else
        CheckUses(TypeDefinition);
    end;

    procedure CheckClasses(const Classes: TList<TTypeClassDefinition>);
    begin
      for var ClassDefinition in Classes do
      begin
        for var &Property in ClassDefinition.Properties do
          CheckType(GetPropertyType(&Property));

        CheckClasses(ClassDefinition.Classes);
      end;
    end;

  begin
    UsesList := TList<String>.Create;

    AddUses('Blue.Print.Types');

    for var AUnit in FUses do
      AddUses(AUnit.Name);

    CheckClasses(Classes);

    for var TypeAlias in TypeAlias do
      CheckType(ResolveTypeAlias(TypeAlias));

    UsesList.Remove(Name);

    LoadUses(UsesList.ToArray);

    UsesList.Free;
  end;

  function GetUnitReferencesNames(const UnitConfiguration: TTypeUnitDefinitionConfiguration): String;
  begin
    Result := EmptyStr;

    for var UnitFile in UnitConfiguration.Files do
    begin
      if not Result.IsEmpty then
        Result := Result + ', ';

      Result := Result + UnitFile.FileName;
    end;
  end;

  procedure DeclareMethod(const &Interface: TTypeInterfaceDefinition; const Method: TTypeMethodDefinition);

    function GetMethodType: String;
    begin
      if Assigned(Method.Return) then
        Result := 'function'
      else
        Result := 'procedure';
    end;

    function GetMethodReturn: String;
    begin
      if Assigned(Method.Return) then
        Result := Format(': %s', [GetTypeName(Method.Return)])
      else
        Result := EmptyStr;
    end;

    function GetParameters: String;
    var
      Parameter: TTypeParameterDefinition;

      function LoadAttributes: String;
      begin
        Result := EmptyStr;

        for var Attribute in Parameter.Attributes.ToArray + Parameter.ParentAttributes.ToArray do
        begin
          if not Result.IsEmpty then
            Result := Result + ', ';

          Result := Result + Attribute;
        end;

        if not Result.IsEmpty then
          Result := Format('[%s] ', [Result]);
      end;

    begin
      Result := EmptyStr;

      for Parameter in Method.Parameters do
      begin
        if not Result.IsEmpty then
          Result := Result + '; ';

        Result := Result + Format('%s%s: %s', [LoadAttributes, ExtractLocalName(Parameter.Name), GetParameterTypeName(Parameter)]);
      end;

      if not Result.IsEmpty then
        Result := Format('(%s)', [Result]);
    end;

    function GetOverloadInformation: String;
    begin
      for var MethodOverload in &Interface.Methods do
        if MethodOverload.Name = Method.Name then
          if Result.IsEmpty then
            Result := ' overload;'
          else
            Exit;

      Result := EmptyStr;
    end;

  begin
    LoadAttributes('    ', Method);

    AddLine('    %s %s%s%s;%s', [GetMethodType, Method.Name, GetParameters, GetMethodReturn, GetOverloadInformation]);
  end;

  function GetInterfaceFunction(const &Interface: TTypeInterfaceDefinition; const LoadDefaultURL: Boolean): String;
  begin
    var DefaultValue := EmptyStr;

    if LoadDefaultURL and not &Interface.DefaultURL.IsEmpty then
      DefaultValue := Format(' = ''%s''', [&Interface.DefaultURL]);

    Result := Format('function Get%0:s(const URL: String%s): %0:s;', [&Interface.Name, DefaultValue]);
  end;

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  AddLine('{$M+}');
  AddLine('{$SCOPEDENUMS ON}');

  AddLine;

  AddLine('// File generated from %s;', [GetUnitReferencesNames(UnitConfiguration)]);

  AddLine;

  LoadInterfaceUses;

  AddLine;

  if not TypeAlias.IsEmpty or not Classes.IsEmpty or not Enumerations.IsEmpty then
    AddLine('type');

  if not Enumerations.IsEmpty then
  begin
    AddLine('  // Enumerations declaration');

    GenerateEnumerators(WHITE_SPACE_IDENT, Self);
  end;

  DeclareForwardClassDeclaration(WHITE_SPACE_IDENT, Self);

  if not TypeAlias.IsEmpty then
  begin
    GenerateAliasDeclaration(WHITE_SPACE_IDENT, TypeAlias);

    AddLine;
  end;

  for var ClassDefinition in Classes do
  begin
    GenerateClassDeclaration(WHITE_SPACE_IDENT, ClassDefinition);

    AddLine;
  end;

  for var &Interface in Interfaces do
  begin
    LoadAttributes('  ', &Interface);

    AddLine('  %s = interface(IInvokable)', [&Interface.Name]);

    var GUIDValue := THashSHA2.GetHashString(GetFullTypeName(&Interface)).ToUpper;

    AddLine('    [''{%s-%s-%s-%s-%s}'']', [GUIDValue.Substring(0, 8), GUIDValue.Substring(8, 4), GUIDValue.Substring(12, 4), GUIDValue.Substring(16, 4), GUIDValue.Substring(20, 12)]);

    for var Method in &Interface.Methods do
      DeclareMethod(&Interface, Method);

    AddLine('  end;');

    AddLine;
  end;

  if not Interfaces.IsEmpty then
  begin
    for var &Interface in Interfaces do
      AddLine(GetInterfaceFunction(&Interface, True));

    AddLine;
  end;

  AddLine('implementation');

  AddLine;

  LoadUsesForImplementation;

  if not Interfaces.IsEmpty then
    for var &Interface in Interfaces do
    begin
      AddLine;

      AddLine(GetInterfaceFunction(&Interface, False));

      AddLine('begin');

      AddLine('  Result := TRemoteService.CreateService<%s>(URL);', [&Interface.Name]);

      AddLine('end;');
    end;

  AddLine;

  for var ClassDefinition in Classes do
    GenerateClassImplementation(ClassDefinition);

  AddLine('end.');

  UnitDefinition.SaveToFile(Format('%s\%s.pas', [Importer.Configuration.OutputFolder, Name]), TEncoding.UTF8);
end;

{ TTypeClassDefinition }

procedure TTypeClassDefinition.AddAtribute(const Value: String);
begin
  for var AttributeValue in Attributes do
    if AttributeValue = Value then
      Exit;

  Attributes.Add(Value);
end;

procedure TTypeClassDefinition.AddAtribute(const Value: String; const Values: array of const);
begin
  AddAtribute(Format(Value, Values));
end;

function TTypeClassDefinition.AddProperty(const Name: String): TPropertyDefinition;
begin
  for var &Property in Properties do
    if &Property.Name = Name then
      Exit(&Property);

  Result := TPropertyDefinition.Create(Self);
  Result.Name := Name;

  FProperties.Add(Result);
end;

constructor TTypeClassDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited Create(Module);

  FProperties := TObjectList<TPropertyDefinition>.Create;
end;

destructor TTypeClassDefinition.Destroy;
begin
  FProperties.Free;

  inherited;
end;

function TTypeClassDefinition.GetNeedAddFunction: Boolean;
begin
  Result := TImplementationInformation.NeedAddFunction in Informations;
end;

function TTypeClassDefinition.GetNeedDestructor: Boolean;
begin
  Result := TImplementationInformation.NeedDestructor in Informations;
end;

function TTypeClassDefinition.GetNeedImplementation: Boolean;
begin
  Result := Informations - [TImplementationInformation.NeedIsStoredField] <> [];
end;

{ TPropertyDefinition }

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

function TPropertyDefinition.GetNeedIsStoredField: Boolean;
begin
  Result := TImplementationInformation.NeedIsStoredField in Informations;
end;

function TPropertyDefinition.GetNeedIsStoredFunction: Boolean;
begin
  Result := TImplementationInformation.NeedIsStoredFunction in Informations;
end;

function TPropertyDefinition.GetNeedSetProcedure: Boolean;
begin
  Result := TImplementationInformation.NeedSetProcedure in Informations;
end;

{ TTypeDefinition }

function TTypeDefinition.GetAsArrayType: TTypeArrayDefinition;
begin
  Result := Self as TTypeArrayDefinition;
end;

function TTypeDefinition.GetAsClassDefinition: TTypeClassDefinition;
begin
  Result := Self as TTypeClassDefinition;
end;

function TTypeDefinition.GetAsDelayedType: TTypeDelayedDefinition;
begin
  Result := Self as TTypeDelayedDefinition;
end;

function TTypeDefinition.GetAsDynamicPropertyType: TTypeDynamicPropertyDefinition;
begin
  Result := Self as TTypeDynamicPropertyDefinition;
end;

function TTypeDefinition.GetAsInterfaceType: TTypeInterfaceDefinition;
begin
  Result := Self as TTypeInterfaceDefinition;
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

function TTypeDefinition.GetAsUnitDefinition: TTypeUnitDefinition;
begin
  Result := Self as TTypeUnitDefinition;
end;

function TTypeDefinition.GetIsArrayType: Boolean;
begin
  Result := Self is TTypeArrayDefinition;
end;

function TTypeDefinition.GetIsDelayedType: Boolean;
begin
  Result := Self is TTypeDelayedDefinition;
end;

function TTypeDefinition.GetIsDynamicPropertyType: Boolean;
begin
  Result := Self is TTypeDynamicPropertyDefinition;
end;

function TTypeDefinition.GetIsEnumeration: Boolean;
begin
  Result := Self is TTypeEnumeration;
end;

function TTypeDefinition.GetIsExternal: Boolean;
begin
  Result := Self is TTypeExternal;
end;

function TTypeDefinition.GetIsInterfaceType: Boolean;
begin
  Result := Self is TTypeInterfaceDefinition;
end;

function TTypeDefinition.GetIsTypeAlias: Boolean;
begin
  Result := Self is TTypeAlias;
end;

function TTypeDefinition.GetIsUnitDefinition: Boolean;
begin
  Result := Self is TTypeUnitDefinition;
end;

function TTypeDefinition.GetParentUnit: TTypeUnitDefinition;
begin
  var Parent := Self;

  while Assigned(Parent) and not Parent.IsUnitDefinition do
    Parent := Parent.ParentModule;

  Result := Parent as TTypeUnitDefinition;
end;

{ TTypeDelayedDefinition }

constructor TTypeDelayedDefinition.Create(const TypeName: String; const Module: TTypeModuleDefinition);
begin
  inherited Create(Module);

  FName := Format('Delayed(%s)', [TypeName]);
  FUnresolvedType := TypeName;
end;

function TTypeDelayedDefinition.GetIsResolved: Boolean;
begin
  Result := Assigned(FTypeResolved);
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

{ TJSONSchemaLoader }

function TJSONSchemaLoader.CheckTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;

  function CreateEnumerator: TTypeEnumeration;
  begin
    Result := TTypeEnumeration.Create(Module);
    Result.Name := TypeName;

    Module.Enumerations.Add(Result);

    for var EnumeratorValue in Schema.&Object.enum do
      Result.Values.Add(EnumeratorValue.ToString);
  end;

  function GetAnyTypeDefinition: TTypeDefinition;
  const
    ANY_TYPE_NAME = 'any';

  begin
    Result := FImporter.FindType(ANY_TYPE_NAME, Module.ParentUnit);

    if not Assigned(Result) then
    begin
      var AliasType := FImporter.CreateTypeAlias(Module.ParentUnit, ANY_TYPE_NAME, FImporter.TValueType);
      Result := AliasType;

      Module.ParentUnit.AddTypeAlias(AliasType);
    end;
  end;

  function IsFlatSchema(const Schema: TSchema): Boolean;
  begin
    Result := Schema.&Object.IsAllOfStored or Schema.&Object.IsOneOfStored or Schema.&Object.IsAnyOfStored or Schema.&Object.IsTypeStored and Schema.&Object.&Type.IsArrayStored or IsConditionalSchema(Schema);
  end;

  procedure CheckFlatAttribute(const ClassDefinition: TTypeClassDefinition);
  begin
    var FlatField := EmptyStr;
    var ParentModule := Module;
    var TypeName := TypeName;

    while ParentModule.IsClassDefinition do
    begin
      TypeName := Format('%s.%s', [ParentModule.Name, TypeName]);

      ParentModule := ParentModule.ParentModule;
    end;

    for var TypeConfiguration in FImporter.Configuration.TypeDefinition do
      if not TypeConfiguration.FlatEnumerator.IsEmpty and (TypeConfiguration.Name = TypeName) then
        FlatField := TypeConfiguration.FlatEnumerator;

    if not FlatField.IsEmpty or IsFlatSchema(Schema) then
      ClassDefinition.AddFlatAttribute(FlatField);
  end;

  function CreateClassTypeDefinition(const ParentModule: TTypeModuleDefinition; const TypeName: String): TTypeClassDefinition;
  begin
    var ClassDefinition := FindAllTypes(TypeName, ParentModule);

    if Assigned(ClassDefinition) and not ClassDefinition.IsDelayedType then
      Result := ClassDefinition.AsClassDefinition
    else
      Result := FImporter.CreateClassDefinition(ParentModule, TypeName);
  end;

  function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const TypeName: String): TTypeClassDefinition;
  begin
    Result := CreateClassTypeDefinition(ParentModule, TypeName);

    CheckFlatAttribute(Result);

    GenerateProperties(Result, Schema);

    GenerateDefinitions(Result, Schema);
  end;

  function GetSimpleType(const SimpleType: TSchema.simpleTypes): TTypeDefinition;
  begin
    case SimpleType of
      TSchema.simpleTypes.boolean: Result := FImporter.BooleanType;
      TSchema.simpleTypes.null: Result := nil;
      TSchema.simpleTypes.integer: Result := FImporter.IntegerType;
      TSchema.simpleTypes.number: Result := FImporter.DoubleType;
      TSchema.simpleTypes.&string: Result := FImporter.StringType;
      else Result := nil;
    end;
  end;

  function MustDeclareClass: Boolean;
  begin
    Result := IsFlatSchema(Schema) or Schema.&Object.IsAdditionalPropertiesStored or Schema.&Object.IsPatternPropertiesStored or Schema.&Object.IsPropertiesStored;
  end;

begin
  if Schema.IsObjectStored then
    for var Definition in Schema.&Object.Definitions.JSONSchema do
    begin
      var TypeDefinition := CheckTypeDefinition(Module, Definition.Value, Definition.Key);

      if not (TypeDefinition.IsClassDefinition or TypeDefinition.IsEnumeration) then
        Module.AddTypeAlias(Importer.CreateTypeAlias(Module, Definition.Key, TypeDefinition));
    end;

  if Schema.&Object.IsEnumStored then
    Result := CreateEnumerator
  else if Schema.&Object.IsTypeStored then
    if Schema.&Object.&type.IsSimpleTypesStored then
    begin
      case Schema.&Object.&type.SimpleTypes of
        TSchema.simpleTypes.&array: Result := TTypeArrayDefinition.Create(Module, CheckTypeDefinition(Module, Schema.&Object.items, TypeName + 'ArrayItem'));
        TSchema.simpleTypes.&object: Result := CreateClassDefinition(Module, TypeName);
        else Result := GetSimpleType(Schema.&Object.&type.SimpleTypes);
      end;
    end
    else
    begin
      var ClassDefinition := CreateClassTypeDefinition(Module, TypeName);
      Result := ClassDefinition;

      ClassDefinition.AddFlatAttribute;

      GenerateDefinitions(ClassDefinition, Schema);

      for var SimpleType in Schema.&Object.&type.&array do
      begin
        var PropertyName := FormatName(TRttiEnumerationType.GetName(SimpleType));
        var PropertyType: TTypeDefinition;

        if SimpleType = TSchema.simpleTypes.&object then
        begin
          PropertyType := CreateClassTypeDefinition(ClassDefinition, PropertyName);

          GenerateProperties(PropertyType.AsClassDefinition, Schema);
        end
        else
          PropertyType := GetSimpleType(SimpleType);

        DefineProperty(ClassDefinition, Schema, PropertyName, PropertyType);
      end;
    end
  else if MustDeclareClass then
    Result := CreateClassDefinition(Module, TypeName)
  else if IsReference(Schema) then
    Result := FindTypeReference(Module, Schema)
  else if Schema.&Object.IsDefaultStored then
    if Schema.&Object.Default.TypeInfo = TypeInfo(Boolean) then
      Result := FImporter.BooleanType
    else if Schema.&Object.Default.TypeInfo = TypeInfo(Double) then
      Result := FImporter.IntegerType
    else if Schema.&Object.Default.TypeInfo = TypeInfo(String) then
      Result := FImporter.StringType
    else
      Result := GetAnyTypeDefinition
  else
    Result := GetAnyTypeDefinition;
end;

constructor TJSONSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited;

  FImporter := Importer;
  FSchemas := TDictionary<String, TSchema>.Create(TIStringComparer.Ordinal);
end;

function TJSONSchemaLoader.CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const ValueType: TTypeDefinition): TTypeDynamicPropertyDefinition;
begin
  Result := TTypeDynamicPropertyDefinition.Create(ParentModule, ValueType);
end;

function TJSONSchemaLoader.DefineProperty(const ClassDefinition: TTypeClassDefinition; const Schema: TSchema; const PropertyName: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
begin
  for var ClassProperty in ClassDefinition.Properties do
    if SameText(ClassProperty.Name, PropertyName) then
      Exit(ClassProperty);

  Result := ClassDefinition.AddProperty(PropertyName);
  Result.Optional := True;
  Result.PropertyType := PropertyType;

  if not Assigned(Result.PropertyType) then
    raise Exception.Create('Property type not found!');

  for var Required in Schema.&Object.required do
    if Result.Name = Required then
      Result.Optional := False;
end;

destructor TJSONSchemaLoader.Destroy;
begin
  FSchemas.Free;

  inherited;
end;

function TJSONSchemaLoader.FindAllTypes(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;

  function FindInProperties(const ClassDefinition: TTypeClassDefinition): TTypeDefinition;
  begin
    Result := nil;

    for var PropertyDefinition in ClassDefinition.Properties do
      if PropertyDefinition.Name = TypeName then
        Exit(PropertyDefinition.PropertyType);
  end;

begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) then
  begin
    var MainUnitType := Module.ParentUnit.MainModule;

    if MainUnitType.IsClassDefinition then
      Result := FindInProperties(MainUnitType.AsClassDefinition)
    else if MainUnitType.IsDelayedType and MainUnitType.AsDelayedType.IsResolved and MainUnitType.AsDelayedType.TypeResolved.IsClassDefinition then
      Result := FindInProperties(MainUnitType.AsDelayedType.TypeResolved.AsClassDefinition);
  end;
end;

function TJSONSchemaLoader.FindTypeReference(const Module: TTypeModuleDefinition; const Schema: TSchema): TTypeDefinition;

  function FindModuleReference(const Reference: String): TTypeModuleDefinition;
  begin
    if Reference.IsEmpty then
      Result := Module.ParentUnit
    else
      FImporter.GetModuleDefinitionByReference(Reference, Result);
  end;

  function FindPropertyValue(const Module: TTypeModuleDefinition; const PropertyName: String): TTypeDefinition;
  begin
    for var PropertyDefinition in Module.AsClassDefinition.Properties do
      if PropertyDefinition.Name = PropertyName then
        Exit(PropertyDefinition.PropertyType);

    Result := Module.AddDelayedType(PropertyName);
  end;

  function FindTypeDefinition(const Module: TTypeModuleDefinition; const TypeName: String): TTypeDefinition;
  begin
    if not FImporter.FindTypeDefinitionInModule(Module, TypeName, Result) then
      Result := Module.AddDelayedType(TypeName);
  end;

begin
  if Schema.&Object.IsRefStored then
  begin
    var ReferenceName := EmptyStr;
    var References := Schema.&Object.ref.Split(['#'], TStringSplitOptions.ExcludeLastEmpty);
    Result := nil;

    if Length(References) = 1 then
      Result := Module
    else
    begin
      var CurrentModule := FindModuleReference(References[0]) as TTypeModuleDefinition;
      var ReferenceType := References[1].Split(['/'], TStringSplitOptions.ExcludeEmpty);

      for var A := 0 to High(ReferenceType) div 2 do
      begin
        ReferenceName := ReferenceType[A];
        var TypeName := ReferenceType[Succ(A)];

        if ReferenceName = 'properties' then
          Result := FindPropertyValue(CurrentModule, TypeName)
        else if (ReferenceName = '$defs') or (ReferenceName = 'definitions') then
          Result := FindTypeDefinition(CurrentModule, TypeName);

        if Result.IsClassDefinition then
          CurrentModule := Result.AsClassDefinition
      end;

      if ReferenceName.IsEmpty then
        Result := CurrentModule
      else if not Assigned(Result) then
        Result := CurrentModule.ParentUnit.MainModule.AddDelayedType(ReferenceName);
    end;
  end
  else if Schema.&Object.IsDynamicRefStored then
    Result := Module.ParentUnit.MainModule
  else
    Result := nil;
end;

procedure TJSONSchemaLoader.GenerateDefinitions(const Module: TTypeModuleDefinition; const Schema: TSchema);
begin
  for var Definition in Schema.&Object.Defs.JSONSchema do
  begin
    var TypeDefinition := CheckTypeDefinition(Module, Definition.Value, Definition.Key);

    if TypeDefinition.Name <> Definition.Key then
      Module.AddTypeAlias(FImporter.CreateTypeAlias(Module, Definition.Key, TypeDefinition));
  end;
end;

procedure TJSONSchemaLoader.GenerateProperties(const ClassDefinition: TTypeClassDefinition; const Schema: TSchema);
const
  ANONYMOUS_PROPERTY_NAME = 'Anonymous';
  PATTERN_PROPERTY_NAME = 'PatternProperty';

  function CheckUniqueName(const PropertyName: String): String;
  begin
    var PropertyCount := 1;
    Result := PropertyName;

    for var ClassProperty in ClassDefinition.Properties do
      if SameText(ClassProperty.Name, PropertyName) then
        Inc(PropertyCount);

    if PropertyCount > 1 then
      Result := Result + PropertyCount.ToString;
  end;

  function GetPropertyName(const Schema: TSchema; const DefaultName: String): String;
  begin
    if IsReference(Schema) then
    begin
      var PropertyTypeReference := FindTypeReference(ClassDefinition, Schema);

      if PropertyTypeReference.IsDelayedType then
        Result := PropertyTypeReference.AsDelayedType.UnresolvedType
      else
        Result := PropertyTypeReference.Name;
    end
    else if Schema.&Object.IsTypeStored and Schema.&Object.&Type.IsSimpleTypesStored then
      Result := TRttiEnumerationType.GetName(Schema.&Object.&type.SimpleTypes)
    else if Schema.&Object.IsPatternPropertiesStored then
      Result := PATTERN_PROPERTY_NAME
    else
      Result := CheckUniqueName(DefaultName);
  end;

  procedure DefinePropertyCheckingType(const PropertyName: String; const PropertySchema: TSchema);
  begin
    var PropertyType := CheckTypeDefinition(ClassDefinition, PropertySchema, FormatName(PropertyName) + 'Property');

    if not PropertyType.IsUnitDefinition then
      DefineProperty(ClassDefinition, Schema, PropertyName, PropertyType);
  end;

  function ConditionalSchemas: TArray<TSchema>;
  begin
    Result := nil;

    if IsConditionalSchema(Schema) then
    begin
      if Schema.&Object.IsThenStored then
        Result := Result + [Schema.&Object.&Then];

      if Schema.&Object.IsElseStored then
        Result := Result + [Schema.&Object.&Else];
    end;
  end;

var
  PropertyName: String;

begin
  if Schema.&Object.IsPropertiesStored then
    for var Pair in Schema.&Object.Properties.JSONSchema do
      DefinePropertyCheckingType(Pair.Key, Pair.Value);

  for var AnonymousSchema in Schema.&Object.allOf + Schema.&Object.oneOf + Schema.&Object.anyOf + ConditionalSchemas do
    if AnonymousSchema.&Object.IsRefStored or AnonymousSchema.&Object.IsTypeStored then
      DefinePropertyCheckingType(GetPropertyName(AnonymousSchema, ANONYMOUS_PROPERTY_NAME), AnonymousSchema)
    else
      GenerateProperties(ClassDefinition, AnonymousSchema);

  if Schema.&Object.IsPatternPropertiesStored then
    for var PatternPropertySchema in Schema.&Object.patternProperties.JSONSchema do
    begin
      PropertyName := GetPropertyName(PatternPropertySchema.Value, 'PatternProperty');

      var PatternProperty := DefineProperty(ClassDefinition, PatternPropertySchema.Value, PropertyName, CreateDynamicPropertyType(ClassDefinition, CheckTypeDefinition(ClassDefinition, PatternPropertySchema.Value, FormatName(PropertyName))));

      PatternProperty.AddAtribute('%s(''%s'')', [PATTERN_PROPERTY_NAME, PatternPropertySchema.Key]);
    end;

  if Schema.&Object.IsAdditionalPropertiesStored and not Schema.&Object.additionalProperties.IsBooleanStored then
  begin
    PropertyName := 'additionalProperties';

    DefineProperty(ClassDefinition, Schema.&Object.additionalProperties, PropertyName, CreateDynamicPropertyType(ClassDefinition, CheckTypeDefinition(ClassDefinition, Schema.&Object.additionalProperties, PropertyName + 'Type')));
  end;
end;

procedure TJSONSchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  var CurrentSchema := LoadSchema(UnitFileConfiguration);

  CheckTypeDefinition(MainModule, CurrentSchema, MainModule.Name);
end;

function TJSONSchemaLoader.IsConditionalSchema(const Schema: TSchema): Boolean;
begin
  Result := Schema.&Object.IsIfStored or Schema.&Object.IsThenStored or Schema.&Object.IsElseStored;
end;

function TJSONSchemaLoader.IsReference(const Schema: TSchema): Boolean;
begin
  Result := Schema.IsObjectStored and (Schema.&Object.IsRefStored or Schema.&Object.IsDynamicRefStored);
end;

function TJSONSchemaLoader.LoadSchema(const UnitFileConfiguration: TUnitFileConfiguration): TSchema;
begin
  if not FSchemas.TryGetValue(UnitFileConfiguration.FileName, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFileFromConfiguration(UnitFileConfiguration), TypeInfo(TSchema)).AsType<TSchema>;

    FSchemas.Add(UnitFileConfiguration.FileName, Result);
  end;
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

{ TTypeModuleDefinition }

function TTypeModuleDefinition.AddDelayedType(const TypeName: String): TTypeDelayedDefinition;
begin
  Result := TTypeDelayedDefinition.Create(TypeName, Self);

  DelayedTypes.Add(Result);
end;

procedure TTypeModuleDefinition.AddTypeAlias(const AType: TTypeAlias);
begin
  TypeAlias.Add(AType);
end;

constructor TTypeModuleDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited;

  FClasses := TObjectList<TTypeClassDefinition>.Create;
  FDelayedTypes := TObjectList<TTypeDelayedDefinition>.Create;
  FEnumerations := TObjectList<TTypeEnumeration>.Create;
  FInterfaces := TObjectList<TTypeInterfaceDefinition>.Create;
  FTypeAlias := TList<TTypeAlias>.Create;
end;

destructor TTypeModuleDefinition.Destroy;
begin
  FTypeAlias.Free;

  FClasses.Free;

  FDelayedTypes.Free;

  FEnumerations.Free;

  FInterfaces.Free;

  inherited;
end;

{ TTypeArrayDefinition }

constructor TTypeArrayDefinition.Create(const Module: TTypeModuleDefinition; const ArrayType: TTypeDefinition);
begin
  inherited Create(Module);

  FArrayType := ArrayType;
  FName := Format('TArray<%s>', [ArrayType.Name]);
end;

{ TTypeUnitDefinitionConfiguration }

destructor TTypeUnitDefinitionConfiguration.Destroy;
begin
  for var UnitFile in Files do
    UnitFile.Free;

  inherited;
end;

{ TTypeDynamicPropertyDefinition }

constructor TTypeDynamicPropertyDefinition.Create(const Module: TTypeModuleDefinition; const ValueType: TTypeDefinition);
begin
  inherited Create(Module);

  FName := 'DynamicProperty';
  FValueType := ValueType;
end;

{ TTypeInterfaceDefinition }

constructor TTypeInterfaceDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited;

  FMethods := TObjectList<TTypeMethodDefinition>.Create;
end;

destructor TTypeInterfaceDefinition.Destroy;
begin
  FMethods.Free;

  inherited;
end;

{ TTypeMethodDefinition }

procedure TTypeMethodDefinition.AddDeleteAttribute;
begin
  AddAtribute('Delete');
end;

procedure TTypeMethodDefinition.AddGetAttribute;
begin
  AddAtribute('Get');
end;

procedure TTypeMethodDefinition.AddOptionsAttribute;
begin
  AddAtribute('Options');
end;

function TTypeMethodDefinition.AddParameter: TTypeParameterDefinition;
begin
  Result := TTypeParameterDefinition.Create(ParentModule);

  Parameters.Add(Result);
end;

procedure TTypeMethodDefinition.AddPatchAttribute;
begin
  AddAtribute('Patch');
end;

procedure TTypeMethodDefinition.AddPostAttribute;
begin
  AddAtribute('Post');
end;

procedure TTypeMethodDefinition.AddPutAttribute;
begin
  AddAtribute('Put');
end;

constructor TTypeMethodDefinition.Create(const ParentModule: TTypeModuleDefinition);
begin
  inherited;

  FParameters := TList<TTypeParameterDefinition>.Create;
end;

destructor TTypeMethodDefinition.Destroy;
begin
  FParameters.Free;

  inherited;
end;

{ TWSDLSchemaLoader }

constructor TWSDLSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited;

  FImporter := Importer;
end;

procedure TWSDLSchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  IsRPCCall: Boolean;
  Operation: IBindingOperation;
  Port: IPort;
  ServiceInterface: TTypeInterfaceDefinition;
  ServiceMethod: TTypeMethodDefinition;
  SchemaLoader: TXSDSchemaLoader;
  SOAPNamespace: String;
  XMLNameSpaceAttribute: String;
  WSDLDocument: IWSDLDocument;

  function FindBinding(const Name: String): IBinding;
  begin
    for var A := 0 to Pred(WSDLDocument.Definition.Bindings.Count) do
    begin
      var Binding := WSDLDocument.Definition.Bindings[A];

      if CompareNames(Binding.Name, ExtractLocalName(Name)) then
        Exit(Binding);
    end;
  end;

  function FindMessage(const Name: String): IMessage;
  begin
    for var A := 0 to Pred(WSDLDocument.Definition.Messages.Count) do
    begin
      var Message := WSDLDocument.Definition.Messages[A];

      if CompareNames(Message.Name, Name) then
        Exit(Message);
    end;
  end;

  function FindPortType(const Name: String): IPortType;
  begin
    for var A := 0 to Pred(WSDLDocument.Definition.PortTypes.Count) do
    begin
      var PortType := WSDLDocument.Definition.PortTypes[A];

      if CompareNames(PortType.Name, Name) then
        Exit(PortType);
    end;
  end;

  function FindOperationInPortType(const Name: String; const PortType: IPortType): IOperation;
  begin
    for var A := 0 to Pred(PortType.Operations.Count) do
    begin
      var Operation := PortType.Operations[A];

      if CompareNames(Operation.Name, Name) then
        Exit(Operation);
    end;
  end;

  function CheckPartType(const Part: IPart): TTypeDefinition;
  begin
    var PartTypeName := SchemaLoader.GetNameWithNamespace(Part, Part.Type_ + Part.Element);
    Result := SchemaLoader.FindType(PartTypeName, MainModule);

    if Assigned(Result) and not Part.Element.IsEmpty then
      for var PropertyDefinition in Result.ParentModule.AsClassDefinition.Properties do
        if PropertyDefinition.Name = PartTypeName then
          Result := PropertyDefinition.PropertyType;

    if not Assigned(Result) then
      Result := MainModule.AddDelayedType(PartTypeName);
  end;

  function AddParameter(const Name: String; const &Type: TTypeDefinition): TTypeParameterDefinition;
  begin
    Result := ServiceMethod.AddParameter;
    Result.Name := Name;
    Result.ParameterType := &Type;

    if not IsRPCCall then
      Result.AddNamespaceAttribute(XMLNameSpaceAttribute);
  end;

  function AddBodyParameter(const Name: String; const &Type: TTypeDefinition): TTypeParameterDefinition;
  begin
    Result := AddParameter(Name, &Type);

    Result.AddAtribute('Body');
  end;

  function AddHeaderParameter(const Name: String; const &Type: TTypeDefinition): TTypeParameterDefinition;
  begin
    Result := AddParameter(Name, &Type);

    Result.AddAtribute('SOAPHeader');
  end;

  procedure CreateParameters(const Parameter: IParam);
  var
    Message: IMessage;

  begin
    if Assigned(Parameter) then
    begin
      Message := FindMessage(Parameter.Message);

      for var A := 0 to Pred(Message.Parts.Count) do
      begin
        var Part := Message.Parts[A];
        var ParameterName := Part.Name;

        if not Part.Element.IsEmpty then
          ParameterName := ExtractLocalName(Part.Element);

        AddBodyParameter(ParameterName, CheckPartType(Part));
      end;
    end;
  end;

  function CheckMessageType(const Message: IMessage): TTypeDefinition;
  var
    Part: IPart;

  begin
    Result := nil;

    for var A := 0 to Pred(Message.Parts.Count) do
    begin
      Part := Message.Parts[A];

      Result := CheckPartType(Part);
    end;
  end;

  function FindSOAPNode(const ParentNode: IXMLNode; const Name: String): IXMLNode;
  begin
    Result := ParentNode.ChildNodes.FindNode(Name, SOAPNamespace);
  end;

  procedure CheckHeaderParameter(const Operation: IBindingOperation);
  begin
    var Header := FindSOAPNode(Operation.Input, SHeader);

    if Assigned(Header) then
    begin
      var MessageType := CheckMessageType(FindMessage(Header.Attributes['message']));
      var ParameterName := Operation.Input.Name;

      if ParameterName.IsEmpty then
        ParameterName := MessageType.Name;

      AddHeaderParameter(ParameterName, MessageType);
    end;
  end;

  function LoadReturnType(const Operation: IOperation): TTypeDefinition;
  var
    Message: IMessage;

    function HasReturnPart: Boolean;
    begin
      for var A := 0 to Pred(Message.Parts.Count) do
        if Message.Parts[A].Name = 'return' then
          Exit(True);

      Result := False;
    end;

  begin
    Message := FindMessage(Operation.Output.Message);

    if IsRPCCall and not HasReturnPart then
    begin
      var ClassDefinition := Importer.CreateClassDefinition(MainModule, Operation.Name);

      for var A := 0 to Pred(Message.Parts.Count) do
      begin
        var Part := Message.Parts[A];
        var PropertyDefinition := ClassDefinition.AddProperty(Part.Name);
        PropertyDefinition.PropertyType := CheckPartType(Part);
      end;

      Result := ClassDefinition;
    end
    else
      Result := CheckMessageType(Message);
  end;

  function FindSOAPOperation: IXMLNode;
  begin
    Result := FindSOAPNode(Operation, SOperation);
  end;

  function FindServiceAddress: IXMLNode;
  begin
    Result := FindSOAPNode(Port, SAddress);
  end;

begin
  SchemaLoader := TXSDSchemaLoader.Create(FImporter);
  WSDLDocument := NewWSDLDoc;

  WSDLDocument.LoadFromXML(FImporter.LoadFileFromConfiguration(UnitFileConfiguration));

  for var A := 0 to Pred(WSDLDocument.Definition.Types.SchemaDefs.Count) do
  begin
    var Schema := WSDLDocument.Definition.Types.SchemaDefs[A];

    SchemaLoader.GenerateClassDefinitionFromSchema(MainModule, Schema);
  end;

  if WSDLDocument.DocumentElement.HasAttribute(SXMLNS + NSDelim + 'soap12') then
    SOAPNamespace := Soap12ns
  else
    SOAPNamespace := Soapns;

  for var A := 0 to Pred(WSDLDocument.Definition.Services.Count) do
  begin
    var Service := WSDLDocument.Definition.Services[A];
    ServiceInterface := FImporter.CreateInterfaceDefinition(MainModule.ParentUnit, Service.Name);

    ServiceInterface.AddAtribute('SOAPService');

    for var B := 0 to Pred(Service.Ports.Count) do
    begin
      Port := Service.Ports[B];

      var Binding := FindBinding(Port.Binding);
      var PortType := FindPortType(Binding.Type_);

      var ServiceAddress := FindServiceAddress;

      if Assigned(ServiceAddress) then
        ServiceInterface.DefaultURL := ServiceAddress.Attributes[SLocation];

      for var C := 0 to Pred(Binding.BindingOperations.Count) do
      begin
        Operation := Binding.BindingOperations[C];
        var PortTypeOperation := FindOperationInPortType(Operation.Name, PortType);
        var SOAPOperation := FindSOAPOperation;

        if Assigned(SOAPOperation) then
        begin
          var SOAPStyle := SOAPOperation.AttributeNodes.FindNode(SStyle);

          IsRPCCall := Assigned(SOAPStyle) and SameText(SOAPStyle.Text, 'rpc');

          ServiceMethod := TTypeMethodDefinition.Create(MainModule);
          ServiceMethod.Name := Operation.Name;
          ServiceMethod.Return := LoadReturnType(PortTypeOperation);
          var SOAPAction := SOAPOperation.AttributeNodes.FindNode(SSoapAction);
          XMLNameSpaceAttribute := WSDLDocument.Definition.TargetNameSpace;

          if IsRPCCall then
          begin
            ServiceMethod.Attributes.Add('SOAP_RPC');
            ServiceMethod.AddNamespaceAttribute(XMLNameSpaceAttribute);
          end;

          if SOAPOperation.NamespaceURI = Soapns then
            ServiceMethod.AddAtribute('Header(''SOAPAction'', ''%s'')', [SOAPAction.Text])
          else
            ServiceMethod.AddAtribute('SOAPAction(''%s'')', [SOAPAction.Text]);

          ServiceInterface.Methods.Add(ServiceMethod);

          CheckHeaderParameter(Operation);

          CreateParameters(PortTypeOperation.Input);
        end;
      end;
    end;
  end;
end;

{ TUnitFileConfiguration }

procedure TUnitFileConfiguration.SetFileType(const Value: TSchemaType);
begin
  FFileType := Value;
  FIsFileTypeStored := True;
end;

{ TTypeCommonDefinition }

procedure TTypeCommonDefinition.AddAtribute(const Attribute: String);
begin
  Attributes.Add(Attribute);
end;

procedure TTypeCommonDefinition.AddAtribute(const Attribute: String; const Params: array of const);
begin
  AddAtribute(Format(Attribute, Params));
end;

procedure TTypeCommonDefinition.AddFlatAttribute(const EnumeratorPropertyName: String);
begin
  var Parameter := EmptyStr;

  if not EnumeratorPropertyName.IsEmpty then
    Parameter := Format('(''%s'')', [EnumeratorPropertyName]);

  AddAtribute(Format('Flat%s', [Parameter]));
end;

procedure TTypeCommonDefinition.AddFlatAttribute;
begin
  AddFlatAttribute(EmptyStr);
end;

procedure TTypeCommonDefinition.AddNamespaceAttribute(const Namespace: String);
begin
  if not Namespace.IsEmpty then
    AddAtribute(FormatNamespaceAttribute(Namespace));
end;

constructor TTypeCommonDefinition.Create;
begin
  inherited Create;

  FAttributes := TList<String>.Create;
  FParentAttributes := TList<String>.Create;
  FParentModule := ParentModule;
end;

destructor TTypeCommonDefinition.Destroy;
begin
  FAttributes.Free;

  FParentAttributes.Free;

  inherited;
end;

function TTypeCommonDefinition.FormatNamespaceAttribute(const Namespace: String): String;
begin
  Result := Format('XMLNamespace(''%s'')', [Namespace]);
end;

function TTypeCommonDefinition.GetIsClassDefinition: Boolean;
begin
  Result := Self is TTypeClassDefinition;
end;

{ TXMLSchemaLoader }

procedure TXMLSchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin

end;

{ TSchemaLoader }

constructor TSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
end;

{ TPropertyDefinitionConfiguration }

procedure TPropertyDefinitionConfiguration.SetOptional(const Value: Boolean);
begin
  FOptional := Value;
  FOptionalStored := True;
end;

end.

