unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema, Blue.Print.JSON.Schema, Blue.Print.Types;

type
  TClassDefinition = class;
  TSchemaImporter = class;
  TTypeArrayDefinition = class;
  TTypeDefinition = class;
  TTypeDelayed = class;
  TTypeEnumeration = class;
  TTypeExternal = class;
  TTypeModuleDefinition = class;
  TUnitDefinition = class;
  TXSDImporter = class;

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
    FName: String;
    FOptional: Boolean;
    FPropertyType: TTypeDefinition;

    function GetNeedGetFunction: Boolean;
    function GetOptional: Boolean;
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
    property Name: String read FName write FName;
    property NeedGetFunction: Boolean read GetNeedGetFunction;
    property Optional: Boolean read GetOptional write FOptional;
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
    function GetIsUnitDefinition: Boolean;
    function GetNeedDestructor: Boolean;
  public
    constructor Create(const ParentModule: TTypeModuleDefinition);

    destructor Destroy; override;

    property AsArrayType: TTypeArrayDefinition read GetAsArrayType;
    property AsClassDefinition: TClassDefinition read GetAsClassDefinition;
    property AsDelayedType: TTypeDelayed read GetAsDelayedType;
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
    property IsUnitDefinition: Boolean read GetIsUnitDefinition;
    property Name: String read FName write FName;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property ParentAttributes: TList<String> read FParentAttributes;
    property ParentModule: TTypeModuleDefinition read FParentModule;
  end;

  TTypeModuleDefinition = class(TTypeDefinition)
  private
    FClasses: TList<TClassDefinition>;
    FEnumarations: TList<TTypeEnumeration>;
  public
    constructor Create(const Module: TTypeModuleDefinition); virtual;

    destructor Destroy; override;

    property Enumarations: TList<TTypeEnumeration> read FEnumarations write FEnumarations;
    property Classes: TList<TClassDefinition> read FClasses;
  end;

  TClassDefinition = class(TTypeModuleDefinition)
  private
    FInheritedFrom: TClassDefinition;
    FParentClass: TClassDefinition;
    FProperties: TList<TPropertyDefinition>;
    FTargetNamespace: String;

    function GetUnitDefinition: TUnitDefinition;
  public
    constructor Create(const Module: TTypeModuleDefinition); overload; override;
    constructor Create(const Module: TTypeModuleDefinition; const TargetNamespace: String); reintroduce; overload;

    destructor Destroy; override;

    function AddProperty(const Name: String): TPropertyDefinition;

    procedure AddNamespaceAttribute(const Namespace: String);
    procedure AddClassType(const ClassDefinition: TClassDefinition);

    property InheritedFrom: TClassDefinition read FInheritedFrom write FInheritedFrom;
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
    FBuildInType: TDictionary<String, TTypeDefinition>;
    FConfiguration: TConfiguration;
    FDelayedTypes: TDictionary<String, TTypeDefinition>;
    FTypeExternal: TDictionary<String, TTypeDefinition>;
    FUnits: TDictionary<String, TUnitDefinition>;
    FStringType: TTypeDefinition;
    FCardinalType: TTypeDefinition;
    FIntegerType: TTypeDefinition;
    FInt64Type: TTypeDefinition;
    FObjectType: TTypeDefinition;
    FWordType: TTypeDefinition;
    FDateType: TTypeDefinition;
    FBooleanType: TTypeDefinition;
    FDateTimeType: TTypeDefinition;
    FDoubleType: TTypeDefinition;
    FTimeType: TTypeDefinition;
  protected
    function AddDelayedType(const TypeName: String; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CreateTypeAlias(const Module: TTypeModuleDefinition; const Alias: String; const TypeDefinition: TTypeDefinition): TTypeAlias;
    function CreateUnit(const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
    function FindType(const TypeName: String; Module: TTypeModuleDefinition): TTypeDefinition; virtual;
    function LoadFile(const UnitFile: TUnitFileConfiguration): String;

    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration); virtual; abstract;
    procedure LoadInternalTypes;

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

    procedure AddTypeExternal(const ModuleName, TypeName: String);
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
    function CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CheckPropertyTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
    function CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
    function CheckEnumeration(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeEnumeration;
    function GenerateClassDefinition(const UnitDeclaration: TUnitDefinition; const ComplexType: IXMLComplexTypeDef; const TargetNamespace: String): TClassDefinition;
    function GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
    function IsReferenceType(const Element: IXMLElementDef): Boolean;

    procedure AddPropertyAttribute(const &Property: TPropertyDefinition; const Attribute: IXMLAttributeDef);
    procedure GenerateProperty(const ClassDefinition: TClassDefinition; const ElementDefinition: IXMLElementDef; const TargetNamespace: String);
    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const ElementDefs: IXMLElementDefList; const TargetNamespace: String);
    procedure LoadXSDTypes;
  protected
    function FindType(const TypeName: String; Module: TTypeModuleDefinition): TTypeDefinition; override;

    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration); override;
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TJSONSchemaImport = class(TSchemaImporter)
  private
    FJSONSchema: TSchema;

    function CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
    function FindReference(const Schema: TSchema): TSchema;
    function GetReferenceName(const Schema: TSchema): String;
    function GetReferenceType(const ParentModule: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
    function GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
    function GenerateTypeDefinition(const ParentModule: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;

    procedure GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);
  protected
    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration); override;
  end;

  TOpenAPIImport30 = class(TSchemaImporter)
