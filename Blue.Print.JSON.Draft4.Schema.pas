unit Blue.Print.JSON.Draft4.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

uses Blue.Print.Types, System.Rtti;

type
  JSONSchema = class;

  JSONSchema = class
  public type
    [EnumValue('array, boolean, integer, null, number, object, string')]
    simpleTypes = (&array, boolean, integer, null, number, &object, &string);

    TAdditionalItemsType = class;
    TItemsType = class;
    TAdditionalPropertiesType = class;
    TDefinitionsType = class;
    TPropertiesType = class;
    TPatternPropertiesType = class;
    TDependenciesType = class;
    TTypeType = class;
    positiveIntegerDefault0 = class;

    schemaArray = System.TArray<Blue.Print.JSON.Draft4.Schema.JSONSchema>;
    positiveInteger = System.Integer;
    stringArray = System.TArray<System.String>;

    [Flat]
    TAdditionalItemsType = class
    private
      FBoolean: System.Boolean;
      FBooleanStored: Boolean;
      FJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      FJSONSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
      function GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      procedure SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanStored;
      property IsJSONSchemaStored: Boolean read FJSONSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanStored;
      property JSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema read GetJSONSchema write SetJSONSchema stored FJSONSchemaStored;
    end;

    [Flat]
    TItemsType = class
    private
      FJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      FJSONSchemaStored: Boolean;
      FSchemaArray: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray;
      FSchemaArrayStored: Boolean;
      function GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      procedure SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
      procedure SetSchemaArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
    public
      destructor Destroy; override;

      function AddSchemaArray: Blue.Print.JSON.Draft4.Schema.JSONSchema;

      property IsJSONSchemaStored: Boolean read FJSONSchemaStored;
      property IsSchemaArrayStored: Boolean read FSchemaArrayStored;
    published
      property JSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema read GetJSONSchema write SetJSONSchema stored FJSONSchemaStored;
      property schemaArray: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray read FSchemaArray write SetSchemaArray stored FSchemaArrayStored;
    end;

    [Flat]
    TAdditionalPropertiesType = class
    private
      FBoolean: System.Boolean;
      FBooleanStored: Boolean;
      FJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      FJSONSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
      function GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
      procedure SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanStored;
      property IsJSONSchemaStored: Boolean read FJSONSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanStored;
      property JSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema read GetJSONSchema write SetJSONSchema stored FJSONSchemaStored;
    end;

    TDefinitionsType = class
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema>;
    public
      destructor Destroy; override;

      function AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema> read FAdditionalProperties write FAdditionalProperties;
    end;

    TPropertiesType = class
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema>;
    public
      destructor Destroy; override;

      function AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema> read FAdditionalProperties write FAdditionalProperties;
    end;

    TPatternPropertiesType = class
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema>;
    public
      destructor Destroy; override;

      function AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema> read FAdditionalProperties write FAdditionalProperties;
    end;

    TDependenciesType = class
    public type
      TAdditionalPropertiesType = class;

      [Flat]
      TAdditionalPropertiesType = class
      private
        FJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
        FJSONSchemaStored: Boolean;
        FStringArray: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray;
        FStringArrayStored: Boolean;
        function GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
        procedure SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
        procedure SetStringArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray);
      public
        destructor Destroy; override;

        procedure AddStringArray(const Value: System.String);

        property IsJSONSchemaStored: Boolean read FJSONSchemaStored;
        property IsStringArrayStored: Boolean read FStringArrayStored;
      published
        property JSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema read GetJSONSchema write SetJSONSchema stored FJSONSchemaStored;
        property stringArray: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray read FStringArray write SetStringArray stored FStringArrayStored;
      end;
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType>;
    public
      destructor Destroy; override;

      function AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType;
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
    end;

    [Flat]
    TTypeType = class
    private
      FSimpleTypes: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes;
      FSimpleTypesStored: Boolean;
      FArray: System.TArray<Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes>;
      FArrayStored: Boolean;
      procedure SetSimpleTypes(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes);
      procedure SetArray(const Value: System.TArray<Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes>);
    public
      procedure AddArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes);

      property IsSimpleTypesStored: Boolean read FSimpleTypesStored;
      property IsArrayStored: Boolean read FArrayStored;
    published
      property simpleTypes: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesStored;
      [FieldName('array')]
      property &array: System.TArray<Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes> read FArray write SetArray stored FArrayStored;
    end;

    [Flat]
    positiveIntegerDefault0 = class
    private
      FPositiveInteger: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger;
      FAllOf2: System.Rtti.TValue;
    published
      property positiveInteger: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger read FPositiveInteger write FPositiveInteger;
      property AllOf2: System.Rtti.TValue read FAllOf2 write FAllOf2;
    end;
  private
    FId: System.String;
    FIdStored: Boolean;
    FSchema: System.String;
    FSchemaStored: Boolean;
    FTitle: System.String;
    FTitleStored: Boolean;
    FDescription: System.String;
    FDescriptionStored: Boolean;
    FDefault: System.Rtti.TValue;
    FDefaultStored: Boolean;
    FMultipleOf: System.Double;
    FMultipleOfStored: Boolean;
    FMaximum: System.Double;
    FMaximumStored: Boolean;
    FExclusiveMaximum: System.Boolean;
    FExclusiveMaximumStored: Boolean;
    FMinimum: System.Double;
    FMinimumStored: Boolean;
    FExclusiveMinimum: System.Boolean;
    FExclusiveMinimumStored: Boolean;
    FMaxLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger;
    FMaxLengthStored: Boolean;
    FMinLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    FMinLengthStored: Boolean;
    FPattern: System.String;
    FPatternStored: Boolean;
    FAdditionalItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType;
    FAdditionalItemsStored: Boolean;
    FItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType;
    FItemsStored: Boolean;
    FMaxItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger;
    FMaxItemsStored: Boolean;
    FMinItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    FMinItemsStored: Boolean;
    FUniqueItems: System.Boolean;
    FUniqueItemsStored: Boolean;
    FMaxProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger;
    FMaxPropertiesStored: Boolean;
    FMinProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    FMinPropertiesStored: Boolean;
    FRequired: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray;
    FRequiredStored: Boolean;
    FAdditionalProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType;
    FAdditionalPropertiesStored: Boolean;
    FDefinitions: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType;
    FDefinitionsStored: Boolean;
    FProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType;
    FPropertiesStored: Boolean;
    FPatternProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType;
    FPatternPropertiesStored: Boolean;
    FDependencies: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType;
    FDependenciesStored: Boolean;
    FEnum: System.TArray<System.Rtti.TValue>;
    FEnumStored: Boolean;
    FType: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType;
    FTypeStored: Boolean;
    FFormat: System.String;
    FFormatStored: Boolean;
    FAllOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray;
    FAllOfStored: Boolean;
    FAnyOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray;
    FAnyOfStored: Boolean;
    FOneOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray;
    FOneOfStored: Boolean;
    FNot: Blue.Print.JSON.Draft4.Schema.JSONSchema;
    FNotStored: Boolean;
    FRef: System.String;
    FRefStored: Boolean;
    procedure SetId(const Value: System.String);
    procedure SetSchema(const Value: System.String);
    procedure SetTitle(const Value: System.String);
    procedure SetDescription(const Value: System.String);
    procedure SetDefault(const Value: System.Rtti.TValue);
    procedure SetMultipleOf(const Value: System.Double);
    procedure SetMaximum(const Value: System.Double);
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetMinimum(const Value: System.Double);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetMaxLength(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
    function GetMinLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    procedure SetMinLength(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
    procedure SetPattern(const Value: System.String);
    function GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType;
    procedure SetAdditionalItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType);
    function GetItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType;
    procedure SetItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType);
    procedure SetMaxItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
    function GetMinItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    procedure SetMinItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
    procedure SetUniqueItems(const Value: System.Boolean);
    procedure SetMaxProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
    function GetMinProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
    procedure SetMinProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
    procedure SetRequired(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray);
    function GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType;
    procedure SetAdditionalProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType);
    function GetDefinitions: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType;
    procedure SetDefinitions(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType);
    function GetProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType;
    procedure SetProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType);
    function GetPatternProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType;
    procedure SetPatternProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType);
    function GetDependencies: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType;
    procedure SetDependencies(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType);
    procedure SetEnum(const Value: System.TArray<System.Rtti.TValue>);
    function GetType: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType;
    procedure SetType(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType);
    procedure SetFormat(const Value: System.String);
    procedure SetAllOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
    procedure SetAnyOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
    procedure SetOneOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
    function GetNot: Blue.Print.JSON.Draft4.Schema.JSONSchema;
    procedure SetNot(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
    procedure SetRef(const Value: System.String);
  public
    destructor Destroy; override;

    procedure AddRequired(const Value: System.String);
    procedure AddEnum(const Value: System.Rtti.TValue);
    function AddAllOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;
    function AddAnyOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;
    function AddOneOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;

    property IsIdStored: Boolean read FIdStored;
    property IsSchemaStored: Boolean read FSchemaStored;
    property IsTitleStored: Boolean read FTitleStored;
    property IsDescriptionStored: Boolean read FDescriptionStored;
    property IsDefaultStored: Boolean read FDefaultStored;
    property IsMultipleOfStored: Boolean read FMultipleOfStored;
    property IsMaximumStored: Boolean read FMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumStored;
    property IsMinimumStored: Boolean read FMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumStored;
    property IsMaxLengthStored: Boolean read FMaxLengthStored;
    property IsMinLengthStored: Boolean read FMinLengthStored;
    property IsPatternStored: Boolean read FPatternStored;
    property IsAdditionalItemsStored: Boolean read FAdditionalItemsStored;
    property IsItemsStored: Boolean read FItemsStored;
    property IsMaxItemsStored: Boolean read FMaxItemsStored;
    property IsMinItemsStored: Boolean read FMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsStored;
    property IsMaxPropertiesStored: Boolean read FMaxPropertiesStored;
    property IsMinPropertiesStored: Boolean read FMinPropertiesStored;
    property IsRequiredStored: Boolean read FRequiredStored;
    property IsAdditionalPropertiesStored: Boolean read FAdditionalPropertiesStored;
    property IsDefinitionsStored: Boolean read FDefinitionsStored;
    property IsPropertiesStored: Boolean read FPropertiesStored;
    property IsPatternPropertiesStored: Boolean read FPatternPropertiesStored;
    property IsDependenciesStored: Boolean read FDependenciesStored;
    property IsEnumStored: Boolean read FEnumStored;
    property IsTypeStored: Boolean read FTypeStored;
    property IsFormatStored: Boolean read FFormatStored;
    property IsAllOfStored: Boolean read FAllOfStored;
    property IsAnyOfStored: Boolean read FAnyOfStored;
    property IsOneOfStored: Boolean read FOneOfStored;
    property IsNotStored: Boolean read FNotStored;
    property IsRefStored: Boolean read FRefStored;
  published
    property id: System.String read FId write SetId stored FIdStored;
    [FieldName('$schema')]
    property Schema: System.String read FSchema write SetSchema stored FSchemaStored;
    property title: System.String read FTitle write SetTitle stored FTitleStored;
    property description: System.String read FDescription write SetDescription stored FDescriptionStored;
    property default: System.Rtti.TValue read FDefault write SetDefault stored FDefaultStored;
    property multipleOf: System.Double read FMultipleOf write SetMultipleOf stored FMultipleOfStored;
    property maximum: System.Double read FMaximum write SetMaximum stored FMaximumStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumStored;
    property minimum: System.Double read FMinimum write SetMinimum stored FMinimumStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumStored;
    property maxLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger read FMaxLength write SetMaxLength stored FMaxLengthStored;
    property minLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0 read GetMinLength write SetMinLength stored FMinLengthStored;
    property pattern: System.String read FPattern write SetPattern stored FPatternStored;
    property additionalItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType read GetAdditionalItems write SetAdditionalItems stored FAdditionalItemsStored;
    property items: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType read GetItems write SetItems stored FItemsStored;
    property maxItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger read FMaxItems write SetMaxItems stored FMaxItemsStored;
    property minItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0 read GetMinItems write SetMinItems stored FMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsStored;
    property maxProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger read FMaxProperties write SetMaxProperties stored FMaxPropertiesStored;
    property minProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0 read GetMinProperties write SetMinProperties stored FMinPropertiesStored;
    property required: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray read FRequired write SetRequired stored FRequiredStored;
    property additionalProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType read GetAdditionalProperties write SetAdditionalProperties stored FAdditionalPropertiesStored;
    property definitions: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType read GetDefinitions write SetDefinitions stored FDefinitionsStored;
    property properties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType read GetProperties write SetProperties stored FPropertiesStored;
    property patternProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType read GetPatternProperties write SetPatternProperties stored FPatternPropertiesStored;
    property dependencies: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType read GetDependencies write SetDependencies stored FDependenciesStored;
    property enum: System.TArray<System.Rtti.TValue> read FEnum write SetEnum stored FEnumStored;
    [FieldName('type')]
    property &type: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType read GetType write SetType stored FTypeStored;
    property format: System.String read FFormat write SetFormat stored FFormatStored;
    property allOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray read FAllOf write SetAllOf stored FAllOfStored;
    property anyOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray read FAnyOf write SetAnyOf stored FAnyOfStored;
    property oneOf: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray read FOneOf write SetOneOf stored FOneOfStored;
    [FieldName('not')]
    property &not: Blue.Print.JSON.Draft4.Schema.JSONSchema read GetNot write SetNot stored FNotStored;
    [FieldName('$ref')]
    property Ref: System.String read FRef write SetRef stored FRefStored;
  end;

implementation

{ JSONSchema }

destructor JSONSchema.Destroy;
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

  for var Item in FAllOf do
    Item.Free;

  for var Item in FAnyOf do
    Item.Free;

  for var Item in FOneOf do
    Item.Free;

  FNot.Free;

  inherited;
end;

procedure JSONSchema.SetId(const Value: System.String);
begin
  FId := Value;
  FIdStored := True;
end;

procedure JSONSchema.SetSchema(const Value: System.String);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

procedure JSONSchema.SetTitle(const Value: System.String);
begin
  FTitle := Value;
  FTitleStored := True;
end;

procedure JSONSchema.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure JSONSchema.SetDefault(const Value: System.Rtti.TValue);
begin
  FDefault := Value;
  FDefaultStored := True;
end;

procedure JSONSchema.SetMultipleOf(const Value: System.Double);
begin
  FMultipleOf := Value;
  FMultipleOfStored := True;
end;

procedure JSONSchema.SetMaximum(const Value: System.Double);
begin
  FMaximum := Value;
  FMaximumStored := True;
end;

procedure JSONSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumStored := True;
end;

procedure JSONSchema.SetMinimum(const Value: System.Double);
begin
  FMinimum := Value;
  FMinimumStored := True;
end;

procedure JSONSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumStored := True;
end;

procedure JSONSchema.SetMaxLength(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
begin
  FMaxLength := Value;
  FMaxLengthStored := True;
end;

function JSONSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    minLength := Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

procedure JSONSchema.SetMinLength(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
begin
  FMinLength := Value;
  FMinLengthStored := True;
end;

procedure JSONSchema.SetPattern(const Value: System.String);
begin
  FPattern := Value;
  FPatternStored := True;
end;

function JSONSchema.GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType;
begin
  if not Assigned(FAdditionalItems) then
    additionalItems := Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType.Create;

  Result := FAdditionalItems;
end;

procedure JSONSchema.SetAdditionalItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalItemsType);
begin
  FAdditionalItems := Value;
  FAdditionalItemsStored := True;
end;

function JSONSchema.GetItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType;
begin
  if not Assigned(FItems) then
    items := Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType.Create;

  Result := FItems;
end;

procedure JSONSchema.SetItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TItemsType);
begin
  FItems := Value;
  FItemsStored := True;
end;

procedure JSONSchema.SetMaxItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
begin
  FMaxItems := Value;
  FMaxItemsStored := True;
end;

function JSONSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    minItems := Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

procedure JSONSchema.SetMinItems(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
begin
  FMinItems := Value;
  FMinItemsStored := True;
end;

procedure JSONSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsStored := True;
end;

procedure JSONSchema.SetMaxProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveInteger);
begin
  FMaxProperties := Value;
  FMaxPropertiesStored := True;
end;

function JSONSchema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    minProperties := Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

procedure JSONSchema.SetMinProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.positiveIntegerDefault0);
begin
  FMinProperties := Value;
  FMinPropertiesStored := True;
