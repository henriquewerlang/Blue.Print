unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema;

type
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

  TTypeChange = class
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
    FTypeChange: TArray<TTypeChange>;
    FOutputFolder: String;
    FSchemaFolder: String;
  public
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFolder: String read FSchemaFolder write FSchemaFolder;
    property TypeChange: TArray<TTypeChange> read FTypeChange write FTypeChange;
    property UnitConfiguration: TArray<TUnitConfiguration> read FUnitConfiguration write FUnitConfiguration;
  end;

  TProperty = class
  private
    FAttributes: TList<String>;
    FName: String;
    FTypeName: String;
    FOptional: Boolean;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddXMLAttributeFixed(const Name, Value: String);
    procedure AddXMLAttributeValue;

    property Attributes: TList<String> read FAttributes write FAttributes;
    property Name: String read FName write FName;
    property Optional: Boolean read FOptional write FOptional;
    property TypeName: String read FTypeName write FTypeName;
  end;

  TClassDefinition = class
  private
    FName: String;
    FClasses: TList<TClassDefinition>;
    FProperties: TList<TProperty>;
    FParentClass: TClassDefinition;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddClassType(const ClassDefinition: TClassDefinition);
    procedure AddProperty(const &Property: TProperty);

    property Classes: TList<TClassDefinition> read FClasses;
    property Name: String read FName write FName;
    property ParentClass: TClassDefinition read FParentClass write FParentClass;
    property Properties: TList<TProperty> read FProperties write FProperties;
  end;

  TTypeAlias = class
  private
    FName: String;
    FTypeName: String;
  public
    property Name: String read FName write FName;
    property TypeName: String read FTypeName write FTypeName;
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

    procedure AddTypeAlias(const TypeAlias: TTypeAlias);
    procedure AddUses(const SchemaUnit: TUnit);
    procedure GenerateFile(const OutputFolder: String);

    property Classes: TList<TClassDefinition> read FClasses write FClasses;
    property UnitConfiguration: TUnitConfiguration read FUnitConfiguration write FUnitConfiguration;
  end;

  TImporter = class
  private
    FBuildInType: TDictionary<String, String>;
    FChangeType: TDictionary<String, String>;
    FUnits: TDictionary<String, TUnit>;
    FConfiguration: TConfiguration;

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
  FChangeType.Add(AliasName, TypeName);
end;

constructor TImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, String>.Create;
  FChangeType := TDictionary<String, String>.Create;
  FUnits := TObjectDictionary<String, TUnit>.Create([doOwnsValues]);

  FBuildInType.Add('string', 'String');
  FBuildInType.Add('boolean', 'Boolean');
  FBuildInType.Add('decimal', 'Double');
  FBuildInType.Add('dateTime', 'TDateTime');
  FBuildInType.Add('date', 'TDate');
  FBuildInType.Add('ID', 'String');
  FBuildInType.Add('time', 'TTime');
  FBuildInType.Add('base64Binary', 'String');
  FBuildInType.Add('anyURI', 'String');
end;

destructor TImporter.Destroy;
begin
  FBuildInType.Free;

  FChangeType.Free;

  FUnits.Free;

  inherited;
end;

