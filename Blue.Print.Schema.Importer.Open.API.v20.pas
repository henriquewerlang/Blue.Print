unit Blue.Print.Schema.Importer.Open.API.v20;

interface

uses System.Generics.Collections, Blue.Print.Schema.Importer, Blue.Print.Open.API.Schema.v20;

type
  TOpenAPI20Import = class(TSchemaImporter)
  private
    FJSONSchema: TSchema;
    FSchemas: TDictionary<String, TSchema>;

    function GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
    function LoadSchema(const UnitFileConfiguration: TUnitFileConfiguration): TSchema;
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

  FSchemas := TDictionary<String, TSchema>.Create(TIStringComparer.Ordinal);
end;

destructor TOpenAPI20Import.Destroy;
begin
  FSchemas.Free;

  inherited;
end;

function TOpenAPI20Import.GenerateTypeDefinition(const Module: TTypeModuleDefinition; const Schema: TSchema; const TypeName: String): TTypeDefinition;
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

//    if not Schema.ref.IsEmpty then
//      Result := GenerateTypeDefinition(Module, GetReferenceSchema(Schema), GetReferenceName(Schema))
//    else if Schema = FJSONSchema then
//      Result := FReferenceClassDefinition
//    else if Schema.IsTypeStored then
//      case Schema.&type.simpleTypes of
//        simpleTypes.&array: Result := TTypeArrayDefinition.Create(UnitDefinition, GetItemArrayTypeDefinition);
//        simpleTypes.boolean: Result := BooleanType;
//        simpleTypes.null: Result := nil;
//        simpleTypes.integer: Result := IntegerType;
//        simpleTypes.number: Result := DoubleType;
//        simpleTypes.&object: Result := TTypeMapDefinition.Create(UnitDefinition, StringType, GenerateTypeDefinition(Module, Schema.additionalProperties, TypeName + 'Properties'));
//        simpleTypes.&string: Result := StringType;
//      end
//      else
//      begin
//        if Assigned(Schema.enum) then
//          Result := CreateEnumerator
//        else if Assigned(Schema.allOf + Schema.oneOf + Schema.anyOf) then
//        begin
//          var InnerClassDefinition := CreateClassDefinition(Module, TypeName);
//          var PropertyName := EmptyStr;
//
//          InnerClassDefinition.AddAtribute('SingleObject');
//
//          for var SchemaProperty in Schema.allOf + Schema.oneOf + Schema.anyOf do
//            if GetPropertyName(SchemaProperty, PropertyName) then
//              DefineProperty(InnerClassDefinition, PropertyName, SchemaProperty).Optional := True;
//
//          Result := InnerClassDefinition;
//        end
//        else
//          Result := GetAnyTypeDefinition;
//      end;
  end;
end;

procedure TOpenAPI20Import.GenerateUnitFileDefinition(const UnitDefinition: TUnitDefinition; const UnitFileConfiguration: TUnitFileConfiguration);
begin
  FJSONSchema := LoadSchema(UnitFileConfiguration);

  if not FJSONSchema.schema.IsEmpty then
    LoadUnitFromReference(FJSONSchema.schema);

  for var Definition in FJSONSchema.definitions do
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

function TOpenAPI20Import.LoadSchema(const UnitFileConfiguration: TUnitFileConfiguration): TSchema;
begin
  if not FSchemas.TryGetValue(UnitFileConfiguration.Reference, Result) then
  begin
    var Serializer := TBluePrintJsonSerializer.Create as IBluePrintSerializer;

    Result := Serializer.Deserialize(LoadFile(UnitFileConfiguration), TypeInfo(TSchema)).AsType<TSchema>;

    FSchemas.Add(UnitFileConfiguration.Reference, Result);
  end;
end;

end.