end;

procedure JSONSchema.AddRequired(const Value: System.String);
begin
  required := required + [Value];
end;

procedure JSONSchema.SetRequired(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray);
begin
  FRequired := Value;
  FRequiredStored := True;
end;

function JSONSchema.GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType;
begin
  if not Assigned(FAdditionalProperties) then
    additionalProperties := Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType.Create;

  Result := FAdditionalProperties;
end;

procedure JSONSchema.SetAdditionalProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TAdditionalPropertiesType);
begin
  FAdditionalProperties := Value;
  FAdditionalPropertiesStored := True;
end;

function JSONSchema.GetDefinitions: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType;
begin
  if not Assigned(FDefinitions) then
    definitions := Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType.Create;

  Result := FDefinitions;
end;

procedure JSONSchema.SetDefinitions(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDefinitionsType);
begin
  FDefinitions := Value;
  FDefinitionsStored := True;
end;

function JSONSchema.GetProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType;
begin
  if not Assigned(FProperties) then
    properties := Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType.Create;

  Result := FProperties;
end;

procedure JSONSchema.SetProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPropertiesType);
begin
  FProperties := Value;
  FPropertiesStored := True;
end;

function JSONSchema.GetPatternProperties: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType;
begin
  if not Assigned(FPatternProperties) then
    patternProperties := Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType.Create;

  Result := FPatternProperties;