function TImporter.GenerateUnit(const Definition: IXMLSchemaDef; const UnitConfiguration: TUnitConfiguration): TUnit;
var
  SchemaUnit: TUnit absolute Result;

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

      SchemaUnit.AddUses(GenerateUnit(Reference.SchemaRef, FindUnitConfiguration(Reference.SchemaLocation)));
    end;
  end;

  function FindTypeAlias(const XSDTypeName: String; var TypeName: String): Boolean;
  begin
    Result := False;

    for var SimpleType in SchemaUnit.FTypeAlias do
      if SimpleType.Name = XSDTypeName then
      begin
        TypeName := SimpleType.TypeName;

        Exit(True);
      end;
  end;

  function GetBaseType(SimpleType: IXMLTypeDef): String;
  begin
    while Assigned(SimpleType.BaseType) do
      SimpleType := SimpleType.BaseType as IXMLSimpleTypeDef;

    Result := ExtractLocalName(SimpleType.Name);
  end;

  function FindTypeName(&Type: IXMLTypeDef): String;
  begin
    Result := GetBaseType(&Type);

    if FBuildInType.ContainsKey(Result) then
      Result := FBuildInType[Result]
    else if FindTypeAlias(Result, Result) then
    else if FChangeType.ContainsKey(Result) then
      Result := FChangeType[Result]
    else if &Type.IsComplex then
      Result := 'T' + Result
    else
      Result := 'Undefined; //Type not found ' + &Type.Name
  end;

  function GenerateSchemaClass(const ComplexType: IXMLComplexTypeDef): TClassDefinition;
  var
    ClassDefinition: TClassDefinition absolute Result;

    function AddProperty(const Name: String; const &Type: IXMLTypeDef): TProperty;
    begin
      Result := TProperty.Create;
      Result.Name := Name;
      Result.TypeName := FindTypeName(&Type);

      ClassDefinition.AddProperty(Result);
    end;

    procedure GenerateProperties(const ElementDefs: IXMLElementDefs; const AllPropertiesOptionals: Boolean);
    begin
      for var A := 0 to Pred(ElementDefs.Count) do
      begin
        var Element := ElementDefs[A];

        if Element.DataType.IsComplex and not Assigned(Element.Ref) and not Assigned(Element.AttributeNodes.FindNode('type')) then
          Result.AddClassType(GenerateSchemaClass(Element.DataType as IXMLComplexTypeDef));

        AddProperty(Element.Name, Element.DataType).Optional := AllPropertiesOptionals or (Element.MinOccurs <> NULL) and (Element.MinOccurs <= 0);
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

      if Attribute.Fixed = NULL then
        &Property.AddXMLAttributeValue
      else
        &Property.AddXMLAttributeFixed(Attribute.Name, Attribute.Fixed);

      &Property.Optional := (Attribute.Use <> NULL) and (Attribute.Use = 'optional');
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

    FUnits.Add(UnitConfiguration.FileName, SchemaUnit);

    for var A := 0 to Pred(Definition.ComplexTypes.Count) do
      SchemaUnit.Classes.Add(GenerateSchemaClass(Definition.ComplexTypes[A]));

    for var A := 0 to Pred(Definition.SimpleTypes.Count) do
      SchemaUnit.AddTypeAlias(GenerateSimpleType(Definition.SimpleTypes[A]));

    ProcessReferences(Definition.SchemaIncludes);

    ProcessReferences(Definition.SchemaImports);
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

procedure TUnit.AddTypeAlias(const TypeAlias: TTypeAlias);
begin
  FTypeAlias.Add(TypeAlias);
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

    if not ClassDefinition.Name.StartsWith('TT') then
      Result := 'T' + Result;
  end;

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

    function GetStoredPropertyDeclaration(const &Property: TProperty): String;
    begin
      Result := EmptyStr;

      if &Property.Optional then
        Result := Format(' stored %s', [GetStoredFunctionName(&Property)]);
    end;

  begin
    AddLine('%s%s = class', [Ident, GetClassName(ClassDefinition)]);

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
        AddLine('%s  F%s: %s;', [Ident, &Property.Name, &Property.TypeName]);

      for var &Property in ClassDefinition.Properties do
        if &Property.Optional then
          AddLine('%s  function %s: Boolean;', [Ident, GetStoredFunctionName(&Property)]);

      AddLine('%spublic', [Ident]);

      for var &Property in ClassDefinition.Properties do
      begin
        for var Attribute in &Property.Attributes do
          AddLine('%:s  [%s]', [Ident, Attribute]);

        AddLine('%0:s  property %1:s: %2:s read F%3:s write F%3:s%4:s;', [Ident, CheckReservedName(&Property.Name), &Property.TypeName, &Property.Name, GetStoredPropertyDeclaration(&Property)]);
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
    if &Property.TypeName = 'String' then
      Result := Format('not F%s.IsEmpty', [&Property.Name])
    else if &Property.TypeName.StartsWith('T') then
      Result := Format('Assigned(F%s)', [&Property.Name])
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
    if HasOptionalProperty(ClassDefinition) then
    begin
      AddLine('{ %s }', [GetClassImplementationName(ClassDefinition)]);

      AddLine;

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

  AddLine('uses %s;', [UsesList]);

  AddLine;

  if not FTypeAlias.IsEmpty or not Classes.IsEmpty then
    AddLine('type');

  if not FTypeAlias.IsEmpty then
  begin
    AddLine('  // Forward type alias');

    for var TypeAlias in FTypeAlias do
      AddLine('  %s = %s;', [TypeAlias.Name, TypeAlias.TypeName]);

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

end.

