unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema;

type
  TImporter = class;
  TTypeDefinition = class;

  TUnitConfiguration = class
  private
    FFileName: String;
    FName: String;
    FUnitClassName: String;
  public
    property FileName: String read FFileName write FFileName;
    property Name: String read FName write FName;
    property UnitClassName: String read FUnitClassName write FUnitClassName;
  end;

  TTypeChangeConfig = class
  private
    FAliasName: String;
    FTypeName: String;
  public
    property AliasName: String read FAliasName write FAliasName;
    property TypeName: String read FTypeName write FTypeName;
  end;

  TTypeExternalConfig = class
  private
    FName: String;
    FModuleName: String;
  public
    property ModuleName: String read FModuleName write FModuleName;
    property Name: String read FName write FName;
  end;

  TConfiguration = class
  private
    FUnitConfiguration: TArray<TUnitConfiguration>;
    FTypeChange: TArray<TTypeChangeConfig>;
    FOutputFolder: String;
    FSchemaFolder: String;
    FTypeExternal: TArray<TTypeExternalConfig>;
  public
    destructor Destroy; override;

    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeChange: TArray<TTypeChangeConfig> read FTypeChange write FTypeChange;
    property TypeExternal: TArray<TTypeExternalConfig> read FTypeExternal write FTypeExternal;
    property UnitConfiguration: TArray<TUnitConfiguration> read FUnitConfiguration write FUnitConfiguration;
  end;

  TProperty = class
  private
    FAttributes: TList<String>;
    FName: String;
    FOptional: Boolean;
    FTypeName: TTypeDefinition;
    FIsArray: Boolean;

    function GetNeedGetFunction: Boolean;
    function GetOptional: Boolean;
    function GetNeedAddFunction: Boolean;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddXMLAttributeFixed(const Name, Value: String);
    procedure AddXMLAttributeValue;
    procedure AddXMLValueAttribute;

    property Attributes: TList<String> read FAttributes write FAttributes;
    property IsArray: Boolean read FIsArray write FIsArray;
    property Name: String read FName write FName;
    property NeedAddFunction: Boolean read GetNeedAddFunction;
    property NeedGetFunction: Boolean read GetNeedGetFunction;
    property Optional: Boolean read GetOptional write FOptional;
    property TypeName: TTypeDefinition read FTypeName write FTypeName;
  end;

  TTypeDefinition = class
  private
    function GetIsClassDefinition: Boolean;
    function GetNeedDestructor: Boolean;
  protected
    FName: String;
  public
    function ResolveType: TTypeDefinition; virtual;

    property IsClassDefinition: Boolean read GetIsClassDefinition;
    property NeedDestructor: Boolean read GetNeedDestructor;
    property Name: String read FName write FName;
  end;

  TClassDefinition = class(TTypeDefinition)
  private
    FClasses: TList<TClassDefinition>;
    FProperties: TList<TProperty>;
    FParentClass: TClassDefinition;
    FInheritedFrom: TTypeDefinition;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddClassType(const ClassDefinition: TClassDefinition);
    procedure AddProperty(const &Property: TProperty);

    property Classes: TList<TClassDefinition> read FClasses;
    property InheritedFrom: TTypeDefinition read FInheritedFrom write FInheritedFrom;
    property ParentClass: TClassDefinition read FParentClass write FParentClass;
    property Properties: TList<TProperty> read FProperties write FProperties;
  end;

  TTypeChangeDefinition = class(TTypeDefinition)
  private
    FImporter: TImporter;
    FType: TTypeDefinition;
    FTypeName: String;
  public
    constructor Create(const Importer: TImporter; const AliasName, TypeName: String);

    function ResolveType: TTypeDefinition; override;
  end;

  TTypeAlias = class(TTypeDefinition)
  private
    FTypeName: TTypeDefinition;
  public
    function ResolveType: TTypeDefinition; override;

    property TypeName: TTypeDefinition read FTypeName write FTypeName;
  end;

  TTypeDelayed = class(TTypeDefinition)
  private
    FImporter: TImporter;
    FParentClass: TClassDefinition;
    FTypeName: String;
    FType: TTypeDefinition;
  public
    constructor Create(const Importer: TImporter; const TypeName: String; const ParentClass: TClassDefinition);

    function ResolveType: TTypeDefinition; override;
  end;

  TUndefinedType = class(TTypeDefinition)
  private
    FUndefinedType: TTypeDefinition;
  public
    constructor Create(const TypeName: String);

    function ResolveType: TTypeDefinition; override;
  end;

  TTypeExternal = class(TTypeDefinition)
  private
    FModuleName: String;
  public
    constructor Create(const ModuleName, TypeName: String);

    property ModuleName: String read FModuleName write FModuleName;
  end;

  TUnit = class
  private
    FClasses: TList<TClassDefinition>;
    FUses: TList<TUnit>;
    FTypeAlias: TList<TTypeAlias>;
    FUnitConfiguration: TUnitConfiguration;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddTypeAlias(const AType: TTypeAlias);
    procedure AddUses(const SchemaUnit: TUnit);
    procedure GenerateFile(const OutputFolder: String);

    property Classes: TList<TClassDefinition> read FClasses write FClasses;
    property TypeAlias: TList<TTypeAlias> read FTypeAlias;
    property UnitConfiguration: TUnitConfiguration read FUnitConfiguration write FUnitConfiguration;
  end;

  TImporter = class
  private
    FBuildInType: TDictionary<String, TTypeDefinition>;
    FChangeTypes: TDictionary<String, TTypeDefinition>;
    FConfiguration: TConfiguration;
    FDelayedTypes: TDictionary<String, TTypeDelayed>;
    FTypeExternal: TDictionary<String, TTypeDefinition>;
    FTypeAlias: TDictionary<String, TTypeDefinition>;
    FUnits: TDictionary<String, TUnit>;
    FXMLBuildInType: TDictionary<String, TTypeDefinition>;

    function FindType(const TypeName: String; const ParentClass: TClassDefinition): TTypeDefinition;
    function GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitConfiguration): TUnit;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddChangeType(const AliasName, TypeName: String);
    procedure AddTypeExternal(const ModuleName, TypeName: String);
    procedure Import;
    procedure LoadConfig(const FileName: String);

    property Configuration: TConfiguration read FConfiguration write FConfiguration;
  end;