end;

procedure JSONSchema.SetPatternProperties(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TPatternPropertiesType);
begin
  FPatternProperties := Value;
  FPatternPropertiesStored := True;
end;

function JSONSchema.GetDependencies: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType;
begin
  if not Assigned(FDependencies) then
    dependencies := Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.Create;

  Result := FDependencies;
end;

procedure JSONSchema.SetDependencies(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType);
begin
  FDependencies := Value;
  FDependenciesStored := True;
end;

procedure JSONSchema.AddEnum(const Value: System.Rtti.TValue);
begin
  enum := enum + [Value];
end;

procedure JSONSchema.SetEnum(const Value: System.TArray<System.Rtti.TValue>);
begin
  FEnum := Value;
  FEnumStored := True;
end;

function JSONSchema.GetType: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType;
begin
  if not Assigned(FType) then
    &type := Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType.Create;

  Result := FType;
end;

procedure JSONSchema.SetType(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.TTypeType);
begin
  FType := Value;
  FTypeStored := True;
end;

procedure JSONSchema.SetFormat(const Value: System.String);
begin
  FFormat := Value;
  FFormatStored := True;
end;

function JSONSchema.AddAllOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  allOf := allOf + [Result];
end;

procedure JSONSchema.SetAllOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
begin
  FAllOf := Value;
  FAllOfStored := True;
