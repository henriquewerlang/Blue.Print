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

  // Forward type alias
  schemaArray = TArray<Blue.Print.JSON.Schema.TSchema>;
  nonNegativeInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;

  TSchema = class
  public type
    [Flat]
    TItems = class
    private
      FSchema: Blue.Print.JSON.Schema.TSchema;
      FSchemaArray: schemaArray;

      function GetSchema: Blue.Print.JSON.Schema.TSchema;
      function GetSchemaStored: Boolean;
      function GetSchemaArrayStored: Boolean;
    public
      destructor Destroy; override;

      function AddSchemaArray: Blue.Print.JSON.Schema.TSchema;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
    published
      property Schema: Blue.Print.JSON.Schema.TSchema read GetSchema write FSchema stored GetSchemaStored;
      property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
    end;

    TDependencies = class
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

    [Flat]
    TType = class
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
  private
    FId: System.String;
    FSchema: System.String;
    FRef: System.String;
    FComment: System.String;
    FTitle: System.String;
    FDescription: System.String;
    FDefault: any;
    FReadOnly: System.Boolean;
    FWriteOnly: System.Boolean;
    FExamples: TArray<any>;
    FMultipleOf: System.Double;
    FMaximum: System.Double;
    FExclusiveMaximum: System.Double;
    FMinimum: System.Double;
    FExclusiveMinimum: System.Double;
    FMaxLength: nonNegativeInteger;
    FMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FPattern: System.String;
    FAdditionalItems: Blue.Print.JSON.Schema.TSchema;
    FItems: Blue.Print.JSON.Schema.TSchema.TItems;
    FMaxItems: nonNegativeInteger;
    FMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FUniqueItems: System.Boolean;
    FContains: Blue.Print.JSON.Schema.TSchema;
    FMaxProperties: nonNegativeInteger;
    FMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    FRequired: stringArray;
    FAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
    FDefinitions: TMap<Blue.Print.JSON.Schema.TSchema>;
    FProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
    FPatternProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
    FDependencies: Blue.Print.JSON.Schema.TSchema.TDependencies;
    FPropertyNames: Blue.Print.JSON.Schema.TSchema;
    FConst: any;
    FEnum: TArray<any>;
    FType: Blue.Print.JSON.Schema.TSchema.TType;
    FFormat: System.String;
    FContentMediaType: System.String;
    FContentEncoding: System.String;
    FIf: Blue.Print.JSON.Schema.TSchema;
    FThen: Blue.Print.JSON.Schema.TSchema;
    FElse: Blue.Print.JSON.Schema.TSchema;
    FAllOf: schemaArray;
    FAnyOf: schemaArray;
    FOneOf: schemaArray;
    FNot: Blue.Print.JSON.Schema.TSchema;
    FReadOnlyIsStored: Boolean;
    FWriteOnlyIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetAdditionalItems: Blue.Print.JSON.Schema.TSchema;
    function GetItems: Blue.Print.JSON.Schema.TSchema.TItems;
    function GetMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetContains: Blue.Print.JSON.Schema.TSchema;
    function GetMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
    function GetAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
    function GetDefinitions: TMap<Blue.Print.JSON.Schema.TSchema>;
    function GetProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
    function GetPatternProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
    function GetDependencies: Blue.Print.JSON.Schema.TSchema.TDependencies;
    function GetPropertyNames: Blue.Print.JSON.Schema.TSchema;
    function GetType: Blue.Print.JSON.Schema.TSchema.TType;
    function GetIf: Blue.Print.JSON.Schema.TSchema;
    function GetThen: Blue.Print.JSON.Schema.TSchema;
    function GetElse: Blue.Print.JSON.Schema.TSchema;
    function GetNot: Blue.Print.JSON.Schema.TSchema;
    function GetIdStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetRefStored: Boolean;
    function GetCommentStored: Boolean;
    function GetTitleStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetExclusiveMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetAdditionalItemsStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetContainsStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetPatternPropertiesStored: Boolean;
    function GetDependenciesStored: Boolean;
    function GetPropertyNamesStored: Boolean;
    function GetConstStored: Boolean;
    function GetEnumStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetContentMediaTypeStored: Boolean;
    function GetContentEncodingStored: Boolean;
    function GetIfStored: Boolean;
    function GetThenStored: Boolean;
    function GetElseStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetAnyOfStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetNotStored: Boolean;
    procedure SetReadOnly(const Value: System.Boolean);
    procedure SetWriteOnly(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: Blue.Print.JSON.Schema.TSchema;
    function AddAnyOf: Blue.Print.JSON.Schema.TSchema;
    function AddOneOf: Blue.Print.JSON.Schema.TSchema;

    property IsIdStored: Boolean read GetIdStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsRefStored: Boolean read GetRefStored;
    property IsCommentStored: Boolean read GetCommentStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
    property IsWriteOnlyStored: Boolean read FWriteOnlyIsStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsAdditionalItemsStored: Boolean read GetAdditionalItemsStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsContainsStored: Boolean read GetContainsStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
    property IsDependenciesStored: Boolean read GetDependenciesStored;
    property IsPropertyNamesStored: Boolean read GetPropertyNamesStored;
    property IsConstStored: Boolean read GetConstStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsContentMediaTypeStored: Boolean read GetContentMediaTypeStored;
    property IsContentEncodingStored: Boolean read GetContentEncodingStored;
    property IsIfStored: Boolean read GetIfStored;
    property IsThenStored: Boolean read GetThenStored;
    property IsElseStored: Boolean read GetElseStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsNotStored: Boolean read GetNotStored;
  published
    [FieldName('$id')]
    property id: System.String read FId write FId stored GetIdStored;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema stored GetSchemaStored;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    [FieldName('$comment')]
    property comment: System.String read FComment write FComment stored GetCommentStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property writeOnly: System.Boolean read FWriteOnly write SetWriteOnly stored FWriteOnlyIsStored;
    property examples: TArray<any> read FExamples write FExamples stored GetExamplesStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: System.Double read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: System.Double read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property maxLength: nonNegativeInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property additionalItems: Blue.Print.JSON.Schema.TSchema read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property items: Blue.Print.JSON.Schema.TSchema.TItems read GetItems write FItems stored GetItemsStored;
    property maxItems: nonNegativeInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property contains: Blue.Print.JSON.Schema.TSchema read GetContains write FContains stored GetContainsStored;
    property maxProperties: nonNegativeInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property minProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    property additionalProperties: Blue.Print.JSON.Schema.TSchema read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<Blue.Print.JSON.Schema.TSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property properties: TMap<Blue.Print.JSON.Schema.TSchema> read GetProperties write FProperties stored GetPropertiesStored;
    property patternProperties: TMap<Blue.Print.JSON.Schema.TSchema> read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property dependencies: Blue.Print.JSON.Schema.TSchema.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
    property propertyNames: Blue.Print.JSON.Schema.TSchema read GetPropertyNames write FPropertyNames stored GetPropertyNamesStored;
    [FieldName('const')]
    property &const: any read FConst write FConst stored GetConstStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('type')]
    property &type: Blue.Print.JSON.Schema.TSchema.TType read GetType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property contentMediaType: System.String read FContentMediaType write FContentMediaType stored GetContentMediaTypeStored;
    property contentEncoding: System.String read FContentEncoding write FContentEncoding stored GetContentEncodingStored;
    [FieldName('if')]
    property &if: Blue.Print.JSON.Schema.TSchema read GetIf write FIf stored GetIfStored;
    [FieldName('then')]
    property &then: Blue.Print.JSON.Schema.TSchema read GetThen write FThen stored GetThenStored;
    [FieldName('else')]
    property &else: Blue.Print.JSON.Schema.TSchema read GetElse write FElse stored GetElseStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    [FieldName('not')]
    property &not: Blue.Print.JSON.Schema.TSchema read GetNot write FNot stored GetNotStored;
  end;

  [Flat]
  NonNegativeIntegerDefault0 = class
  private
    FNonNegativeInteger: nonNegativeInteger;

    function GetNonNegativeIntegerStored: Boolean;
  public
    property IsNonNegativeIntegerStored: Boolean read GetNonNegativeIntegerStored;
  published
    property nonNegativeInteger: nonNegativeInteger read FNonNegativeInteger write FNonNegativeInteger stored GetNonNegativeIntegerStored;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
