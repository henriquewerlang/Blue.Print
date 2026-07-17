unit Blue.Print.Schema.Importer.Open.API.v20;

interface

uses System.Rtti, System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v20, Blue.Print.JSON.Draft4.Schema;

type
  TOpenAPI20SchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FOpenAPIDefinition: TOpenAPIDefinition.TOpenAPIDefinition;
    FOpenAPIDefinitions: TDictionary<String, TOpenAPIDefinition.TOpenAPIDefinition>;
    FUnitFileConfiguration: TUnitFileConfiguration;

    function CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: TOpenAPIDefinition.Schema; const ClassName: String): TTypeDefinition;
    function CreateArrayDefinition(const Module: TTypeModuleDefinition; const TypeName: String; const ArrayItemType: TTypeDefinition): TTypeDefinition;
    function FindSchemaReference(const Reference: String): TOpenAPIDefinition.Schema;
    function GenerateSimpleType(const Module: TTypeModuleDefinition; const TypeName: String; const SimpleType: Schema.simpleTypes; const ArrayItems: TOpenAPIDefinition.PrimitivesItems; const Enumeration: TArray<TValue>): TTypeDefinition;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: TOpenAPIDefinition.Schema; const TypeName: String): TTypeDefinition;
    function GetSchemaReferenceName(const OpenAPISchema: TOpenAPIDefinition.Schema): String;
    function LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition.TOpenAPIDefinition;
    function LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition.TOpenAPIDefinition;
    function LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition.TOpenAPIDefinition;

    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadClassDefinition(const ClassDefinition: TTypeClassDefinition; const ClassSchema: TOpenAPIDefinition.Schema);
  public
    constructor Create(const Importer: TSchemaImporter); override;

    destructor Destroy; override;
  end;

  THeaderParameterSubSchemaHelper = class helper for TOpenAPIDefinition.HeaderParameterSubSchema
  private
    function GetSimpleType: Schema.simpleTypes;
  public
    property SimpleType: Schema.simpleTypes read GetSimpleType;
  end;

  TQueryParameterSubSchemaHelper = class helper for TOpenAPIDefinition.QueryParameterSubSchema
  private
    function GetSimpleType: Schema.simpleTypes;
  public
    property SimpleType: Schema.simpleTypes read GetSimpleType;
  end;

  TPathParameterSubSchema = class helper for TOpenAPIDefinition.PathParameterSubSchema
  private
    function GetSimpleType: Schema.simpleTypes;
  public
    property SimpleType: Schema.simpleTypes read GetSimpleType;
  end;

  TFormDataParameterSubSchema = class helper for TOpenAPIDefinition.FormDataParameterSubSchema
  private
    function GetSimpleType: Schema.simpleTypes;
  public
    property SimpleType: Schema.simpleTypes read GetSimpleType;
  end;

implementation

uses System.SysUtils, System.Generics.Defaults, System.IOUtils, Blue.Print.Serializer, Blue.Print.Types;

const
  REFERENCE_SEPARATOR = '#';

{ TOpenAPI20SchemaLoader }

function TOpenAPI20SchemaLoader.CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: TOpenAPIDefinition.Schema; const ClassName: String): TTypeDefinition;
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
  inherited;

  FImporter := Importer;
  FOpenAPIDefinitions := TDictionary<String, TOpenAPIDefinition.TOpenAPIDefinition>.Create(TIStringComparer.Ordinal);
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

function TOpenAPI20SchemaLoader.FindSchemaReference(const Reference: String): TOpenAPIDefinition.Schema;
begin
  Result := nil;
  var SchemaName := EmptyStr;

  var Schema := LoadSchemaReference(Reference, SchemaName);

  for var Definition in Schema.definitions.additionalProperties do
    if Definition.Key = SchemaName then
      Exit(Definition.Value);
end;

function TOpenAPI20SchemaLoader.GenerateSimpleType(const Module: TTypeModuleDefinition; const TypeName: String; const SimpleType: Schema.simpleTypes; const ArrayItems: TOpenAPIDefinition.PrimitivesItems; const Enumeration: TArray<TValue>): TTypeDefinition;

  function CreateEnumerator: TTypeEnumeration;
  begin
    var TypeFinded := Importer.FindType(TypeName, Module);

    if Assigned(TypeFinded) then
      Result := TypeFinded.AsTypeEnumeration
    else
    begin
      Result := TTypeEnumeration.Create(Module);
      Result.Name := TypeName;

      for var EnumeratorValue in Enumeration do
        Result.Values.Add(EnumeratorValue.ToString);

      Module.Enumerations.Add(Result);
    end;
  end;

  function GetArrayType(const ArrayType: TOpenAPIDefinition.PrimitivesItems): TTypeDefinition;
  begin
    case ArrayItems.&type of
      TOpenAPIDefinition.PrimitivesItems.TypeProperty.array: Result := CreateArrayDefinition(Module, TypeName, GetArrayType(ArrayItems.items));
      TOpenAPIDefinition.PrimitivesItems.TypeProperty.boolean: Result := FImporter.BooleanType;
      TOpenAPIDefinition.PrimitivesItems.TypeProperty.integer: Result := FImporter.IntegerType;
      TOpenAPIDefinition.PrimitivesItems.TypeProperty.number: Result := FImporter.DoubleType;
      TOpenAPIDefinition.PrimitivesItems.TypeProperty.string: Result := FImporter.StringType;
      else Result := nil;
    end;
  end;