end;

function JSONSchema.AddAnyOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  anyOf := anyOf + [Result];
end;

procedure JSONSchema.SetAnyOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
begin
  FAnyOf := Value;
  FAnyOfStored := True;
end;

function JSONSchema.AddOneOf: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  oneOf := oneOf + [Result];
end;

procedure JSONSchema.SetOneOf(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
begin
  FOneOf := Value;
  FOneOfStored := True;
end;

function JSONSchema.GetNot: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  if not Assigned(FNot) then
    &not := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  Result := FNot;
end;

procedure JSONSchema.SetNot(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
begin
  FNot := Value;
  FNotStored := True;
end;

procedure JSONSchema.SetRef(const Value: System.String);
begin
  FRef := Value;
  FRefStored := True;
end;

{ JSONSchema.TAdditionalItemsType }

destructor JSONSchema.TAdditionalItemsType.Destroy;
begin
  FJSONSchema.Free;

  inherited;
end;

procedure JSONSchema.TAdditionalItemsType.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanStored := True;
end;

function JSONSchema.TAdditionalItemsType.GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  if not Assigned(FJSONSchema) then
    JSONSchema := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  Result := FJSONSchema;
end;

procedure JSONSchema.TAdditionalItemsType.SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
begin
  FJSONSchema := Value;
  FJSONSchemaStored := True;
end;

{ JSONSchema.TItemsType }

destructor JSONSchema.TItemsType.Destroy;
begin
  FJSONSchema.Free;

  for var Item in FSchemaArray do
    Item.Free;

  inherited;
end;

function JSONSchema.TItemsType.GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  if not Assigned(FJSONSchema) then
    JSONSchema := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  Result := FJSONSchema;
end;

procedure JSONSchema.TItemsType.SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
begin
  FJSONSchema := Value;
  FJSONSchemaStored := True;
end;

function JSONSchema.TItemsType.AddSchemaArray: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  schemaArray := schemaArray + [Result];
end;

procedure JSONSchema.TItemsType.SetSchemaArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.schemaArray);
begin
  FSchemaArray := Value;
  FSchemaArrayStored := True;
end;

{ JSONSchema.TAdditionalPropertiesType }

destructor JSONSchema.TAdditionalPropertiesType.Destroy;
begin
  FJSONSchema.Free;

  inherited;
end;

procedure JSONSchema.TAdditionalPropertiesType.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanStored := True;
end;

function JSONSchema.TAdditionalPropertiesType.GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  if not Assigned(FJSONSchema) then
    JSONSchema := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  Result := FJSONSchema;
end;

procedure JSONSchema.TAdditionalPropertiesType.SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
begin
  FJSONSchema := Value;
  FJSONSchemaStored := True;
end;

{ JSONSchema.TDefinitionsType }

destructor JSONSchema.TDefinitionsType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function JSONSchema.TDefinitionsType.AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.JSON.Draft4.Schema.JSONSchema>.Create(Name, Result)];
end;

