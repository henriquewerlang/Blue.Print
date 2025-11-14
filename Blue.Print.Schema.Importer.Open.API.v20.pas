unit Blue.Print.Schema.Importer.Open.API.v20;

interface

uses System.Rtti, System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v20;

type
  TOpenAPI20SchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FOpenAPIDefinition: TOpenAPIDefinition;
    FOpenAPIDefinitions: TDictionary<String, TOpenAPIDefinition>;
    FUnitFileConfiguration: TUnitFileConfiguration;

    function CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: Schema; const ClassName: String): TTypeDefinition;
    function CreateArrayDefinition(const Module: TTypeModuleDefinition; const TypeName: String; const ArrayItemType: TTypeDefinition): TTypeDefinition;
    function FindSchemaReference(const Reference: String): Schema;
    function GenerateSimpleType(const Module: TTypeModuleDefinition; const TypeName: String; const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems; const Enumeration: TArray<TValue>): TTypeDefinition;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const TypeName: String): TTypeDefinition;
    function GetSchemaReferenceName(const OpenAPISchema: Schema): String;
    function LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition;
    function LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;
    function LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition;

    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadClassDefinition(const ClassDefinition: TClassDefinition; const ClassSchema: Schema);
  public
    constructor Create(const Importer: TSchemaImporter);

    destructor Destroy; override;
  end;

  THeaderParameterSubSchemaHelper = class helper for HeaderParameterSubSchema
  private
    function GetSimpleType: simpleTypes;
  public
    property SimpleType: simpleTypes read GetSimpleType;
  end;

  TQueryParameterSubSchemaHelper = class helper for QueryParameterSubSchema
  private
    function GetSimpleType: simpleTypes;
  public
    property SimpleType: simpleTypes read GetSimpleType;
  end;

  TPathParameterSubSchema = class helper for PathParameterSubSchema
  private
    function GetSimpleType: simpleTypes;
  public
    property SimpleType: simpleTypes read GetSimpleType;
  end;

  TFormDataParameterSubSchema = class helper for FormDataParameterSubSchema
  private
    function GetSimpleType: simpleTypes;
  public
    property SimpleType: simpleTypes read GetSimpleType;
  end;

implementation

uses System.SysUtils, System.Generics.Defaults, System.IOUtils, Blue.Print.Serializer, Blue.Print.Types;

const
  REFERENCE_SEPARATOR = '#';

{ TOpenAPI20SchemaLoader }

function TOpenAPI20SchemaLoader.CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: Schema; const ClassName: String): TTypeDefinition;
begin
  Result := FImporter.FindType(ClassName, Module);

  if not Assigned(Result) then
  begin
    Result := FImporter.CreateClassDefinition(Module, ClassName);

    LoadClassDefinition(Result.AsClassDefinition, ClassSchema);
  end;
end;

constructor TOpenAPI20SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
  FOpenAPIDefinitions := TDictionary<String, TOpenAPIDefinition>.Create(TIStringComparer.Ordinal);
end;

function TOpenAPI20SchemaLoader.CreateArrayDefinition(const Module: TTypeModuleDefinition; const TypeName: String; const ArrayItemType: TTypeDefinition): TTypeDefinition;
begin
  Result := TTypeArrayDefinition.Create(Module, ArrayItemType);
end;

destructor TOpenAPI20SchemaLoader.Destroy;
begin
  FOpenAPIDefinitions.Free;

  inherited;
end;

function TOpenAPI20SchemaLoader.FindSchemaReference(const Reference: String): Schema;
begin
  Result := nil;
  var SchemaName := EmptyStr;

  var Schema := LoadSchemaReference(Reference, SchemaName);

  for var Definition in Schema.definitions.schema do
    if Definition.Key = SchemaName then
      Exit(Definition.Value);
end;

function TOpenAPI20SchemaLoader.GenerateSimpleType(const Module: TTypeModuleDefinition; const TypeName: String; const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems; const Enumeration: TArray<TValue>): TTypeDefinition;

  function CreateEnumerator: TTypeEnumeration;
  begin
    Result := TTypeEnumeration.Create(Module);
    Result.Name := TypeName;

    for var EnumeratorValue in Enumeration do
      Result.Values.Add(EnumeratorValue.ToString);

    Module.Enumerations.Add(Result);
  end;

  function GetArrayType(const ArrayType: PrimitivesItems): TTypeDefinition;
  begin
    case ArrayItems.&type of
      PrimitivesItems.TType.array: Result := CreateArrayDefinition(Module, TypeName, GetArrayType(ArrayItems.items));
      PrimitivesItems.TType.boolean: Result := FImporter.BooleanType;
      PrimitivesItems.TType.integer: Result := FImporter.IntegerType;
      PrimitivesItems.TType.number: Result := FImporter.DoubleType;
      PrimitivesItems.TType.string: Result := FImporter.StringType;
      else Result := nil;
    end;
  end;

begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) then
    if Assigned(Enumeration) then
      Result := CreateEnumerator
    else
      case SimpleType of
        simpleTypes.array: Result := CreateArrayDefinition(Module, TypeName, GetArrayType(ArrayItems));
        simpleTypes.boolean: Result := FImporter.BooleanType;
        simpleTypes.integer: Result := FImporter.IntegerType;
        simpleTypes.null: Result := nil;
        simpleTypes.number: Result := FImporter.DoubleType;
        simpleTypes.string: Result := FImporter.StringType;
        else Result := nil;
      end;
end;

function TOpenAPI20SchemaLoader.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const TypeName: String): TTypeDefinition;
begin
  if OpenAPISchema.IsTypeStored and (OpenAPISchema.&type.simpleTypes = simpleTypes.array) then
    Result := CreateArrayDefinition(Module, TypeName, GenerateTypeDefinition(Module, OpenAPISchema.items.schema, TypeName + 'ArrayItem'))
  else
  begin
    Result := FImporter.FindType(TypeName, Module);

    if not Assigned(Result) then
      if not OpenAPISchema.ref.IsEmpty then
        Result := Module.AddDelayedType(GetSchemaReferenceName(OpenAPISchema))
      else if OpenAPISchema.IsTypeStored then
        case OpenAPISchema.&type.simpleTypes of
          simpleTypes.&object: Result := CheckClassDefinition(Module, OpenAPISchema, TypeName);
          else Result := GenerateSimpleType(Module, TypeName, OpenAPISchema.&type.simpleTypes, nil, OpenAPISchema.enum);
        end
      else
        Abort;
  end;
end;