implementation

uses System.SysUtils, System.Classes, System.IOUtils, System.Variants, XML.xmldom, Blue.Print.Serializer, Blue.Print.Types;

{ TImporter }

procedure TImporter.AddChangeType(const AliasName, TypeName: String);
begin
  FChangeTypes.Add(AliasName, TTypeChangeDefinition.Create(Self, AliasName, TypeName));
end;

procedure TImporter.AddTypeExternal(const ModuleName, TypeName: String);
begin
  FTypeExternal.Add(TypeName, TTypeExternal.Create(ModuleName, TypeName));
end;

constructor TImporter.Create;

  function AddTypeAlias(const Alias: String; TypeName: TTypeDefinition): TTypeAlias;
  begin
    Result := TTypeAlias.Create;
    Result.Name := Alias;
    Result.TypeName := TypeName;

    FTypeAlias.Add(Alias, Result);
  end;

  function AddBuildInType(const TypeName: String; const TypeDefinition: TTypeDefinition): TTypeDefinition;
  begin
    Result := TypeDefinition;

    FXMLBuildInType.Add(TypeName, TypeDefinition);
  end;

  function AddType(const TypeName: String): TTypeDefinition;
  begin
    Result := TTypeDefinition.Create;
    Result.Name := 'System.' + TypeName;

    FBuildInType.Add(Result.Name, Result);

    AddTypeAlias(TypeName, Result);
  end;

begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create;
  FChangeTypes := TDictionary<String, TTypeDefinition>.Create;
  FDelayedTypes := TDictionary<String, TTypeDelayed>.Create;
  FTypeAlias := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues]);
  FTypeExternal := TObjectDictionary<String, TTypeDefinition>.Create([doOwnsValues]);
  FUnits := TObjectDictionary<String, TUnit>.Create([doOwnsValues]);
  FXMLBuildInType := TDictionary<String, TTypeDefinition>.Create;

  var StringType := AddType('String');
  var CardinalType := AddType('Cardinal');
  var IntegerType := AddType('Integer');
  var Int64Type := AddType('Int64');
  AddType(TObject.ClassName);
  AddType('Undefined');
  var WordType := AddType('Word');

  AddBuildInType('anyURI', StringType);
  AddBuildInType('base64Binary', StringType);
  AddBuildInType('boolean', AddType('Boolean'));
  AddBuildInType('date', AddType('TDate'));
  AddBuildInType('dateTime', AddType('TDateTime'));
  AddBuildInType('decimal', AddType('Double'));
  AddBuildInType('ID', StringType);
  AddBuildInType('int', IntegerType);
  AddBuildInType('long', Int64Type);
  AddBuildInType('string', StringType);
  AddBuildInType('time', AddType('TTime'));
  AddBuildInType('token', StringType);
  AddBuildInType('unsignedShort', WordType);
  AddBuildInType('unsignedInt', CardinalType);
