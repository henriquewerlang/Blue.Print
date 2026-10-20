unit Blue.Print.JSON.Draft4.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema;

uses Blue.Print.Types, System.Rtti;

type
  // Forward class declaration
  TJSONSchema = class;

  // Types alias
  any = System.Rtti.TValue;

  TJSONSchema = class
  public type
    [EnumValue('array, boolean, integer, null, number, object, string')]
    simpleTypes = (&array, boolean, integer, null, number, &object, &string);

    // Forward class declaration
    positiveIntegerDefault0 = class;
    TJSONSchema = class;

    // Types alias
    schemaArray = TArray<Blue.Print.JSON.Draft4.Schema.TJSONSchema>;
    positiveInteger = System.Integer;
    stringArray = TArray<System.String>;

    [Flat]
    positiveIntegerDefault0 = class
    private
      FPositiveInteger: TJSONSchema.positiveInteger;

      function GetPositiveIntegerStored: Boolean;
    public
      property IsPositiveIntegerStored: Boolean read GetPositiveIntegerStored;
    published
      property positiveInteger: TJSONSchema.positiveInteger read FPositiveInteger write FPositiveInteger stored GetPositiveIntegerStored;
    end;

    TJSONSchema = class
    public type
      // Forward class declaration
      AdditionalItemsProperty = class;
      ItemsProperty = class;
      AdditionalPropertiesProperty = class;
      DefinitionsProperty = class;
      PropertiesProperty = class;
      PatternPropertiesProperty = class;
      DependenciesProperty = class;
      TypeProperty = class;

      [Flat]
      AdditionalItemsProperty = class
      private
        FBoolean: System.Boolean;
        FAdditionalItemsProperty: TJSONSchema.TJSONSchema.AdditionalItemsProperty;
        FBooleanIsStored: Boolean;

        function GetAdditionalItemsProperty: TJSONSchema.TJSONSchema.AdditionalItemsProperty;
        function GetAdditionalItemsPropertyStored: Boolean;
        procedure SetBoolean(const Value: System.Boolean);
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read FBooleanIsStored;
        property IsAdditionalItemsPropertyStored: Boolean read GetAdditionalItemsPropertyStored;
      published
        property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
        property AdditionalItemsProperty: TJSONSchema.TJSONSchema.AdditionalItemsProperty read GetAdditionalItemsProperty write FAdditionalItemsProperty stored GetAdditionalItemsPropertyStored;
      end;

      [Flat]
      ItemsProperty = class
      private
        FItemsProperty: TJSONSchema.TJSONSchema;
        FSchemaArray: TJSONSchema.schemaArray;

        function GetItemsProperty: TJSONSchema.TJSONSchema;
        function GetItemsPropertyStored: Boolean;
        function GetSchemaArrayStored: Boolean;
      public
        destructor Destroy; override;

        function AddSchemaArray: Blue.Print.JSON.Draft4.Schema.TJSONSchema;

        property IsItemsPropertyStored: Boolean read GetItemsPropertyStored;
        property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
      published
        property schema: TJSONSchema.TJSONSchema read GetItemsProperty write FItemsProperty stored GetItemsPropertyStored;
        property schemaArray: TJSONSchema.schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
      end;

      [Flat]
      AdditionalPropertiesProperty = class
      private
        FBoolean: System.Boolean;
        FAdditionalPropertiesProperty: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
        FBooleanIsStored: Boolean;

        function GetAdditionalPropertiesProperty: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
        function GetAdditionalPropertiesPropertyStored: Boolean;
        procedure SetBoolean(const Value: System.Boolean);
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read FBooleanIsStored;
        property IsAdditionalPropertiesPropertyStored: Boolean read GetAdditionalPropertiesPropertyStored;
      published
        property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
        property AdditionalPropertiesProperty: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty read GetAdditionalPropertiesProperty write FAdditionalPropertiesProperty stored GetAdditionalPropertiesPropertyStored;
      end;

      DefinitionsProperty = class
      private
        FAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema>;

        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        function AddDefinitions(const Name: String): TJSONSchema.TJSONSchema;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema> read FAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      PropertiesProperty = class
      private
        FAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema>;

        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        function AddProperties(const Name: String): TJSONSchema.TJSONSchema;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema> read FAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      PatternPropertiesProperty = class
      private
        FAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.PatternPropertiesProperty>;

        function GetAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.PatternPropertiesProperty>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.PatternPropertiesProperty> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      DependenciesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
        private
          FAdditionalPropertiesType: TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType;
          FStringArray: TJSONSchema.stringArray;

          function GetAdditionalPropertiesType: TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType;
          function GetAdditionalPropertiesTypeStored: Boolean;
          function GetStringArrayStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesTypeStored: Boolean read GetAdditionalPropertiesTypeStored;
          property IsStringArrayStored: Boolean read GetStringArrayStored;
        published
          property additionalPropertiesType: TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType read GetAdditionalPropertiesType write FAdditionalPropertiesType stored GetAdditionalPropertiesTypeStored;
          property stringArray: TJSONSchema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        end;
      private
        FAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      TypeProperty = class
      private
        FSimpleTypes: TJSONSchema.simpleTypes;
        FArray: TArray<TJSONSchema.simpleTypes>;
        FSimpleTypesIsStored: Boolean;

        function GetArrayStored: Boolean;
        procedure SetSimpleTypes(const Value: TJSONSchema.simpleTypes);
      public
        property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
        property IsArrayStored: Boolean read GetArrayStored;
      published
        property simpleTypes: TJSONSchema.simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
        [FieldName('array')]
        property &array: TArray<TJSONSchema.simpleTypes> read FArray write FArray stored GetArrayStored;
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
      FMaxLength: TJSONSchema.positiveInteger;
      FMinLength: TJSONSchema.positiveIntegerDefault0;
      FPattern: System.String;
      FAdditionalItems: TJSONSchema.TJSONSchema.AdditionalItemsProperty;
      FItems: TJSONSchema.TJSONSchema.ItemsProperty;
      FMaxItems: TJSONSchema.positiveInteger;
      FMinItems: TJSONSchema.positiveIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxProperties: TJSONSchema.positiveInteger;
      FMinProperties: TJSONSchema.positiveIntegerDefault0;
      FRequired: TJSONSchema.stringArray;
      FAdditionalProperties: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
      FDefinitions: TJSONSchema.TJSONSchema.DefinitionsProperty;
      FProperties: TJSONSchema.TJSONSchema.PropertiesProperty;
      FPatternProperties: TJSONSchema.TJSONSchema.PatternPropertiesProperty;
      FDependencies: TJSONSchema.TJSONSchema.DependenciesProperty;
      FEnum: TArray<String>;
      FType: TJSONSchema.TJSONSchema.TypeProperty;
      FFormat: System.String;
      FAllOf: TJSONSchema.schemaArray;
      FAnyOf: TJSONSchema.schemaArray;
      FOneOf: TJSONSchema.schemaArray;
      FNot: TJSONSchema.TJSONSchema;
      FExclusiveMaximumIsStored: Boolean;
      FExclusiveMinimumIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;
        Fref: String;

      function GetMinLength: TJSONSchema.positiveIntegerDefault0;
      function GetAdditionalItems: TJSONSchema.TJSONSchema.AdditionalItemsProperty;
      function GetItems: TJSONSchema.TJSONSchema.ItemsProperty;
      function GetMinItems: TJSONSchema.positiveIntegerDefault0;
      function GetMinProperties: TJSONSchema.positiveIntegerDefault0;
      function GetAdditionalProperties: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
      function GetDefinitions: TJSONSchema.TJSONSchema.DefinitionsProperty;
      function GetProperties: TJSONSchema.TJSONSchema.PropertiesProperty;
      function GetPatternProperties: TJSONSchema.TJSONSchema.PatternPropertiesProperty;
      function GetDependencies: TJSONSchema.TJSONSchema.DependenciesProperty;
      function GetType: TJSONSchema.TJSONSchema.TypeProperty;
      function GetNot: TJSONSchema.TJSONSchema;
      function GetIdStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetTitleStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetDefaultStored: Boolean;
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
      procedure SetExclusiveMaximum(const Value: System.Boolean);
      procedure SetExclusiveMinimum(const Value: System.Boolean);
      procedure SetUniqueItems(const Value: System.Boolean);
      function GetRefStored: Boolean;
    public
      destructor Destroy; override;

      function AddAllOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
      function AddAnyOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
      function AddOneOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;

      property IsIdStored: Boolean read GetIdStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsTitleStored: Boolean read GetTitleStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
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

      property IsRefStored: Boolean read GetRefStored;
    published
      property id: System.String read FId write FId stored GetIdStored;
      [FieldName('$TJSONSchema')]
      property TJSONSchema: System.String read FSchema write FSchema stored GetSchemaStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
      property maxLength: TJSONSchema.positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: TJSONSchema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property additionalItems: TJSONSchema.TJSONSchema.AdditionalItemsProperty read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
      property items: TJSONSchema.TJSONSchema.ItemsProperty read GetItems write FItems stored GetItemsStored;
      property maxItems: TJSONSchema.positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: TJSONSchema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
      property maxProperties: TJSONSchema.positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: TJSONSchema.positiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: TJSONSchema.stringArray read FRequired write FRequired stored GetRequiredStored;
      property additionalProperties: TJSONSchema.TJSONSchema.AdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property definitions: TJSONSchema.TJSONSchema.DefinitionsProperty read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property properties: TJSONSchema.TJSONSchema.PropertiesProperty read GetProperties write FProperties stored GetPropertiesStored;
      property patternProperties: TJSONSchema.TJSONSchema.PatternPropertiesProperty read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      property dependencies: TJSONSchema.TJSONSchema.DependenciesProperty read GetDependencies write FDependencies stored GetDependenciesStored;
      property enum: TArray<String> read FEnum write FEnum stored GetEnumStored;
      [FieldName('type')]
      property &type: TJSONSchema.TJSONSchema.TypeProperty read GetType write FType stored GetTypeStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property allOf: TJSONSchema.schemaArray read FAllOf write FAllOf stored GetAllOfStored;
      property anyOf: TJSONSchema.schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
      property oneOf: TJSONSchema.schemaArray read FOneOf write FOneOf stored GetOneOfStored;
      [FieldName('not')]
      property &not: TJSONSchema.TJSONSchema read GetNot write FNot stored GetNotStored;

      [FieldName('$ref')]
      property ref: String read Fref write Fref stored GetRefStored;
    end;
  end;

