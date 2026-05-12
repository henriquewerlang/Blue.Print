unit Blue.Print.JSON.Draft4.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  simpleTypes = (&array, boolean, integer, null, number, &object, &string);
  // Forward class declaration
  PositiveIntegerDefault0 = class;
  TSchema = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.JSON.Draft4.Schema.TSchema>;
  positiveInteger = System.Integer;
  any = System.Rtti.TValue;
  stringArray = TArray<System.String>;

  [Flat]
  PositiveIntegerDefault0 = class
  private
    FPositiveInteger: positiveInteger;
    FAnonymous: any;
    FAnonymousIsStored: Boolean;

    function GetPositiveIntegerStored: Boolean;
    procedure SetAnonymous(const Value: any);
  public
    property IsPositiveIntegerStored: Boolean read GetPositiveIntegerStored;
    property IsAnonymousStored: Boolean read FAnonymousIsStored;
  published
    property positiveInteger: positiveInteger read FPositiveInteger write FPositiveInteger stored GetPositiveIntegerStored;
    property Anonymous: any read FAnonymous write SetAnonymous stored FAnonymousIsStored;
  end;

  TSchema = class
  public type
    [Flat]
    TAdditionalItems = class
    private
      FBoolean: System.Boolean;
      FSchema: TSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: TSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    [Flat]
    TItems = class
    private
      FSchema: TSchema;
      FSchemaArray: schemaArray;

      function GetSchema: TSchema;
      function GetSchemaStored: Boolean;
      function GetSchemaArrayStored: Boolean;
    public
      destructor Destroy; override;

      function AddSchemaArray: TSchema;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
    published
      property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
      property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
    end;

    [Flat]
    TAdditionalProperties = class
    private
      FBoolean: System.Boolean;
      FSchema: TSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: TSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    TDefinitions = class
    private
      FSchema: TDynamicProperty<TSchema>;

      function GetSchema: TDynamicProperty<TSchema>;
      function GetSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property Schema: TDynamicProperty<TSchema> read GetSchema write FSchema stored GetSchemaStored;
    end;

    TProperties = class
    private
      FSchema: TDynamicProperty<TSchema>;

      function GetSchema: TDynamicProperty<TSchema>;
      function GetSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property Schema: TDynamicProperty<TSchema> read GetSchema write FSchema stored GetSchemaStored;
    end;

    TPatternProperties = class
    private
      FSchema: TDynamicProperty<TSchema>;

      function GetSchema: TDynamicProperty<TSchema>;
      function GetSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property Schema: TDynamicProperty<TSchema> read GetSchema write FSchema stored GetSchemaStored;
    end;

    TDependencies = class
    private
      FSchema: TSchema;
      FStringArray: stringArray;

      function GetSchema: TSchema;
      function GetSchemaStored: Boolean;
      function GetStringArrayStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsStringArrayStored: Boolean read GetStringArrayStored;
    published
      property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
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
      property &Array: TArray<simpleTypes> read FArray write FArray stored GetArrayStored;
    end;
  private
    FId: System.String;
    FSchema: System.String;
    FTitle: System.String;
    FDescription: System.String;
    FDefault: any;
    FMultipleOf: System.Double;
    FMaximum: System.Double;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: positiveInteger;
    FMinLength: PositiveIntegerDefault0;
    FPattern: System.String;
    FAdditionalItems: TSchema.TAdditionalItems;
    FItems: TSchema.TItems;
    FMaxItems: positiveInteger;
    FMinItems: PositiveIntegerDefault0;
    FUniqueItems: System.Boolean;
    FMaxProperties: positiveInteger;
    FMinProperties: PositiveIntegerDefault0;
    FRequired: stringArray;
    FAdditionalProperties: TSchema.TAdditionalProperties;
    FDefinitions: TSchema.TDefinitions;
    FProperties: TSchema.TProperties;
    FPatternProperties: TSchema.TPatternProperties;
    FDependencies: TSchema.TDependencies;
    FEnum: TArray<any>;
    FType: TSchema.TType;
    FFormat: System.String;
    FAllOf: schemaArray;
    FAnyOf: schemaArray;
    FOneOf: schemaArray;
    FNot: TSchema;
    FDefaultIsStored: Boolean;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetMinLength: PositiveIntegerDefault0;
    function GetAdditionalItems: TSchema.TAdditionalItems;
    function GetItems: TSchema.TItems;
    function GetMinItems: PositiveIntegerDefault0;
    function GetMinProperties: PositiveIntegerDefault0;
    function GetAdditionalProperties: TSchema.TAdditionalProperties;
    function GetDefinitions: TSchema.TDefinitions;
    function GetProperties: TSchema.TProperties;
    function GetPatternProperties: TSchema.TPatternProperties;
    function GetDependencies: TSchema.TDependencies;
    function GetType: TSchema.TType;
    function GetNot: TSchema;
    function GetIdStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetTitleStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetAdditionalItemsStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetPatternPropertiesStored: Boolean;
    function GetDependenciesStored: Boolean;
    function GetEnumStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetAnyOfStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetNotStored: Boolean;
    procedure SetDefault(const Value: any);
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: TSchema;
    function AddAnyOf: TSchema;
    function AddOneOf: TSchema;

    property IsIdStored: Boolean read GetIdStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read FDefaultIsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsAdditionalItemsStored: Boolean read GetAdditionalItemsStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
    property IsDependenciesStored: Boolean read GetDependenciesStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsNotStored: Boolean read GetNotStored;
  published
    property id: System.String read FId write FId stored GetIdStored;
    [FieldName('$schema')]
    property Schema: System.String read FSchema write FSchema stored GetSchemaStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write SetDefault stored FDefaultIsStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property additionalItems: TSchema.TAdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property items: TSchema.TItems read GetItems write FItems stored GetItemsStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    property additionalProperties: TSchema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TSchema.TDefinitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property properties: TSchema.TProperties read GetProperties write FProperties stored GetPropertiesStored;
    property patternProperties: TSchema.TPatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property dependencies: TSchema.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('type')]
    property &Type: TSchema.TType read GetType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    [FieldName('not')]
    property &Not: TSchema read GetNot write FNot stored GetNotStored;
  end;

