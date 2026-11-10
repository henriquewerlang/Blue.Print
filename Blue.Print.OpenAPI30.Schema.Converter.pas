unit Blue.Print.OpenAPI30.Schema.Converter;

interface

uses System.SysUtils, Blue.Print.Schema.Importer, Blue.Print.OpenAPI30.Schema;

type
  EPathItemWithoutOperation = class(Exception)
  public
    constructor Create(const Path: String);
  end;

  EServiceInterfaceNameEmpty = class(Exception)
  public
    constructor Create;
  end;

  EInvalidContentType = class(Exception)
  public
    constructor Create(const Path: String);
  end;

  TOpenAPI30SchemaConverter = class(TInterfacedObject, ISchemaConverter)
  private
    function LoadDefinition(const Schema: TSchema): OpenAPIDefinition;

    procedure Convert(const Schema: TSchema);
    procedure LoadSchema(const Schema: TSchema);
  end;

implementation

uses REST.Types, Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI30SchemaConverter }

procedure TOpenAPI30SchemaConverter.Convert(const Schema: TSchema);
const
  BODY_PARAMETER_NAME = 'Body';

var
  Definition: OpenAPIDefinition;
  Importer: TSchemaImporter;
  PathItem: TDynamicPair<OpenAPIDefinition.PathItem>;

  function GetNamespace: String;
  begin
    Result := Definition.info.title;
  end;

  function GetComponentsNamespace: String;
  begin
    Result := GetNamespace + '/components';
  end;

  function GetComponentsSchemasNamespace: String;
  begin
    Result := GetComponentsNamespace + '/schemas';
  end;

  function GetComponentsRequestBodiesNamespace: String;
  begin
    Result := GetComponentsNamespace + '/requestBodies';
  end;

  function GeneratePropertyName(const ClassDefinition: TTypeClassDefinition): String;
  begin
    Result := 'AllOf';

    if ClassDefinition.HasProperties then
      Result := Result + Succ(Length(ClassDefinition.Properties)).ToString;
  end;

  function CreateReferenceType(const ParentModule: TTypeClassDefinition; const TypenName: String; const Reference: OpenAPIDefinition.Reference): TTypeReferenceDefinition;
  begin
    var ReferenceValue := Reference.&string[0].Value.Replace('#', GetNamespace);

    var Namespace := ReferenceValue.Substring(0, ReferenceValue.LastDelimiter('/'));

    Result := Importer.CreateReferenceType(ParentModule, TypenName, Namespace, ReferenceValue.Substring(Succ(Namespace.Length)));
  end;

  function CreateSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.Schema): TTypeDefinition;

    function CreatePropertyType(const ClassDefinition: TTypeClassDefinition; const PropertyName: String; const PropertySchema: OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType): TTypeDefinition;
    begin
      if PropertySchema.IsReferenceStored then
        Result := CreateReferenceType(ClassDefinition, PropertyName, PropertySchema.Reference)
      else
        Result := CreateSchemaType(ClassDefinition, Format('.%sType', [PropertyName]), PropertySchema.Schema);
    end;

  begin
    Result := Importer.BuildInTypes[TBuildInType.ValueType];

    if SchemaType.IsPropertiesStored then
    begin
      var ClassDefinition := Importer.CreateClassType(ParentModule, TypeName);

      for var PropertySchema in SchemaType.properties.additionalProperties do
        ClassDefinition.AddProperty(PropertySchema.Key, CreatePropertyType(ClassDefinition, PropertySchema.Key, PropertySchema.Value));

      Result := ClassDefinition;
    end
    else if SchemaType.IsEnumStored then
    begin
      var EnumeratorDefinition := Importer.CreateEnumeratorType(ParentModule, TypeName);

      for var EnumeratorValue in SchemaType.enum do
        EnumeratorDefinition.AddEnumeration(EnumeratorValue.ToString);

      Result := EnumeratorDefinition;
    end
    else if SchemaType.IsTypeStored then
      case SchemaType.&type of
        OpenAPIDefinition.Schema.TTypeType.array: ;
        OpenAPIDefinition.Schema.TTypeType.boolean: Result := Importer.BuildInTypes[TBuildInType.BooleanType];
        OpenAPIDefinition.Schema.TTypeType.integer: Result := Importer.BuildInTypes[TBuildInType.IntegerType];
        OpenAPIDefinition.Schema.TTypeType.number: Result := Importer.BuildInTypes[TBuildInType.DoubleType];
        OpenAPIDefinition.Schema.TTypeType.object: Result := Importer.CreateClassType(ParentModule, TypeName);
        OpenAPIDefinition.Schema.TTypeType.string: Result := Importer.BuildInTypes[TBuildInType.StringType];
      end
    else if SchemaType.IsAllOfStored then
    begin
      var ClassDefinition := Importer.CreateClassType(ParentModule, TypeName);

      for var AllOf in SchemaType.allOf do
        ClassDefinition.AddProperty(GeneratePropertyName(ClassDefinition), CreateSchemaType(ClassDefinition, '.AllOfType', AllOf.Schema));

      Result := ClassDefinition;
    end;
  end;

  function CreateComponentSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType): TTypeDefinition;
  begin
    if SchemaType.IsReferenceStored then
      Result := CreateReferenceType(ParentModule, TypeName, SchemaType.Reference)
    else
      Result := CreateSchemaType(ParentModule, TypeName, SchemaType.Schema);
  end;

  function CreateMediaSchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const SchemaType: OpenAPIDefinition.MediaType): TTypeDefinition;
  begin
    if SchemaType.schema.IsReferenceStored then
      Result := CreateReferenceType(ParentModule, TypeName, SchemaType.schema.Reference)
    else
      Result := CreateSchemaType(Schema.MainClass, TypeName, SchemaType.schema.Schema);
  end;

  function CreateRequestBodySchemaType(const ParentModule: TTypeClassDefinition; const TypeName: String; const RequestBodySchema: OpenAPIDefinition.RequestBody): TTypeDefinition;
  begin
    for var ContentType in RequestBodySchema.content.additionalProperties do
      if (ContentType.Key = CONTENTTYPE_APPLICATION_JSON) or (ContentType.Key = CONTENTTYPE_MULTIPART_FORM_DATA) then
        Exit(CreateMediaSchemaType(Schema.MainClass, TypeName, ContentType.Value));

    raise EInvalidContentType.Create(TypeName);
  end;

  procedure LoadOperationParameters(const MethodDefinition: TTypeMethodDefinition; const Operation: OpenAPIDefinition.Operation);

    function FormatTypeName(const ParameterName: String): String;
    begin
      Result := Format('.%s_%sType', [MethodDefinition.Name, ParameterName]);
    end;

    function CreateParameterType(const ParameterSchema: OpenAPIDefinition.Parameter): TTypeDefinition;
    begin
      var TypeName := FormatTypeName(ParameterSchema.name);

      if ParameterSchema.schema.IsReferenceStored then
        Result := CreateReferenceType(Schema.MainClass, TypeName, ParameterSchema.schema.Reference)
      else
        Result := CreateSchemaType(Schema.MainClass, TypeName, ParameterSchema.schema.Schema);
    end;

    function LoadBodyType: TTypeDefinition;
    begin
      var TypeName := FormatTypeName(BODY_PARAMETER_NAME);

      if Operation.requestBody.IsReferenceStored then
        Result := CreateReferenceType(Schema.MainClass, TypeName, Operation.requestBody.Reference)
      else
        Result := CreateRequestBodySchemaType(Schema.MainClass, TypeName, Operation.requestBody.RequestBody);
    end;

  begin
    for var ParameterSchema in Operation.parameters do
    begin
      var ParameterDefinition := Importer.CreateParameter(MethodDefinition, ParameterSchema.Parameter.name, CreateParameterType(ParameterSchema.Parameter));

      if ParameterSchema.Parameter.&in = 'header' then
        Importer.CreateHeaderAttribute(ParameterDefinition)
      else if ParameterSchema.Parameter.&in = 'path' then
        Importer.CreatePathNameAttribute(ParameterDefinition)
      else if ParameterSchema.Parameter.&in = 'query' then
        Importer.CreateQueryAttribute(ParameterDefinition);
    end;

    if Operation.IsRequestBodyStored then
    begin
      var Parameter := Importer.CreateParameter(MethodDefinition, BODY_PARAMETER_NAME, LoadBodyType);

      Importer.CreateBodyAttribute(Parameter);
    end;
  end;

  function GetServerName: String;
  begin
    for var ServerInfo in Definition.servers do
      Exit(ServerInfo.url);

    Result := EmptyStr;
  end;

