unit Blue.Print.Schema.Importer.Open.API.v30;

interface

uses System.Rtti, System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v30, Blue.Print.JSON.Draft4.Schema;

type
  TOpenAPI30SchemaLoader = class(TSchemaLoader, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FOpenAPIDefinition: TOpenAPIDefinition.TOpenAPIDefinition;
    FOpenAPIDefinitions: TDictionary<String, TOpenAPIDefinition.TOpenAPIDefinition>;
    FUnitFileConfiguration: TUnitFileConfiguration;

    function CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: TOpenAPIDefinition.Schema; const ClassName: String): TTypeDefinition;
    function CheckType(const Module: TTypeModuleDefinition; const TypeName: String; const SchemaType: TOpenAPIDefinition.Schema): TTypeDefinition;
    function CreateArrayDefinition(const Module: TTypeModuleDefinition; const TypeName: String; const ArrayItemType: TTypeDefinition): TTypeDefinition;
    function FindSchemaReference(const Reference: TOpenAPIDefinition.Reference): TOpenAPIDefinition.Schema;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: TOpenAPIDefinition.Schema; const TypeName: String): TTypeDefinition;
    function GetSchemaReferenceName(const Reference: TOpenAPIDefinition.Reference): String;
    function LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition.TOpenAPIDefinition;
    function LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition.TOpenAPIDefinition;
    function LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition.TOpenAPIDefinition;

    procedure GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
    procedure LoadClassDefinition(const ClassDefinition: TTypeClassDefinition; const ClassSchema: TOpenAPIDefinition.Schema);
  public
    constructor Create(const Importer: TSchemaImporter); override;

    destructor Destroy; override;
  end;

implementation

uses System.SysUtils, System.Generics.Defaults, System.IOUtils, REST.Types, Blue.Print.Serializer, Blue.Print.Types;

const
  REFERENCE_SEPARATOR = '#';

{ TOpenAPI30SchemaLoader }

function TOpenAPI30SchemaLoader.CheckClassDefinition(const Module: TTypeModuleDefinition; const ClassSchema: TOpenAPIDefinition.Schema; const ClassName: String): TTypeDefinition;
begin
  Result := FImporter.FindType(ClassName, Module);

  if not Assigned(Result) then
  begin
    Result := FImporter.CreateClassDefinition(Module, ClassName);

    LoadClassDefinition(Result.AsClassDefinition, ClassSchema);
  end;
end;

function TOpenAPI30SchemaLoader.CheckType(const Module: TTypeModuleDefinition; const TypeName: String; const SchemaType: TOpenAPIDefinition.Schema): TTypeDefinition;
begin
  Result := Importer.FindType(TypeName, Module);

  if not Assigned(Result) then
    Result := GenerateTypeDefinition(Module, SchemaType, TypeName);
end;

constructor TOpenAPI30SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited;

  FImporter := Importer;
  FOpenAPIDefinitions := TDictionary<String, TOpenAPIDefinition.TOpenAPIDefinition>.Create(TIStringComparer.Ordinal);
end;

function TOpenAPI30SchemaLoader.CreateArrayDefinition(const Module: TTypeModuleDefinition; const TypeName: String; const ArrayItemType: TTypeDefinition): TTypeDefinition;
begin
  Result := TTypeArrayDefinition.Create(Module, ArrayItemType);
end;

destructor TOpenAPI30SchemaLoader.Destroy;
begin
  FOpenAPIDefinitions.Free;

  inherited;
end;

function TOpenAPI30SchemaLoader.FindSchemaReference(const Reference: TOpenAPIDefinition.Reference): TOpenAPIDefinition.Schema;
begin
  Result := nil;
  var SchemaName := EmptyStr;

  var Schema := LoadSchemaReference(GetSchemaReferenceName(Reference), SchemaName);

  for var Definition in Schema.components.schemas.PatternPropertyElement do
    if Definition.Key = SchemaName then
      if Definition.Value.IsReferenceStored then
        Abort
      else
        Exit(Definition.Value.Schema);
end;

