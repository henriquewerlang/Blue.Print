unit Blue.Print.Schema.Importer.Open.API.v20;

interface

uses System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v20;

type
  TOpenAPI20Import = class(TSchemaImporter)
  private
    FOpenAPIDefinition: TOpenAPIDefinition;
    FOpenAPIDefinitions: TDictionary<String, TOpenAPIDefinition>;

    function GenerateClassDefintion(const Module: TTypeModuleDefinition; const Schema: Schema; const ClassName: String): TTypeDefinition;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: Schema; const TypeName: String): TTypeDefinition;
    function GetSchemaReference(const Schema: Schema): Schema;
    function GetSchemaReferenceName(const Schema: Schema): String;
    function GetSimpleType(const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems): TTypeDefinition;
    function LoadOpenAPIDefinition(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;
  protected
    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration); override;
  public
    constructor Create;

    destructor Destroy; override;
  end;

implementation

uses System.SysUtils, System.Generics.Defaults, Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI20Import }

constructor TOpenAPI20Import.Create;
begin
  inherited;

  FOpenAPIDefinitions := TDictionary<String, TOpenAPIDefinition>.Create(TIStringComparer.Ordinal);
end;

destructor TOpenAPI20Import.Destroy;
begin
  FOpenAPIDefinitions.Free;

  inherited;
end;

function TOpenAPI20Import.GenerateClassDefintion(const Module: TTypeModuleDefinition; const Schema: Schema; const ClassName: String): TTypeDefinition;
begin
  var ClassDefinition := TClassDefinition.Create(Module);
  ClassDefinition.Name := ClassName;
  Result := ClassDefinition;

  for var Prop in Schema.properties.schema do
  begin
    var NewProperty := TPropertyDefinition.Create;
    NewProperty.Optional := True;
    NewProperty.Name := Prop.Key;
    NewProperty.PropertyType := GenerateTypeDefinition(Module, Prop.Value, NewProperty.Name + 'Property');

    if not Assigned(NewProperty.PropertyType) then
      raise Exception.Create('Property type not found!');

    ClassDefinition.Properties.Add(NewProperty);
  end;

  Module.Classes.Add(ClassDefinition);
end;

function TOpenAPI20Import.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: Schema; const TypeName: String): TTypeDefinition;
var
  UnitDefinition: TUnitDefinition;

begin
  Result := FindType(TypeName, Module);

  if not Assigned(Result) then
  begin
    if Module.IsUnitDefinition then
      UnitDefinition := Module.AsUnitDefinition
    else
      UnitDefinition := Module.AsClassDefinition.UnitDefinition;

    if not Schema.ref.IsEmpty then
      Result := GenerateTypeDefinition(Module, GetSchemaReference(Schema), GetSchemaReferenceName(Schema))
    else if Schema.IsTypeStored then
      case Schema.&type.simpleTypes of
        simpleTypes.&array: Result := TTypeArrayDefinition.Create(UnitDefinition, GenerateTypeDefinition(Module, Schema.items.schema, TypeName + 'ArrayItem'));
        simpleTypes.&object: Result := GenerateClassDefintion(Module, Schema, TypeName);
        else Result := GetSimpleType(Schema.&type.simpleTypes, nil);
      end
    else
      Abort;
  end;
end;

procedure TOpenAPI20Import.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  Service: TTypeServiceDefinition;

  procedure AddMethod(const Operation: Operation);
  var
    Method: TTypeMethodDefinition;

    procedure AddParameter(const Name: String; const ParameterType: TTypeDefinition); overload;
    begin
      var Parameter := Method.AddParameter;
      Parameter.Name := Name;
      Parameter.ParameterType := ParameterType;
    end;

    procedure AddParameter(const Name: String; const Schema: Schema); overload;
    begin
      AddParameter(Name, GenerateTypeDefinition(UnitDefinition, Schema, Name));
    end;

  begin
    Method := TTypeMethodDefinition.Create;
    Method.Name := Operation.operationId;

    for var Return in Operation.responses.responseValue.Values do
      if Return.response.IsSchemaStored then
        Method.Return := GenerateTypeDefinition(UnitDefinition, Return.response.schema, Method.Name + 'Return');

    for var ParameterDefinitionItem in Operation.parameters do
    begin
      var ParameterDefinition := ParameterDefinitionItem.parameter;

      if ParameterDefinition.IsBodyParameterStored then
        AddParameter(ParameterDefinition.bodyParameter.name, ParameterDefinition.bodyParameter.schema)
      else if ParameterDefinition.IsNonBodyParameterStored then
      begin
        var NoBodyParameter := ParameterDefinition.nonBodyParameter;

        if NoBodyParameter.IsHeaderParameterSubSchemaStored then
          AddParameter(NoBodyParameter.headerParameterSubSchema.name, GetSimpleType(NoBodyParameter.headerParameterSubSchema.&type.simpleTypes, NoBodyParameter.headerParameterSubSchema.items))
        else if NoBodyParameter.IsQueryParameterSubSchemaStored then
          AddParameter(NoBodyParameter.queryParameterSubSchema.name, GetSimpleType(NoBodyParameter.queryParameterSubSchema.&type.simpleTypes, NoBodyParameter.queryParameterSubSchema.items))
        else if NoBodyParameter.IsPathParameterSubSchemaStored then
          AddParameter(NoBodyParameter.pathParameterSubSchema.name, GetSimpleType(NoBodyParameter.pathParameterSubSchema.&type.simpleTypes, NoBodyParameter.pathParameterSubSchema.items))
        else if NoBodyParameter.IsFormDataParameterSubSchemaStored then
          AddParameter(NoBodyParameter.formDataParameterSubSchema.name, GetSimpleType(NoBodyParameter.formDataParameterSubSchema.&type.simpleTypes, NoBodyParameter.formDataParameterSubSchema.items));
      end;
    end;

    Service.Methods.Add(Method);
  end;

