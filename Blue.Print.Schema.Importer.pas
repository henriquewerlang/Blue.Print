unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema;

type
  TUnitAlias = class
  private
    FFileName: String;
    FUnitName: String;
  public
    property FileName: String read FFileName write FFileName;
    property UnitName: String read FUnitName write FUnitName;
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
    FUnitAlias: TArray<TUnitAlias>;
    FTypeChange: TArray<TTypeChange>;
  public
    property TypeChange: TArray<TTypeChange> read FTypeChange write FTypeChange;
    property UnitAlias: TArray<TUnitAlias> read FUnitAlias write FUnitAlias;
  end;

  TProperty = class
  private
    FName: String;
    FTypeName: String;
  public
    property Name: String read FName write FName;
    property TypeName: String read FTypeName write FTypeName;
  end;

  TClassDefinition = class
  private
    FName: String;
    FClasses: TList<TClassDefinition>;
    FProperties: TList<TProperty>;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddClassType(const ClassDefinition: TClassDefinition);
    procedure AddProperty(const &Property: TProperty);

    property Classes: TList<TClassDefinition> read FClasses;
    property Name: String read FName write FName;
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
    FName: String;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddTypeAlias(const TypeAlias: TTypeAlias);
    procedure AddUses(const SchemaUnit: TUnit);
    procedure GenerateFile;

    property Classes: TList<TClassDefinition> read FClasses write FClasses;
    property Name: String read FName write FName;
  end;

  TImporter = class
  private
    FBuildInType: TDictionary<String, String>;
    FChangeType: TDictionary<String, String>;
    FUnits: TDictionary<String, TUnit>;
    FUnitAlias: TDictionary<String, String>;

    function GenerateUnit(const Definition: IXMLSchemaDef; const FileName: String): TUnit;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddChangeType(const AliasName, TypeName: String);
    procedure AddUnitName(const FileName, UnitName: String);
    procedure Import(const FileName: String);
    procedure LoadConfig(const FileName: String);
  end;

implementation

uses System.SysUtils, System.Classes, System.IOUtils, XML.xmldom, Blue.Print.Serializer, Blue.Print.Types;

{ TImporter }

procedure TImporter.AddChangeType(const AliasName, TypeName: String);
begin
  FChangeType.Add(AliasName, TypeName);
end;

procedure TImporter.AddUnitName(const FileName, UnitName: String);
begin
  FUnitAlias.Add(FileName, UnitName);
end;

constructor TImporter.Create;
begin
  inherited;

  FBuildInType := TDictionary<String, String>.Create;
  FChangeType := TDictionary<String, String>.Create;
  FUnitAlias := TDictionary<String, String>.Create;
  FUnits := TObjectDictionary<String, TUnit>.Create([doOwnsValues]);

  FBuildInType.Add('string', 'String');
  FBuildInType.Add('boolean', 'Boolean');
  FBuildInType.Add('decimal', 'Double');
  FBuildInType.Add('dateTime', 'TDateTime');
  FBuildInType.Add('date', 'TDate');
  FBuildInType.Add('time', 'TTime');
  FBuildInType.Add('base64Binary', 'String');
  FBuildInType.Add('anyURI', 'String');
end;

destructor TImporter.Destroy;
begin
  FBuildInType.Free;

  FChangeType.Free;

  FUnitAlias.Free;

  FUnits.Free;

  inherited;
end;

function TImporter.GenerateUnit(const Definition: IXMLSchemaDef; const FileName: String): TUnit;
var
  SchemaUnit: TUnit absolute Result;

  procedure ProcessReferences(const List: IXMLSchemaDocRefs);
  begin
    for var A := 0 to Pred(List.Count) do
    begin
      var Reference := List[A];

      SchemaUnit.AddUses(GenerateUnit(Reference.SchemaRef, Reference.SchemaLocation));
    end;
  end;

  function GenerateSchemaClass(const ComplexType: IXMLComplexTypeDef): TClassDefinition;
  begin
    Result := TClassDefinition.Create;
    Result.Name := ComplexType.Name;

    for var A := 0 to Pred(ComplexType.ElementDefs.Count) do
    begin
      var Element := ComplexType.ElementDefs[A];

      if Element.DataType.IsComplex and not Assigned(Element.Ref) and not Assigned(Element.AttributeNodes.FindNode('type')) then
        Result.AddClassType(GenerateSchemaClass(Element.DataType as IXMLComplexTypeDef));

      var &Property := TProperty.Create;
      &Property.Name := Element.Name;
      &Property.TypeName := 'T' + Element.DataType.Name;

      Result.AddProperty(&Property);
    end;
  end;

  function FindSimpleType(const XSDTypeName: String; var TypeName: String): Boolean;
  begin
    Result := False;

    for var SimpleType in SchemaUnit.FTypeAlias do
      if SimpleType.Name = XSDTypeName then
      begin
        TypeName := SimpleType.TypeName;

        Exit(True);
      end;
  end;

  function SimpleBaseType(SimpleType: IXMLSimpleTypeDef): String;
  begin
    while Assigned(SimpleType.BaseType) do
      SimpleType := SimpleType.BaseType as IXMLSimpleTypeDef;

    Result := ExtractLocalName(SimpleType.Name);
  end;

  function GenerateSimpleType(const SimpleType: IXMLSimpleTypeDef): TTypeAlias;
  begin
    Result := TTypeAlias.Create;
    Result.Name := SimpleType.Name;
    var TypeName := SimpleBaseType(SimpleType);

    if not FBuildInType.TryGetValue(TypeName, TypeName) and not FindSimpleType(TypeName, TypeName) then
      TypeName := 'Undefined; //Type not found ' + SimpleType.RestrictionNode.BaseName;

    if FChangeType.ContainsKey(Result.Name) then
      TypeName := FChangeType[Result.Name];

    Result.TypeName := TypeName;
  end;

