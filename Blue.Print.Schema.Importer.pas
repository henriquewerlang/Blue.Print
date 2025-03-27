unit Blue.Print.Schema.Importer;

interface

uses System.Generics.Collections, Xml.XMLSchema;

type
  TUnitAlias = class
  private
    FFileName: String;
    FName: String;
  public
    property FileName: String read FFileName write FFileName;
    property Name: String read FName write FName;
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
    FOutputFolder: String;
    FSchemaFiles: TArray<String>;
  public
    property OutputFolder: String read FOutputFolder write FOutputFolder;
    property SchemaFiles: TArray<String> read FSchemaFiles write FSchemaFiles;
    property TypeChange: TArray<TTypeChange> read FTypeChange write FTypeChange;
    property UnitAlias: TArray<TUnitAlias> read FUnitAlias write FUnitAlias;
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
    procedure GenerateFile(const OutputFolder: String);

    property Classes: TList<TClassDefinition> read FClasses write FClasses;
    property Name: String read FName write FName;
  end;

  TImporter = class
  private
    FBuildInType: TDictionary<String, String>;
    FChangeType: TDictionary<String, String>;
    FUnits: TDictionary<String, TUnit>;
    FUnitAlias: TDictionary<String, String>;
    FConfiguration: TConfiguration;

    function GenerateUnit(const Definition: IXMLSchemaDef; const FileName: String): TUnit;
  public
    constructor Create;

    destructor Destroy; override;

    procedure AddChangeType(const AliasName, TypeName: String);
    procedure AddUnitName(const FileName, UnitName: String);
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
  FBuildInType.Add('ID', 'String');
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

  begin
    Result := TClassDefinition.Create;
    Result.Name := ComplexType.Name;

    for var A := 0 to Pred(ComplexType.ElementDefs.Count) do
    begin
      var Element := ComplexType.ElementDefs[A];

      if Element.DataType.IsComplex and not Assigned(Element.Ref) and not Assigned(Element.AttributeNodes.FindNode('type')) then
        Result.AddClassType(GenerateSchemaClass(Element.DataType as IXMLComplexTypeDef));

      AddProperty(Element.Name, Element.DataType).Optional := (Element.MinOccurs <> NULL) and (Element.MinOccurs <= 0);
    end;

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

procedure TImporter.Import;
begin
  for var SchemaFile in Configuration.SchemaFiles do
  begin
    var Schema := LoadXMLSchema(SchemaFile);

    GenerateUnit(Schema.SchemaDef, ExtractFileName(SchemaFile));

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

    for var UnitAlias in Configuration.UnitAlias do
      AddUnitName(UnitAlias.FileName, UnitAlias.Name);

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

  procedure GenerateClassDeclaration(const Ident: String; const ClassDefinition: TClassDefinition);

    function GetStoredPropertyDeclaration(const &Property: TProperty): String;
    begin
      Result := EmptyStr;

      if &Property.Optional then
        Result := Format(' stored %s', [GetStoredFunctionName(&Property)]);
    end;

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

      for var &Property in ClassDefinition.Properties do
        if &Property.Optional then
          AddLine('%s  function %s: Boolean;', [Ident, GetStoredFunctionName(&Property)]);

      AddLine('%spublic', [Ident]);

      for var &Property in ClassDefinition.Properties do
      begin
        for var Attribute in &Property.Attributes do
          AddLine('%:s  [%s]', [Ident, Attribute]);

        AddLine('%0:s  property %1:s: %2:s read F%1:s write F%1:s%3:s;', [Ident, &Property.Name, &Property.TypeName, GetStoredPropertyDeclaration(&Property)]);
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

  for var ClassDefinition in Classes do
    if HasOptionalProperty(ClassDefinition) then
    begin
      AddLine('{ %s }', [ClassDefinition.Name]);

      AddLine;

      for var &Property in ClassDefinition.Properties do
        if &Property.Optional then
        begin
          AddLine('function %s.%s: Boolean;', [ClassDefinition.Name, GetStoredFunctionName(&Property)]);

          AddLine('begin');

          AddLine('  Result := %s;', [GetOptionalValue(&Property)]);

          AddLine('end;');

          AddLine;
        end;
    end;

  AddLine('end.');

  UnitDefinition.SaveToFile(Format('%s\%s.pas', [OutputFolder, Name]));
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