begin
  if Assigned(Enumeration) then
    Result := CreateEnumerator
  else
    case SimpleType of
      Schema.simpleTypes.array: Result := CreateArrayDefinition(Module, TypeName, GetArrayType(ArrayItems));
      Schema.simpleTypes.boolean: Result := FImporter.BooleanType;
      Schema.simpleTypes.integer: Result := FImporter.IntegerType;
      Schema.simpleTypes.null: Result := nil;
      Schema.simpleTypes.number: Result := FImporter.DoubleType;
      Schema.simpleTypes.string: Result := FImporter.StringType;
      else Result := nil;
    end;
end;

function TOpenAPI20SchemaLoader.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: TOpenAPIDefinition.Schema; const TypeName: String): TTypeDefinition;
begin
  if OpenAPISchema.IsTypeStored and OpenAPISchema.&type.IsSimpleTypesStored then
    case OpenAPISchema.&type.simpleTypes of
      Schema.simpleTypes.&object: Result := CheckClassDefinition(Module, OpenAPISchema, TypeName);
      Schema.simpleTypes.&array: Result := CreateArrayDefinition(Module, TypeName, GenerateTypeDefinition(Module, OpenAPISchema.items.schema, TypeName + 'ArrayItem'))
      else Result := GenerateSimpleType(Module, TypeName, OpenAPISchema.&type.simpleTypes, nil, OpenAPISchema.enum);
    end
  else if OpenAPISchema.IsRefStored then
    Result := Module.AddDelayedType(GetSchemaReferenceName(OpenAPISchema))
  else
    Abort;
end;