//  private
//    function GenerateClassDefinition(const UnitDeclaration: TUnitDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
  protected
    procedure GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration); override;
  end;

  TSchemaHelper = class helper for TSchema
  private
    function GetIsArray: Boolean;
  public
    property IsArray: Boolean read GetIsArray;
  end;

implementation

uses System.SysUtils, System.Classes, System.IOUtils, System.Variants, System.Net.HttpClient, XML.XMLDom, Xml.XMLSchemaTags, Blue.Print.Serializer;

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

procedure TSchemaImporter.AddTypeExternal(const ModuleName, TypeName: String);
begin
  FTypeExternal.Add(TypeName, TTypeExternal.Create(ModuleName, TypeName));
end;

constructor TSchemaImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create;
  FDelayedTypes := TDictionary<String, TTypeDefinition>.Create;
  FTypeExternal := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues]);
  FUnits := TObjectDictionary<String, TUnitDefinition>.Create([doOwnsValues]);

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

  FUnits.Add(UnitConfiguration.Name, Result);
end;

destructor TSchemaImporter.Destroy;
begin
  FTypeExternal.Free;

  FBuildInType.Free;

  FDelayedTypes.Free;

  FUnits.Free;

  inherited;
end;

function TSchemaImporter.FindType(const TypeName: String; Module: TTypeModuleDefinition): TTypeDefinition;

  function FindTypeDefinitionModule(const Module: TTypeModuleDefinition; const TypeName: String; var TypeDefinition: TTypeDefinition): Boolean;
  begin
    Result := False;

    for var ClassDefinition in Module.Classes do
    begin
      Result := ClassDefinition.Name = TypeName;

      if Result then
      begin
        TypeDefinition := ClassDefinition;

        Break;
      end;
    end;

    for var Enumerator in Module.Enumarations do
    begin
      Result := Enumerator.Name = TypeName;

      if Result then
      begin
        TypeDefinition := Enumerator;

        Break;
      end;
    end;
  end;

  function FindTypeDefinition(const TypeName: String): TTypeDefinition;
  begin
    Result := nil;

    if FTypeExternal.TryGetValue(TypeName, Result) then
      Exit;

    if FBuildInType.TryGetValue(TypeName, Result) then
      Exit;

    if not Assigned(Result) then
      for var UnitDefinition in FUnits.Values do
        for var TypeAlias in UnitDefinition.TypeAlias do
          if TypeAlias.Name = TypeName then
            Exit(TypeAlias);
  end;

begin
  Result := nil;

  while Assigned(Module) and not FindTypeDefinitionModule(Module, TypeName, Result) do
    if Module is TClassDefinition then
      Module := TClassDefinition(Module).ParentClass
    else
      Module := nil;

  if not Assigned(Result) then
  begin
    Module := nil;

    for var SplitTypeName in TypeName.Split(['.']) do
    begin
      Result := FindTypeDefinition(SplitTypeName);

      if Assigned(Module) then
        FindTypeDefinitionModule(Module, SplitTypeName, Result)
      else if not Assigned(Result) then
        for var UnitDefinition in FUnits.Values do
          if FindTypeDefinitionModule(UnitDefinition, SplitTypeName, Result) then
            Break;

      Module := TClassDefinition(Result);
    end;
  end;