end;

destructor TImporter.Destroy;
begin
  FXMLBuildInType.Free;

  FBuildInType.Free;

  FChangeTypes.Free;

  FDelayedTypes.Free;

  FTypeExternal.Free;

  FTypeAlias.Free;

  FUnits.Free;

  inherited;
end;

function TImporter.FindType(const TypeName: String; const ParentClass: TClassDefinition): TTypeDefinition;

  function FindInClassList(const ClassList: TList<TClassDefinition>; const TypeName: String): TTypeDefinition;
  begin
    Result := nil;

    for var ClassDefinition in ClassList do
      if ClassDefinition.Name = TypeName then
        Exit(ClassDefinition);
  end;

  function FindInClasses(const ClassList: TList<TClassDefinition>; const TypeName: String): TTypeDefinition;
  begin
    Result := FindInClassList(ClassList, TypeName);

    if not Assigned(Result) then
      for var ClassDefinition in ClassList do
      begin
        Result := FindInClasses(ClassDefinition.Classes, TypeName);

        if Assigned(Result) then
          Exit;
      end;
  end;

  function FindInClass(ClassDefinition: TClassDefinition; const TypeName: String): TTypeDefinition;
  begin
    repeat
      Result := FindInClassList(ClassDefinition.Classes, TypeName);

      ClassDefinition := ClassDefinition.ParentClass;
    until Assigned(Result) or not Assigned(ClassDefinition);
  end;

begin
  Result := nil;

  if FTypeExternal.TryGetValue(TypeName, Result) then
    Exit;

  if FTypeAlias.TryGetValue(TypeName, Result) then
    Exit;

  if FBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  if FXMLBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  if FChangeTypes.TryGetValue(TypeName, Result) then
    Exit;

  if Assigned(ParentClass) then
    Result := FindInClass(ParentClass, TypeName);

  if not Assigned(Result) then
    for var UnitDefinition in FUnits.Values do
    begin
      Result := FindInClasses(UnitDefinition.Classes, TypeName);

      if Assigned(Result) then
        Exit;

      for var SimpleType in UnitDefinition.TypeAlias do
        if SimpleType.Name = TypeName then
          Exit(SimpleType);
    end;
end;