implementation

uses System.SysUtils;

{ PositiveIntegerDefault0 }

function PositiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
begin
  Result := FPositiveInteger <> 0;
end;

procedure PositiveIntegerDefault0.SetAnonymous(const Value: any);
begin
  FAnonymous := Value;
  FAnonymousIsStored := True;
end;

{ TSchema }

destructor TSchema.Destroy;
begin
  FMinLength.Free;

  FAdditionalItems.Free;

  FItems.Free;

  FMinItems.Free;

  FMinProperties.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FProperties.Free;

  FPatternProperties.Free;

  FDependencies.Free;

  FType.Free;

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

function TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure TSchema.SetDefault(const Value: any);
begin
  FDefault := Value;
  FDefaultIsStored := True;
end;

function TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure TSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure TSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0.Create;

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

function TSchema.GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.TSchema.TAdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Draft4.Schema.TSchema.TAdditionalItems.Create;

  Result := FAdditionalItems;
end;

function TSchema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TSchema.GetItems: Blue.Print.JSON.Draft4.Schema.TSchema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft4.Schema.TSchema.TItems.Create;

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

function TSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0.Create;

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

function TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TSchema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.PositiveIntegerDefault0.Create;

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

function TSchema.GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.TSchema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft4.Schema.TSchema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.GetDefinitions: Blue.Print.JSON.Draft4.Schema.TSchema.TDefinitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft4.Schema.TSchema.TDefinitions.Create;

  Result := FDefinitions;
end;

function TSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchema.GetProperties: Blue.Print.JSON.Draft4.Schema.TSchema.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft4.Schema.TSchema.TProperties.Create;

  Result := FProperties;
end;

function TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.GetPatternProperties: Blue.Print.JSON.Draft4.Schema.TSchema.TPatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft4.Schema.TSchema.TPatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.GetDependencies: Blue.Print.JSON.Draft4.Schema.TSchema.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft4.Schema.TSchema.TDependencies.Create;

  Result := FDependencies;
end;

function TSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TSchema.GetType: Blue.Print.JSON.Draft4.Schema.TSchema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.TSchema.TType.Create;

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

function TSchema.AddAllOf: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TSchema.AddAnyOf: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TSchema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TSchema.AddOneOf: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TSchema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TSchema.GetNot: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  Result := FNot;
end;

function TSchema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ TSchema.TAdditionalItems }

destructor TSchema.TAdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TSchema.TAdditionalItems.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TSchema.TAdditionalItems.GetSchema: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TAdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TItems }

destructor TSchema.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TSchema.TItems.GetSchema: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TSchema.TItems.AddSchemaArray: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TSchema.TItems.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TSchema.TAdditionalProperties }

destructor TSchema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TSchema.TAdditionalProperties.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TSchema.TAdditionalProperties.GetSchema: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

  Result := FSchema;
end;

function TSchema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TDefinitions }

destructor TSchema.TDefinitions.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TDefinitions.GetSchema: TDynamicProperty<TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TDefinitions.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TProperties }

destructor TSchema.TProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TProperties.GetSchema: TDynamicProperty<TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TPatternProperties }

destructor TSchema.TPatternProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TPatternProperties.GetSchema: TDynamicProperty<TSchema>;
begin
  if not Assigned(FSchema) then
    FSchema := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.TSchema>.Create;

  Result := FSchema;
end;

function TSchema.TPatternProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TSchema.TDependencies }

destructor TSchema.TDependencies.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TSchema.TDependencies.GetSchema: Blue.Print.JSON.Draft4.Schema.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.TSchema.Create;

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

end.
