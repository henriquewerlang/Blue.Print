﻿unit Blue.Print.Schema.Importer.Open.API.v20;

interface

uses System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v20;

type
  TOpenAPI20SchemaLoader = class(TInterfacedObject, ISchemaLoader)
  private
    FImporter: TSchemaImporter;
    FOpenAPIDefinition: TOpenAPIDefinition;
    FOpenAPIDefinitions: TDictionary<String, TOpenAPIDefinition>;

    function GenerateClassDefintion(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const ClassName: String): TTypeDefinition;
    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const TypeName: String): TTypeDefinition;
    function GetSchemaReferenceName(const OpenAPISchema: Schema): String;
    function GetSimpleType(const Module: TTypeModuleDefinition; const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems): TTypeDefinition;
    function LoadOpenAPIDefinition(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;

    procedure GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
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

uses System.SysUtils, System.Generics.Defaults, Blue.Print.Serializer, Blue.Print.Types;

{ TOpenAPI20SchemaLoader }

constructor TOpenAPI20SchemaLoader.Create(const Importer: TSchemaImporter);
begin
  inherited Create;

  FImporter := Importer;
  FOpenAPIDefinitions := TDictionary<String, TOpenAPIDefinition>.Create(TIStringComparer.Ordinal);
end;

destructor TOpenAPI20SchemaLoader.Destroy;
begin
  FOpenAPIDefinitions.Free;

  inherited;
end;

function TOpenAPI20SchemaLoader.GenerateClassDefintion(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const ClassName: String): TTypeDefinition;
begin
  var ClassDefinition := TClassDefinition.Create(Module);
  ClassDefinition.Name := ClassName;
  Result := ClassDefinition;

  for var Prop in OpenAPISchema.properties.schema do
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

function TOpenAPI20SchemaLoader.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const OpenAPISchema: Schema; const TypeName: String): TTypeDefinition;
begin
  Result := FImporter.FindType(TypeName, Module);

  if not Assigned(Result) then
    if not OpenAPISchema.ref.IsEmpty then
      Result := Module.AddDelayedType(GetSchemaReferenceName(OpenAPISchema))
    else if OpenAPISchema.IsTypeStored then
      case OpenAPISchema.&type.simpleTypes of
        simpleTypes.&array: Result := TTypeArrayDefinition.Create(Module, GenerateTypeDefinition(Module, OpenAPISchema.items.schema, TypeName + 'ArrayItem'));
        simpleTypes.&object: Result := GenerateClassDefintion(Module, OpenAPISchema, TypeName);
        else Result := GetSimpleType(Module, OpenAPISchema.&type.simpleTypes, nil);
      end
    else
      Abort;
end;

procedure TOpenAPI20SchemaLoader.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
var
  Service: TTypeInterfaceDefinition;

  procedure AddMethod(const Operation: Operation);
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

  begin
    Method := TTypeMethodDefinition.Create;
    Method.Name := Operation.operationId;

    for var Return in Operation.responses.responseValue.Values do
      if Return.response.IsSchemaStored then
        Method.Return := GenerateTypeDefinition(UnitDefinition, Return.response.schema.schema, Method.Name + 'Return');

    for var ParameterDefinitionItem in Operation.parameters do
    begin
      var ParameterDefinition := ParameterDefinitionItem.parameter;

      if ParameterDefinition.IsBodyParameterStored then
        AddParameter(ParameterDefinition.bodyParameter.name, ParameterDefinition.bodyParameter.schema)
      else if ParameterDefinition.IsNonBodyParameterStored then
      begin
        var NoBodyParameter := ParameterDefinition.nonBodyParameter;

        if NoBodyParameter.IsHeaderParameterSubSchemaStored then
        begin
          var Header := NoBodyParameter.headerParameterSubSchema;

          var Parameter := AddParameter(Header.name, GetSimpleType(UnitDefinition, Header.SimpleType, Header.items));
          Parameter.AddAtribute('HeaderValue(''%s'')', [Header.name]);
        end
        else if NoBodyParameter.IsQueryParameterSubSchemaStored then
        begin
          var Query := NoBodyParameter.queryParameterSubSchema;

          AddParameter(Query.name, GetSimpleType(UnitDefinition, Query.SimpleType, Query.items));
        end
        else if NoBodyParameter.IsPathParameterSubSchemaStored then
        begin
          var Path := NoBodyParameter.pathParameterSubSchema;

          AddParameter(Path.name, GetSimpleType(UnitDefinition, Path.SimpleType, Path.items));
        end
        else if NoBodyParameter.IsFormDataParameterSubSchemaStored then
        begin
          var Form := NoBodyParameter.formDataParameterSubSchema;

          AddParameter(Form.name, GetSimpleType(UnitDefinition, Form.SimpleType, Form.items));
        end;
      end;
    end;

    Service.Methods.Add(Method);
  end;