begin
  FMinLength.Free;

  FAdditionalItems.Free;

  FItems.Free;

  FMinItems.Free;

  FContains.Free;

  FMinProperties.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FProperties.Free;

  FPatternProperties.Free;

  FDependencies.Free;

  FPropertyNames.Free;

  FType.Free;

  FIf.Free;

  FThen.Free;

  FElse.Free;

  for var AObject in FAllOf do
    AObject.Free;

  for var AObject in FAnyOf do
    AObject.Free;

  for var AObject in FOneOf do
    AObject.Free;

  FNot.Free;

  inherited;
end;

function TSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TSchema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TSchema.GetCommentStored: Boolean;
begin
  Result := not FComment.IsEmpty;
end;

function TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

procedure TSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

procedure TSchema.SetWriteOnly(const Value: System.Boolean);
begin
  FWriteOnly := Value;
  FWriteOnlyIsStored := True;
end;

function TSchema.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := FExclusiveMaximum <> 0;
end;

function TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := FExclusiveMinimum <> 0;
end;

function TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
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

function TSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
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

function TSchema.GetItems: Blue.Print.JSON.Schema.TSchema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Schema.TSchema.TItems.Create;

  Result := FItems;
end;

function TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
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

procedure TSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
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

function TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
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

function TSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
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

function TSchema.GetDefinitions: TMap<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FDefinitions;
end;

function TSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchema.GetProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FProperties;
end;

function TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.GetPatternProperties: TMap<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := TMap<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FPatternProperties;
end;

function TSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.GetDependencies: Blue.Print.JSON.Schema.TSchema.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Schema.TSchema.TDependencies.Create;

  Result := FDependencies;
end;

function TSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
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

function TSchema.GetConstStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TSchema.GetType: Blue.Print.JSON.Schema.TSchema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Schema.TSchema.TType.Create;

  Result := FType;
end;

function TSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TSchema.GetContentMediaTypeStored: Boolean;
begin
  Result := not FContentMediaType.IsEmpty;
end;

function TSchema.GetContentEncodingStored: Boolean;
begin
  Result := not FContentEncoding.IsEmpty;
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

function TSchema.AddAllOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TSchema.AddAnyOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TSchema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TSchema.AddOneOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TSchema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
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

{ TSchema.TItems }

destructor TSchema.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TSchema.TItems.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TSchema.TItems.AddSchemaArray: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TSchema.TItems.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TSchema.TDependencies }

destructor TSchema.TDependencies.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TDependencies.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TDependencies.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TSchema.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TSchema.TType }

procedure TSchema.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function TSchema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ NonNegativeIntegerDefault0 }

function NonNegativeIntegerDefault0.GetNonNegativeIntegerStored: Boolean;
begin
  Result := FNonNegativeInteger <> 0;
end;

end.