begin
  FOpenAPIDefinition := LoadOpenAPIDefinition(UnitFileConfiguration);
  Service := TTypeServiceDefinition.Create(UnitDefinition);
  Service.Name := UnitDefinition.UnitConfiguration.ServiceName;

  UnitDefinition.Services.Add(Service);

  for var Definition in FOpenAPIDefinition.definitions.schema do
  begin
    var TypeDefinition := GenerateTypeDefinition(UnitDefinition, Definition.Value, Definition.Key);

    if TypeDefinition.IsEnumeration and not BuildInType.ContainsKey(TypeDefinition.Name) then
      UnitDefinition.Enumerations.Add(TypeDefinition.AsTypeEnumeration)
    else if not TypeDefinition.IsClassDefinition then
      UnitDefinition.AddTypeAlias(CreateTypeAlias(UnitDefinition, Definition.Key, TypeDefinition));
  end;

  for var PathItem in FOpenAPIDefinition.paths.pathItem do
    if PathItem.Value.IsGetStored then
      AddMethod(PathItem.Value.get)
    else if PathItem.Value.IsPostStored then
      AddMethod(PathItem.Value.post)
    else if PathItem.Value.IsPutStored then
      AddMethod(PathItem.Value.put)
    else if PathItem.Value.IsDeleteStored then
      AddMethod(PathItem.Value.delete)
    else if PathItem.Value.IsOptionsStored then
      AddMethod(PathItem.Value.options)
    else if PathItem.Value.IsPatchStored then
      AddMethod(PathItem.Value.patch)
    else if PathItem.Value.IsHeadStored then
      AddMethod(PathItem.Value.head);
end;

function TOpenAPI20Import.GetSchemaReference(const Schema: Schema): Schema;
begin
  var List: TDynamicProperty<Blue.Print.Open.API.Schema.v20.Schema> := nil;
  Result := nil;

  for var ReferenceName in Schema.ref.Split(['/']) do
    if ReferenceName = '#' then
      Result := nil
    else if (ReferenceName = 'definitions') or (ReferenceName = 'defs') then
      List := FOpenAPIDefinition.definitions.schema
    else if ReferenceName = 'properties' then
      List := Result.properties.schema
    else
      Result := List[ReferenceName];

  if not Assigned(Result) then
    raise Exception.CreateFmt('Reference not found %s', [Schema.ref]);
end;

function TOpenAPI20Import.GetSchemaReferenceName(const Schema: Schema): String;
begin
  var Values := Schema.ref.Split(['/']);

  Result := Values[High(Values)];
end;

function TOpenAPI20Import.GetSimpleType(const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems): TTypeDefinition;
begin
  case SimpleType of
    simpleTypes.array: Result := nil;
    simpleTypes.boolean: Result := BooleanType;
    simpleTypes.null: Result := nil;
    simpleTypes.integer: Result := IntegerType;
    simpleTypes.number: Result := DoubleType;
    simpleTypes.&string: Result := StringType;
    else Abort;
  end
end;

function TOpenAPI20Import.LoadOpenAPIDefinition(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;
begin
  if not FOpenAPIDefinitions.TryGetValue(UnitFileConfiguration.Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(LoadFile(UnitFileConfiguration), TypeInfo(TOpenAPIDefinition)).AsType<TOpenAPIDefinition>;

    FOpenAPIDefinitions.Add(UnitFileConfiguration.Reference, Result);
  end;
end;

end.