begin
  Definition := Schema.SchemaValue.AsType<OpenAPIDefinition>;
  Importer := Schema.Importer;

  if not Assigned(Schema.ServiceInterface) then
    raise EServiceInterfaceNameEmpty.Create;

  for var SchemaDefinition in Definition.components.schemas.PatternProperty do
  begin
    var TypeDefinition := CreateComponentSchemaType(Schema.MainClass, SchemaDefinition.Key, SchemaDefinition.Value);

    if not TypeDefinition.IsClassDefinition and not TypeDefinition.IsEnumeratorDefinition then
      TypeDefinition := Importer.CreateAliasType(Schema.MainClass, SchemaDefinition.Key, TypeDefinition);

    Importer.AddType(GetComponentsSchemasNamespace, TypeDefinition);
  end;

  for var RequestBodyDefinition in Definition.components.requestBodies.PatternProperty do
  begin
    var TypeDefinition := CreateRequestBodySchemaType(Schema.MainClass, RequestBodyDefinition.Key, RequestBodyDefinition.Value.RequestBody);

    Importer.AddType(GetComponentsRequestBodiesNamespace, TypeDefinition);
  end;

  for PathItem in Definition.paths.PathItem do
  begin
    var MethodName := PathItem.Key;
    var MethodSchema := PathItem.Value;
    var Operation: OpenAPIDefinition.Operation;

    var MethodDefinition := Importer.CreateServiceMethod(Schema.ServiceInterface, MethodName.Substring(1).Replace('/', '_'), nil);

    if MethodSchema.IsPatchStored then
    begin
      Operation := MethodSchema.patch;

      Importer.CreatePatchAttribute(MethodDefinition);
    end
    else if MethodSchema.IsGetStored then
    begin
      Operation := MethodSchema.get;

      Importer.CreateGetAttribute(MethodDefinition);
    end
    else if MethodSchema.IsPostStored then
    begin
      Operation := MethodSchema.post;

      Importer.CreatePostAttribute(MethodDefinition);
    end
    else if MethodSchema.IsDeleteStored then
    begin
      Operation := MethodSchema.delete;

      Importer.CreateDeleteAttribute(MethodDefinition);
    end
    else if MethodSchema.IsOptionsStored then
    begin
      Operation := MethodSchema.options;

      Importer.CreateOptionsAttribute(MethodDefinition);
    end
    else if MethodSchema.IsPutStored then
    begin
      Operation := MethodSchema.put;

      Importer.CreatePutAttribute(MethodDefinition);
    end
    else
      raise EPathItemWithoutOperation.Create(PathItem.Key);

    LoadOperationParameters(MethodDefinition, Operation);

    if not SameText(MethodDefinition.Name, MethodName.Substring(1)) then
      Importer.CreateRemoteNameAttribute(MethodDefinition, MethodName);
  end;

  Importer.CreateRemoteNameAttribute(Schema.ServiceInterface, GetServerName);