function TOpenAPI30SchemaLoader.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: TOpenAPIDefinition.Schema; const TypeName: String): TTypeDefinition;

  function GetArraySchemaType: TOpenAPIDefinition.Schema;
  begin
    if OpenAPISchema.items.IsReferenceStored then
      Result := FindSchemaReference(OpenAPISchema.items.Reference)
    else
      Result := OpenAPISchema.items.Schema;
  end;

  function CreateEnumerator: TTypeEnumeration;
  begin
    var TypeFinded := Importer.FindType(TypeName, Module);

    if Assigned(TypeFinded) then
      Result := TypeFinded.AsTypeEnumeration
    else
    begin
      Result := TTypeEnumeration.Create(Module);
      Result.Name := TypeName;

      for var EnumeratorValue in OpenAPISchema.enum do
        Result.Values.Add(EnumeratorValue.ToString);

      Module.Enumerations.Add(Result);
    end;
  end;


begin
  if OpenAPISchema.IsTypeStored then
    case OpenAPISchema.&type of
      TOpenAPIDefinition.Schema.TypeProperty.&object: Result := CheckClassDefinition(Module, OpenAPISchema, TypeName);
      TOpenAPIDefinition.Schema.TypeProperty.&array: Result := CreateArrayDefinition(Module, TypeName, GenerateTypeDefinition(Module, GetArraySchemaType, TypeName + 'ArrayItem'));
      TOpenAPIDefinition.Schema.TypeProperty.boolean: Result := FImporter.BooleanType;
      TOpenAPIDefinition.Schema.TypeProperty.integer: Result := FImporter.IntegerType;
      TOpenAPIDefinition.Schema.TypeProperty.number: Result := FImporter.DoubleType;
      TOpenAPIDefinition.Schema.TypeProperty.&string:
        if OpenAPISchema.IsEnumStored then
          Result := CreateEnumerator
        else
          Result := FImporter.StringType;
      else Abort;
    end
  else if OpenAPISchema.IsAllOfStored then
    Result := CheckClassDefinition(Module, OpenAPISchema, TypeName)
  else
    Abort;
end;