begin
  FOpenAPIDefinition := LoadOpenAPIDefinition(UnitFileConfiguration);
  Service := FImporter.CreateInterfaceDefinition(UnitDefinition, UnitFileConfiguration.InterfaceName);

  for var Definition in FOpenAPIDefinition.definitions.schema do
  begin
    var TypeDefinition := GenerateTypeDefinition(UnitDefinition, Definition.Value, Definition.Key);

    if TypeDefinition.IsEnumeration and not FImporter.BuildInType.ContainsKey(TypeDefinition.Name) then
      UnitDefinition.Enumerations.Add(TypeDefinition.AsTypeEnumeration)
    else if not TypeDefinition.IsClassDefinition then
      UnitDefinition.AddTypeAlias(FImporter.CreateTypeAlias(UnitDefinition, Definition.Key, TypeDefinition));
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

function TOpenAPI20SchemaLoader.GetSchemaReferenceName(const OpenAPISchema: Schema): String;
begin
  var Values := OpenAPISchema.ref.Split(['/']);

  Result := Values[High(Values)];
end;

function TOpenAPI20SchemaLoader.GetSimpleType(const Module: TTypeModuleDefinition; const SimpleType: simpleTypes; const ArrayItems: PrimitivesItems): TTypeDefinition;

  function GetArrayType(const ArrayType: PrimitivesItems): TTypeDefinition;
  begin
    case ArrayItems.&type of
      PrimitivesItems.TType.&string: Result := FImporter.StringType;
      PrimitivesItems.TType.number: Result := FImporter.DoubleType;
      PrimitivesItems.TType.integer: Result := FImporter.IntegerType;
      PrimitivesItems.TType.boolean: Result := FImporter.BooleanType;
      &PrimitivesItems.TType.array: Result := TTypeArrayDefinition.Create(Module, GetArrayType(ArrayItems.items));
      else Result := nil;
    end;
  end;

begin
  case SimpleType of
    simpleTypes.array: Result := TTypeArrayDefinition.Create(Module, GetArrayType(ArrayItems));
    simpleTypes.boolean: Result := FImporter.BooleanType;
    simpleTypes.null: Result := nil;
    simpleTypes.integer: Result := FImporter.IntegerType;
    simpleTypes.number: Result := FImporter.DoubleType;
    simpleTypes.&string: Result := FImporter.StringType;
    else Result := nil;
  end
end;

function TOpenAPI20SchemaLoader.LoadOpenAPIDefinition(const UnitFileConfiguration: TUnitFileConfiguration): TOpenAPIDefinition;
begin
  if not FOpenAPIDefinitions.TryGetValue(UnitFileConfiguration.Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(FImporter.LoadFile(UnitFileConfiguration), TypeInfo(TOpenAPIDefinition)).AsType<TOpenAPIDefinition>;

    FOpenAPIDefinitions.Add(UnitFileConfiguration.Reference, Result);
  end;
end;

{ THeaderParameterSubSchemaHelper }

function THeaderParameterSubSchemaHelper.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.&string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.&array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TQueryParameterSubSchemaHelper }

function TQueryParameterSubSchemaHelper.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.&string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.&array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TPathParameterSubSchema }

function TPathParameterSubSchema.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.&string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.&array);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

{ TFormDataParameterSubSchema }

function TFormDataParameterSubSchema.GetSimpleType: simpleTypes;
const
  SIMPLE_TYPE_CONVERTION: array[TType] of simpleTypes = (simpleTypes.&string, simpleTypes.number, simpleTypes.boolean, simpleTypes.integer, simpleTypes.&array, simpleTypes.null);

begin
  Result := SIMPLE_TYPE_CONVERTION[&type];
end;

end.

