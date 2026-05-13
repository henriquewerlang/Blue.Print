unit Blue.Print.Schema.Importer;

interface

{$SCOPEDENUMS ON}

uses System.Generics.Collections, System.SysUtils, Xml.XMLSchema, Blue.Print.JSON.Schema, Blue.Print.Types;

type
  TClassDefinition = class;
  TSchemaImporter = class;
  TTypeAlias = class;
  TTypeArrayDefinition = class;
  TTypeDefinition = class;
  TTypeDelayedDefinition = class;
  TTypeDynamicPropertyDefinition = class;
  TTypeEnumeration = class;
  TTypeExternal = class;
  TTypeInterfaceDefinition = class;
  TTypeModuleDefinition = class;
  TUnitDefinition = class;

  TImplementationInformation = (NeedDestructor, NeedGetFunction, NeedSetProcedure, NeedAddFunction, NeedIsStoredFunction, NeedIsStoredField);
  TImplementationInformations = set of TImplementationInformation;
  TSchemaType = (XSD, JSON, OpenAPI20, OpenAPI30, OpenAPI31, WSDL, SOAP10);

  TUnitFileConfiguration = class
  private
    FAppendClassName: String;
    FReference: String;
    FUnitClassName: String;
    FFileType: TSchemaType;
    FIsFileTypeStored: Boolean;
    FInterfaceName: String;
    FBaseURL: String;

    procedure SetFileType(const Value: TSchemaType);
  public
    property AppendClassName: String read FAppendClassName write FAppendClassName;
    property BaseURL: String read FBaseURL write FBaseURL;
    property FileType: TSchemaType read FFileType write SetFileType stored FIsFileTypeStored;
    property InterfaceName: String read FInterfaceName write FInterfaceName;
    property IsFileTypeStored: Boolean read FIsFileTypeStored write FIsFileTypeStored;
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
    FChangeProperType: String;
  public
    property Name: String read FName write FName;
    property AppendProperty: TArray<TAppendPropertyConfiguration> read FAppendProperty write FAppendProperty;
    property Attribute: String read FAttribute write FAttribute;
    property ChangeName: String read FChangeName write FChangeName;
    property ChangeProperType: String read FChangeProperType write FChangeProperType;
    property ChangeType: String read FChangeType write FChangeType;
    property FlatEnumerator: String read FFlatEnumerator write FFlatEnumerator;
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
    FImports: TArray<String>;
  public
    constructor Create;

    destructor Destroy; override;

    property Imports: TArray<String> read FImports write FImports;
    property MaxColumnSize: Integer read FMaxColumnSize write FMaxColumnSize;
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeDefinition: TArray<TTypeDefinitionConfiguration> read FTypeDefinition write FTypeDefinition;
    property UnitConfiguration: TArray<TUnitDefinitionConfiguration> read FUnitConfiguration write FUnitConfiguration;
  end;

  TTypeCommonDefinition = class
  private
    FAttributes: TList<String>;
    FParentAttributes: TList<String>;

    function GetIsClassDefinition: Boolean;
  public
    constructor Create;

    destructor Destroy; override;

    function FormatNamespaceAttribute(const Namespace: String): String;

    procedure AddAtribute(const Attribute: String); overload;
    procedure AddAtribute(const Attribute: String; const Params: array of const); overload;
    procedure AddNamespaceAttribute(const Namespace: String);

    property Attributes: TList<String> read FAttributes;
    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property ParentAttributes: TList<String> read FParentAttributes;
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
    FParentModule: TTypeModuleDefinition;

    function GetAsArrayType: TTypeArrayDefinition;
    function GetAsClassDefinition: TClassDefinition;
    function GetAsDelayedType: TTypeDelayedDefinition;
    function GetAsDynamicPropertyType: TTypeDynamicPropertyDefinition;
    function GetAsInterfaceType: TTypeInterfaceDefinition;
    function GetAsTypeAlias: TTypeAlias;
    function GetAsTypeEnumeration: TTypeEnumeration;
    function GetAsTypeExternal: TTypeExternal;
    function GetAsUnitDefinition: TUnitDefinition;
    function GetIsArrayType: Boolean;
    function GetIsDelayedType: Boolean;
    function GetIsDynamicPropertyType: Boolean;
    function GetIsEnumeration: Boolean;
    function GetIsExternal: Boolean;
    function GetIsInterfaceType: Boolean;
    function GetIsTypeAlias: Boolean;
    function GetIsUnitDefinition: Boolean;
    function GetParentUnit: TUnitDefinition;
  public
    constructor Create(const ParentModule: TTypeModuleDefinition);

    property AsArrayType: TTypeArrayDefinition read GetAsArrayType;
    property AsClassDefinition: TClassDefinition read GetAsClassDefinition;
    property AsInterfaceType: TTypeInterfaceDefinition read GetAsInterfaceType;
    property AsDelayedType: TTypeDelayedDefinition read GetAsDelayedType;
    property AsDynamicPropertyType: TTypeDynamicPropertyDefinition read GetAsDynamicPropertyType;
    property AsTypeAlias: TTypeAlias read GetAsTypeAlias;
    property AsTypeEnumeration: TTypeEnumeration read GetAsTypeEnumeration;
    property AsTypeExternal: TTypeExternal read GetAsTypeExternal;
    property AsUnitDefinition: TUnitDefinition read GetAsUnitDefinition;
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
    property ParentModule: TTypeModuleDefinition read FParentModule;
    property ParentUnit: TUnitDefinition read GetParentUnit;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FClasses: TList<TClassDefinition>;
    FDelayedTypes: TList<TTypeDelayedDefinition>;
    FEnumerations: TList<TTypeEnumeration>;
    FInterfaces: TList<TTypeInterfaceDefinition>;
  public
    constructor Create(const Module: TTypeModuleDefinition);

    destructor Destroy; override;

    function AddDelayedType(const TypeName: String): TTypeDelayedDefinition;

    property Classes: TList<TClassDefinition> read FClasses;
    property DelayedTypes: TList<TTypeDelayedDefinition> read FDelayedTypes;
    property Enumerations: TList<TTypeEnumeration> read FEnumerations write FEnumerations;
    property Interfaces: TList<TTypeInterfaceDefinition> read FInterfaces write FInterfaces;
  end;

  TClassDefinition = class(TTypeModuleDefinition)
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
    procedure AddFlatAttribute; overload;
    procedure AddFlatAttribute(const EnumeratorPropertyName: String); overload;

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
    constructor Create;

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

  TTypeDynamicPropertyDefinition = class(TTypeDefinition)
  private
    FValueType: TTypeDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition; const ValueType: TTypeDefinition);

    property ValueType: TTypeDefinition read FValueType write FValueType;
  end;

  TUnitDefinition = class(TTypeModuleDefinition)
  private
    FUses: TList<TUnitDefinition>;
    FTypeAlias: TList<TTypeAlias>;
    FUnitConfiguration: TUnitDefinitionConfiguration;
    FMainType: TTypeDefinition;
  public
    constructor Create; reintroduce;

    destructor Destroy; override;

    procedure AddTypeAlias(const AType: TTypeAlias);
    procedure AddUses(const SchemaUnit: TUnitDefinition);
    procedure GenerateFile(const Importer: TSchemaImporter);

    property MainType: TTypeDefinition read FMainType write FMainType;
    property TypeAlias: TList<TTypeAlias> read FTypeAlias;
    property UnitConfiguration: TUnitDefinitionConfiguration read FUnitConfiguration write FUnitConfiguration;
  end;

  ISchemaLoader = interface
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
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
    FObjectType: TTypeDefinition;
    FStringType: TTypeDefinition;
    FTimeType: TTypeDefinition;
    FTypeExternal: TDictionary<String, TTypeDefinition>;
    FUnits: TList<TUnitDefinition>;
    FUnitFiles: TDictionary<TUnitFileConfiguration, TUnitDefinition>;
    FWordType: TTypeDefinition;
    FTValueType: TTypeDefinition;

    function AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;
    function CreateSchemaLoader(const UnitFileConfiguration: TUnitFileConfiguration): ISchemaLoader;
    function CreateUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
    function CheckChangeTypeName(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindChangeTypeName(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindTypeDefinitionInModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
    function FindTypeInUnits(const Module: TTypeModuleDefinition; const TypeName: String): TTypeDefinition;
    function LoadUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
    function LoadUnitFromReference(const Reference: String): TUnitDefinition;

    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
    procedure LoadInternalTypes;
    procedure LoadUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create;

    destructor Destroy; override;

    function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
    function CreateInterfaceDefinition(const ParentUnit: TUnitDefinition; const InterfaceName: String): TTypeInterfaceDefinition;
    function CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindUnitByReference(const Reference: String): TUnitDefinition;
    function GetFileNameFromSchemaFolder(const FileName: String): String;
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
    property TimeType: TTypeDefinition read FTimeType;
    property TValueType: TTypeDefinition read FTValueType;
    property Units: TList<TUnitDefinition> read FUnits;
    property WordType: TTypeDefinition read FWordType;
  end;

  TXSDSchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FXMLBuildInType: TDictionary<String, TTypeDefinition>;

    function AddProperty(const ClassDefinition: TClassDefinition; const Name: String; const &Type: IXMLTypeDef): TPropertyDefinition;
    function CheckClassDefinition(const ParentModule: TTypeModuleDefinition; const ComplexType: IXMLComplexTypeDef): TTypeDefinition;
    function CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
    function GetAttributeDataType(const Attribute: IXMLAttributeDef): IXMLTypeDef;
    function GetElementDataType(const Element: IXMLElementDef): IXMLTypeDef;
    function FindBaseType(const TypeDefinition: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ComplexType: IXMLComplexTypeDef): TTypeDefinition;
    function GenerateClassDefinitionFromSchema(const UnitFileConfiguration: TUnitFileConfiguration; const ParentModule: TTypeModuleDefinition; const SchemaDefinition: IXMLSchemaDef): TClassDefinition;
    function GenerateProperty(const ClassDefinition: TClassDefinition; const ElementDefinition: IXMLElementDef): TPropertyDefinition;
    function IsElementOptional(const ElementDefinition: IXMLElementDef): Boolean;

    procedure AddPropertyAttribute(const &Property: TPropertyDefinition; const Attribute: IXMLAttributeDef);
    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const ElementDefs: IXMLElementDefList);
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadXSDTypes;
  public
    constructor Create(const Importer: TSchemaImporter);

    destructor Destroy; override;
  end;

  TWSDLSchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;

    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter);
  end;

  TJSONSchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FSchemas: TDictionary<String, TSchema>;

    function CheckTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
    function CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const ValueType: TTypeDefinition): TTypeDynamicPropertyDefinition;
    function CreateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
    function DefineProperty(const ClassDefinition: TClassDefinition; const Schema: TSchema; const PropertyName: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
    function FindAllTypes(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function FindTypeReference(const Module: TTypeModuleDefinition; const Schema: TSchema): TTypeDefinition;
    function GetReferenceName(const Schema: TSchema): String;
    function IsConditionalSchema(const Schema: TSchema): Boolean;
    function IsReference(const Schema: TSchema): Boolean;
    function LoadSchema(const UnitFileConfiguration: TUnitFileConfiguration): TSchema;

    procedure GenerateDefinitions(const Module: TTypeModuleDefinition; const Schema: TSchema);
    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
  public
    constructor Create(const Importer: TSchemaImporter);

    destructor Destroy; override;
  end;

function OnlyValidChars(const Value: String): String;

implementation

uses System.Classes, System.IOUtils, System.Variants, System.Net.HttpClient, System.Rtti, System.Generics.Defaults, Xml.XMLIntf, XML.XMLDom, Xml.XMLSchemaTags, Soap.WSDLBind, Soap.WSDLIntf, System.Hash, Blue.Print.Serializer,
  Blue.Print.Schema.Importer.Open.API.v20, Blue.Print.Schema.Importer.Open.API.v30, Blue.Print.Schema.Importer.Open.API.v31;

const
  DEFAULT_SCHEMA_CLASS_NAME = 'Schema';
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

function SameCase(const Value: String): String;
begin
  Result := Value;
end;

function OnlyValidChars(const Value: String): String;
begin
  var CharCase: TCaseFunction := SameCase;
  Result := EmptyStr;

  for var Char in Value do
    if CharInSet(Char, ['0'..'9', 'a'..'z', 'A'..'Z', '_']) then
    begin
      Result := Result + CharCase(Char);
      CharCase := SameCase;
    end
    else
      CharCase := UpperCase;
end;

function GetTypePrefixName(const Name: String): String;
begin
  Result := 'T' + OnlyValidChars(Name);
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
      Result := Result + CheckReservedName(OnlyValidChars(Split));

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

function TSchemaImporter.AddTypeExternal(const ModuleName, TypeName: String): TTypeExternal;
begin
  Result := TTypeExternal.Create(ModuleName, TypeName);

  FTypeExternal.Add(TypeName, Result);
end;

function TSchemaImporter.CheckChangeTypeName(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := nil;

  for var TypeDefinitionConfig in Configuration.TypeDefinition do
    if (TypeDefinitionConfig.Name = TypeName) and not TypeDefinitionConfig.ChangeType.IsEmpty then
    begin
      var TypeToChange := FindChangeTypeName(TypeName, Module);

      if not Assigned(TypeToChange) then
        TypeToChange := Module.AddDelayedType(TypeDefinitionConfig.ChangeType);

      if Module.IsUnitDefinition then
      begin
        Result := CreateTypeAlias(Module.AsUnitDefinition, TypeName, TypeToChange);

        Module.AsUnitDefinition.AddTypeAlias(Result.AsTypeAlias);
      end
      else
        Result := TypeToChange;
    end;
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create(TIStringComparer.Ordinal);
  FTypeExternal := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues], TIStringComparer.Ordinal);
  FUnits := TObjectList<TUnitDefinition>.Create;
  FUnitFiles := TDictionary<TUnitFileConfiguration, TUnitDefinition>.Create;

  LoadInternalTypes;
end;

function TSchemaImporter.CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
begin
  Result := TClassDefinition.Create(ParentModule);
  Result.Name := ClassTypeName;

  ParentModule.Classes.Add(Result);
end;

function TSchemaImporter.CreateInterfaceDefinition(const ParentUnit: TUnitDefinition; const InterfaceName: String): TTypeInterfaceDefinition;
begin
  Result := TTypeInterfaceDefinition.Create(ParentUnit);
  Result.Name := InterfaceName;

  ParentUnit.Interfaces.Add(Result);
end;

function TSchemaImporter.CreateSchemaLoader(const UnitFileConfiguration: TUnitFileConfiguration): ISchemaLoader;
const
  FILE_SCHEMA_EXTENSION: array[TSchemaType] of String = ('xsd', 'json', 'oas2', 'oas3', 'oas31', 'wsdl', 'wsdl');

  function GetFileType: TSchemaType;
  begin
    var FileExtension := TPath.GetExtension(UnitFileConfiguration.Reference);

    for var SchemaExtension := Low(TSchemaType) to High(TSchemaType) do
      if FileExtension = '.' + FILE_SCHEMA_EXTENSION[SchemaExtension] then
        Exit(SchemaExtension);

    raise Exception.Create('Unable to define the file type schema!');
  end;

begin
  var FileType := UnitFileConfiguration.FileType;

  if not UnitFileConfiguration.IsFileTypeStored then
    FileType := GetFileType;

  case FileType of
    TSchemaType.XSD: Result := TXSDSchemaLoader.Create(Self);
    TSchemaType.JSON: Result := TJSONSchemaLoader.Create(Self);
    TSchemaType.OpenAPI20: Result := TOpenAPI20SchemaLoader.Create(Self);
    TSchemaType.OpenAPI30: Result := TOpenAPI30SchemaLoader.Create(Self);
    TSchemaType.OpenAPI31: Result := TOpenAPI31SchemaLoader.Create(Self);
    TSchemaType.WSDL, TSchemaType.SOAP10: Result := TWSDLSchemaLoader.Create(Self);
    else Abort;
  end;
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
  Result.Name := UnitConfiguration.Name;
  Result.UnitConfiguration := UnitConfiguration;

  Units.Add(Result);
end;

destructor TSchemaImporter.Destroy;
begin
  FTypeExternal.Free;

  FBuildInType.Free;

  FUnits.Free;

  FUnitFiles.Free;

  inherited;
end;

function TSchemaImporter.FindChangeTypeName(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := nil;

  for var TypeDefinitionConfig in Configuration.TypeDefinition do
    if (TypeDefinitionConfig.Name = TypeName) and not TypeDefinitionConfig.ChangeType.IsEmpty then
      Exit(FindType(TypeDefinitionConfig.ChangeType, Module));
end;

function TSchemaImporter.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := nil;

  if FTypeExternal.TryGetValue(TypeName, Result) then
    Exit;

  if BuildInType.TryGetValue(TypeName, Result) then
    Exit;

  if FindTypeDefinitionInModule(Module, TypeName, Result) or Module.IsClassDefinition and FindTypeDefinitionInModule(Module.ParentUnit, TypeName, Result) then
    Exit;

  if not Assigned(Result) then
    Result := FindTypeInUnits(nil, TypeName);

  if not Assigned(Result) then
    Result := CheckChangeTypeName(TypeName, Module);
end;

function TSchemaImporter.FindTypeDefinitionInModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
begin
  Result := False;

  for var ClassDefinition in Module.Classes do
  begin
    Result := AnsiSameText(ClassDefinition.Name, TypeName);

    if Result then
    begin
      TypeDefinition := ClassDefinition;

      Exit;
    end;
  end;

  for var Enumerator in Module.Enumerations do
  begin
    Result := AnsiSameText(Enumerator.Name, TypeName);

    if Result then
    begin
      TypeDefinition := Enumerator;

      Exit;
    end;
  end;

  if Module.IsUnitDefinition then
    for var TypeAlias in Module.AsUnitDefinition.TypeAlias do
    begin
      Result := AnsiSameText(TypeAlias.Name, TypeName);

      if Result then
      begin
        TypeDefinition := TypeAlias;

        Exit;
      end;
    end;
end;

function TSchemaImporter.FindTypeInUnits(const Module: TTypeModuleDefinition; const TypeName: String): TTypeDefinition;
begin
  var CurrentModule: TTypeModuleDefinition := Module;
  Result := nil;

  for var SplitTypeName in TypeName.Split(['.']) do
  begin
    if Assigned(CurrentModule) then
    begin
      if not FindTypeDefinitionInModule(CurrentModule, SplitTypeName, Result) then
        Break;
    end
    else if not Assigned(Result) then
      for var UnitDefinition in Units do
        if FindTypeDefinitionInModule(UnitDefinition, SplitTypeName, Result) then
          Break;

    if Assigned(Result) and Result.IsClassDefinition then
      CurrentModule := Result.AsClassDefinition
    else
      Break;
  end;
end;

function TSchemaImporter.FindUnitByReference(const Reference: String): TUnitDefinition;
begin
  for var UnitConfiguration in FUnitFiles do
    if UnitConfiguration.Key.Reference = Reference then
      Exit(UnitConfiguration.Value);

  raise Exception.CreateFmt('Unit reference not found %s.', [Reference]);
end;

procedure TSchemaImporter.GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
begin
  var UnitDefinition := LoadUnit(UnitConfiguration);

  for var UnitFile in UnitConfiguration.Files do
    LoadUnitFileDefinition(UnitDefinition, UnitFile);
end;

function TSchemaImporter.GetFileNameFromSchemaFolder(const FileName: String): String;
begin
  Result := TPath.GetFullPath(Configuration.SchemaFolder + '\' + FileName);
end;

procedure TSchemaImporter.Import;
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
    GenerateUnitDefinition(UnitConfiguration);

  for var TypeDefinitionConfig in Configuration.TypeDefinition do
  begin
    var TypeDefinition := FindTypeInUnits(nil, TypeDefinitionConfig.Name);

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
          ClassDefinition.AddProperty(AppendProperty.Name).PropertyType := FindTypeInUnits(nil, AppendProperty.&Type);
      end;

      if not TypeDefinitionConfig.ChangeProperType.IsEmpty then
      begin
        var PropertyDefinition := TypeDefinitionConfig.ChangeProperType.Split(['.']);

        for var PropertyToChange in TypeDefinition.AsClassDefinition.Properties do
          if PropertyToChange.Name = PropertyDefinition[0] then
          begin
            PropertyToChange.PropertyType := FindType(PropertyDefinition[1], nil);
          end;
      end;
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
  var ReferenceName := UnitFileConfiguration.Reference;

  if not UnitFileConfiguration.BaseURL.IsEmpty then
    ReferenceName := UnitFileConfiguration.BaseURL + '/' + ReferenceName;

  Result := LoadFile(ReferenceName);
end;

procedure TSchemaImporter.LoadInternalTypes;

  function AddTypeDefinition(const TypeDefinition: TTypeDefinition; const UnitName, TypeName: String): TTypeDefinition;
  begin
    Result := TypeDefinition;
    Result.Name := Format('%s.%s', [UnitName, TypeName]);

    BuildInType.Add(Result.Name, Result);

    BuildInType.Add(TypeName, CreateTypeAlias(nil, TypeName, Result));
  end;

  function AddType(const UnitName, TypeName: String): TTypeDefinition; overload;
  begin
    Result := AddTypeDefinition(TTypeDefinition.Create(nil), UnitName, TypeName);
  end;

  function AddType(const TypeName: String): TTypeDefinition; overload;
  begin
    Result := AddType('System', TypeName);
  end;

  function AddNumberType(const TypeName: String): TTypeDefinition;
  begin
    Result := AddType(TypeName);
    Result.FIsNumericType := True;
  end;

begin
  FBooleanType := AddTypeDefinition(TTypeEnumeration.Create(nil), 'System', 'Boolean');
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
  FTValueType := AddTypeDefinition(AddTypeExternal('System.Rtti', 'System.Rtti.TValue'), 'System.Rtti', 'TValue');
  FWordType := AddNumberType('Word');
end;

function TSchemaImporter.LoadRelativePath(const RelativeFolder, FileName: String): String;
begin
  Result := TPath.GetFullPath(TPath.GetDirectoryName(FileName) + '\' + RelativeFolder);
end;

function TSchemaImporter.LoadUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
begin
  for var &Unit in Units do
    if &Unit.UnitConfiguration = UnitConfiguration then
      Exit(&Unit);

  Result := CreateUnit(UnitConfiguration);
end;

procedure TSchemaImporter.LoadUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  if not FUnitFiles.ContainsKey(UnitFileConfiguration) then
  begin
    FUnitFiles.Add(UnitFileConfiguration, UnitDefinition);

    var Loader := CreateSchemaLoader(UnitFileConfiguration);

    Loader.GenerateUnitFileDefinition(UnitDefinition, UnitFileConfiguration);
  end;
end;

function TSchemaImporter.LoadUnitFromReference(const Reference: String): TUnitDefinition;
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
    for var UnitFileConfiguration in UnitConfiguration.Files do
      if UnitFileConfiguration.Reference = Reference then
      begin
        Result := LoadUnit(UnitConfiguration);

        LoadUnitFileDefinition(Result, UnitFileConfiguration);

        Exit;
      end;

  raise Exception.CreateFmt('Schema file without unit configuration %s!', [ExtractFileName(Reference)]);
end;

{ TXSDSchemaLoader }

procedure TXSDSchemaLoader.AddPropertyAttribute(const &Property: TPropertyDefinition; const Attribute: IXMLAttributeDef);
begin
  if Attribute.Fixed = NULL then
    &Property.AddXMLAttributeValue
  else
    &Property.AddXMLAttributeFixed(Attribute.Name, Attribute.Fixed);

  &Property.Optional := (Attribute.Use <> NULL) and (Attribute.Use = 'optional');
end;

function TXSDSchemaLoader.AddProperty(const ClassDefinition: TClassDefinition; const Name: String; const &Type: IXMLTypeDef): TPropertyDefinition;

  function CheckPropertyTypeDefinition: TTypeDefinition;
  begin
    Result := FindType(&Type.Name, ClassDefinition);

    if not Assigned(Result) then
      Result := CheckTypeDefinition(&Type, ClassDefinition);

    if not Assigned(Result) then
      Result := FindBaseType(&Type, ClassDefinition);

    if not Assigned(Result) then
      raise Exception.CreateFmt('Type %s not found for the property %s!', [&Type.Name, Name]);
  end;

begin
  Result := ClassDefinition.AddProperty(Name);
  Result.PropertyType := CheckPropertyTypeDefinition;
end;

constructor TXSDSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
  FXMLBuildInType := TDictionary<String, TTypeDefinition>.Create(TIStringComparer.Ordinal);

  LoadXSDTypes;
end;

destructor TXSDSchemaLoader.Destroy;
begin
  FXMLBuildInType.Free;

  inherited;
end;

function TXSDSchemaLoader.FindBaseType(const TypeDefinition: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  if Assigned(TypeDefinition.BaseType) then
  begin
    Result := FindType(TypeDefinition.BaseType.Name, Module);

    if not Assigned(Result) then
      Result := Module.AddDelayedType(TypeDefinition.BaseType.Name);
  end
  else
    Result := nil;
end;

function TXSDSchemaLoader.FindType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
var
  BuildInType: TTypeDefinition;

begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) and FXMLBuildInType.TryGetValue(ExtractLocalName(TypeName), BuildInType)  then
    Result := BuildInType;
end;

function TXSDSchemaLoader.CheckClassDefinition(const ParentModule: TTypeModuleDefinition; const ComplexType: IXMLComplexTypeDef): TTypeDefinition;
begin
  Result := FindType(ComplexType.Name, ParentModule);

  if not Assigned(Result) or not Result.IsClassDefinition then
    Result := GenerateClassDefinition(ParentModule, ComplexType);
end;

function TXSDSchemaLoader.CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
var
  SimpleType: IXMLSimpleTypeDef;

  function CreateEnumeration: TTypeEnumeration;
  var
    EnumValues: TStringList;

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
  end;

  function CheckRestriction: TTypeDefinition;
  begin
    if &Type.Enumerations.Count > 0 then
      Result := CreateEnumeration
    else
    begin
      Result := FindBaseType(&Type, Module);

      if not Assigned(Result) then
        Abort
      else if Module.IsUnitDefinition then
      begin
        Result := FImporter.CreateTypeAlias(Module.AsUnitDefinition, &Type.Name, Result);

        Module.AsUnitDefinition.AddTypeAlias(Result.AsTypeAlias);
      end;
    end;
  end;

  function CreateArray: TTypeAlias;
  begin
    Result := FImporter.CreateTypeAlias(Module, &Type.Name, TTypeArrayDefinition.Create(Module, FindType((SimpleType.ContentNode as IXMLSimpleTypeList).ItemType, Module)));

    Module.AsUnitDefinition.AddTypeAlias(Result);
  end;

begin
  Result := nil;

  if &Type.IsComplex then
    Result := CheckClassDefinition(Module, &Type as IXMLComplexTypeDef)
  else if Supports(&Type, IXMLSimpleTypeDef, SimpleType) then
    case SimpleType.DerivationMethod of
      sdmNone: ;
      sdmRestriction: Result := CheckRestriction;
      sdmList: Result := CreateArray;
      sdmUnion: Abort;
    end;
end;

function TXSDSchemaLoader.CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
begin
  Result := FindType(&Type.Name, UnitDefinition);

  if not Assigned(Result) then
    Result := CheckTypeDefinition(&Type, UnitDefinition);
end;

function TXSDSchemaLoader.GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ComplexType: IXMLComplexTypeDef): TTypeDefinition;
begin
  var ClassDefinition := FImporter.CreateClassDefinition(ParentModule, ComplexType.Name);
  Result := ClassDefinition;

  GenerateProperties(ClassDefinition, ComplexType.ElementDefList);

  for var A := 0 to Pred(ComplexType.AttributeDefs.Count) do
  begin
    var Attribute := ComplexType.AttributeDefs[A];
    var &Property := AddProperty(ClassDefinition, Attribute.Name, GetAttributeDataType(Attribute));

    AddPropertyAttribute(&Property, Attribute);
  end;

  if Assigned(ComplexType.BaseType) then
  begin
    var &Property := AddProperty(ClassDefinition, 'Value', ComplexType.BaseType);

    &Property.AddXMLValueAttribute;
  end;
end;

function TXSDSchemaLoader.GenerateClassDefinitionFromSchema(const UnitFileConfiguration: TUnitFileConfiguration; const ParentModule: TTypeModuleDefinition; const SchemaDefinition: IXMLSchemaDef): TClassDefinition;
begin
  Result := nil;

  if SchemaDefinition.ElementDefs.Count > 0 then
  begin
    if not UnitFileConfiguration.UnitClassName.IsEmpty then
      Result := FImporter.CreateClassDefinition(ParentModule, UnitFileConfiguration.UnitClassName)
    else if not UnitFileConfiguration.AppendClassName.IsEmpty then
    begin
      var ClassType := FImporter.FindTypeInUnits(ParentModule, UnitFileConfiguration.AppendClassName);

      if not Assigned(ClassType) then
        ClassType := FImporter.CreateClassDefinition(ParentModule, UnitFileConfiguration.AppendClassName);

      Result := ClassType.AsClassDefinition;
    end;

    for var A := 0 to Pred(SchemaDefinition.ElementDefs.Count) do
    begin
      if not Assigned(Result) then
        raise Exception.CreateFmt('The file %s must have a "UnitClassName" in the configuration!', [UnitFileConfiguration.Reference]);

      var &Property := GenerateProperty(Result, SchemaDefinition.ElementDefs[A]);
      &Property.Optional := &Property.Optional or not UnitFileConfiguration.AppendClassName.IsEmpty;

      if not SchemaDefinition.ElementDefs[A].HasAttribute('type') then
        &Property.PropertyType.AddNamespaceAttribute(VarToStr(SchemaDefinition.TargetNamespace));
    end;
  end;
end;

procedure TXSDSchemaLoader.GenerateProperties(const ClassDefinition: TClassDefinition; const ElementDefs: IXMLElementDefList);
begin
  for var A := 0 to Pred(ElementDefs.Count) do
    GenerateProperty(ClassDefinition, ElementDefs[A]);
end;

function TXSDSchemaLoader.GenerateProperty(const ClassDefinition: TClassDefinition; const ElementDefinition: IXMLElementDef): TPropertyDefinition;

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

  function CreateProperty(const TypeDefinition: IXMLTypeDef): TPropertyDefinition;
  begin
    Result := AddProperty(ClassDefinition, ElementDefinition.Name, TypeDefinition);
    Result.Optional := IsOptional(ElementDefinition);

    if ElementDefinition.IsRepeating then
      Result.PropertyType := TTypeArrayDefinition.Create(ClassDefinition, Result.PropertyType);
  end;

begin
  var ElementDataType := GetElementDataType(ElementDefinition);

  if ElementDataType.IsComplex then
  begin
    var ComplexType := ElementDataType as IXMLComplexTypeDef;

    if (ComplexType.ElementDefs.Count = 0) and (ComplexType.AttributeDefs.Count = 1) and ComplexType.AttributeDefs[0].HasAttribute(SFixed) then
    begin
      var Attribute := ComplexType.AttributeDefs[0];
      var PropertyType: IXMLTypeDef := nil;

      if Assigned(ComplexType.BaseType) then
        PropertyType := ComplexType.BaseType
      else
        PropertyType := GetAttributeDataType(Attribute);

      Result := CreateProperty(PropertyType);

      AddPropertyAttribute(Result, Attribute);
      Result.Optional := Result.Optional or IsElementOptional(ElementDefinition);
    end
    else
    begin
      CheckClassDefinition(ClassDefinition, ComplexType);

      Result := CreateProperty(ComplexType);
    end;
  end
  else
  begin
    Result := CreateProperty(ElementDataType);

    var FixedValue := ElementDefinition.AttributeNodes.FindNode(SFixed);

    if Assigned(FixedValue) then
      Result.FixedValue := VarToStr(FixedValue.NodeValue);
  end;
end;

procedure TXSDSchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);

  procedure ProcessReferences(const UnitDefinition: TUnitDefinition; const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      FImporter.LoadUnitFromReference(Reference.SchemaLocation);
    end;
  end;

  function LoadFile: IXMLSchemaDoc;
  begin
    if UnitFileConfiguration.Reference.StartsWith('http') then
      Result := LoadXMLSchemaStr(FImporter.LoadFileFromConfiguration(UnitFileConfiguration))
    else
      Result := LoadXMLSchema(FImporter.GetFileNameFromSchemaFolder(UnitFileConfiguration.Reference))
  end;

begin
  var Schema := LoadFile;

  ProcessReferences(UnitDefinition, Schema.SchemaDef.SchemaIncludes);

  ProcessReferences(UnitDefinition, Schema.SchemaDef.SchemaImports);

  for var A := 0 to Pred(Schema.SchemaDef.SimpleTypes.Count) do
    CheckUnitTypeDefinition(Schema.SchemaDef.SimpleTypes[A], UnitDefinition);

  for var A := 0 to Pred(Schema.SchemaDef.ComplexTypes.Count) do
    CheckUnitTypeDefinition(Schema.SchemaDef.ComplexTypes[A], UnitDefinition).AddNamespaceAttribute(VarToStr(Schema.SchemaDef.TargetNamespace));

  GenerateClassDefinitionFromSchema(UnitFileConfiguration, UnitDefinition, Schema.SchemaDef);
end;

function TXSDSchemaLoader.GetAttributeDataType(const Attribute: IXMLAttributeDef): IXMLTypeDef;
begin
  if Attribute.RefName.IsEmpty then
    Result := Attribute.DataType
  else if Assigned(Attribute.Ref) then
    Result := Attribute.Ref.DataType
  else
  begin
    var SchemaDefinition := Attribute.SchemaDef;

    while Assigned(SchemaDefinition) do
    begin
      var SchemaAttribute := SchemaDefinition.AttributeDefs.Find(Attribute.RefName);

      if Assigned(SchemaAttribute) then
        Exit(SchemaAttribute.DataType);

      SchemaDefinition := SchemaDefinition.NextSibling as IXMLSchemaDef;
    end;
  end;
end;

function TXSDSchemaLoader.GetElementDataType(const Element: IXMLElementDef): IXMLTypeDef;
begin
  if Element.RefName.IsEmpty then
    Result := Element.DataType
  else if Assigned(Element.Ref) then
    Result := Element.Ref.DataType
  else
  begin
    var SchemaDefinition := Element.SchemaDef;

    while Assigned(SchemaDefinition) do
    begin
      var SchemaElement := SchemaDefinition.ElementDefs.Find(Element.RefName);

      if Assigned(SchemaElement) then
        Exit(SchemaElement.DataType);

      SchemaDefinition := SchemaDefinition.NextSibling as IXMLSchemaDef;
    end;
  end;
end;

function TXSDSchemaLoader.IsElementOptional(const ElementDefinition: IXMLElementDef): Boolean;
begin
  Result := ElementDefinition.MinOccurs <= 0;
end;

procedure TXSDSchemaLoader.LoadXSDTypes;

  function AddBuildInType(const TypeName: String; const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    FXMLBuildInType.Add(TypeName, TypeDefinition);
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

    function GetName: String;
    begin
      for var TypeConfiguration in Importer.Configuration.TypeDefinition do
        if (TypeConfiguration.Name = ClassDefinition.Name) and not TypeConfiguration.ChangeName.IsEmpty then
          Exit(TypeConfiguration.ChangeName);

      Result := ClassDefinition.Name;
    end;

  begin
    Result := CheckReservedName(FormatName(GetName));

    if Assigned(ClassDefinition.ParentModule) and ClassDefinition.ParentModule.IsClassDefinition then
      Result := GetTypePrefixName(Result);
  end;

  function ResolveTypeDefinition(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    if Result.IsDelayedType then
    begin
      var DelayedType := Result.AsDelayedType;

      if not DelayedType.IsResolved then
      begin
        var TypeName := DelayedType.UnresolvedType;

        DelayedType.TypeResolved := Importer.FindType(TypeName, DelayedType.ParentModule);

        if not DelayedType.IsResolved then
        begin
          DelayedType.TypeResolved := Importer.FindTypeInUnits(nil, TypeName);

          if not DelayedType.IsResolved then
            DelayedType.TypeResolved := TUndefinedType.Create(TypeName);
        end;

        DelayedType.TypeResolved := ResolveTypeDefinition(DelayedType.TypeResolved);
      end;

      Result := DelayedType.TypeResolved;
    end;
  end;

  function ResolveTypeAlias(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(TypeDefinition);

    if Result.IsTypeAlias then
      Result := ResolveTypeAlias(Result.AsTypeAlias.TypeDefinition);
  end;

  function GetPropertyType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := Importer.FindChangeTypeName(&Property.Name, nil);

    if not Assigned(Result) then
      Result := ResolveTypeDefinition(&Property.PropertyType);
  end;

  function GetPropertyBaseType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeAlias(&Property.PropertyType);
  end;

  function GetArrayItemType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    var BaseType := ResolveTypeAlias(TypeDefinition);

    if BaseType.IsArrayType then
      Result := ResolveTypeDefinition(BaseType.AsArrayType.ArrayType)
    else
      Result := TypeDefinition;
  end;

  function GetArrayItemBaseType(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeAlias(GetArrayItemType(TypeDefinition));
  end;

  function GetClassImplementationName(ClassDefinition: TClassDefinition): String;
  begin
    Result := GetClassName(ClassDefinition);

    while Assigned(ClassDefinition.ParentModule) and ClassDefinition.ParentModule.IsClassDefinition do
    begin
      Result := Format('%s.%s', [GetClassName(ClassDefinition.ParentModule.AsClassDefinition), Result]);

      ClassDefinition := ClassDefinition.ParentModule.AsClassDefinition;
    end;
  end;

  function GetPropertyFieldName(const &Property: TPropertyDefinition): String;
  begin
    Result := 'F' + FormatName(&Property.Name);
  end;

  function GetStoredFieldName(const &Property: TPropertyDefinition): String;
  begin
    Result := Format('%sIsStored', [GetPropertyFieldName(&Property)])
  end;

  function GetPropertyGetFunctionName(const &Property: TPropertyDefinition): String;
  begin
    Result := 'Get' + FormatName(&Property.Name)
  end;

  function GetPropertyReadMethod(const &Property: TPropertyDefinition): String;
  begin
    if &Property.NeedGetFunction then
      Result := GetPropertyGetFunctionName(&Property)
    else
      Result := GetPropertyFieldName(&Property);
  end;

  function GetPropertySetProcedureName(const &Property: TPropertyDefinition): String;
  begin
    Result := 'Set' + FormatName(&Property.Name);
  end;

  function GetPropertyWriteMethod(const &Property: TPropertyDefinition): String;
  begin
    if &Property.NeedSetProcedure then
      Result := GetPropertySetProcedureName(&Property)
    else
      Result := GetPropertyFieldName(&Property);
  end;

  function GetEnumerationName(const TypeEnumeration: TTypeEnumeration): String;
  begin
    Result := TypeEnumeration.EnumeratorName;

    if TypeEnumeration.ParentModule.IsClassDefinition then
      Result := Format('%s.%s', [GetClassImplementationName(TypeEnumeration.ParentModule.AsClassDefinition), Result]);
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
    else
      Result := ResolveTypeDefinition(TypeDefinition).Name;
  end;

  function GetFullTypeName(const TypeDefinition: TTypeDefinition): String;
  begin
    Result := GetTypeName(TypeDefinition);

    if TypeDefinition.IsClassDefinition or TypeDefinition.IsInterfaceType then
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
    var TypeDefinition := Importer.FindChangeTypeName(Parameter.Name, nil);

    if not Assigned(TypeDefinition) then
      TypeDefinition := Parameter.ParameterType;

    Result := GetTypeName(TypeDefinition);
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

  procedure LoadParentAttributes(const Ident: String; const TypeDefinition: TTypeCommonDefinition);
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

      AddLine('%s%s = (%s);', [Ident, Enumerator.EnumeratorName, GetEnumeratorValues(Enumerator, sLineBreak + Ident + WHITE_SPACE_IDENT, FormatEnumeratorValue)]);

      FirstEnumerator := False;
    end;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

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
      begin
        var Inheritence := ResolveTypeDefinition(ClassDefinition.InheritedFrom);
        var InheritenceName := EmptyStr;

        if Inheritence.IsClassDefinition then
          InheritenceName := GetClassImplementationName(Inheritence.AsClassDefinition)
        else if Inheritence.IsExternal then
          InheritenceName := Inheritence.AsTypeExternal.Name;

        Result := Format('(%s)', [InheritenceName]);
      end
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
        Result := PropertyType.IsClassDefinition and not PropertyType.IsObjectType or PropertyType.IsDynamicPropertyType or PropertyType.IsArrayType and GetNeedDestructor(GetArrayItemBaseType(PropertyType));
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

        if not SameText(FormatPropertyName(&Property.Name), &Property.Name) then
        begin
          &Property.AddFieldAttribute(&Property.Name);

          &Property.Name := FormatName(&Property.Name);
        end;
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
            AddLine('%s  function %s: %s;', [Ident, GetAddFuntionName(&Property), GetTypeName(GetArrayItemType(GetPropertyType(&Property)))]);

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

        AddLine('%s  property %s: %s read %s write %s%s;', [Ident, FormatPropertyName(&Property.Name), GetPropertyTypeName(&Property), GetPropertyReadMethod(&Property), GetPropertyWriteMethod(&Property),
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

          AddLine('  Result := %s;', [CreateObjectClass(GetArrayItemBaseType(PropertyType))]);

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

      procedure AddUnitDefinition(const UnitDefinition: TUnitDefinition);
      begin
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
        else if TypeDefinition.IsTypeAlias and Assigned(TypeDefinition.AsTypeAlias.ParentModule) then
          AddUnitDefinition(TypeDefinition.ParentModule.AsUnitDefinition);
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

        Result := Result + Format('%s%s: %s', [LoadAttributes, OnlyValidChars(Parameter.Name), GetParameterTypeName(Parameter)]);
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
      AddLine('  %s = %s;', [TypeAlias.Name, GetBaseTypeFullName(TypeAlias)]);

    AddLine;
  end;

  for var AClass in Classes do
  begin
    GenerateClassDeclaration(WHITE_SPACE_IDENT, AClass);

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

{ TClassDefinition }

procedure TClassDefinition.AddAtribute(const Value: String);
begin
  for var AttributeValue in Attributes do
    if AttributeValue = Value then
      Exit;

  Attributes.Add(Value);
end;

procedure TClassDefinition.AddFlatAttribute;
begin
  AddFlatAttribute(EmptyStr);
end;

procedure TClassDefinition.AddAtribute(const Value: String; const Values: array of const);
begin
  AddAtribute(Format(Value, Values));
end;

procedure TClassDefinition.AddFlatAttribute(const EnumeratorPropertyName: String);
begin
  var Parameter := EmptyStr;

  if not EnumeratorPropertyName.IsEmpty then
    Parameter := Format('(''%s'')', [EnumeratorPropertyName]);

  AddAtribute(Format('Flat%s', [Parameter]));
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

constructor TTypeDefinition.Create(const ParentModule: TTypeModuleDefinition);
begin
  inherited Create;

  FParentModule := ParentModule;
end;

function TTypeDefinition.GetAsArrayType: TTypeArrayDefinition;
begin
  Result := Self as TTypeArrayDefinition;
end;

function TTypeDefinition.GetAsClassDefinition: TClassDefinition;
begin
  Result := Self as TClassDefinition;
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

function TTypeDefinition.GetAsUnitDefinition: TUnitDefinition;
begin
  Result := Self as TUnitDefinition;
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
  Result := Self is TUnitDefinition;
end;

function TTypeDefinition.GetParentUnit: TUnitDefinition;
begin
  var Parent := Self;

  while not Parent.IsUnitDefinition do
    Parent := Parent.ParentModule;

  Result := Parent as TUnitDefinition;
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
begin
  if IsReference(Schema) then
    Result := FindTypeReference(Module, Schema)
  else
    Result := CreateTypeDefinition(Module, Schema, TypeName);
end;

constructor TJSONSchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
  FSchemas := TDictionary<String, TSchema>.Create(TIStringComparer.Ordinal);
end;

function TJSONSchemaLoader.CreateDynamicPropertyType(const ParentModule: TTypeModuleDefinition; const ValueType: TTypeDefinition): TTypeDynamicPropertyDefinition;
begin
  Result := TTypeDynamicPropertyDefinition.Create(ParentModule, ValueType);
end;

function TJSONSchemaLoader.CreateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;

  function CreateEnumerator: TTypeEnumeration;
  begin
    Result := TTypeEnumeration.Create(Module);
    Result.Name := TypeName;

    Module.Enumerations.Add(Result);

    if not Module.IsUnitDefinition then
      Result.Name := FormatName(Result.Name);

    for var EnumeratorValue in Schema.&Object.enum do
      Result.Values.Add(EnumeratorValue.ToString);
  end;

  function GetAnyTypeDefinition: TTypeDefinition;
  const
    ANY_TYPE_NAME = 'any';

  var
    UnitDefinition: TUnitDefinition;

  begin
    Result := FImporter.FindType(ANY_TYPE_NAME, Module);

    if not Assigned(Result) then
    begin
      if Module.IsUnitDefinition then
        UnitDefinition := Module.AsUnitDefinition
      else
        UnitDefinition := Module.ParentUnit;

      var AliasType := FImporter.CreateTypeAlias(UnitDefinition, ANY_TYPE_NAME, FImporter.TValueType);
      Result := AliasType;

      UnitDefinition.AddTypeAlias(AliasType);
    end;
  end;

  function IsFlatSchema(const Schema: TSchema): Boolean;
  begin
    Result := Schema.&Object.IsAllOfStored or Schema.&Object.IsOneOfStored or Schema.&Object.IsAnyOfStored or Schema.&Object.IsTypeStored and Schema.&Object.&Type.IsArrayStored or IsConditionalSchema(Schema);
  end;

  procedure CheckFlatAttribute(const ClassDefinition: TClassDefinition);
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

  function CreateClassTypeDefinition(const ParentModule: TTypeModuleDefinition; const TypeName: String): TClassDefinition;
  begin
    var ClassDefinition := FindAllTypes(TypeName, ParentModule);

    if Assigned(ClassDefinition) and not ClassDefinition.IsDelayedType then
      Result := ClassDefinition.AsClassDefinition
    else
    begin
      Result := FImporter.CreateClassDefinition(ParentModule, TypeName);

      GenerateDefinitions(Result, Schema);
    end;
  end;

  function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const TypeName: String): TClassDefinition;
  begin
    Result := CreateClassTypeDefinition(ParentModule, TypeName);

    CheckFlatAttribute(Result);

    GenerateProperties(Result, Schema);
  end;

  function GetSimpleType(const SimpleType: simpleTypes): TTypeDefinition;
  begin
    case SimpleType of
      simpleTypes.boolean: Result := FImporter.BooleanType;
      simpleTypes.null: Result := nil;
      simpleTypes.integer: Result := FImporter.IntegerType;
      simpleTypes.number: Result := FImporter.DoubleType;
      simpleTypes.&string: Result := FImporter.StringType;
      else Result := nil;
    end;
  end;

  function NeedClassDeclaration(const Schema: TSchema): Boolean;
  begin
    Result := IsFlatSchema(Schema) or Schema.&Object.IsAdditionalPropertiesStored or Schema.&Object.IsPatternPropertiesStored or Schema.&Object.IsPropertiesStored;
  end;

  function MustDeclareClass: Boolean;
  begin
    Result := NeedClassDeclaration(Schema);
  end;

begin
  if Schema.&Object.IsEnumStored then
    Result := CreateEnumerator
  else if Schema.&Object.IsTypeStored then
    if Schema.&Object.&type.IsSimpleTypesStored then
    begin
      case Schema.&Object.&type.SimpleTypes of
        simpleTypes.&array: Result := TTypeArrayDefinition.Create(Module, CheckTypeDefinition(Module, Schema.&Object.items, TypeName + 'ArrayItem'));
        simpleTypes.&object: Result := CreateClassDefinition(Module, TypeName);
        else Result := GetSimpleType(Schema.&Object.&type.SimpleTypes);
      end;
    end
    else
    begin
      var ClassDefinition := CreateClassTypeDefinition(Module, TypeName);
      Result := ClassDefinition;

      ClassDefinition.AddFlatAttribute;

      for var SimpleType in Schema.&Object.&type.&array do
      begin
        var PropertyName := FormatName(TRttiEnumerationType.GetName(SimpleType));
        var PropertyType: TTypeDefinition;

        if SimpleType = simpleTypes.&object then
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

function TJSONSchemaLoader.DefineProperty(const ClassDefinition: TClassDefinition; const Schema: TSchema; const PropertyName: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
begin
  for var ClassProperty in ClassDefinition.Properties do
    if ClassProperty.Name = PropertyName then
      Exit(ClassProperty);

  Result := TPropertyDefinition.Create;
  Result.Optional := True;
  Result.Name := PropertyName;
  Result.PropertyType := PropertyType;

  if not Assigned(Result.PropertyType) then
    raise Exception.Create('Property type not found!');

  for var Required in Schema.&Object.required do
    if Result.Name = Required then
      Result.Optional := False;

  ClassDefinition.Properties.Add(Result);
end;

destructor TJSONSchemaLoader.Destroy;
begin
  FSchemas.Free;

  inherited;
end;

function TJSONSchemaLoader.FindAllTypes(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;

  function FindInProperties(const ClassDefinition: TClassDefinition): TTypeDefinition;
  begin
    Result := nil;

    for var PropertyDefinition in ClassDefinition.Properties do
      if PropertyDefinition.Name = TypeName then
        Exit(PropertyDefinition.PropertyType);
  end;

begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) then
    for var DelayedType in Module.DelayedTypes do
      if DelayedType.UnresolvedType = TypeName then
        Exit(DelayedType);

  if not Assigned(Result) then
  begin
    var MainUnitType := Module.ParentUnit.MainType;

    if MainUnitType.IsClassDefinition then
      Result := FindInProperties(MainUnitType.AsClassDefinition)
    else if MainUnitType.IsDelayedType and MainUnitType.AsDelayedType.IsResolved and MainUnitType.AsDelayedType.TypeResolved.IsClassDefinition then
      Result := FindInProperties(MainUnitType.AsDelayedType.TypeResolved.AsClassDefinition);
  end;
end;

function TJSONSchemaLoader.FindTypeReference(const Module: TTypeModuleDefinition; const Schema: TSchema): TTypeDefinition;

  function FindMainTypeReference(const References: TArray<String>): TTypeDefinition;
  begin
    Result := FImporter.LoadUnitFromReference(References[0]).MainType;
  end;

begin
  if Schema.&Object.IsRefStored then
  begin
    var Reference := Schema.&Object.ref;

    if Reference = REFERENCE_SEPARATOR then
      Result := Module.ParentUnit.MainType
    else
    begin
      var References := Reference.Split(['#']);

      if Length(References) = 1 then
        Result := FindMainTypeReference(References)
      else
      begin
        var ReferenceModule: TTypeModuleDefinition;

        if References[0].IsEmpty then
          ReferenceModule := Module.ParentUnit
        else
          ReferenceModule := FindMainTypeReference(References).ParentModule;

        var ReferenceName := GetReferenceName(Schema);

        Result := FindAllTypes(ReferenceName, ReferenceModule);

        if not Assigned(Result) then
          Result := ReferenceModule.ParentUnit.AddDelayedType(ReferenceName);
      end;
    end;
  end
  else if Schema.&Object.IsDynamicRefStored then
    Result := Module.ParentUnit.MainType
  else
    Result := nil;
end;

procedure TJSONSchemaLoader.GenerateDefinitions(const Module: TTypeModuleDefinition; const Schema: TSchema);
begin
  for var Definition in Schema.&Object.Defs.defs do
  begin
    var TypeDefinition := CheckTypeDefinition(Module, Definition.Value, Definition.Key);

    if TypeDefinition.IsDelayedType then
      TypeDefinition := CreateTypeDefinition(Module, Definition.Value, Definition.Key);

    if (TypeDefinition.Name <> Definition.Key) and Module.IsUnitDefinition then
      Module.AsUnitDefinition.AddTypeAlias(FImporter.CreateTypeAlias(Module, Definition.Key, TypeDefinition));
  end;
end;

procedure TJSONSchemaLoader.GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);
const
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

  function GetPropertyName(const Schema: TSchema): String;
  const
    ANONYMOUS_PROPERTY_NAME = 'Anonymous';

  begin
    if Schema.&Object.IsRefStored then
      Result := GetReferenceName(Schema)
    else if Schema.&Object.IsTypeStored and Schema.&Object.&Type.IsSimpleTypesStored then
      Result := TRttiEnumerationType.GetName(Schema.&Object.&type.simpleTypes)
    else if Schema.&Object.IsDynamicRefStored then
      Result := FormatName(ClassDefinition.Name)
    else if Schema.&Object.IsPatternPropertiesStored then
      Result := PATTERN_PROPERTY_NAME
    else
      Result := ANONYMOUS_PROPERTY_NAME;

    Result := CheckUniqueName(Result);
  end;

  procedure DefinePropertyCheckingType(const PropertyName: String; const PropertySchema: TSchema);
  begin
    DefineProperty(ClassDefinition, Schema, PropertyName, CheckTypeDefinition(ClassDefinition, PropertySchema, PropertyName));
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
  for var Pair in Schema.&Object.Properties.Properties do
    DefinePropertyCheckingType(Pair.Key, Pair.Value);

  for var AnonymousSchema in Schema.&Object.allOf + Schema.&Object.oneOf + Schema.&Object.anyOf + ConditionalSchemas do
    if AnonymousSchema.&Object.IsRefStored or AnonymousSchema.&Object.IsTypeStored then
      DefinePropertyCheckingType(GetPropertyName(AnonymousSchema), AnonymousSchema)
    else
      GenerateProperties(ClassDefinition, AnonymousSchema);

  if Schema.&Object.IsAdditionalPropertiesStored then
  begin
    PropertyName := GetPropertyName(Schema.&Object.additionalProperties);

    GenerateProperties(ClassDefinition, Schema.&Object.additionalProperties);

    DefineProperty(ClassDefinition, Schema.&Object.additionalProperties, PropertyName, CreateDynamicPropertyType(ClassDefinition, CheckTypeDefinition(ClassDefinition, Schema.&Object.additionalProperties, PropertyName)));
  end;

  if Schema.&Object.IsPatternPropertiesStored then
    for var PatternPropertySchema in Schema.&Object.patternProperties.PatternProperties do
    begin
      PropertyName := GetPropertyName(Schema);

      var PatternProperty := DefineProperty(ClassDefinition, PatternPropertySchema.Value, PropertyName, CreateDynamicPropertyType(ClassDefinition, CheckTypeDefinition(ClassDefinition, PatternPropertySchema.Value, PropertyName)));

      PatternProperty.AddAtribute('%s(''%s'')', [PATTERN_PROPERTY_NAME, PatternPropertySchema.Key]);
    end;
end;

procedure TJSONSchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  var CurrentSchema := LoadSchema(UnitFileConfiguration);
  var LoadMainClass := not Assigned(UnitDefinition.MainType);
  var UnitClassName := UnitFileConfiguration.UnitClassName + UnitFileConfiguration.AppendClassName;

  if LoadMainClass then
    UnitDefinition.MainType := UnitDefinition.AddDelayedType(UnitClassName + 'Delayed');

  GenerateDefinitions(UnitDefinition, CurrentSchema);

  var ClassDefinition := CheckTypeDefinition(UnitDefinition, CurrentSchema, UnitClassName);

  if LoadMainClass then
    UnitDefinition.MainType.AsDelayedType.TypeResolved := ClassDefinition;
end;

function TJSONSchemaLoader.GetReferenceName(const Schema: TSchema): String;
begin
  var Values := Schema.&Object.ref.Split(['/']);

  Result := Values[High(Values)];

  if Result = REFERENCE_SEPARATOR then
    Result := DEFAULT_SCHEMA_CLASS_NAME;
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
  if not FSchemas.TryGetValue(UnitFileConfiguration.Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFileFromConfiguration(UnitFileConfiguration), TypeInfo(TSchema)).AsType<TSchema>;

    FSchemas.Add(UnitFileConfiguration.Reference, Result);
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

function TTypeEnumeration.GetEnumeratorName: String;
begin
  if ParentModule.IsClassDefinition then
    Result := GetTypePrefixName(Name)
  else
    Result := Name;
end;

{ TTypeModuleDefinition }

function TTypeModuleDefinition.AddDelayedType(const TypeName: String): TTypeDelayedDefinition;
begin
  Result := TTypeDelayedDefinition.Create(TypeName, Self);

  DelayedTypes.Add(Result);
end;

constructor TTypeModuleDefinition.Create(const Module: TTypeModuleDefinition);
begin
  inherited;

  FClasses := TObjectList<TClassDefinition>.Create;
  FDelayedTypes := TObjectList<TTypeDelayedDefinition>.Create;
  FEnumerations := TObjectList<TTypeEnumeration>.Create;
  FInterfaces := TObjectList<TTypeInterfaceDefinition>.Create;
end;

destructor TTypeModuleDefinition.Destroy;
begin
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
end;

{ TUnitDefinitionConfiguration }

destructor TUnitDefinitionConfiguration.Destroy;
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
  Result := TTypeParameterDefinition.Create;

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

constructor TTypeMethodDefinition.Create;
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
  inherited Create;

  FImporter := Importer;
end;

procedure TWSDLSchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  IsRPCCall: Boolean;
  Operation: IBindingOperation;
  Port: IPort;
  ServiceInterface: TTypeInterfaceDefinition;
  ServiceMethod: TTypeMethodDefinition;
  SchemaLoader: TXSDSchemaLoader;
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

  function FindType(Name: String): IXMLTypeDef;
  begin
    Name := ExtractLocalName(Name);

    for var A := 0 to Pred(WSDLDocument.Definition.Types.SchemaDefs.Count) do
    begin
      var Schema := WSDLDocument.Definition.Types.SchemaDefs[A];

      for var B := 0 to Pred(Schema.ComplexTypes.Count) do
      begin
        var ComplexType := Schema.ComplexTypes[B];

        if CompareNames(ExtractLocalName(ComplexType.Name), Name) then
          Exit(ComplexType);
      end;

      for var B := 0 to Pred(Schema.SimpleTypes.Count) do
      begin
        var SimpleType := Schema.SimpleTypes[B];

        if CompareNames(ExtractLocalName(SimpleType.Name), Name) then
          Exit(SimpleType);
      end;
    end;

    for var A := 0 to Pred(WSDLDocument.Definition.Types.SchemaDefs.Count) do
    begin
      var Schema := WSDLDocument.Definition.Types.SchemaDefs[A];

      for var B := 0 to Pred(Schema.ElementDefs.Count) do
      begin
        var Element := Schema.ElementDefs[B];

        if CompareNames(Element.Name, Name) then
          Exit(SchemaLoader.GetElementDataType(Element));
      end;
    end;
  end;

  function CheckPartType(const Part: IPart): TTypeDefinition;
  begin
    var TypeName: String;

    if Part.Element.IsEmpty then
      TypeName := Part.Type_
    else
      TypeName := Part.Element;

    var ParameterType := FindType(TypeName);

    if Assigned(ParameterType) then
      Result := SchemaLoader.CheckUnitTypeDefinition(ParameterType, UnitDefinition)
    else
      Result := SchemaLoader.FindType(TypeName, UnitDefinition);
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

        if Part.Element.IsEmpty then
          AddBodyParameter(Part.Name, CheckPartType(Part))
        else
        begin
          var ElementType := FindType(Part.Element);

          var ElementTypeDefinition := SchemaLoader.FindType(ElementType.Name, UnitDefinition);

          if Assigned(ElementTypeDefinition) then
            AddBodyParameter(Part.Name, ElementTypeDefinition)
          else if ElementType.IsComplex then
          begin
            var ComplexType := ElementType as IXMLComplexTypeDef;

            var ClassDefinition := FImporter.CreateClassDefinition(UnitDefinition, ComplexType.Name);

            AddBodyParameter(ComplexType.Name, ClassDefinition);

            for var B := 0 to Pred(ComplexType.ElementDefs.Count) do
            begin
              var Element := ComplexType.ElementDefs[0];

              SchemaLoader.AddProperty(ClassDefinition, Element.Name, SchemaLoader.GetElementDataType(Element));
            end;
          end
          else
            AddBodyParameter(Part.Name, SchemaLoader.FindType(ElementType.Name, UnitDefinition));
        end;
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

      if Part.Element.IsEmpty then
      begin
        var ClassDefinition := FImporter.CreateClassDefinition(UnitDefinition, Message.Name);
        var PartProperty := ClassDefinition.AddProperty(Part.Name);
        PartProperty.PropertyType := CheckPartType(Part);
        Result := ClassDefinition;
      end
      else
        Exit(CheckPartType(Part));
    end;
  end;

  function FindSOAPNode(const ParentNode: IXMLNode; const Name: String): IXMLNode;
  begin
    Result := ParentNode.ChildNodes.FindNode(Name, Soap12ns);

    if not Assigned(Result) then
      Result := ParentNode.ChildNodes.FindNode(Name, Soapns);
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

  function LoadReturnType(const Return: IParam): TTypeDefinition;
  begin
    Result := CheckMessageType(FindMessage(Return.Message));
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

    for var B := 0 to Pred(Schema.ComplexTypes.Count) do
      SchemaLoader.CheckUnitTypeDefinition(Schema.ComplexTypes[B], UnitDefinition);

    for var B := 0 to Pred(Schema.SimpleTypes.Count) do
      SchemaLoader.CheckUnitTypeDefinition(Schema.SimpleTypes[B], UnitDefinition);
  end;

  for var A := 0 to Pred(WSDLDocument.Definition.Services.Count) do
  begin
    var Service := WSDLDocument.Definition.Services[A];
    ServiceInterface := FImporter.CreateInterfaceDefinition(UnitDefinition, Service.Name);

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
          ServiceMethod := TTypeMethodDefinition.Create;
          ServiceMethod.Name := Operation.Name;
          ServiceMethod.Return := LoadReturnType(PortTypeOperation.Output);
          var SOAPAction := SOAPOperation.AttributeNodes.FindNode(SSoapAction);
          var SOAPStyle := SOAPOperation.AttributeNodes.FindNode(SStyle);
          XMLNameSpaceAttribute := WSDLDocument.Definition.TargetNameSpace;

          IsRPCCall := Assigned(SOAPStyle) and SameText(SOAPStyle.Text, 'rpc');

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

procedure TTypeCommonDefinition.AddNamespaceAttribute(const Namespace: String);
begin
  if not Namespace.IsEmpty then
    AddAtribute(FormatNamespaceAttribute(Namespace));
end;

constructor TTypeCommonDefinition.Create;
begin
  inherited;

  FAttributes := TList<String>.Create;
  FParentAttributes := TList<String>.Create;
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
  Result := Self is TClassDefinition;
end;

end.

