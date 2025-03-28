﻿unit Blue.Print.Schema.Importer;

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

  TConfiguration = class
  private
    FUnitConfiguration: TArray<TUnitConfiguration>;
    FTypeChange: TArray<TTypeChangeConfig>;
    FOutputFolder: String;
    FSchemaFolder: String;
  public
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeChange: TArray<TTypeChangeConfig> read FTypeChange write FTypeChange;
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
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddXMLAttributeFixed(const Name, Value: String);
    procedure AddXMLAttributeValue;

    property Attributes: TList<String> read FAttributes write FAttributes;
    property IsArray: Boolean read FIsArray write FIsArray;
    property Name: String read FName write FName;
    property NeedGetFunction: Boolean read GetNeedGetFunction;
    property Optional: Boolean read GetOptional write FOptional;
    property TypeName: TTypeDefinition read FTypeName write FTypeName;
  end;

  TTypeDefinition = class
  private
    function GetIsClassDefinition: Boolean;
  protected
    FName: String;
  public
    function ResolveType: TTypeDefinition; virtual;

    property IsClassDefinition: Boolean read GetIsClassDefinition;
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
    FTypeName: String;
    FType: TTypeDefinition;
  public
    constructor Create(const Importer: TImporter; const TypeName: String);

    function ResolveType: TTypeDefinition; override;
  end;

  TUndefinedType = class(TTypeDefinition)
  private
    FUndefinedType: TTypeDefinition;
  public
    constructor Create(const TypeName: String);

    function ResolveType: TTypeDefinition; override;
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
    FUnits: TDictionary<String, TUnit>;
    FXMLBuildInType: TDictionary<String, TTypeDefinition>;

    function FindType(const TypeName: String): TTypeDefinition;
    function GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitConfiguration): TUnit;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddChangeType(const AliasName, TypeName: String);
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

constructor TImporter.Create;

  function AddType(const TypeName: String): TTypeDefinition;
  begin
    Result := TTypeDefinition.Create;
    Result.Name := TypeName;

    FBuildInType.Add(Result.Name, Result);
  end;

  function AddTypeAlias(const Alias: String; TypeName: TTypeDefinition): TTypeAlias;
  begin
    Result := TTypeAlias.Create;
    Result.Name := Alias;
    Result.TypeName := TypeName;
  end;

begin
  inherited;

  FBuildInType := TDictionary<String, TTypeDefinition>.Create;
  FChangeTypes := TDictionary<String, TTypeDefinition>.Create;
  FDelayedTypes := TDictionary<String, TTypeDelayed>.Create;
  FUnits := TObjectDictionary<String, TUnit>.Create([doOwnsValues]);
  FXMLBuildInType := TDictionary<String, TTypeDefinition>.Create;

  var StringType := AddType('String');
  var CardinalType := AddType('Cardinal');
  var IntegerType := AddType('Integer');
  var Int64Type := AddType('Int64');
  AddType('TObject');
  AddType('Undefined');
  var WordType := AddType('Word');

  FXMLBuildInType.Add('anyURI', StringType);
  FXMLBuildInType.Add('base64Binary', StringType);
  FXMLBuildInType.Add('boolean', AddType('Boolean'));
  FXMLBuildInType.Add('date', AddType('TDate'));
  FXMLBuildInType.Add('dateTime', AddType('TDateTime'));
  FXMLBuildInType.Add('decimal', AddType('Double'));
  FXMLBuildInType.Add('ID', StringType);
  FXMLBuildInType.Add('int', IntegerType);
  FXMLBuildInType.Add('long', Int64Type);
  FXMLBuildInType.Add('string', StringType);
  FXMLBuildInType.Add('time', AddType('TTime'));
  FXMLBuildInType.Add('token', StringType);
  FXMLBuildInType.Add('unsignedShort', WordType);
  FXMLBuildInType.Add('unsignedInt', CardinalType);
end;

destructor TImporter.Destroy;
begin
  FXMLBuildInType.Free;

  FBuildInType.Free;

  FChangeTypes.Free;

  FDelayedTypes.Free;

  FUnits.Free;

  inherited;
end;

function TImporter.FindType(const TypeName: String): TTypeDefinition;

  function FindInClasses(const ClassList: TList<TClassDefinition>; const TypeName: String): TTypeDefinition;
  begin
    Result := nil;

    for var ClassDefinition in ClassList do
    begin
      if ClassDefinition.Name = TypeName then
        Exit(ClassDefinition);

      Result := FindInClasses(ClassDefinition.Classes, TypeName);

      if Assigned(Result) then
        Exit;
    end;
  end;