implementation

uses System.SysUtils;

{ TJSONSchema.positiveIntegerDefault0 }

function TJSONSchema.positiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
begin
  Result := FPositiveInteger <> 0;
end;

{ TJSONSchema.TJSONSchema }

destructor TJSONSchema.TJSONSchema.Destroy;
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

function TJSONSchema.TJSONSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TJSONSchema.TJSONSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TJSONSchema.TJSONSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure TJSONSchema.TJSONSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TJSONSchema.TJSONSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure TJSONSchema.TJSONSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function TJSONSchema.TJSONSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TJSONSchema.TJSONSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TJSONSchema.TJSONSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TJSONSchema.TJSONSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalItemsProperty;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalItemsProperty.Create;

  Result := FAdditionalItems;
end;

function TJSONSchema.TJSONSchema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TJSONSchema.TJSONSchema.GetItems: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.ItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.ItemsProperty.Create;

  Result := FItems;
end;

function TJSONSchema.TJSONSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TJSONSchema.TJSONSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TJSONSchema.TJSONSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TJSONSchema.TJSONSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure TJSONSchema.TJSONSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TJSONSchema.TJSONSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TJSONSchema.TJSONSchema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.TJSONSchema.positiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TJSONSchema.TJSONSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TJSONSchema.TJSONSchema.GetRefStored: Boolean;
begin
  Result := not Fref.IsEmpty;