end;

procedure TSchemaImporter.Import;
begin
//  for var TypeDefinitionConfig in Configuration.TypeDefinition do
//    if not TypeDefinitionConfig.ChangeType.IsEmpty then
//      AddTypeAlias(TypeDefinitionConfig.Name, AddDelayedType(TypeDefinitionConfig.ChangeType, nil));

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
    Result := TFile.ReadAllText(Format('%s\%s', [Configuration.SchemaFolder, UnitFile.Reference]));
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

function TXSDImporter.FindType(const TypeName: String; Module: TTypeModuleDefinition): TTypeDefinition;
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
      Module.Enumarations.Add(Result);
  end
  else
    Result := nil;
end;


function TXSDImporter.CheckPropertyTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;
begin
  Result := CheckTypeDefinition(&Type, Module);

  if not Assigned(Result) then
    Result := AddDelayedType(&Type.Name, Module);
end;

function TXSDImporter.CheckTypeDefinition(const &Type: IXMLTypeDef; const Module: TTypeModuleDefinition): TTypeDefinition;

  function GetBaseType(TypeDefinition: IXMLTypeDef): TTypeDefinition;
  begin
    Result := nil;

    if not TypeDefinition.IsComplex and Assigned(TypeDefinition.BaseType) then
      repeat
        TypeDefinition := TypeDefinition.BaseType as IXMLSimpleTypeDef;

        Result := FindType(TypeDefinition.Name, Module);
      until Assigned(Result) or not Assigned(TypeDefinition);
  end;

begin
  var TypeName := &Type.Name;

  Result := FindType(TypeName, Module);

  if not Assigned(Result) then
    Result := CheckEnumeration(&Type, Module);

  if not Assigned(Result) then
    Result := GetBaseType(&Type);
end;

function TXSDImporter.CheckUnitTypeDefinition(const &Type: IXMLTypeDef; const UnitDefinition: TUnitDefinition): TTypeDefinition;
begin
  Result := CheckTypeDefinition(&Type, UnitDefinition);

  if not Result.IsEnumeration then
    UnitDefinition.AddTypeAlias(CreateTypeAlias(UnitDefinition, &Type.Name, Result));
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