{ JSONSchema.TPropertiesType }

destructor JSONSchema.TPropertiesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function JSONSchema.TPropertiesType.AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.JSON.Draft4.Schema.JSONSchema>.Create(Name, Result)];
end;

{ JSONSchema.TPatternPropertiesType }

destructor JSONSchema.TPatternPropertiesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function JSONSchema.TPatternPropertiesType.AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.JSON.Draft4.Schema.JSONSchema>.Create(Name, Result)];
end;

{ JSONSchema.TDependenciesType }

destructor JSONSchema.TDependenciesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function JSONSchema.TDependenciesType.AddAdditionalProperties(const Name: String): Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.JSON.Draft4.Schema.JSONSchema.TDependenciesType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ JSONSchema.TDependenciesType.TAdditionalPropertiesType }

destructor JSONSchema.TDependenciesType.TAdditionalPropertiesType.Destroy;
begin
  FJSONSchema.Free;

  inherited;
end;

function JSONSchema.TDependenciesType.TAdditionalPropertiesType.GetJSONSchema: Blue.Print.JSON.Draft4.Schema.JSONSchema;
begin
  if not Assigned(FJSONSchema) then
    JSONSchema := Blue.Print.JSON.Draft4.Schema.JSONSchema.Create;

  Result := FJSONSchema;
end;

procedure JSONSchema.TDependenciesType.TAdditionalPropertiesType.SetJSONSchema(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema);
begin
  FJSONSchema := Value;
  FJSONSchemaStored := True;
end;

procedure JSONSchema.TDependenciesType.TAdditionalPropertiesType.AddStringArray(const Value: System.String);
begin
  stringArray := stringArray + [Value];
end;

procedure JSONSchema.TDependenciesType.TAdditionalPropertiesType.SetStringArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.stringArray);
begin
  FStringArray := Value;
  FStringArrayStored := True;
end;

{ JSONSchema.TTypeType }

procedure JSONSchema.TTypeType.SetSimpleTypes(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesStored := True;
end;

procedure JSONSchema.TTypeType.AddArray(const Value: Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes);
begin
  &array := &array + [Value];
end;

procedure JSONSchema.TTypeType.SetArray(const Value: System.TArray<Blue.Print.JSON.Draft4.Schema.JSONSchema.simpleTypes>);
begin
  FArray := Value;
  FArrayStored := True;
end;

end.