end;

function TJSONSchema.TJSONSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TJSONSchema.TJSONSchema.GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.Create;

  Result := FAdditionalProperties;
end;

function TJSONSchema.TJSONSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TJSONSchema.TJSONSchema.GetDefinitions: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DefinitionsProperty;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DefinitionsProperty.Create;

  Result := FDefinitions;
end;

function TJSONSchema.TJSONSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TJSONSchema.TJSONSchema.GetProperties: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.PropertiesProperty;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.PropertiesProperty.Create;

  Result := FProperties;
end;

function TJSONSchema.TJSONSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TJSONSchema.TJSONSchema.GetPatternProperties: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.PatternPropertiesProperty;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.PatternPropertiesProperty.Create;

  Result := FPatternProperties;
end;

function TJSONSchema.TJSONSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TJSONSchema.TJSONSchema.GetDependencies: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DependenciesProperty;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DependenciesProperty.Create;

  Result := FDependencies;
end;

function TJSONSchema.TJSONSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TJSONSchema.TJSONSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TJSONSchema.TJSONSchema.GetType: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.TypeProperty;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.TypeProperty.Create;

  Result := FType;
end;

function TJSONSchema.TJSONSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TJSONSchema.TJSONSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TJSONSchema.TJSONSchema.AddAllOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TJSONSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TJSONSchema.TJSONSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TJSONSchema.TJSONSchema.AddAnyOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TJSONSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TJSONSchema.TJSONSchema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TJSONSchema.TJSONSchema.AddOneOf: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TJSONSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TJSONSchema.TJSONSchema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TJSONSchema.TJSONSchema.GetNot: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.Create;

  Result := FNot;
end;

function TJSONSchema.TJSONSchema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ TJSONSchema.TJSONSchema.AdditionalItemsProperty }

destructor TJSONSchema.TJSONSchema.AdditionalItemsProperty.Destroy;
begin
  FAdditionalItemsProperty.Free;

  inherited;
end;

procedure TJSONSchema.TJSONSchema.AdditionalItemsProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TJSONSchema.AdditionalItemsProperty.GetAdditionalItemsProperty: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalItemsProperty;
begin
  if not Assigned(FAdditionalItemsProperty) then
    FAdditionalItemsProperty := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalItemsProperty.Create;

  Result := FAdditionalItemsProperty;
