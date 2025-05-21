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
  NonNegativeIntegerDefault0 = class;
  TSchema = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.JSON.Schema.TSchema>;
  nonNegativeInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;

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

  [Flat]
  TSchema = class
  public type
    TObject = class
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

      TDefinitions = class
      private
        FSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;

        function GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
        function GetSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
      published
        property Schema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema> read GetSchema write FSchema stored GetSchemaStored;
      end;

      TProperties = class
      private
        FSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;

        function GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
        function GetSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
      published
        property Schema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema> read GetSchema write FSchema stored GetSchemaStored;
      end;

      TPatternProperties = class
      private
        FSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;

        function GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
        function GetSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
      published
        property Schema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema> read GetSchema write FSchema stored GetSchemaStored;
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
      FItems: Blue.Print.JSON.Schema.TSchema.TObject.TItems;
      FMaxItems: nonNegativeInteger;
      FMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
      FUniqueItems: System.Boolean;
      FContains: Blue.Print.JSON.Schema.TSchema;
      FMaxProperties: nonNegativeInteger;
      FMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
      FRequired: stringArray;
      FAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
      FDefinitions: Blue.Print.JSON.Schema.TSchema.TObject.TDefinitions;
      FProperties: Blue.Print.JSON.Schema.TSchema.TObject.TProperties;
      FPatternProperties: Blue.Print.JSON.Schema.TSchema.TObject.TPatternProperties;
      FDependencies: Blue.Print.JSON.Schema.TSchema.TObject.TDependencies;
      FPropertyNames: Blue.Print.JSON.Schema.TSchema;
      FConst: any;
      FEnum: TArray<any>;
      FType: Blue.Print.JSON.Schema.TSchema.TObject.TType;
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
      FDefaultIsStored: Boolean;
      FReadOnlyIsStored: Boolean;
      FWriteOnlyIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;
      FConstIsStored: Boolean;

      function GetMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
      function GetAdditionalItems: Blue.Print.JSON.Schema.TSchema;
      function GetItems: Blue.Print.JSON.Schema.TSchema.TObject.TItems;
      function GetMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
      function GetContains: Blue.Print.JSON.Schema.TSchema;
      function GetMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
      function GetAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
      function GetDefinitions: Blue.Print.JSON.Schema.TSchema.TObject.TDefinitions;
      function GetProperties: Blue.Print.JSON.Schema.TSchema.TObject.TProperties;
      function GetPatternProperties: Blue.Print.JSON.Schema.TSchema.TObject.TPatternProperties;
      function GetDependencies: Blue.Print.JSON.Schema.TSchema.TObject.TDependencies;
      function GetPropertyNames: Blue.Print.JSON.Schema.TSchema;
      function GetType: Blue.Print.JSON.Schema.TSchema.TObject.TType;
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
      procedure SetDefault(const Value: any);
      procedure SetReadOnly(const Value: System.Boolean);
      procedure SetWriteOnly(const Value: System.Boolean);
      procedure SetUniqueItems(const Value: System.Boolean);
      procedure SetConst(const Value: any);
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
      property IsDefaultStored: Boolean read FDefaultIsStored;
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
      property IsConstStored: Boolean read FConstIsStored;
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
      property default: any read FDefault write SetDefault stored FDefaultIsStored;
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
      property items: Blue.Print.JSON.Schema.TSchema.TObject.TItems read GetItems write FItems stored GetItemsStored;
      property maxItems: nonNegativeInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
      property contains: Blue.Print.JSON.Schema.TSchema read GetContains write FContains stored GetContainsStored;
      property maxProperties: nonNegativeInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: stringArray read FRequired write FRequired stored GetRequiredStored;
      property additionalProperties: Blue.Print.JSON.Schema.TSchema read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property definitions: Blue.Print.JSON.Schema.TSchema.TObject.TDefinitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property properties: Blue.Print.JSON.Schema.TSchema.TObject.TProperties read GetProperties write FProperties stored GetPropertiesStored;
      property patternProperties: Blue.Print.JSON.Schema.TSchema.TObject.TPatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      property dependencies: Blue.Print.JSON.Schema.TSchema.TObject.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
      property propertyNames: Blue.Print.JSON.Schema.TSchema read GetPropertyNames write FPropertyNames stored GetPropertyNamesStored;
      [FieldName('const')]
      property &const: any read FConst write SetConst stored FConstIsStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      [FieldName('type')]
      property &type: Blue.Print.JSON.Schema.TSchema.TObject.TType read GetType write FType stored GetTypeStored;
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
  private
    FObject: Blue.Print.JSON.Schema.TSchema.TObject;
    FBoolean: System.Boolean;
    FBooleanIsStored: Boolean;

    function GetObject: Blue.Print.JSON.Schema.TSchema.TObject;
    function GetObjectStored: Boolean;
    procedure SetBoolean(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsObjectStored: Boolean read GetObjectStored;
    property IsBooleanStored: Boolean read FBooleanIsStored;
  published
    [FieldName('Object')]
    property &Object: Blue.Print.JSON.Schema.TSchema.TObject read GetObject write FObject stored GetObjectStored;
    property Boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
  end;

implementation

uses System.SysUtils;

{ NonNegativeIntegerDefault0 }

function NonNegativeIntegerDefault0.GetNonNegativeIntegerStored: Boolean;
begin
  Result := FNonNegativeInteger <> 0;
end;

{ TSchema }

destructor TSchema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function TSchema.GetObject: Blue.Print.JSON.Schema.TSchema.TObject;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.JSON.Schema.TSchema.TObject.Create;

  Result := FObject;
end;

function TSchema.GetObjectStored: Boolean;
begin
  Result := Assigned(FObject);
end;

procedure TSchema.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ TSchema.TObject }