function TImporter.GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitConfiguration): TUnit;
var
  UnitDeclaration: TUnit absolute Result;

  function FindUnitConfiguration(const FileName: String): TUnitConfiguration;
  begin
    for var Configuration in Configuration.UnitConfiguration do
      if Configuration.FileName = FileName then
        Exit(Configuration);

    raise Exception.CreateFmt('Schema file without unit configuration %s!', [ExtractFileName(FileName)]);
  end;

  procedure ProcessReferences(const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      UnitDeclaration.AddUses(GenerateUnit(Reference.SchemaRef, FindUnitConfiguration(Reference.SchemaLocation)));
    end;
  end;

  function GetBaseType(TypeDefinition: IXMLTypeDef): String;
  begin
    if not TypeDefinition.IsComplex then
      while Assigned(TypeDefinition.BaseType) do
        TypeDefinition := TypeDefinition.BaseType as IXMLSimpleTypeDef;

    Result := ExtractLocalName(TypeDefinition.Name);
  end;

  function FindTypeName(&Type: IXMLTypeDef; const ParentClass: TClassDefinition): TTypeDefinition;
  begin
    var TypeName := &Type.Name;

    Result := FindType(TypeName, ParentClass);

    if not Assigned(Result) then
    begin
      TypeName := GetBaseType(&Type);

      Result := FindType(TypeName, ParentClass);
    end;

    if not Assigned(Result) then
      for var DelayedType in FDelayedTypes.Values do
        if DelayedType.FTypeName = TypeName then
          Result := DelayedType;

    if not Assigned(Result) then
    begin
      Result := TTypeDelayed.Create(Self, TypeName, ParentClass);

      FDelayedTypes.Add(TypeName, Result as TTypeDelayed);
    end;
  end;

  function IsReferenceType(const Element: IXMLElementDef): Boolean;
  begin
    Result := Assigned(Element.Ref) or Assigned(Element.AttributeNodes.FindNode('type'));
  end;

  function CanGenerateClass(const Element: IXMLElementDef): Boolean;
  begin
    Result := Element.DataType.IsComplex and not IsReferenceType(Element);
  end;

  function GenerateClassDefinition(const ComplexType: IXMLComplexTypeDef): TClassDefinition;
  var
    ClassDefinition: TClassDefinition absolute Result;

    function AddProperty(const Name: String): TProperty;
    begin
      for var &Property in ClassDefinition.Properties do
        if &Property.Name = Name then
          Exit(&Property);

      Result := TProperty.Create;
      Result.Name := Name;

      ClassDefinition.AddProperty(Result);
    end;

    function AddPropertyWithType(const Name: String; const &Type: IXMLTypeDef): TProperty;
    begin
      Result := AddProperty(Name);
      Result.TypeName := FindTypeName(&Type, ClassDefinition);
    end;

    procedure AddPropertyAttribute(const &Property: TProperty; const Attribute: IXMLAttributeDef);
    begin
      if Attribute.Fixed = NULL then
        &Property.AddXMLAttributeValue
      else
        &Property.AddXMLAttributeFixed(Attribute.Name, Attribute.Fixed);

      &Property.Optional := (Attribute.Use <> NULL) and (Attribute.Use = 'optional');
    end;

    procedure GenerateProperties(const ElementDefs: IXMLElementDefs; const AllPropertiesOptionals: Boolean);
    begin
      for var A := 0 to Pred(ElementDefs.Count) do
      begin
        var Element := ElementDefs[A];
        var NewProperty := AddProperty(Element.Name);
        NewProperty.IsArray := Element.IsRepeating;
        NewProperty.Optional := AllPropertiesOptionals or (Element.MinOccurs <> NULL) and (Element.MinOccurs <= 0);
        var PropertyType := Element.DataType;

        if CanGenerateClass(Element) then
        begin
          var ComplexType := (Element.DataType as IXMLComplexTypeDef);

          if (ComplexType.ElementDefs.Count = 0) and (ComplexType.AttributeDefs.Count = 1) then
            for var B := 0 to Pred(ComplexType.AttributeDefs.Count) do
            begin
              var Attribute := ComplexType.AttributeDefs[B];
              PropertyType := Attribute.DataType;

              AddPropertyAttribute(NewProperty, Attribute);
            end
          else
          begin
            PropertyType := ComplexType;

            Result.AddClassType(GenerateClassDefinition(ComplexType));
          end;
        end;

        NewProperty.TypeName := FindTypeName(PropertyType, ClassDefinition);
      end;
    end;

    procedure CheckCompositor(const ElementCompositors: IXMLElementCompositors);
    begin
      for var A := 0 to Pred(ElementCompositors.Count) do
      begin
        var Compositor := ElementCompositors[A];

        GenerateProperties(Compositor.ElementDefs, True);

        CheckCompositor(Compositor.Compositors);
      end;
    end;

  begin
    Result := TClassDefinition.Create;
    Result.Name := ComplexType.Name;

    GenerateProperties(ComplexType.ElementDefs, False);

    CheckCompositor(ComplexType.ElementCompositors);

    for var A := 0 to Pred(ComplexType.AttributeDefs.Count) do
    begin
      var Attribute := ComplexType.AttributeDefs[A];
      var &Property := AddPropertyWithType(Attribute.Name, Attribute.DataType);

      AddPropertyAttribute(&Property, Attribute);
    end;

    if Assigned(ComplexType.BaseType) then    
    begin
      var &Property := AddProperty('Value');
      &Property.TypeName := FindTypeName(ComplexType.BaseType, ClassDefinition);

      &Property.AddXMLValueAttribute;
    end;
  end;

  function GenerateSimpleType(const SimpleType: IXMLSimpleTypeDef): TTypeAlias;
  begin
    Result := TTypeAlias.Create;
    Result.Name := SimpleType.Name;
    Result.TypeName := FindTypeName(SimpleType, nil);
  end;

begin
  if not FUnits.TryGetValue(UnitConfiguration.FileName, Result) then
  begin
    Result := TUnit.Create;
    Result.UnitConfiguration := UnitConfiguration;

    FUnits.Add(UnitConfiguration.FileName, UnitDeclaration);

    ProcessReferences(Definition.SchemaIncludes);

    ProcessReferences(Definition.SchemaImports);

    for var A := 0 to Pred(Definition.SimpleTypes.Count) do
      UnitDeclaration.AddTypeAlias(GenerateSimpleType(Definition.SimpleTypes[A]));

    for var A := 0 to Pred(Definition.ComplexTypes.Count) do
      UnitDeclaration.Classes.Add(GenerateClassDefinition(Definition.ComplexTypes[A]));

    for var A := 0 to Pred(Definition.ElementDefs.Count) do
    begin
      var Element := Definition.ElementDefs[A];

      if CanGenerateClass(Element) then
      begin
        var ClassDefinition := GenerateClassDefinition(Element.DataType as IXMLComplexTypeDef);
        ClassDefinition.Name := UnitConfiguration.UnitClassName;

        if UnitConfiguration.UnitClassName.IsEmpty then
          raise Exception.CreateFmt('Schema file %s need a class name in the configuration file!', [UnitConfiguration.FileName]);

        UnitDeclaration.Classes.Add(ClassDefinition);
      end
      else if IsReferenceType(Element) then
      begin
        var ClassDefinition := TClassDefinition.Create;
        ClassDefinition.Name := Element.Name;
        ClassDefinition.InheritedFrom := FindTypeName(Element.DataType, ClassDefinition);

        UnitDeclaration.Classes.Add(ClassDefinition);
      end;
    end;
  end;
end;

procedure TImporter.Import;
begin
  for var UnitConfiguration in Configuration.UnitConfiguration do
  begin
    var SchemaFile := Format('%s\%s', [Configuration.SchemaFolder, UnitConfiguration.FileName]);

    var Schema := LoadXMLSchema(SchemaFile);

    GenerateUnit(Schema.SchemaDef, UnitConfiguration);

    for var SchemaUnit in FUnits.Values do
      SchemaUnit.GenerateFile(Configuration.OutputFolder);
  end;
end;

procedure TImporter.LoadConfig(const FileName: String);
begin
  if TFile.Exists(FileName) then
  begin
    var Serializer: IBluePrintSerializer := TBluePrintJsonSerializer.Create;

    Configuration := Serializer.Deserialize(TFile.ReadAllText(FileName), TypeInfo(TConfiguration)).AsType<TConfiguration>;

    for var TypeChange in Configuration.TypeChange do
      AddChangeType(TypeChange.AliasName, TypeChange.TypeName);

    for var TypeExternal in Configuration.TypeExternal do
      AddTypeExternal(TypeExternal.ModuleName, TypeExternal.Name);
  end;
end;

{ TUnit }

procedure TUnit.AddTypeAlias(const AType: TTypeAlias);
begin
  TypeAlias.Add(AType);
end;

procedure TUnit.AddUses(const SchemaUnit: TUnit);
begin
  FUses.Add(SchemaUnit);
end;

constructor TUnit.Create;
begin
  inherited;

  FClasses := TObjectList<TClassDefinition>.Create;
  FTypeAlias := TObjectList<TTypeAlias>.Create;
  FUses := TList<TUnit>.Create;
end;

destructor TUnit.Destroy;
begin
  FClasses.Free;

  FTypeAlias.Free;

  FUses.Free;

  inherited;
end;

procedure TUnit.GenerateFile(const OutputFolder: String);
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

  function GetStoredFunctionName(const &Property: TProperty): String;
  begin
    Result := Format('Get%sStored', [&Property.Name]);
  end;

  function CheckReservedName(const Name: String): String;
  const
    SPECIAL_NAMES: array[0..1] of String = ('type', 'mod');

  begin
    Result := Name;

    for var SpecialName in SPECIAL_NAMES do
      if CompareText(Name, SpecialName) = 0 then
        Exit('&' + Result);
  end;

  function GetClassName(const ClassDefinition: TClassDefinition): String;
  begin
    Result := ClassDefinition.Name;

    if Assigned(ClassDefinition.ParentClass) then
      Result := 'T' + Result.Substring(0, 1).ToUpper + Result.Substring(1);
  end;

  function GetPropertyType(const &Property: TProperty): TTypeDefinition;
  begin
    Result := &Property.TypeName.ResolveType;
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

  function GetPropertyFieldName(const &Property: TProperty): String;
  begin
    Result := 'F' + &Property.Name;
  end;

  function GetPropertyGetFunction(const &Property: TProperty): String;
  begin
    if &Property.NeedGetFunction then
      Result := 'Get' + &Property.Name
    else
      Result := GetPropertyFieldName(&Property);
  end;

  function GetTypeName(const &Property: TProperty): String;
  begin
    var TypeName := GetPropertyType(&Property);

    Result := TypeName.Name;

    if TypeName.IsClassDefinition then
      Result := GetClassImplementationName(TypeName as TClassDefinition);
  end;

  function GetPropertyTypeName(const &Property: TProperty): String;
  begin
    Result := GetTypeName(&Property);

    if &Property.IsArray then
      Result := Format('TArray<%s>', [Result]);
  end;

  function GetAddFuntionName(const &Property: TProperty): String;
  begin
    Result := 'Add' + &Property.Name;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

    function GetStoredPropertyDeclaration(const &Property: TProperty): String;
    begin
      Result := EmptyStr;

      if &Property.Optional then
        Result := Format(' stored %s', [GetStoredFunctionName(&Property)]);
    end;

    function GetInheritence: String;
    begin
      if Assigned(ClassDefinition.InheritedFrom) then
        Result := Format('(%s)', [ClassDefinition.InheritedFrom.Name])
      else
        Result := EmptyStr;
    end;

    function HasArrayProperty(const ClassDefinition: TClassDefinition): Boolean;
    begin
      Result := False;

      for var &Property in ClassDefinition.Properties do
        if &Property.IsArray then
          Exit(True);
    end;

  begin
    AddLine('%s%s = class%s', [Ident, GetClassName(ClassDefinition), GetInheritence]);

    if not ClassDefinition.Classes.IsEmpty then
    begin
      AddLine('%spublic type', [Ident]);

      for var SubClass in ClassDefinition.Classes do
      begin
        GenerateClassDeclaration(Ident + '  ', SubClass);

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

      if CheckNeedDestructor(ClassDefinition) or HasArrayProperty(ClassDefinition) then
      begin
        AddLine('%spublic', [Ident]);

        if CheckNeedDestructor(ClassDefinition) then
          AddLine('%s  destructor Destroy; override;', [Ident]);


        if CheckNeedDestructor(ClassDefinition) and HasArrayProperty(ClassDefinition) then
          AddLine;

        for var &Property in ClassDefinition.Properties do
          if &Property.NeedAddFunction then
            AddLine('%s  function %s: %s;', [Ident, GetAddFuntionName(&Property), GetTypeName(&Property)]);
      end;

      AddLine('%spublished', [Ident]);

      for var &Property in ClassDefinition.Properties do
      begin
        for var Attribute in &Property.Attributes do
          AddLine('%:s  [%s]', [Ident, Attribute]);

        AddLine('%s  property %s: %s read %s write %s%s;', [Ident, CheckReservedName(&Property.Name), GetPropertyTypeName(&Property), GetPropertyGetFunction(&Property), GetPropertyFieldName(&Property), GetStoredPropertyDeclaration(&Property)]);
      end;
    end;

    AddLine('%send;', [Ident]);
  end;

  function HasOptionalProperty(const ClassDefinition: TClassDefinition): Boolean;
  begin
    Result := False;

    for var &Property in ClassDefinition.Properties do
      if &Property.Optional then
        Exit(True);
  end;

  function GetOptionalValue(const &Property: TProperty): String;
  begin
    if GetPropertyTypeName(&Property) = 'String' then
      Result := Format('not %s.IsEmpty', [GetPropertyFieldName(&Property)])
    else if GetPropertyType(&Property).IsClassDefinition then
      Result := Format('Assigned(%s)', [GetPropertyFieldName(&Property)])
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

          if &Property.IsArray and PropertyType.NeedDestructor then
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
        if &Property.NeedGetFunction then
        begin
          var PropertyFieldName := GetPropertyFieldName(&Property);
          var PropertyTypeName := GetPropertyTypeName(&Property);

          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetPropertyGetFunction(&Property), PropertyTypeName]);

          AddLine('begin');

          AddLine('  if not Assigned(%s) then', [PropertyFieldName]);

          AddLine('    %s := %s.Create;', [PropertyFieldName, PropertyTypeName]);

          AddLine;

          AddLine('  Result := %s;', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end
        else if &Property.NeedAddFunction then
        begin
          var PropertyFieldName := GetPropertyFieldName(&Property);
          var PropertyTypeName := GetTypeName(&Property);

          AddLine('function %s.%s: %s;', [GetClassImplementationName(ClassDefinition), GetAddFuntionName(&Property), PropertyTypeName]);

          AddLine('begin');

          AddLine('  Result := %s.Create;', [PropertyTypeName]);

          AddLine;

          AddLine('  %0:s := %0:s + [Result];', [PropertyFieldName]);

          AddLine('end;');

          AddLine;
        end;

      for var &Property in ClassDefinition.Properties do
        if &Property.Optional then
        begin
          AddLine('function %s.%s: Boolean;', [GetClassImplementationName(ClassDefinition), GetStoredFunctionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s;', [GetOptionalValue(&Property)]);

          AddLine('end;');

          AddLine;
        end;
    end;

    for var SubClassDefinition in ClassDefinition.Classes do
      GenerateClassImplementation(SubClassDefinition);
  end;

  function GetAllExternalModules: TArray<String>;
  var
    Return: TDictionary<String, String>;

    procedure CheckClasses(const Classes: TList<TClassDefinition>);
    begin
      for var ClassDefinition in Classes do
      begin
        for var &Property in ClassDefinition.Properties do
        begin
          var PropertyType := GetPropertyType(&Property);

          if PropertyType is TTypeExternal then
            Return.AddOrSetValue(TTypeExternal(PropertyType).ModuleName, EmptyStr);
        end;

        CheckClasses(ClassDefinition.Classes);
      end;
    end;

  begin
    Return := TDictionary<String, String>.Create;

    CheckClasses(Classes);

    for var TypeAlias in TypeAlias do
      if TypeAlias.ResolveType is TTypeExternal then
        Return.AddOrSetValue(TTypeExternal(TypeAlias.ResolveType).ModuleName, EmptyStr);

    Result := Return.Keys.ToArray;

    Return.Free;
  end;

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [UnitConfiguration.Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  AddLine('{$M+}');

  AddLine;

  var UsesList := 'Blue.Print.Types';

  for var AUnit in FUses do
    UsesList := UsesList + ', ' + AUnit.UnitConfiguration.Name;

  for var ModuleName in GetAllExternalModules do
    UsesList := UsesList + ', ' + ModuleName;

  AddLine('// File generated from %s;', [UnitConfiguration.FileName]);

  AddLine;

  AddLine('uses %s;', [UsesList]);

  AddLine;

  if not TypeAlias.IsEmpty or not Classes.IsEmpty then
    AddLine('type');

  if not TypeAlias.IsEmpty then
  begin
    AddLine('  // Forward type alias');

    for var TypeAlias in TypeAlias do
      AddLine('  %s = %s;', [TypeAlias.Name, TypeAlias.ResolveType.Name]);

    AddLine;
  end;

  if not Classes.IsEmpty then
  begin
    AddLine('  // Forward class declaration');

    for var AClass in Classes do
      AddLine('  %s = class;', [GetClassName(AClass)]);

    AddLine;

    for var AClass in Classes do
    begin
      GenerateClassDeclaration('  ', AClass);

      AddLine;
    end;
  end;

  AddLine('implementation');

  AddLine;

  AddLine('uses System.SysUtils;');

  AddLine;

  for var ClassDefinition in Classes do
    GenerateClassImplementation(ClassDefinition);

  AddLine('end.');

  UnitDefinition.SaveToFile(Format('%s\%s.pas', [OutputFolder, UnitConfiguration.Name]), TEncoding.UTF8);
end;

{ TClassDefinition }

procedure TClassDefinition.AddClassType(const ClassDefinition: TClassDefinition);
begin
  ClassDefinition.ParentClass := Self;

  FClasses.Add(ClassDefinition);
end;

procedure TClassDefinition.AddProperty(const &Property: TProperty);
begin
  FProperties.Add(&Property);
end;

constructor TClassDefinition.Create;
begin
  inherited;

  FClasses := TObjectList<TClassDefinition>.Create;
  FProperties := TObjectList<TProperty>.Create;
end;

destructor TClassDefinition.Destroy;
begin
  FClasses.Free;

  FProperties.Free;

  inherited;
end;

{ TProperty }

procedure TProperty.AddXMLAttributeFixed(const Name, Value: String);
begin
  Attributes.Add(Format('XMLAttribute(''%s'', ''%s'')', [Name, value]));
end;

procedure TProperty.AddXMLAttributeValue;
begin
  Attributes.Add('XMLAttributeValue');
end;

procedure TProperty.AddXMLValueAttribute;
begin
  Attributes.Add('XMLValue');
end;

constructor TProperty.Create;
begin
  FAttributes := TList<String>.Create;
end;

destructor TProperty.Destroy;
begin
  FAttributes.Free;

  inherited;
end;

function TProperty.GetNeedAddFunction: Boolean;
begin
  Result := IsArray and TypeName.IsClassDefinition;
end;

function TProperty.GetNeedGetFunction: Boolean;
begin
  Result := TypeName.IsClassDefinition and not IsArray;
end;

function TProperty.GetOptional: Boolean;
begin
  Result := FOptional and not TypeName.IsClassDefinition;
end;

{ TTypeDefinition }

function TTypeDefinition.GetIsClassDefinition: Boolean;
begin
  Result := ResolveType is TClassDefinition;
end;

function TTypeDefinition.GetNeedDestructor: Boolean;
begin
  Result := IsClassDefinition or (Name = TObject.ClassName);
end;

function TTypeDefinition.ResolveType: TTypeDefinition;
begin
  Result := Self;
end;

{ TTypeDelayed }

constructor TTypeDelayed.Create(const Importer: TImporter; const TypeName: String; const ParentClass: TClassDefinition);
begin
  inherited Create;

  FImporter := Importer;
  FParentClass := ParentClass;
  FTypeName := TypeName;
end;

function TTypeDelayed.ResolveType: TTypeDefinition;
begin
  if not Assigned(FType) then
    FType := FImporter.FindType(FTypeName, FParentClass);

  if not Assigned(FType) then
    FType := TUndefinedType.Create(FTypeName);

  Result := FType.ResolveType;
end;

{ TUndefinedType }

constructor TUndefinedType.Create(const TypeName: String);
begin
  inherited Create;

  FName := TypeName;
  FUndefinedType := TTypeDefinition.Create;
  FUndefinedType.Name := Format('Undefined { %s }', [FName]);
end;

function TUndefinedType.ResolveType: TTypeDefinition;
begin
  Result := FUndefinedType;
end;

{ TTypeAlias }

function TTypeAlias.ResolveType: TTypeDefinition;
begin
  Result := TypeName.ResolveType;
end;

{ TTypeChangeDefinition }

constructor TTypeChangeDefinition.Create(const Importer: TImporter; const AliasName, TypeName: String);
begin
  inherited Create;

  FImporter := Importer;
  FName := AliasName;
  FTypeName := TypeName;
end;

function TTypeChangeDefinition.ResolveType: TTypeDefinition;
begin
  if not Assigned(FType) then
    FType := FImporter.FindType(FTypeName, nil);

  if not Assigned(FType) then
    raise Exception.CreateFmt('Wrong type configuration %s - %s!', [FName, FTypeName]);

  Result := FType.ResolveType;
end;

{ TConfiguration }

destructor TConfiguration.Destroy;
begin
  for var AUnit in FUnitConfiguration do
    AUnit.Free;

  for var TypeChange in FTypeChange do
    TypeChange.Free;

  for var TypeExternal in FTypeExternal do
    TypeExternal.Free;

  inherited;
end;

{ TTypeExternal }

constructor TTypeExternal.Create(const ModuleName, TypeName: String);
begin
  inherited Create;

  FModuleName := ModuleName;
  Name := TypeName;
end;

end.