end;

function TJSONSchema.TJSONSchema.AdditionalItemsProperty.GetAdditionalItemsPropertyStored: Boolean;
begin
  Result := Assigned(FAdditionalItemsProperty);
end;

{ TJSONSchema.TJSONSchema.ItemsProperty }

destructor TJSONSchema.TJSONSchema.ItemsProperty.Destroy;
begin
  FItemsProperty.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.ItemsProperty.GetItemsProperty: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema;
begin
  if not Assigned(FItemsProperty) then
    FItemsProperty := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.Create;

  Result := FItemsProperty;
end;

function TJSONSchema.TJSONSchema.ItemsProperty.GetItemsPropertyStored: Boolean;
begin
  Result := Assigned(FItemsProperty);
end;

function TJSONSchema.TJSONSchema.ItemsProperty.AddSchemaArray: Blue.Print.JSON.Draft4.Schema.TJSONSchema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.TJSONSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TJSONSchema.TJSONSchema.ItemsProperty.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TJSONSchema.TJSONSchema.AdditionalPropertiesProperty }

destructor TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.Destroy;
begin
  FAdditionalPropertiesProperty.Free;

  inherited;
end;

procedure TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.GetAdditionalPropertiesProperty: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalPropertiesProperty) then
    FAdditionalPropertiesProperty := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.Create;

  Result := FAdditionalPropertiesProperty;
end;

function TJSONSchema.TJSONSchema.AdditionalPropertiesProperty.GetAdditionalPropertiesPropertyStored: Boolean;
begin
  Result := Assigned(FAdditionalPropertiesProperty);
end;

{ TJSONSchema.TJSONSchema.DefinitionsProperty }

function TJSONSchema.TJSONSchema.DefinitionsProperty.AddDefinitions(const Name: String): TJSONSchema.TJSONSchema;
begin
  Result := TJSONSchema.TJSONSchema.Create;

  FAdditionalProperties := FAdditionalProperties + [TDynamicPair<TJSONSchema.TJSONSchema>.Create(Name, Result)];
end;

destructor TJSONSchema.TJSONSchema.DefinitionsProperty.Destroy;
begin
  for var Prop in FAdditionalProperties do
    Prop.Value.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.DefinitionsProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TJSONSchema.TJSONSchema.PropertiesProperty }

function TJSONSchema.TJSONSchema.PropertiesProperty.AddProperties(const Name: String): TJSONSchema.TJSONSchema;
begin
  Result := TJSONSchema.TJSONSchema.Create;

  FAdditionalProperties := FAdditionalProperties + [TDynamicPair<TJSONSchema.TJSONSchema>.Create(Name, Result)];
end;

destructor TJSONSchema.TJSONSchema.PropertiesProperty.Destroy;
begin
  for var Prop in FAdditionalProperties do
    Prop.Value.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.PropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TJSONSchema.TJSONSchema.PatternPropertiesProperty }

destructor TJSONSchema.TJSONSchema.PatternPropertiesProperty.Destroy;
begin
//  FAdditionalProperties.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.PatternPropertiesProperty.GetAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.PatternPropertiesProperty>;
begin
//  if not Assigned(FAdditionalProperties) then
//    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.PatternPropertiesProperty>.Create;

  Result := FAdditionalProperties;
end;

function TJSONSchema.TJSONSchema.PatternPropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TJSONSchema.TJSONSchema.DependenciesProperty }

destructor TJSONSchema.TJSONSchema.DependenciesProperty.Destroy;
begin
//  FAdditionalProperties.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.DependenciesProperty.GetAdditionalProperties: TDynamicProperty<TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType>;
begin
//  if not Assigned(FAdditionalProperties) then
//    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TJSONSchema.TJSONSchema.DependenciesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType }

destructor TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType.Destroy;
begin
  FAdditionalPropertiesType.Free;

  inherited;
end;

function TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType.GetAdditionalPropertiesType: Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType;
begin
  if not Assigned(FAdditionalPropertiesType) then
    FAdditionalPropertiesType := Blue.Print.JSON.Draft4.Schema.TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType.Create;

  Result := FAdditionalPropertiesType;
end;

function TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType.GetAdditionalPropertiesTypeStored: Boolean;
begin
  Result := Assigned(FAdditionalPropertiesType);
end;

function TJSONSchema.TJSONSchema.DependenciesProperty.additionalPropertiesType.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TJSONSchema.TJSONSchema.TypeProperty }

procedure TJSONSchema.TJSONSchema.TypeProperty.SetSimpleTypes(const Value: TJSONSchema.simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function TJSONSchema.TJSONSchema.TypeProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

end.