procedure TOpenAPI20SchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  Service: TTypeInterfaceDefinition;

  procedure AddRemoteName(const TypeDefinition: TTypeCommonDefinition; RemoteName: String);
  begin
    if RemoteName.StartsWith('/') then
      RemoteName := RemoteName.Substring(1);

    TypeDefinition.AddAtribute('RemoteName(''%s'')', [RemoteName]);
  end;

  function AddMethod(const Operation: TOpenAPIDefinition.Operation; const RemoteName: String): TTypeMethodDefinition;
  var
    Method: TTypeMethodDefinition absolute Result;

    function AddParameter(const Name: String; const ParameterType: TTypeDefinition): TTypeParameterDefinition; overload;
    begin
      Result := Method.AddParameter;
      Result.Name := OnlyValidChars(Name);
      Result.ParameterType := ParameterType;

      if Result.Name <> Name then
        Result.AddAtribute('Query(''%s'')', [Name]);
    end;

    function AddParameter(const Name: String; const OpenAPISchema: TOpenAPIDefinition.Schema): TTypeParameterDefinition; overload;
    begin
      Result := AddParameter(Name, GenerateTypeDefinition(MainModule, OpenAPISchema, Name));
    end;

    function FindParameterDefinition(const JSONReference: TOpenAPIDefinition.JsonReference): TOpenAPIDefinition.Parameter;
    begin
      var ReferenceName := EmptyStr;
      Result := nil;

      var ReferenceDefinition := LoadSchemaReference(JSONReference.ref, ReferenceName);

      for var ParameterInfo in ReferenceDefinition.parameters.additionalProperties do
        if ParameterInfo.Key = ReferenceName then
          Exit(ParameterInfo.Value);
    end;

    function FindReturnType: TTypeDefinition;
    var
      Schemas: TList<TOpenAPIDefinition.Response.SchemaProperty>;

      procedure AddSchema(const Schema: TOpenAPIDefinition.Response.SchemaProperty);
      begin
        if Schema.IsSchemaStored and Schema.schema.IsRefStored then
          for var SchemaToFind in Schemas do
            if SchemaToFind.IsSchemaStored and SchemaToFind.schema.IsRefStored and (SchemaToFind.schema.ref = Schema.schema.ref) then
              Exit;

        Schemas.Add(Schema);
      end;

      function GetSchema(const Schema: TOpenAPIDefinition.Response.SchemaProperty): TOpenAPIDefinition.Schema;
      begin
        if Schema.schema.IsRefStored then
          Result := FindSchemaReference(Schema.schema.ref)
        else
          Result := Schema.schema;
      end;

    begin
      Result := nil;
      Schemas := TList<TOpenAPIDefinition.Response.SchemaProperty>.Create;

      for var Return in Operation.responses.responseValue do
        if Return.Key.StartsWith('2') and Return.Value.response.IsSchemaStored then
          AddSchema(Return.Value.response.schema);

      if not Schemas.IsEmpty then
      begin
        var ReturnClassName := Method.Name + 'Return';

        if Schemas.Count = 1 then
          Result := GenerateTypeDefinition(MainModule, Schemas.First.schema, ReturnClassName)
        else
          Abort;
      end;

      Schemas.Free;
    end;

  begin
    Result := TTypeMethodDefinition.Create(MainModule);
    Result.Name := Operation.operationId;

    if Result.Name.IsEmpty then
      Result.Name := OnlyValidChars(RemoteName);

    AddRemoteName(Result, RemoteName);

    Result.Return := FindReturnType;

    for var ParameterDefinitionItem in Operation.parameters do
    begin
      var ParameterDefinition: TOpenAPIDefinition.Parameter;

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
          var Header := NoBodyParameter.HeaderParameterSubSchema;

          var Parameter := AddParameter(Header.name, GenerateSimpleType(MainModule, Header.Name + 'Header', Header.SimpleType, Header.items, Header.enum));
          Parameter.AddAtribute('HeaderValue(''%s'')', [Header.name]);
        end
        else if NoBodyParameter.IsQueryParameterSubSchemaStored then
        begin
          var Query := NoBodyParameter.QueryParameterSubSchema;

          AddParameter(Query.name, GenerateSimpleType(MainModule, Query.Name + 'Query', Query.SimpleType, Query.items, Query.enum));
        end
        else if NoBodyParameter.IsPathParameterSubSchemaStored then
        begin
          var Path := NoBodyParameter.PathParameterSubSchema;

          AddParameter(Path.name, GenerateSimpleType(MainModule, Path.Name + 'Path', Path.SimpleType, Path.items, Path.enum));
        end
        else if NoBodyParameter.IsFormDataParameterSubSchemaStored then
        begin
          var Form := NoBodyParameter.FormDataParameterSubSchema;

          AddParameter(Form.name, GenerateSimpleType(MainModule, Form.Name + 'Form', Form.SimpleType, Form.items, Form.enum));
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
    Service := FImporter.CreateInterfaceDefinition(MainModule.ParentUnit, UnitFileConfiguration.InterfaceName);

    AddRemoteName(Service, FOpenAPIDefinition.basePath);
  end;

  for var Definition in FOpenAPIDefinition.definitions.additionalProperties do
  begin
    var TypeDefinition := GenerateTypeDefinition(MainModule, Definition.Value, Definition.Key);

    if not TypeDefinition.IsEnumeration and not TypeDefinition.IsClassDefinition and not TypeDefinition.IsTypeAlias then
      MainModule.AddTypeAlias(FImporter.CreateTypeAlias(MainModule, Definition.Key, TypeDefinition));
  end;

  for var PathItem in FOpenAPIDefinition.paths.pathItem do
  begin
    if PathItem.Value.IsGetStored then
      AddMethod(PathItem.Value.get, PathItem.Key).AddGetAttribute;

    if PathItem.Value.IsPostStored then
      AddMethod(PathItem.Value.post, PathItem.Key).AddPostAttribute;

    if PathItem.Value.IsPutStored then
      AddMethod(PathItem.Value.put, PathItem.Key).AddPutAttribute;

    if PathItem.Value.IsDeleteStored then
      AddMethod(PathItem.Value.delete, PathItem.Key).AddDeleteAttribute;

    if PathItem.Value.IsOptionsStored then
      AddMethod(PathItem.Value.options, PathItem.Key).AddOptionsAttribute;

    if PathItem.Value.IsPatchStored then
      AddMethod(PathItem.Value.patch, PathItem.Key).AddPatchAttribute;

    if PathItem.Value.IsHeadStored then
      AddMethod(PathItem.Value.head, PathItem.Key);
  end;
end;

function TOpenAPI20SchemaLoader.GetSchemaReferenceName(const OpenAPISchema: TOpenAPIDefinition.Schema): String;
begin
  LoadSchemaReference(OpenAPISchema.ref, Result);
end;