function TXSDImporter.GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitDefinitionConfiguration): TUnitDefinition;
var
  UnitDeclaration: TUnitDefinition absolute Result;

  function FindUnitConfiguration(const Reference: String): TUnitDefinitionConfiguration;
  begin
    for var Configuration in Configuration.UnitConfiguration do
      for var UnitFile in Configuration.Files do
        if UnitFile.Reference = Reference then
          Exit(Configuration);

    raise Exception.CreateFmt('Schema file without unit configuration %s!', [ExtractFileName(Reference)]);
  end;

  procedure ProcessReferences(const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      UnitDeclaration.AddUses(GenerateUnit(Reference.SchemaRef, FindUnitConfiguration(Reference.SchemaLocation)));
    end;
  end;

begin
  Result := CreateUnit(UnitConfiguration);

  ProcessReferences(Definition.SchemaIncludes);

  ProcessReferences(Definition.SchemaImports);

  for var A := 0 to Pred(Definition.SimpleTypes.Count) do
    CheckUnitTypeDefinition(Definition.SimpleTypes[A], Result);

  for var A := 0 to Pred(Definition.ComplexTypes.Count) do
  begin
    var ClassDefinition := GenerateClassDefinition(UnitDeclaration, Definition.ComplexTypes[A], Definition.TargetNamespace);

    UnitDeclaration.Classes.Add(ClassDefinition);
  end;

  if Definition.ElementDefs.Count > 0 then
  begin
    var ClassDefinition := TClassDefinition.Create(UnitDeclaration, EmptyStr);
    ClassDefinition.Name := UnitConfiguration.Name;

    for var A := 0 to Pred(Definition.ElementDefs.Count) do
      GenerateProperty(ClassDefinition, Definition.ElementDefs[A], Definition.TargetNamespace);

    UnitDeclaration.Classes.Add(ClassDefinition);
  end;
end;

procedure TXSDImporter.GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
begin
  for var UnitFile in UnitConfiguration.Files do
  begin
    var Schema := LoadXMLSchemaStr(LoadFile(UnitFile));

    GenerateUnit(Schema.SchemaDef, UnitConfiguration);
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

  function GetPropertyType(const &Property: TPropertyDefinition): TTypeDefinition;
  begin
    Result := ResolveTypeDefinition(&Property.PropertyType);
  end;

  function CheckNeedDestructor(const ClassDefinition: TClassDefinition): Boolean;
  begin
    Result := False;

    for var &Property in ClassDefinition.Properties do
      if GetPropertyType(&Property).NeedDestructor then
        Exit(True);
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
      Result := Format('TArray<%s>', [GetTypeName(TypeDefinition.AsArrayType.ArrayType)])
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
    Result := 'Add' + FormatName(&Property.Name);
  end;

  function HasOptionalProperty(const ClassDefinition: TClassDefinition): Boolean;
  begin
    Result := False;

    for var &Property in ClassDefinition.Properties do
      if &Property.Optional then
        Exit(True);
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
    for var Enumerator in Module.Enumarations do
    begin
      LoadAttributes(Ident, Enumerator.Attributes.ToArray);

      AddLine('%s[EnumValue(''%s'')]', [Ident, GetEnumeratorValues(Enumerator, ''' +' + sLineBreak + Ident + WHITE_SPACE_IDENT + '''', NotFormatEnumeratorValue)]);

      AddLine('%s%s = (%s);', [Ident, Enumerator.EnumeratorName, GetEnumeratorValues(Enumerator, sLineBreak + Ident + WHITE_SPACE_IDENT, FormatEnumeratorValue)]);
    end;
  end;

  function GetNeedAddFunction(const &Property: TPropertyDefinition): Boolean;
  begin
    var PropertyType := GetPropertyType(&Property);

    Result := PropertyType.IsArrayType and PropertyType.AsArrayType.ArrayType.IsClassDefinition;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

    function GetStoredPropertyDeclaration(const &Property: TPropertyDefinition): String;
    begin
      Result := EmptyStr;

      if &Property.Optional then
        Result := Format(' stored %s', [GetStoredFunctionName(&Property)]);
    end;

    function GetInheritence: String;
    begin
      if Assigned(ClassDefinition.InheritedFrom) then
        Result := Format('(%s)', [GetClassImplementationName(ClassDefinition.InheritedFrom)])
      else
        Result := EmptyStr;
    end;

    function CheckNeedAddFunction(const ClassDefinition: TClassDefinition): Boolean;
    begin
      Result := False;

      for var &Property in ClassDefinition.Properties do
        if GetNeedAddFunction(&Property) then
          Exit(True);
    end;

  begin
    LoadAttributes(Ident, ClassDefinition.Attributes.ToArray);

    AddLine('%s%s = class%s', [Ident, GetClassName(ClassDefinition), GetInheritence]);

    if not ClassDefinition.Classes.IsEmpty or not ClassDefinition.Enumarations.IsEmpty then
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
        if &Property.Optional then
          AddLine('%s  function %s: Boolean;', [Ident, GetStoredFunctionName(&Property)]);

      if CheckNeedDestructor(ClassDefinition) or CheckNeedAddFunction(ClassDefinition) or HasOptionalProperty(ClassDefinition) then
      begin
        AddLine('%spublic', [Ident]);

        if CheckNeedDestructor(ClassDefinition) then
          AddLine('%s  destructor Destroy; override;', [Ident]);

        if CheckNeedDestructor(ClassDefinition) and CheckNeedAddFunction(ClassDefinition) then
          AddLine;

        for var &Property in ClassDefinition.Properties do
          if GetNeedAddFunction(&Property) then
            AddLine('%s  function %s: %s;', [Ident, GetAddFuntionName(&Property), GetPropertyTypeName(&Property)]);

        for var &Property in ClassDefinition.Properties do
          if &Property.Optional then
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

  function GetOptionalValue(const &Property: TPropertyDefinition): String;
  begin
    var PropertyType := GetPropertyType(&Property);

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
    if HasOptionalProperty(ClassDefinition) or CheckNeedDestructor(ClassDefinition) then
    begin
      AddLine('{ %s }', [GetClassImplementationName(ClassDefinition)]);

      AddLine;

      if CheckNeedDestructor(ClassDefinition) then
      begin
        AddLine('destructor %s.Destroy;', [GetClassImplementationName(ClassDefinition)]);

        AddLine('begin');

        for var &Property in ClassDefinition.Properties do
        begin
          var PropertyType := GetPropertyType(&Property);

          if PropertyType.IsArrayType and PropertyType.NeedDestructor then
          begin
            AddLine('  for var AObject in %s do', [GetPropertyFieldName(&Property)]);
            AddLine('    AObject.Free;');

            AddLine;
          end
          else if PropertyType.NeedDestructor then
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
        end
        else if GetNeedAddFunction(&Property) then
        begin
          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetAddFuntionName(&Property), GetPropertyTypeName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s.Create;', [GetTypeName(PropertyType.AsArrayType.ArrayType)]);

          AddLine;

          AddLine('  %0:s := %0:s + [Result];', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end;

        if &Property.Optional then
        begin
          AddLine('function %s.%s: Boolean;', [GetClassImplementationName(ClassDefinition), GetStoredFunctionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s;', [GetOptionalValue(&Property)]);

          AddLine('end;');

          AddLine;
        end;
      end;
    end;

    for var SubClassDefinition in ClassDefinition.Classes do
      GenerateClassImplementation(SubClassDefinition);
  end;

  function GetAllExternalModules: TArray<String>;
  var
    Return: TList<String>;

    procedure AddUses(const ModuleName: String);
    begin
      for var Name in Return do
        if Name = ModuleName then
          Exit;

      Return.Add(ModuleName);
    end;

    procedure CheckType(const TypeDefinition: TTypeDefinition);
    begin
      var ModuleName := EmptyStr;

      if TypeDefinition.IsExternal then
        ModuleName := TypeDefinition.AsTypeExternal.ModuleName
      else if TypeDefinition.IsClassDefinition then
      begin
        var ClassDefinition := TypeDefinition.AsClassDefinition;

        if ClassDefinition.UnitDefinition <> Self then
          ModuleName := ClassDefinition.UnitDefinition.UnitConfiguration.Name;

        if Assigned(ClassDefinition.InheritedFrom) then
          CheckType(ClassDefinition.InheritedFrom);
      end
      else if TypeDefinition.IsEnumeration and TypeDefinition.ParentModule.IsUnitDefinition and (TypeDefinition.ParentModule <> Self) then
        ModuleName := TypeDefinition.ParentModule.AsUnitDefinition.UnitConfiguration.Name;

      if not ModuleName.IsEmpty then
        AddUses(ModuleName);
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
    Return := TList<String>.Create;

    for var AUnit in FUses do
      AddUses(AUnit.UnitConfiguration.Name);

    CheckClasses(Classes);

    for var TypeAlias in TypeAlias do
      CheckType(TypeAlias);

    Result := Return.ToArray;

    Return.Free;
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

  function ResolverTypeAlias(const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    if Result is TTypeAlias then
      Result := ResolverTypeAlias(TTypeAlias(Result).TypeDefinition);
  end;

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [UnitConfiguration.Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  AddLine('{$M+}');

  if not Enumarations.IsEmpty then
    AddLine('{$SCOPEDENUMS ON}');

  AddLine;

  var UsesList := 'Blue.Print.Types';

  for var ModuleName in GetAllExternalModules do
    UsesList := UsesList + ', ' + ModuleName;

  AddLine('// File generated from %s;', [GetUnitReferencesNames(UnitConfiguration)]);

  AddLine;

  AddLine('uses %s;', [UsesList]);

  AddLine;

  if not TypeAlias.IsEmpty or not Classes.IsEmpty then
    AddLine('type');

  if not Enumarations.IsEmpty then
  begin
    AddLine('  // Enumerations declaration');

    GenerateEnumerators(WHITE_SPACE_IDENT, Self);

    AddLine;
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
      AddLine('  %s = %s;', [TypeAlias.Name, GetTypeName(ResolverTypeAlias(TypeAlias.TypeDefinition))]);

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

procedure TClassDefinition.AddClassType(const ClassDefinition: TClassDefinition);
begin
  ClassDefinition.ParentClass := Self;

  FClasses.Add(ClassDefinition);
end;

procedure TClassDefinition.AddNamespaceAttribute(const Namespace: String);
begin
  if not Namespace.IsEmpty then
    Attributes.Add(Format('XMLNamespace(''%s'')', [Namespace]));
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

function TPropertyDefinition.GetNeedGetFunction: Boolean;
begin
  Result := PropertyType.IsClassDefinition and not PropertyType.IsArrayType and not PropertyType.IsObjectType;
end;

function TPropertyDefinition.GetOptional: Boolean;
begin
  Result := FOptional and not PropertyType.IsArrayType;
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

function TTypeDefinition.GetIsUnitDefinition: Boolean;
begin
  Result := Self is TUnitDefinition;
end;

function TTypeDefinition.GetNeedDestructor: Boolean;
begin
  Result := IsClassDefinition or IsObjectType;
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

{ TOpenAPIImport30 }

//function TOpenAPIImport30.GenerateClassDefinition(const UnitDeclaration: TUnitDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
//
//  function FindReference(const ReferenceObject: TReferenceObject): String;
//  begin
//    var References := ReferenceObject.ref.Split(['/']);
//
//    Result := References[High(References)];
//  end;
//
//  function GenerateTypeDefinition(const Schema: TSchemaObject; const TypeName: String; const ParentClass: TClassDefinition): TTypeDefinition;
//  begin
//    if not Schema.ref.IsEmpty then
//      Result := TTypeDelayed.Create(Self, FindReference(Schema), ParentClass)
//    else
//      case Schema.&type of
//        TPropertyType.&array: Result := GenerateTypeDefinition(Schema.items, TypeName, ParentClass);
//        TPropertyType.boolean: Result := BooleanType;
//        TPropertyType.null: Result := nil;
//        TPropertyType.integer: Result := IntegerType;
//        TPropertyType.number: Result := DoubleType;
//        TPropertyType.&object: Result := GenerateClassDefinition(UnitDeclaration, TypeName, Schema);
//        TPropertyType.&string: Result := StringType;
//        else Result := nil;
//      end;
//  end;
//
//begin
//  Result := TClassDefinition.Create(UnitDeclaration);
//  Result.Name := ClassTypeName;
//
//  for var Pair in Schema.properties do
//  begin
//    var Prop := TPropertyDefinition.Create;
//    var SchemaType := Pair.Value;
//    Prop.IsArray := SchemaType.&type = TPropertyType.&array;
//    Prop.Name := Pair.Key;
//    Prop.TypeName := GenerateTypeDefinition(Pair.Value, Pair.Key, Result);
//
//    Result.Properties.Add(Prop);
//  end;
//end;

procedure TOpenAPIImport30.GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
begin
//  var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;
//
//  var OpenAPISchema := Serializer.Deserialize(TFile.ReadAllText(Format('%s\%s', [Configuration.SchemaFolder, UnitConfiguration.FileName])), TypeInfo(TOpenAPIObject)).AsType<TOpenAPIObject>;
//  var UnitDeclaration := CreateUnit(UnitConfiguration);
//
//  for var ComponentSchema in OpenAPISchema.components.schemas do
//    UnitDeclaration.Classes.Add(GenerateClassDefinition(UnitDeclaration, ComponentSchema.Key, ComponentSchema.Value));
end;

{ TJSONSchemaImport }

function TJSONSchemaImport.CreateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String): TClassDefinition;
begin
  Result := TClassDefinition.Create(ParentModule);
  Result.Name := ClassTypeName;

  ParentModule.Classes.Add(Result);
end;

function TJSONSchemaImport.FindReference(const Schema: TSchema): TSchema;
begin
  Result := FJSONSchema.defs[GetReferenceName(Schema)];
end;

function TJSONSchemaImport.GenerateClassDefinition(const ParentModule: TTypeModuleDefinition; const ClassTypeName: String; const Schema: TSchema): TClassDefinition;
begin
  Result := CreateClassDefinition(ParentModule, ClassTypeName);

  GenerateProperties(Result, Schema);
end;

procedure TJSONSchemaImport.GenerateProperties(const ClassDefinition: TClassDefinition; const Schema: TSchema);

  function CheckPropertyType(const Prop: TPropertyDefinition; const Schema: TSchema): TTypeDefinition;
  begin
    if not Schema.ref.IsEmpty then
      Result := GetReferenceType(ClassDefinition, Schema, Prop.Name)
    else
      Result := GenerateTypeDefinition(ClassDefinition, Schema, Prop.Name);
  end;

  procedure DefineProperty(const PropertyName: String; const SchemaType: TSchema);
  begin
    var Prop := TPropertyDefinition.Create;
    Prop.Name := PropertyName;
    Prop.PropertyType := CheckPropertyType(Prop, SchemaType);

    if FormatPropertyName(Prop.Name) <> Prop.Name then
      Prop.AddFieldAttribute(Prop.Name);

    if not Assigned(Prop.PropertyType) then
      raise Exception.Create('Property type not found!');

    ClassDefinition.Properties.Add(Prop);
  end;

  procedure AppendProperties(const Properties: TMap<String, TSchema>);
  begin
    for var Pair in Properties do
      DefineProperty(Pair.Key, Pair.Value);
  end;

begin
  if not Schema.ref.IsEmpty then
    DefineProperty(GetReferenceName(Schema), FindReference(Schema));

  AppendProperties(Schema.Properties);
end;

function TJSONSchemaImport.GenerateTypeDefinition(const ParentModule: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
begin
  if not Schema.ref.IsEmpty then
    Result := GetReferenceType(ParentModule, Schema, TypeName)
  else
    case Schema.&type of
      TPropertyType.&array: Result := TTypeArrayDefinition.Create(ParentModule, GenerateTypeDefinition(ParentModule, Schema.items, TypeName));
      TPropertyType.boolean: Result := BooleanType;
      TPropertyType.null: Result := nil;
      TPropertyType.integer: Result := IntegerType;
      TPropertyType.number: Result := DoubleType;
      TPropertyType.&object: Result := GenerateClassDefinition(ParentModule, TypeName, Schema);
      TPropertyType.&string: Result := StringType;
      else
      begin
        var InnerClassDefinition := CreateClassDefinition(ParentModule, TypeName);

        for var AllOf in Schema.allOf do
          GenerateProperties(InnerClassDefinition, AllOf);

        Result := InnerClassDefinition;
      end;
    end;
end;

procedure TJSONSchemaImport.GenerateUnitDefinition(const UnitConfiguration: TUnitDefinitionConfiguration);
begin
  var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;
  var UnitDeclaration := CreateUnit(UnitConfiguration);

  for var UnitFile in UnitConfiguration.Files do
  begin
    FJSONSchema := Serializer.Deserialize(LoadFile(UnitFile), TypeInfo(TSchema)).AsType<TSchema>;
    var UnitClass := TClassDefinition.Create(UnitDeclaration);
    UnitClass.Name := UnitFile.UnitClassName;

    UnitDeclaration.Classes.Add(UnitClass);

    for var Definition in FJSONSchema.defs do
    begin
      var TypeDefinition := GenerateTypeDefinition(UnitDeclaration, Definition.Value, Definition.Key);

      if not TypeDefinition.IsClassDefinition then
        UnitDeclaration.TypeAlias.Add(CreateTypeAlias(UnitDeclaration, Definition.Key, TypeDefinition));
    end;

    GenerateProperties(UnitClass, FJSONSchema);

    FJSONSchema.Free;
  end;
end;

function TJSONSchemaImport.GetReferenceName(const Schema: TSchema): String;
begin
  var References := Schema.ref.Split(['/']);

  Result := References[High(References)];
end;

function TJSONSchemaImport.GetReferenceType(const ParentModule: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
begin
  Result := FindType(GetReferenceName(Schema), ParentModule);

  if not Assigned(Result) then
    Result := AddDelayedType(TypeName, ParentModule);
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
  FEnumarations := TObjectList<TTypeEnumeration>.Create;
end;

destructor TTypeModuleDefinition.Destroy;
begin
  FClasses.Free;

  FEnumarations.Free;

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