procedure TOpenAPI20SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  Service: TTypeInterfaceDefinition;

  procedure AddRemoteName(const TypeDefinition: TTypeCommonDefinition; RemoteName: String);
  begin
    if RemoteName.StartsWith('/') then
      RemoteName := RemoteName.Substring(1);

    TypeDefinition.AddAtribute('RemoteName(''%s'')', [RemoteName]);
  end;

  procedure AddMethod(const Operation: Operation; const RemoteName: String);
  var
    Method: TTypeMethodDefinition;

    function AddParameter(const Name: String; const ParameterType: TTypeDefinition): TTypeParameterDefinition; overload;
    begin
      Result := Method.AddParameter;
      Result.Name := Name;
      Result.ParameterType := ParameterType;
    end;

    function AddParameter(const Name: String; const OpenAPISchema: Schema): TTypeParameterDefinition; overload;
    begin
      Result := AddParameter(Name, GenerateTypeDefinition(UnitDefinition, OpenAPISchema, Name));
    end;

    function FindParameterDefinition(const JSONReference: JsonReference): Parameter;
    begin
      var ReferenceName := EmptyStr;
      Result := nil;

      var ReferenceDefinition := LoadSchemaReference(JSONReference.ref, ReferenceName);

      for var ParameterInfo in ReferenceDefinition.parameters.parameter do
        if ParameterInfo.Key = ReferenceName then
          Exit(ParameterInfo.Value);
    end;

    function FindReturnType: TTypeDefinition;
    var
      Schemas: TList<Response.TSchema>;

      procedure AddSchema(const Schema: Response.TSchema);
      begin
        if Schema.IsSchemaStored and Schema.schema.IsRefStored then
          for var SchemaToFind in Schemas do
            if SchemaToFind.IsSchemaStored and SchemaToFind.schema.IsRefStored and (SchemaToFind.schema.ref = Schema.schema.ref) then
              Exit;

        Schemas.Add(Schema);
      end;

      function GetSchema(const Schema: Response.TSchema): Schema;
      begin
        if Schema.schema.IsRefStored then
          Result := FindSchemaReference(Schema.schema.ref)
        else
          Result := Schema.schema;
      end;

    begin
      Result := nil;
      Schemas := TList<Response.TSchema>.Create;

      for var Return in Operation.responses.responseValue do
        if Return.Value.response.IsSchemaStored then
          AddSchema(Return.Value.response.schema);

      if Schemas.IsEmpty then
      else
      begin
        var ReturnClassName := Method.Name + 'Return';

        if Schemas.Count = 1 then
          Result := GenerateTypeDefinition(UnitDefinition, Schemas.First.schema, ReturnClassName)
        else
        begin
          Result := FImporter.CreateClassDefinition(UnitDefinition, ReturnClassName);

          for var Schema in Schemas do
            if Schema.IsSchemaStored then
              LoadClassDefinition(Result.AsClassDefinition, GetSchema(Schema));
        end;
      end;

      Schemas.Free;
    end;

  begin
    Method := TTypeMethodDefinition.Create;
    Method.Name := Operation.operationId;

    if Method.Name.IsEmpty then
      Method.Name := OnlyValidChars(RemoteName);

    AddRemoteName(Method, RemoteName);

    Method.Return := FindReturnType;

    for var ParameterDefinitionItem in Operation.parameters do
    begin
      var ParameterDefinition: Parameter;

      if ParameterDefinitionItem.IsJsonReferenceStored then
        ParameterDefinition := FindParameterDefinition(ParameterDefinitionItem.jsonReference)
      else
        ParameterDefinition := ParameterDefinitionItem.parameter;

      if ParameterDefinition.IsBodyParameterStored then
        AddParameter(ParameterDefinition.bodyParameter.name, ParameterDefinition.bodyParameter.schema)
      else if ParameterDefinition.IsNonBodyParameterStored then
      begin
        var NoBodyParameter := ParameterDefinition.nonBodyParameter;

        if NoBodyParameter.IsHeaderParameterSubSchemaStored then
        begin
          var Header := NoBodyParameter.headerParameterSubSchema;

          var Parameter := AddParameter(Header.name, GenerateSimpleType(UnitDefinition, Header.Name + 'Header', Header.SimpleType, Header.items, Header.enum));
          Parameter.AddAtribute('HeaderValue(''%s'')', [Header.name]);
        end
        else if NoBodyParameter.IsQueryParameterSubSchemaStored then
        begin
          var Query := NoBodyParameter.queryParameterSubSchema;

          AddParameter(Query.name, GenerateSimpleType(UnitDefinition, Query.Name + 'Query', Query.SimpleType, Query.items, Query.enum));
        end
        else if NoBodyParameter.IsPathParameterSubSchemaStored then
        begin
          var Path := NoBodyParameter.pathParameterSubSchema;

          AddParameter(Path.name, GenerateSimpleType(UnitDefinition, Path.Name + 'Path', Path.SimpleType, Path.items, Path.enum));
        end
        else if NoBodyParameter.IsFormDataParameterSubSchemaStored then
        begin
          var Form := NoBodyParameter.formDataParameterSubSchema;

          AddParameter(Form.name, GenerateSimpleType(UnitDefinition, Form.Name + 'Form', Form.SimpleType, Form.items, Form.enum));
        end;
      end;
    end;

    Service.Methods.Add(Method);
  end;

begin
  FOpenAPIDefinition := LoadOpenAPIDefinitionFromConfiguration(UnitFileConfiguration);
  FUnitFileConfiguration := UnitFileConfiguration;
  Service := nil;

  if not UnitFileConfiguration.InterfaceName.IsEmpty then
  begin
    Service := FImporter.CreateInterfaceDefinition(UnitDefinition, UnitFileConfiguration.InterfaceName);

    AddRemoteName(Service, FOpenAPIDefinition.basePath);
  end;

  for var Definition in FOpenAPIDefinition.definitions.schema do
  begin
    var TypeDefinition := GenerateTypeDefinition(UnitDefinition, Definition.Value, Definition.Key);

    if not TypeDefinition.IsEnumeration and not TypeDefinition.IsClassDefinition and not TypeDefinition.IsTypeAlias then
      UnitDefinition.AddTypeAlias(FImporter.CreateTypeAlias(UnitDefinition, Definition.Key, TypeDefinition));
  end;

  for var PathItem in FOpenAPIDefinition.paths.pathItem do
  begin
    if PathItem.Value.IsGetStored then
      AddMethod(PathItem.Value.get, PathItem.Key);

    if PathItem.Value.IsPostStored then
      AddMethod(PathItem.Value.post, PathItem.Key);

    if PathItem.Value.IsPutStored then
      AddMethod(PathItem.Value.put, PathItem.Key);

    if PathItem.Value.IsDeleteStored then
      AddMethod(PathItem.Value.delete, PathItem.Key);

    if PathItem.Value.IsOptionsStored then
      AddMethod(PathItem.Value.options, PathItem.Key);

    if PathItem.Value.IsPatchStored then
      AddMethod(PathItem.Value.patch, PathItem.Key);

    if PathItem.Value.IsHeadStored then
      AddMethod(PathItem.Value.head, PathItem.Key);
  end;
