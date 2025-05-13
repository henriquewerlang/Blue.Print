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

  for var Prop in Schema.properties do
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
        simpleTypes.boolean: Result := BooleanType;
        simpleTypes.null: Result := nil;
        simpleTypes.integer: Result := IntegerType;
        simpleTypes.number: Result := DoubleType;
        simpleTypes.&object: Result := GenerateClassDefintion(Module, Schema, TypeName);
        simpleTypes.&string: Result := StringType;
      end
      else
        Abort;
  end;
end;

procedure TOpenAPI20Import.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  FOpenAPIDefinition := LoadOpenAPIDefinition(UnitFileConfiguration);

  for var Definition in FOpenAPIDefinition.definitions do
  begin
    var TypeDefinition := GenerateTypeDefinition(UnitDefinition, Definition.Value, Definition.Key);

    if TypeDefinition.IsEnumeration then
    begin
      if not BuildInType.ContainsKey(TypeDefinition.Name) then
        UnitDefinition.Enumerations.Add(TypeDefinition.AsTypeEnumeration)
    end
    else if not TypeDefinition.IsClassDefinition then
      UnitDefinition.AddTypeAlias(CreateTypeAlias(UnitDefinition, Definition.Key, TypeDefinition));
  end;
end;

function TOpenAPI20Import.GetSchemaReference(const Schema: Schema): Schema;
begin
  var List: definitions := nil;
  Result := nil;

  for var ReferenceName in Schema.ref.Split(['/']) do
    if ReferenceName = '#' then
      Result := nil
    else if (ReferenceName = 'definitions') or (ReferenceName = 'defs') then
      List := FOpenAPIDefinition.definitions
    else if ReferenceName = 'properties' then
      List := Result.properties
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