procedure TOpenAPI30SchemaLoader.GenerateUnitFileDefinition(const MainModule: TTypeModuleDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  Service: TTypeInterfaceDefinition;

  procedure AddRemoteName(const TypeDefinition: TTypeCommonDefinition; RemoteName: String);
  begin
    if RemoteName.StartsWith('/') then
      RemoteName := RemoteName.Substring(1);

    TypeDefinition.AddAtribute('RemoteName(''%s'')', [RemoteName]);
  end;

  procedure AddMethod(const Operation: TOpenAPIDefinition.Operation; const RemoteName, AttributeName: String);
  var
    Method: TTypeMethodDefinition;

    function AddParameter(const Name: String; const ParameterType: TTypeDefinition): TTypeParameterDefinition; overload;
    begin
      Result := Method.AddParameter;
      Result.Name := OnlyValidChars(Name);
      Result.ParameterType := ParameterType;
    end;

    function AddParameter(const Name: String; const OpenAPISchema: TOpenAPIDefinition.Schema): TTypeParameterDefinition; overload;
    begin
      Result := AddParameter(Name, GenerateTypeDefinition(MainModule, OpenAPISchema, Name));
    end;

    function FindReturnType: TTypeDefinition;
    begin
      var MediaType: TOpenAPIDefinition.MediaType := nil;
      Result := nil;

      for var Return in Operation.responses.PatternPropertyElement do
        if Return.Key.StartsWith('2') and Return.Value.IsReferenceStored then
          Abort
        else if Return.Value.Response.content.additionalProperties.ContainsKey(CONTENTTYPE_APPLICATION_JSON) then
          MediaType := Return.Value.Response.content.additionalProperties[CONTENTTYPE_APPLICATION_JSON]
        else
          Abort;

      if Assigned(MediaType) then
      begin
        var Schema: TOpenAPIDefinition.Schema;
        var ReturnClassName := Method.Name + 'Return';

        if MediaType.schema.IsReferenceStored then
          Schema := FindSchemaReference(MediaType.schema.Reference)
        else
          Schema := MediaType.schema.Schema;

        Result := GenerateTypeDefinition(MainModule, Schema, ReturnClassName);
      end;
    end;

    function GetParameter(const ParameterSchema: TOpenAPIDefinition.Operation.ParametersPropertyArrayItem): TOpenAPIDefinition.Parameter;
    begin
      if ParameterSchema.IsReferenceStored then
        Abort
      else
        Result := ParameterSchema.parameter;
    end;

  begin
    var CurrentParameter: NativeInt;
    var LastOptionalParameter: NativeInt := 0;
    var ParameterCount := Length(Operation.parameters);

    repeat
      CurrentParameter := 0;
      Method := TTypeMethodDefinition.Create(MainModule);
      Method.Name := Operation.operationId;

      if Method.Name.IsEmpty then
        Method.Name := OnlyValidChars(RemoteName);

      if '/' + Method.Name <> RemoteName then
        AddRemoteName(Method, RemoteName);

      Method.Return := FindReturnType;

      for var ParameterSchema in Operation.parameters do
      begin
        var ParameterDefinition := GetParameter(ParameterSchema);

        if not (ParameterDefinition.IsRequiredStored and ParameterDefinition.required) and (CurrentParameter >= LastOptionalParameter) then
        begin
          LastOptionalParameter := Succ(CurrentParameter);

          Break;
        end;

        Inc(CurrentParameter);

        var Parameter := AddParameter(ParameterDefinition.name, CheckType(MainModule, ParameterDefinition.Name + ParameterDefinition.&in, ParameterDefinition.schema.Schema));

        if ParameterDefinition.&in = 'header' then
          Parameter.AddAtribute('HeaderValue(''%s'')', [ParameterDefinition.name])
        else if ParameterDefinition.&in = 'query' then
        begin
          var QueryAttribute := EmptyStr;

          if Parameter.Name <> ParameterDefinition.name then
            QueryAttribute := Format('(''%s'')', [ParameterDefinition.name]);

          Parameter.AddAtribute('Query%s', [QueryAttribute]);
        end
        else if ParameterDefinition.&in = 'path' then
          Parameter.AddAtribute('PathName')
        else
          Abort;
      end;

      Method.AddAtribute(AttributeName);

      Service.Methods.Add(Method);
    until CurrentParameter >= ParameterCount;
  end;

begin
  FOpenAPIDefinition := LoadOpenAPIDefinitionFromConfiguration(UnitFileConfiguration);
  FUnitFileConfiguration := UnitFileConfiguration;
  Service := nil;

  if not UnitFileConfiguration.InterfaceName.IsEmpty then
    Service := FImporter.CreateInterfaceDefinition(MainModule.ParentUnit, UnitFileConfiguration.InterfaceName);

  for var Definition in FOpenAPIDefinition.components.schemas.PatternPropertyElement do
  begin
    var ComponentSchema: TOpenAPIDefinition.Schema;

    if Definition.Value.IsReferenceStored then
      ComponentSchema := FindSchemaReference(Definition.Value.Reference)
    else
      ComponentSchema := Definition.Value.Schema;

    var TypeDefinition := GenerateTypeDefinition(MainModule, ComponentSchema, Definition.Key);

    if not TypeDefinition.IsEnumeration and not TypeDefinition.IsClassDefinition and not TypeDefinition.IsTypeAlias then
      MainModule.AddTypeAlias(FImporter.CreateTypeAlias(MainModule, Definition.Key, TypeDefinition));
  end;

  for var PathItem in FOpenAPIDefinition.paths.pathItem do
  begin
    if PathItem.Value.IsGetStored then
      AddMethod(PathItem.Value.get, PathItem.Key, 'Get');

    if PathItem.Value.IsPostStored then
      AddMethod(PathItem.Value.post, PathItem.Key, 'Post');

    if PathItem.Value.IsPutStored then
      AddMethod(PathItem.Value.put, PathItem.Key, 'Put');

    if PathItem.Value.IsDeleteStored then
      AddMethod(PathItem.Value.delete, PathItem.Key, 'Delete');

    if PathItem.Value.IsOptionsStored then
      AddMethod(PathItem.Value.options, PathItem.Key, 'Options');

    if PathItem.Value.IsPatchStored then
      AddMethod(PathItem.Value.patch, PathItem.Key, 'Patch');

    if PathItem.Value.IsHeadStored then
      AddMethod(PathItem.Value.head, PathItem.Key, 'Head');
  end;
end;

function TOpenAPI30SchemaLoader.GetSchemaReferenceName(const Reference: TOpenAPIDefinition.Reference): String;
begin
  Result := Reference.&string['$ref'];
end;

procedure TOpenAPI30SchemaLoader.LoadClassDefinition(const ClassDefinition: TTypeClassDefinition; const ClassSchema: TOpenAPIDefinition.Schema);
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
        var PropertySchema: TOpenAPIDefinition.Schema;

        if Prop.Value.IsReferenceStored then
          PropertySchema := FindSchemaReference(Prop.Value.Reference)
        else
          PropertySchema := Prop.Value.Schema;

        DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, PropertySchema, PropertyName + 'Property'));
      end;
  end;

  function GetPropertyName(const PropertySchema: TOpenAPIDefinition.Schema.AllOfPropertyArrayItem): String;
  begin
    if PropertySchema.IsReferenceStored then
    begin
      var References := GetSchemaReferenceName(PropertySchema.Reference).Split(['/']);

      Result := References[High(References)];
    end
    else
    begin
      Inc(AnnonymusIndex);

      Result := ClassDefinition.Name + 'Property';

      if AnnonymusIndex > 1 then
        Result := Result + AnnonymusIndex.ToString;
    end;
  end;

  function GetPropertySchemaType(const PropertySchema: TOpenAPIDefinition.Schema.AllOfPropertyArrayItem): TOpenAPIDefinition.Schema;
  begin
    if PropertySchema.IsReferenceStored then
      Result := FindSchemaReference(PropertySchema.Reference)
    else
      Result := PropertySchema.Schema;
  end;