begin
  if not FUnits.TryGetValue(FileName, Result) then
  begin
    Result := TUnit.Create;

    if FUnitAlias.ContainsKey(FileName) then
      SchemaUnit.Name := FUnitAlias[FileName];

    FUnits.Add(FileName, SchemaUnit);

    for var A := 0 to Pred(Definition.ComplexTypes.Count) do
      SchemaUnit.Classes.Add(GenerateSchemaClass(Definition.ComplexTypes[A]));

    for var A := 0 to Pred(Definition.SimpleTypes.Count) do
      SchemaUnit.AddTypeAlias(GenerateSimpleType(Definition.SimpleTypes[A]));

    ProcessReferences(Definition.SchemaIncludes);

    ProcessReferences(Definition.SchemaImports);
  end;
end;

procedure TImporter.Import(const FileName: String);
begin
  var Schema := LoadXMLSchema(FileName);

  GenerateUnit(Schema.SchemaDef, ExtractFileName(FileName));

  for var SchemaUnit in FUnits.Values do
    SchemaUnit.GenerateFile;
end;

procedure TImporter.LoadConfig(const FileName: String);
begin
  if TFile.Exists(FileName) then
  begin
    var Serializer: IBluePrintSerializer := TBluePrintJsonSerializer.Create;

    var Configuration := Serializer.Deserialize(TFile.ReadAllText(FileName), TypeInfo(TConfiguration)).AsType<TConfiguration>;

    for var UnitAlias in Configuration.UnitAlias do
      AddUnitName(UnitAlias.FileName, UnitAlias.UnitName);

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

procedure TUnit.GenerateFile;
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

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);
  begin
      AddLine('%sT%s = class', [Ident, ClassDefinition.Name]);

      if not ClassDefinition.Classes.IsEmpty then
      begin
        AddLine('%spublic type', [Ident]);

        for var SubClass in ClassDefinition.Classes do
          GenerateClassDeclaration(Ident + '  ', SubClass);
      end;

      if not ClassDefinition.Properties.IsEmpty then
      begin
        AddLine('%sprivate', [Ident]);

        for var &Property in ClassDefinition.Properties do
          AddLine('%s  F%s: %s;', [Ident, &Property.Name, &Property.TypeName]);

        AddLine('%spublic', [Ident]);

        for var &Property in ClassDefinition.Properties do
          AddLine('%0:s  property %1:s: %2:s read F%1:s write F%1:s;', [Ident, &Property.Name, &Property.TypeName]);
      end;

      AddLine('%send;', [Ident]);
  end;

begin
  UnitDefinition := TStringList.Create;

  AddLine('unit %s;', [Name]);

  AddLine;

  AddLine('interface');

  AddLine;

  if not FUses.IsEmpty then
  begin
    var UsesList := EmptyStr;

    for var AUnit in FUses do
    begin
      if not UsesList.IsEmpty then
        UsesList := UsesList + ', ';

      UsesList := UsesList + AUnit.Name;
    end;

    AddLine('uses %s;', [UsesList]);

    AddLine;
  end;

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
      AddLine('  T%s = class;', [AClass.Name]);

    AddLine;

    for var AClass in Classes do
    begin
      GenerateClassDeclaration('  ', AClass);

      AddLine;
    end;
  end;

  AddLine('implementation');

  AddLine;

  AddLine('end.');

  AddLine;

  UnitDefinition.SaveToFile(Format('.\%s.pas', [Name]));
end;

{ TClassDefinition }

procedure TClassDefinition.AddClassType(const ClassDefinition: TClassDefinition);
begin
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

end.

