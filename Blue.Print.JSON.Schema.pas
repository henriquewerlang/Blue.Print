unit Blue.Print.JSON.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-07/schema#;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  simpleTypes = (&array, boolean, integer, null, number, &object, &string);
  // Forward class declaration
  TSchema = class;
  NonNegativeIntegerDefault0 = class;
  Dependencies = class;
  Items = class;
  &Type = class;

  // Forward type alias
  nonNegativeInteger = System.Integer;
  schemaArray = TArray<Blue.Print.JSON.Schema.TSchema>;
  stringArray = TArray<System.String>;
  any = TValue;

  TSchema = class
  private
    FPropertyNames: Blue.Print.JSON.Schema.TSchema;
    FAnyOf: schemaArray;
    FExclusiveMaximum: System.Double;
    FFormat: System.String;
    FExclusiveMinimum: System.Double;
    FAllOf: schemaArray;
    FSchema: System.String;
    FProperties: TMap<System.String, Blue.Print.JSON.Schema.TSchema>;
    FNot: Blue.Print.JSON.Schema.TSchema;
    FMaxLength: nonNegativeInteger;
    FEnum: TArray<any>;
    FRef: System.String;
    FAdditionalItems: Blue.Print.JSON.Schema.TSchema;
    FContentMediaType: System.String;
    FPattern: System.String;
    FDefault: any;
    FMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FReadOnly: System.Boolean;
    FMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FTitle: System.String;
    FComment: System.String;
    FPatternProperties: TMap<System.String, Blue.Print.JSON.Schema.TSchema>;
    FMultipleOf: System.Double;
    FConst: any;
    FOneOf: schemaArray;
    FThen: Blue.Print.JSON.Schema.TSchema;
    FMinimum: System.Double;
    FDependencies: TMap<System.String, Blue.Print.JSON.Schema.Dependencies>;
    FAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
    FContains: Blue.Print.JSON.Schema.TSchema;
    FWriteOnly: System.Boolean;
    FDefinitions: TMap<System.String, Blue.Print.JSON.Schema.TSchema>;
    FMaxProperties: nonNegativeInteger;
    FElse: Blue.Print.JSON.Schema.TSchema;
    FId: System.String;
    FMaxItems: nonNegativeInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FContentEncoding: System.String;
    FItems: Blue.Print.JSON.Schema.Items;
    FMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FIf: Blue.Print.JSON.Schema.TSchema;
    FRequired: stringArray;
    FType: Blue.Print.JSON.Schema.&Type;
    FExamples: TArray<any>;

    function GetPropertyNames: Blue.Print.JSON.Schema.TSchema;
    function GetNot: Blue.Print.JSON.Schema.TSchema;
    function GetAdditionalItems: Blue.Print.JSON.Schema.TSchema;
    function GetMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetThen: Blue.Print.JSON.Schema.TSchema;
    function GetAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
    function GetContains: Blue.Print.JSON.Schema.TSchema;
    function GetElse: Blue.Print.JSON.Schema.TSchema;
    function GetItems: Blue.Print.JSON.Schema.Items;
    function GetMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetIf: Blue.Print.JSON.Schema.TSchema;
    function GetType: Blue.Print.JSON.Schema.&Type;
    function GetPropertyNamesStored: Boolean;
    function GetAnyOfStored: Boolean;
    function GetExclusiveMaximumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetNotStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetRefStored: Boolean;
    function GetAdditionalItemsStored: Boolean;
    function GetContentMediaTypeStored: Boolean;
    function GetPatternStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetReadOnlyStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetTitleStored: Boolean;
    function GetCommentStored: Boolean;
    function GetPatternPropertiesStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetConstStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetThenStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetDependenciesStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetContainsStored: Boolean;
    function GetWriteOnlyStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetElseStored: Boolean;
    function GetIdStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetUniqueItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetContentEncodingStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetIfStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetTypeStored: Boolean;
    function GetExamplesStored: Boolean;
  public
    destructor Destroy; override;

    property IsPropertyNamesStored: Boolean read GetPropertyNamesStored;
    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsNotStored: Boolean read GetNotStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsRefStored: Boolean read GetRefStored;
    property IsAdditionalItemsStored: Boolean read GetAdditionalItemsStored;
    property IsContentMediaTypeStored: Boolean read GetContentMediaTypeStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsReadOnlyStored: Boolean read GetReadOnlyStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsCommentStored: Boolean read GetCommentStored;
    property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsConstStored: Boolean read GetConstStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsThenStored: Boolean read GetThenStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsDependenciesStored: Boolean read GetDependenciesStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsContainsStored: Boolean read GetContainsStored;
    property IsWriteOnlyStored: Boolean read GetWriteOnlyStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsElseStored: Boolean read GetElseStored;
    property IsIdStored: Boolean read GetIdStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsContentEncodingStored: Boolean read GetContentEncodingStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsIfStored: Boolean read GetIfStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
  published
    property propertyNames: Blue.Print.JSON.Schema.TSchema read GetPropertyNames write FPropertyNames stored GetPropertyNamesStored;
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property exclusiveMaximum: System.Double read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Double read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema stored GetSchemaStored;
    property properties: TMap<System.String, Blue.Print.JSON.Schema.TSchema> read FProperties write FProperties stored GetPropertiesStored;
    [FieldName('not')]
    property &not: Blue.Print.JSON.Schema.TSchema read GetNot write FNot stored GetNotStored;
    property maxLength: nonNegativeInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property additionalItems: Blue.Print.JSON.Schema.TSchema read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property contentMediaType: System.String read FContentMediaType write FContentMediaType stored GetContentMediaTypeStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property minProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
    property minLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    [FieldName('$comment')]
    property comment: System.String read FComment write FComment stored GetCommentStored;
    property patternProperties: TMap<System.String, Blue.Print.JSON.Schema.TSchema> read FPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('const')]
    property &const: any read FConst write FConst stored GetConstStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    [FieldName('then')]
    property &then: Blue.Print.JSON.Schema.TSchema read GetThen write FThen stored GetThenStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property dependencies: TMap<System.String, Blue.Print.JSON.Schema.Dependencies> read FDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: Blue.Print.JSON.Schema.TSchema read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property contains: Blue.Print.JSON.Schema.TSchema read GetContains write FContains stored GetContainsStored;
    property writeOnly: System.Boolean read FWriteOnly write FWriteOnly stored GetWriteOnlyStored;
    property definitions: TMap<System.String, Blue.Print.JSON.Schema.TSchema> read FDefinitions write FDefinitions stored GetDefinitionsStored;
    property maxProperties: nonNegativeInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    [FieldName('else')]
    property &else: Blue.Print.JSON.Schema.TSchema read GetElse write FElse stored GetElseStored;
    [FieldName('$id')]
    property id: System.String read FId write FId stored GetIdStored;
    property maxItems: nonNegativeInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property contentEncoding: System.String read FContentEncoding write FContentEncoding stored GetContentEncodingStored;
    property items: Blue.Print.JSON.Schema.Items read GetItems write FItems stored GetItemsStored;
    property minItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    [FieldName('if')]
    property &if: Blue.Print.JSON.Schema.TSchema read GetIf write FIf stored GetIfStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.JSON.Schema.&Type read GetType write FType stored GetTypeStored;
    property examples: TArray<any> read FExamples write FExamples stored GetExamplesStored;
  end;

  [SingleObject]
  NonNegativeIntegerDefault0 = class
  private
    FNonNegativeInteger: nonNegativeInteger;

    function GetNonNegativeIntegerStored: Boolean;
  public
    property IsNonNegativeIntegerStored: Boolean read GetNonNegativeIntegerStored;
  published
    property nonNegativeInteger: nonNegativeInteger read FNonNegativeInteger write FNonNegativeInteger stored GetNonNegativeIntegerStored;
  end;

  [SingleObject]
  Dependencies = class
  private
    FSchema: Blue.Print.JSON.Schema.TSchema;
    FStringArray: stringArray;

    function GetSchema: Blue.Print.JSON.Schema.TSchema;
    function GetSchemaStored: Boolean;
    function GetStringArrayStored: Boolean;
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsStringArrayStored: Boolean read GetStringArrayStored;
  published
    property Schema: Blue.Print.JSON.Schema.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property stringArray: stringArray read FStringArray write FStringArray stored GetStringArrayStored;
  end;

  [SingleObject]
  Items = class
  private
    FSchema: Blue.Print.JSON.Schema.TSchema;
    FSchemaArray: schemaArray;

    function GetSchema: Blue.Print.JSON.Schema.TSchema;
    function GetSchemaStored: Boolean;
    function GetSchemaArrayStored: Boolean;
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
  published
    property Schema: Blue.Print.JSON.Schema.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
  end;

  [SingleObject]
  &Type = class
  private
    FSimpleTypes: simpleTypes;
    FArray: TArray<simpleTypes>;
    FSimpleTypesIsStored: Boolean;

    function GetArrayStored: Boolean;
    procedure SetSimpleTypes(const Value: simpleTypes);
  public
    property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
    property IsArrayStored: Boolean read GetArrayStored;
  published
    property simpleTypes: simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
    [FieldName('array')]
    property &array: TArray<simpleTypes> read FArray write FArray stored GetArrayStored;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