begin
  Result := nil;

  if FBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  if FXMLBuildInType.TryGetValue(TypeName, Result) then
    Exit;

  for var UnitDefinition in FUnits.Values do
  begin
    Result := FindInClasses(UnitDefinition.Classes, TypeName);

    if Assigned(Result) then
      Exit;

    for var SimpleType in UnitDefinition.TypeAlias do
      if SimpleType.Name = TypeName then
        Exit(SimpleType);
  end;

  if FChangeTypes.TryGetValue(TypeName, Result) then
    Exit;
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

  function GetBaseType(SimpleType: IXMLTypeDef): String;
  begin
    while Assigned(SimpleType.BaseType) do
      SimpleType := SimpleType.BaseType as IXMLSimpleTypeDef;

    Result := ExtractLocalName(SimpleType.Name);
  end;

  function FindTypeName(&Type: IXMLTypeDef): TTypeDefinition;
  begin
    var TypeName := GetBaseType(&Type);

    Result := FindType(TypeName);

    if not Assigned(Result) then
      for var DelayedType in FDelayedTypes.Values do
        if DelayedType.FTypeName = TypeName then
          Result := DelayedType;

    if not Assigned(Result) then
    begin
      Result := TTypeDelayed.Create(Self, TypeName);

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

    function AddProperty(const Name: String; const &Type: IXMLTypeDef): TProperty;
    begin
      Result := TProperty.Create;
      Result.Name := Name;
      Result.TypeName := FindTypeName(&Type);

      ClassDefinition.AddProperty(Result);
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
        var NewProperty := AddProperty(Element.Name, Element.DataType);
        NewProperty.IsArray := (Element.MinOccurs <> NULL) and (Element.MaxOccurs > 1);
        NewProperty.Optional := AllPropertiesOptionals or (Element.MinOccurs <> NULL) and (Element.MinOccurs <= 0);

        if CanGenerateClass(Element) then
        begin
          var ComplexType := (Element.DataType as IXMLComplexTypeDef);

          if ComplexType.ElementDefs.Count = 0 then
            for var B := 0 to Pred(ComplexType.AttributeDefs.Count) do
            begin
              var Attribute := ComplexType.AttributeDefs[B];

              AddPropertyAttribute(NewProperty, Attribute);
              NewProperty.TypeName := FindTypeName(Attribute.DataType);
            end
          else
            Result.AddClassType(GenerateClassDefinition(ComplexType));
        end;
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
      var &Property := AddProperty(Attribute.Name, Attribute.DataType);

      AddPropertyAttribute(&Property, Attribute);
    end;
  end;

  function GenerateSimpleType(const SimpleType: IXMLSimpleTypeDef): TTypeAlias;
  begin
    Result := TTypeAlias.Create;
    Result.Name := SimpleType.Name;
    Result.TypeName := FindTypeName(SimpleType);
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

        UnitDeclaration.Classes.Add(ClassDefinition);
      end
      else if IsReferenceType(Element) then
      begin
        var ClassDefinition := TClassDefinition.Create;
        ClassDefinition.Name := Element.Name;
        ClassDefinition.InheritedFrom := FindTypeName(Element.DataType);

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
      if GetPropertyType(&Property).IsClassDefinition then
        Exit(True);
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

  function GetPropertyTypeName(const &Property: TProperty): String;
  begin
    var TypeName := GetPropertyType(&Property);

    Result := TypeName.Name;

    if TypeName.IsClassDefinition then
      Result := GetClassName(TypeName as TClassDefinition);

    if &Property.IsArray then
      Result := Format('TArray<%s>', [Result]);
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

      if CheckNeedDestructor(ClassDefinition) then
      begin
        AddLine('%spublic', [Ident]);

        AddLine('%s  destructor Destroy; override;', [Ident]);
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

    function GetClassImplementationName(ClassDefinition: TClassDefinition): String;
    begin
      Result := GetClassName(ClassDefinition);

      while Assigned(ClassDefinition.ParentClass) do
      begin
        Result := Format('%s.%s', [GetClassName(ClassDefinition.ParentClass), Result]);

        ClassDefinition := ClassDefinition.ParentClass;
      end;
    end;

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

          if &Property.IsArray and PropertyType.IsClassDefinition then
          begin
            AddLine('  for var AObject in %s do', [GetPropertyFieldName(&Property)]);
            AddLine('    AObject.Free;');

            AddLine;
          end
          else if PropertyType.IsClassDefinition then
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

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [UnitConfiguration.Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  var UsesList := 'Blue.Print.Types';

  for var AUnit in FUses do
  begin
    UsesList := UsesList + ', ' + AUnit.UnitConfiguration.Name;
  end;

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

constructor TProperty.Create;
begin
  FAttributes := TList<String>.Create;
end;

destructor TProperty.Destroy;
begin
  FAttributes.Free;

  inherited;
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

function TTypeDefinition.ResolveType: TTypeDefinition;
begin
  Result := Self;
end;

{ TTypeDelayed }

constructor TTypeDelayed.Create(const Importer: TImporter; const TypeName: String);
begin
  inherited Create;

  FImporter := Importer;
  FTypeName := TypeName;
end;

function TTypeDelayed.ResolveType: TTypeDefinition;
begin
  if not Assigned(FType) then
    FType := FImporter.FindType(FTypeName);

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
    FType := FImporter.FindType(FTypeName);

  if not Assigned(FType) then
    raise Exception.CreateFmt('Wrong type configuration %s - %s!', [FName, FTypeName]);

  Result := FType.ResolveType;
end;

end.