destructor TSchema.TObject.Destroy;
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

function TSchema.TObject.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TSchema.TObject.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TSchema.TObject.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TSchema.TObject.GetCommentStored: Boolean;
begin
  Result := not FComment.IsEmpty;
end;

function TSchema.TObject.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TSchema.TObject.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure TSchema.TObject.SetDefault(const Value: any);
begin
  FDefault := Value;
  FDefaultIsStored := True;
end;

procedure TSchema.TObject.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

procedure TSchema.TObject.SetWriteOnly(const Value: System.Boolean);
begin
  FWriteOnly := Value;
  FWriteOnlyIsStored := True;
end;

function TSchema.TObject.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TSchema.TObject.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TSchema.TObject.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TSchema.TObject.GetExclusiveMaximumStored: Boolean;
begin
  Result := FExclusiveMaximum <> 0;
end;

function TSchema.TObject.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TSchema.TObject.GetExclusiveMinimumStored: Boolean;
begin
  Result := FExclusiveMinimum <> 0;
end;

function TSchema.TObject.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TSchema.TObject.GetMinLength: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinLength;
end;

function TSchema.TObject.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TSchema.TObject.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TSchema.TObject.GetAdditionalItems: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FAdditionalItems;
end;

function TSchema.TObject.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TSchema.TObject.GetItems: Blue.Print.JSON.Schema.TSchema.TObject.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Schema.TSchema.TObject.TItems.Create;

  Result := FItems;
end;

function TSchema.TObject.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.TObject.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TSchema.TObject.GetMinItems: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.TObject.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure TSchema.TObject.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TSchema.TObject.GetContains: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FContains) then
    FContains := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FContains;
end;

function TSchema.TObject.GetContainsStored: Boolean;
begin
  Result := Assigned(FContains);
end;

function TSchema.TObject.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TSchema.TObject.GetMinProperties: Blue.Print.JSON.Schema.NonNegativeIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Schema.NonNegativeIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.TObject.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TSchema.TObject.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TSchema.TObject.GetAdditionalProperties: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FAdditionalProperties;
end;

function TSchema.TObject.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.TObject.GetDefinitions: Blue.Print.JSON.Schema.TSchema.TObject.TDefinitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Schema.TSchema.TObject.TDefinitions.Create;

  Result := FDefinitions;
end;

function TSchema.TObject.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchema.TObject.GetProperties: Blue.Print.JSON.Schema.TSchema.TObject.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Schema.TSchema.TObject.TProperties.Create;

  Result := FProperties;
end;

function TSchema.TObject.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.TObject.GetPatternProperties: Blue.Print.JSON.Schema.TSchema.TObject.TPatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Schema.TSchema.TObject.TPatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.TObject.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.TObject.GetDependencies: Blue.Print.JSON.Schema.TSchema.TObject.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Schema.TSchema.TObject.TDependencies.Create;

  Result := FDependencies;
end;

function TSchema.TObject.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TSchema.TObject.GetPropertyNames: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FPropertyNames) then
    FPropertyNames := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FPropertyNames;
end;

function TSchema.TObject.GetPropertyNamesStored: Boolean;
begin
  Result := Assigned(FPropertyNames);
end;

procedure TSchema.TObject.SetConst(const Value: any);
begin
  FConst := Value;
  FConstIsStored := True;
end;

function TSchema.TObject.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TSchema.TObject.GetType: Blue.Print.JSON.Schema.TSchema.TObject.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Schema.TSchema.TObject.TType.Create;

  Result := FType;
end;

function TSchema.TObject.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TSchema.TObject.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TSchema.TObject.GetContentMediaTypeStored: Boolean;
begin
  Result := not FContentMediaType.IsEmpty;
end;

function TSchema.TObject.GetContentEncodingStored: Boolean;
begin
  Result := not FContentEncoding.IsEmpty;
end;

function TSchema.TObject.GetIf: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FIf) then
    FIf := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FIf;
end;

function TSchema.TObject.GetIfStored: Boolean;
begin
  Result := Assigned(FIf);
end;

function TSchema.TObject.GetThen: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FThen) then
    FThen := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FThen;
end;

function TSchema.TObject.GetThenStored: Boolean;
begin
  Result := Assigned(FThen);
end;

function TSchema.TObject.GetElse: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FElse) then
    FElse := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FElse;
end;

function TSchema.TObject.GetElseStored: Boolean;
begin
  Result := Assigned(FElse);
end;

function TSchema.TObject.AddAllOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TSchema.TObject.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TSchema.TObject.AddAnyOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TSchema.TObject.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TSchema.TObject.AddOneOf: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TSchema.TObject.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TSchema.TObject.GetNot: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FNot;
end;

function TSchema.TObject.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ TSchema.TObject.TItems }

destructor TSchema.TObject.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TSchema.TObject.TItems.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TObject.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TSchema.TObject.TItems.AddSchemaArray: Blue.Print.JSON.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Schema.TSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TSchema.TObject.TItems.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TSchema.TObject.TDefinitions }

destructor TSchema.TObject.TDefinitions.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TObject.TDefinitions.GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TObject.TDefinitions.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TObject.TProperties }

destructor TSchema.TObject.TProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TObject.TProperties.GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TObject.TProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TObject.TPatternProperties }

destructor TSchema.TObject.TPatternProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TObject.TPatternProperties.GetSchema: TDynamicProperty<Blue.Print.JSON.Schema.TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TObject.TPatternProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TObject.TDependencies }

destructor TSchema.TObject.TDependencies.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TObject.TDependencies.GetSchema: Blue.Print.JSON.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TObject.TDependencies.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TSchema.TObject.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TSchema.TObject.TType }

procedure TSchema.TObject.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function TSchema.TObject.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

end.