end;

function TOpenAPI20SchemaLoader.GetSchemaReferenceName(const OpenAPISchema: Schema): String;
begin
  LoadSchemaReference(OpenAPISchema.ref, Result);
end;

procedure TOpenAPI20SchemaLoader.LoadClassDefinition(const ClassDefinition: TClassDefinition; const ClassSchema: Schema);
var
  AnnonymusIndex: Integer;

  function FindProperty(const PropertyName: String): Boolean;
  begin
    Result := False;

    for var &Property in ClassDefinition.Properties do
      Result := Result or SameText(&Property.Name, PropertyName);
  end;

  procedure DefinePropety(const PropertyName: String; const PropertyType: TTypeDefinition);
  begin
    if not FindProperty(PropertyName) then
    begin
      var NewProperty := TPropertyDefinition.Create;
      NewProperty.Name := PropertyName;
      NewProperty.PropertyType := PropertyType;
      var Required := False;

      if not Assigned(NewProperty.PropertyType) then
        raise Exception.Create('Property type not found!');

      for var RequiredName in ClassSchema.required do
        Required := Required or (RequiredName = PropertyName);

      NewProperty.Optional := not Required;

      ClassDefinition.Properties.Add(NewProperty);
    end;
  end;

  procedure DefineProperties(const Properties: Schema);
  begin
    for var Prop in Properties.properties.schema do
    begin
      var PropertyName := Prop.Key;

      DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, Prop.Value, PropertyName));
    end;
  end;

  function GetPropertyName(const PropertySchema: Schema): String;
  begin
    if PropertySchema.IsRefStored then
      Result := GetSchemaReferenceName(PropertySchema)
    else
    begin
      Inc(AnnonymusIndex);

      Result := ClassName;

      if AnnonymusIndex > 1 then
        Result := Result + AnnonymusIndex.ToString;
    end;
  end;

begin
  AnnonymusIndex := 0;

  DefineProperties(ClassSchema);

  if ClassSchema.IsAllOfStored then
    ClassDefinition.AddFlatAttribute;

  for var AllOfSchema in ClassSchema.allOf do
  begin
    var PropertyName := GetPropertyName(AllOfSchema);

    DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, AllOfSchema, PropertyName));
  end;

  if ClassSchema.IsXmlStored then
  begin
    ClassDefinition.AddAtribute('XML');

    if ClassSchema.xml.name <> ClassName then
      ClassDefinition.AddAtribute('DocumentName(''%s'')', [ClassSchema.xml.name]);
  end;
end;

function TOpenAPI20SchemaLoader.LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition;
begin
  if not FOpenAPIDefinitions.TryGetValue(Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFile(Reference), TypeInfo(TOpenAPIDefinition)).AsType<TOpenAPIDefinition>;

    FOpenAPIDefinitions.Add(Reference, Result);
  end;
end;

function TOpenAPI20SchemaLoader.LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;
begin
  Result := LoadOpenAPIDefinition(UnitFileConfiguration.Reference);
end;

function TOpenAPI20SchemaLoader.LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition;
begin
  var References := Reference.Split([REFERENCE_SEPARATOR]);
  var Values := References[1].Split(['/']);

  if References[0].IsEmpty then
    Result := FOpenAPIDefinition
  else
    Result := LoadOpenAPIDefinition(FImporter.LoadRelativePath(References[0], FImporter.GetFileNameFromSchemaFolder(FUnitFileConfiguration.Reference)));

  ReferenceName := Values[High(Values)];
end;

{ THeaderParameterSubSchemaHelper }

function THeaderParameterSubSchemaHelper.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TQueryParameterSubSchemaHelper }

function TQueryParameterSubSchemaHelper.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TPathParameterSubSchema }

function TPathParameterSubSchema.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TFormDataParameterSubSchema }

function TFormDataParameterSubSchema.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.array, simpleTypes.null);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

end.