begin
  FPropertyNames.Free;

  FNot.Free;

  FAdditionalItems.Free;

  FMinProperties.Free;

  FMinLength.Free;

  FThen.Free;

  FAdditionalProperties.Free;

  FContains.Free;

  FElse.Free;

  FItems.Free;

  FMinItems.Free;

  FIf.Free;

  FType.Free;

  inherited;
end;

function TSchema.GetPropertyNames: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FPropertyNames) then
    FPropertyNames := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FPropertyNames;
end;

function TSchema.GetPropertyNamesStored: Boolean;
begin
  Result := Assigned(FPropertyNames);
end;

function TSchema.GetAnyOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := FExclusiveMaximum <> 0;
end;

function TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := FExclusiveMinimum <> 0;
end;

function TSchema.GetAllOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TSchema.GetPropertiesStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetNot: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FNot;
end;

function TSchema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TSchema.GetEnumStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TSchema.GetAdditionalItems: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FAdditionalItems;
end;

function TSchema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TSchema.GetContentMediaTypeStored: Boolean;
begin
  Result := not FContentMediaType.IsEmpty;
end;

function TSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TSchema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinLength;
end;

function TSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TSchema.GetCommentStored: Boolean;
begin
  Result := not FComment.IsEmpty;
end;

function TSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TSchema.GetConstStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetOneOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetThen: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FThen) then
    FThen := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FThen;
end;

function TSchema.GetThenStored: Boolean;
begin
  Result := Assigned(FThen);
end;

function TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TSchema.GetDependenciesStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.GetContains: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FContains) then
    FContains := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FContains;
end;

function TSchema.GetContainsStored: Boolean;
begin
  Result := Assigned(FContains);
end;

function TSchema.GetWriteOnlyStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetDefinitionsStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TSchema.GetElse: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FElse) then
    FElse := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FElse;
end;

function TSchema.GetElseStored: Boolean;
begin
  Result := Assigned(FElse);
end;

function TSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TSchema.GetContentEncodingStored: Boolean;
begin
  Result := not FContentEncoding.IsEmpty;
end;

function TSchema.GetItems: Blue.Print.JSON.Schema.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Schema.Items.Create;

  Result := FItems;
end;

function TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.GetMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TSchema.GetIf: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FIf) then
    FIf := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FIf;
end;

function TSchema.GetIfStored: Boolean;
begin
  Result := Assigned(FIf);
end;

function TSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetType: Blue.Print.JSON.Schema.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Schema.&Type.Create;

  Result := FType;
end;

function TSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TSchema.GetExamplesStored: Boolean;
begin
  Result := False;
end;

{ NonNegativeIntegerDefault0 }

function NonNegativeIntegerDefault0.GetNonNegativeIntegerStored: Boolean;
begin
  Result := FNonNegativeInteger <> 0;
end;

{ Dependencies }

destructor Dependencies.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Dependencies.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function Dependencies.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Dependencies.GetStringArrayStored: Boolean;
begin
  Result := False;
end;

{ Items }

destructor Items.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Items.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function Items.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Items.GetSchemaArrayStored: Boolean;
begin
  Result := False;
end;

{ &Type }

procedure &Type.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function &Type.GetArrayStored: Boolean;
begin
  Result := False;
end;

end.