end;

function TOpenAPI30SchemaConverter.LoadDefinition(const Schema: TSchema): OpenAPIDefinition;

  function GetSerializer: IBluePrintSerializer;
  begin
    Result := TBluePrintJSONSerializer.Create;
  end;

begin
  Result := GetSerializer.Deserialize(Schema.SchemaText, TypeInfo(OpenAPIDefinition)).AsType<OpenAPIDefinition>;
end;

procedure TOpenAPI30SchemaConverter.LoadSchema(const Schema: TSchema);
begin
  var Definition := LoadDefinition(Schema);

  Schema.Namespace := Definition.info.title;
  Schema.SchemaValue := Definition;
end;

{ EPathItemWithoutOperation }

constructor EPathItemWithoutOperation.Create(const Path: String);
begin
  inherited CreateFmt('The path item "%s" doesn''t have a operation loaded!', [Path]);
end;

{ EServiceInterfaceNameEmpty }

constructor EServiceInterfaceNameEmpty.Create;
begin
  inherited Create('Must configure the "ServiceInterfaceName" in the schema file!');
end;

{ EInvalidContentType }

constructor EInvalidContentType.Create(const Path: String);
begin
  inherited CreateFmt('The path item "%s" doesn''t have a valid content type!', [Path]);
end;

initialization
  TSchemaImporter.Converters[TSchemaType.OpenAPI30] := TOpenAPI30SchemaConverter.Create;

end.