procedure TOpenAPI20SchemaLoader.LoadClassDefinition(const ClassDefinition: TTypeClassDefinition; const ClassSchema: TOpenAPIDefinition.Schema);
var
  AnnonymusIndex: Integer;

  function FindProperty(const PropertyName: String): TPropertyDefinition;
  begin
    Result := nil;

    for var PropertyDefinition in ClassDefinition.Properties do
      if PropertyDefinition.Name = PropertyName then
        Exit(PropertyDefinition);
  end;

  function DefinePropety(const PropertyName: String; const PropertyType: TTypeDefinition): TPropertyDefinition;
  begin
    Result := FindProperty(PropertyName);

    if not Assigned(Result) then
    begin
      Result := ClassDefinition.AddProperty(PropertyName);
      Result.PropertyType := PropertyType;
      var Required := False;

      if not Assigned(Result.PropertyType) then
        raise Exception.Create('Property type not found!');

      for var RequiredName in ClassSchema.required do
        Required := Required or (RequiredName = PropertyName);

      Result.Optional := not Required;
    end;
  end;

  function HasProperties: Boolean;
  begin
    Result := ClassSchema.IsPropertiesStored and ClassSchema.properties.IsAdditionalPropertiesStored;
  end;

  procedure DefineProperties;
  begin
    if HasProperties then
      for var Prop in ClassSchema.properties.additionalProperties do
      begin
        var PropertyName := Prop.Key;

        DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, Prop.Value, PropertyName + 'Property'));
      end;
  end;

  function GetPropertyName(const PropertySchema: TOpenAPIDefinition.Schema): String;
  begin
    if PropertySchema.IsRefStored then
      Result := GetSchemaReferenceName(PropertySchema)
    else
    begin
      Inc(AnnonymusIndex);

      Result := ClassDefinition.Name + 'Property';

      if AnnonymusIndex > 1 then
        Result := Result + AnnonymusIndex.ToString;
    end;
  end;

begin
  AnnonymusIndex := 0;

  DefineProperties;

  if ClassSchema.IsAllOfStored and not HasProperties then
    ClassDefinition.AddFlatAttribute;

  for var AllOfSchema in ClassSchema.allOf do
  begin
    var PropertyName := GetPropertyName(AllOfSchema);

    var PropertyDefinition := DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, AllOfSchema, PropertyName));

    if HasProperties then
      PropertyDefinition.AddFlatAttribute;
  end;

  if ClassSchema.IsXmlStored then
  begin
    ClassDefinition.AddAtribute('XML');

    if ClassSchema.xml.name <> ClassDefinition.Name then
      ClassDefinition.AddAtribute('DocumentName(''%s'')', [ClassSchema.xml.name]);
  end;
end;

function TOpenAPI20SchemaLoader.LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  if not FOpenAPIDefinitions.TryGetValue(Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFile(Reference), TypeInfo(TOpenAPIDefinition.TOpenAPIDefinition)).AsType<TOpenAPIDefinition.TOpenAPIDefinition>;

    FOpenAPIDefinitions.Add(Reference, Result);
  end;
end;

function TOpenAPI20SchemaLoader.LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  Result := LoadOpenAPIDefinition(UnitFileConfiguration.FileName);
end;

function TOpenAPI20SchemaLoader.LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  var References := Reference.Split([REFERENCE_SEPARATOR]);
  var Values := References[1].Split(['/']);

  if References[0].IsEmpty then
    Result := FOpenAPIDefinition
  else
    Result := LoadOpenAPIDefinition(FImporter.LoadRelativePath(References[0], FImporter.GetFileNameFromSchemaFolder(FUnitFileConfiguration.FileName)));

  ReferenceName := Values[High(Values)];
end;

{ THeaderParameterSubSchemaHelper }

function THeaderParameterSubSchemaHelper.GetSimpleType: Schema.simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TypeProperty] of Schema.simpleTypes = (Schema.simpleTypes.string, Schema.simpleTypes.number, Schema.simpleTypes.boolean, Schema.simpleTypes.integer, Schema.simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TQueryParameterSubSchemaHelper }

function TQueryParameterSubSchemaHelper.GetSimpleType: Schema.simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TypeProperty] of Schema.simpleTypes = (Schema.simpleTypes.string, Schema.simpleTypes.number, Schema.simpleTypes.boolean, Schema.simpleTypes.integer, Schema.simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TPathParameterSubSchema }

function TPathParameterSubSchema.GetSimpleType: Schema.simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TypeProperty] of Schema.simpleTypes = (Schema.simpleTypes.string, Schema.simpleTypes.number, Schema.simpleTypes.boolean, Schema.simpleTypes.integer, Schema.simpleTypes.array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TFormDataParameterSubSchema }

function TFormDataParameterSubSchema.GetSimpleType: Schema.simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TypeProperty] of Schema.simpleTypes = (Schema.simpleTypes.string, Schema.simpleTypes.number, Schema.simpleTypes.boolean, Schema.simpleTypes.integer, Schema.simpleTypes.array, Schema.simpleTypes.null);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

end.