begin
  AnnonymusIndex := 0;

  DefineProperties;

  if ClassSchema.IsAllOfStored and not HasProperties then
    ClassDefinition.AddFlatAttribute;

  for var AllOfSchema in ClassSchema.allOf do
  begin
    var PropertyName := GetPropertyName(AllOfSchema);

    var PropertyDefinition := DefinePropety(PropertyName, GenerateTypeDefinition(ClassDefinition, GetPropertySchemaType(AllOfSchema), PropertyName));

    if HasProperties then
      PropertyDefinition.AddFlatAttribute;
  end;

//  if ClassSchema.IsXmlStored then
//  begin
//    ClassDefinition.AddAtribute('XML');
//
//    if ClassSchema.xml.name <> ClassDefinition.Name then
//      ClassDefinition.AddAtribute('DocumentName(''%s'')', [ClassSchema.xml.name]);
//  end;
end;

function TOpenAPI30SchemaLoader.LoadOpenAPIDefinition(const Reference: String): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  if not FOpenAPIDefinitions.TryGetValue(Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFile(Reference), TypeInfo(TOpenAPIDefinition.TOpenAPIDefinition)).AsType<TOpenAPIDefinition.TOpenAPIDefinition>;

    FOpenAPIDefinitions.Add(Reference, Result);
  end;
end;

function TOpenAPI30SchemaLoader.LoadOpenAPIDefinitionFromConfiguration(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  Result := LoadOpenAPIDefinition(UnitFileConfiguration.FileName);
end;

function TOpenAPI30SchemaLoader.LoadSchemaReference(const Reference: String; out ReferenceName: String): TOpenAPIDefinition.TOpenAPIDefinition;
begin
  var References := Reference.Split([REFERENCE_SEPARATOR]);
  var Values := References[1].Split(['/']);

  if References[0].IsEmpty then
    Result := FOpenAPIDefinition
  else
    Result := LoadOpenAPIDefinition(FImporter.LoadRelativePath(References[0], FImporter.GetFileNameFromSchemaFolder(FUnitFileConfiguration.FileName)));

  ReferenceName := Values[High(Values)];
end;

end.

