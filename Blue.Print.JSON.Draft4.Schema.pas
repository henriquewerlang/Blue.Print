unit Blue.Print.JSON.Draft4.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema;

uses Blue.Print.Types, System.Rtti;

type
  // Forward class declaration
  Schema = class;

  // Types alias
  any = System.Rtti.TValue;

  Schema = class
  public type
    [EnumValue('array, boolean, integer, null, number, object, string')]
    simpleTypes = (&array, boolean, integer, null, number, &object, &string);

    // Forward class declaration
    positiveIntegerDefault0 = class;
    Schema = class;

    // Types alias
    schemaArray = TArray<Blue.Print.JSON.Draft4.Schema.Schema>;
    positiveInteger = System.Integer;
    stringArray = TArray<System.String>;

    [Flat]
    positiveIntegerDefault0 = class
    private
      FPositiveInteger: Schema.positiveInteger;

      function GetPositiveIntegerStored: Boolean;
    public
      property IsPositiveIntegerStored: Boolean read GetPositiveIntegerStored;
    published
      property positiveInteger: Schema.positiveInteger read FPositiveInteger write FPositiveInteger stored GetPositiveIntegerStored;
    end;

    Schema = class
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
        FAdditionalItemsProperty: Schema.Schema.AdditionalItemsProperty;

        function GetAdditionalItemsProperty: Schema.Schema.AdditionalItemsProperty;
        function GetBooleanStored: Boolean;
        function GetAdditionalItemsPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read GetBooleanStored;
        property IsAdditionalItemsPropertyStored: Boolean read GetAdditionalItemsPropertyStored;
      published
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
        property AdditionalItemsProperty: Schema.Schema.AdditionalItemsProperty read GetAdditionalItemsProperty write FAdditionalItemsProperty stored GetAdditionalItemsPropertyStored;
      end;

      [Flat]
      ItemsProperty = class
      private
        FItemsProperty: Schema.Schema.ItemsProperty;
        FSchemaArray: Schema.schemaArray;

        function GetItemsProperty: Schema.Schema.ItemsProperty;
        function GetItemsPropertyStored: Boolean;
        function GetSchemaArrayStored: Boolean;
      public
        destructor Destroy; override;

        function AddSchemaArray: Blue.Print.JSON.Draft4.Schema.Schema;

        property IsItemsPropertyStored: Boolean read GetItemsPropertyStored;
        property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
      published
        property ItemsProperty: Schema.Schema.ItemsProperty read GetItemsProperty write FItemsProperty stored GetItemsPropertyStored;
        property schemaArray: Schema.schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
      end;

      [Flat]
      AdditionalPropertiesProperty = class
      private
        FBoolean: System.Boolean;
        FAdditionalPropertiesProperty: Schema.Schema.AdditionalPropertiesProperty;

        function GetAdditionalPropertiesProperty: Schema.Schema.AdditionalPropertiesProperty;
        function GetBooleanStored: Boolean;
        function GetAdditionalPropertiesPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read GetBooleanStored;
        property IsAdditionalPropertiesPropertyStored: Boolean read GetAdditionalPropertiesPropertyStored;
      published
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
        property AdditionalPropertiesProperty: Schema.Schema.AdditionalPropertiesProperty read GetAdditionalPropertiesProperty write FAdditionalPropertiesProperty stored GetAdditionalPropertiesPropertyStored;
      end;

      DefinitionsProperty = class
      private
        FAdditionalProperties: TDynamicProperty<Schema.Schema.DefinitionsProperty>;

        function GetAdditionalProperties: TDynamicProperty<Schema.Schema.DefinitionsProperty>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema.Schema.DefinitionsProperty> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      PropertiesProperty = class
      private
        FAdditionalProperties: TDynamicProperty<Schema.Schema.PropertiesProperty>;

        function GetAdditionalProperties: TDynamicProperty<Schema.Schema.PropertiesProperty>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema.Schema.PropertiesProperty> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      PatternPropertiesProperty = class
      private
        FAdditionalProperties: TDynamicProperty<Schema.Schema.PatternPropertiesProperty>;

        function GetAdditionalProperties: TDynamicProperty<Schema.Schema.PatternPropertiesProperty>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema.Schema.PatternPropertiesProperty> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      DependenciesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
        private
          FAdditionalPropertiesType: Schema.Schema.DependenciesProperty.additionalPropertiesType;
          FStringArray: Schema.stringArray;

          function GetAdditionalPropertiesType: Schema.Schema.DependenciesProperty.additionalPropertiesType;
          function GetAdditionalPropertiesTypeStored: Boolean;
          function GetStringArrayStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesTypeStored: Boolean read GetAdditionalPropertiesTypeStored;
          property IsStringArrayStored: Boolean read GetStringArrayStored;
        published
          property additionalPropertiesType: Schema.Schema.DependenciesProperty.additionalPropertiesType read GetAdditionalPropertiesType write FAdditionalPropertiesType stored GetAdditionalPropertiesTypeStored;
          property stringArray: Schema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        end;
      private
        FAdditionalProperties: TDynamicProperty<Schema.Schema.DependenciesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<Schema.Schema.DependenciesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema.Schema.DependenciesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      TypeProperty = class
      private
        FSimpleTypes: Schema.simpleTypes;
        FArray: TArray<Schema.simpleTypes>;
        FSimpleTypesIsStored: Boolean;

        function GetArrayStored: Boolean;
        procedure SetSimpleTypes(const Value: Schema.simpleTypes);
      public
        property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
        property IsArrayStored: Boolean read GetArrayStored;
      published
        property simpleTypes: Schema.simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
        [FieldName('array')]
        property &array: TArray<Schema.simpleTypes> read FArray write FArray stored GetArrayStored;
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
      FMaxLength: Schema.positiveInteger;
      FMinLength: Schema.positiveIntegerDefault0;
      FPattern: System.String;
      FAdditionalItems: Schema.Schema.AdditionalItemsProperty;
      FItems: Schema.Schema.ItemsProperty;
      FMaxItems: Schema.positiveInteger;
      FMinItems: Schema.positiveIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxProperties: Schema.positiveInteger;
      FMinProperties: Schema.positiveIntegerDefault0;
      FRequired: Schema.stringArray;
      FAdditionalProperties: Schema.Schema.AdditionalPropertiesProperty;
      FDefinitions: Schema.Schema.DefinitionsProperty;
      FProperties: Schema.Schema.PropertiesProperty;
      FPatternProperties: Schema.Schema.PatternPropertiesProperty;
      FDependencies: Schema.Schema.DependenciesProperty;
      FEnum: TArray<any>;
      FType: Schema.Schema.TypeProperty;
      FFormat: System.String;
      FAllOf: Schema.schemaArray;
      FAnyOf: Schema.schemaArray;
      FOneOf: Schema.schemaArray;
      FNot: Schema.Schema;

      function GetMinLength: Schema.positiveIntegerDefault0;
      function GetAdditionalItems: Schema.Schema.AdditionalItemsProperty;
      function GetItems: Schema.Schema.ItemsProperty;
      function GetMinItems: Schema.positiveIntegerDefault0;
      function GetMinProperties: Schema.positiveIntegerDefault0;
      function GetAdditionalProperties: Schema.Schema.AdditionalPropertiesProperty;
      function GetDefinitions: Schema.Schema.DefinitionsProperty;
      function GetProperties: Schema.Schema.PropertiesProperty;
      function GetPatternProperties: Schema.Schema.PatternPropertiesProperty;
      function GetDependencies: Schema.Schema.DependenciesProperty;
      function GetType: Schema.Schema.TypeProperty;
      function GetNot: Schema.Schema;
      function GetIdStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetTitleStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetDefaultStored: Boolean;
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
      function GetUniqueItemsStored: Boolean;
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
    public
      destructor Destroy; override;

      function AddAllOf: Blue.Print.JSON.Draft4.Schema.Schema;
      function AddAnyOf: Blue.Print.JSON.Draft4.Schema.Schema;
      function AddOneOf: Blue.Print.JSON.Draft4.Schema.Schema;

      property IsIdStored: Boolean read GetIdStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsTitleStored: Boolean read GetTitleStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
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
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
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
      property schema: System.String read FSchema write FSchema stored GetSchemaStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: Schema.positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property additionalItems: Schema.Schema.AdditionalItemsProperty read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
      property items: Schema.Schema.ItemsProperty read GetItems write FItems stored GetItemsStored;
      property maxItems: Schema.positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property maxProperties: Schema.positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: Schema.positiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: Schema.stringArray read FRequired write FRequired stored GetRequiredStored;
      property additionalProperties: Schema.Schema.AdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property definitions: Schema.Schema.DefinitionsProperty read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property properties: Schema.Schema.PropertiesProperty read GetProperties write FProperties stored GetPropertiesStored;
      property patternProperties: Schema.Schema.PatternPropertiesProperty read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      property dependencies: Schema.Schema.DependenciesProperty read GetDependencies write FDependencies stored GetDependenciesStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      [FieldName('type')]
      property &type: Schema.Schema.TypeProperty read GetType write FType stored GetTypeStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property allOf: Schema.schemaArray read FAllOf write FAllOf stored GetAllOfStored;
      property anyOf: Schema.schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
      property oneOf: Schema.schemaArray read FOneOf write FOneOf stored GetOneOfStored;
      [FieldName('not')]
      property &not: Schema.Schema read GetNot write FNot stored GetNotStored;
    end;
  end;

implementation

uses System.SysUtils;

{ Schema.positiveIntegerDefault0 }

function Schema.positiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
begin
  Result := FPositiveInteger <> 0;
end;

{ Schema.Schema }

destructor Schema.Schema.Destroy;
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

function Schema.Schema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function Schema.Schema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function Schema.Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function Schema.Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Schema.Schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Schema.Schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Schema.Schema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Schema.Schema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Schema.Schema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Schema.Schema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Schema.Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Schema.Schema.GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalItemsProperty;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalItemsProperty.Create;

  Result := FAdditionalItems;
end;

function Schema.Schema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function Schema.Schema.GetItems: Blue.Print.JSON.Draft4.Schema.Schema.Schema.ItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft4.Schema.Schema.Schema.ItemsProperty.Create;

  Result := FItems;
end;

function Schema.Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Schema.Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Schema.Schema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Schema.Schema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Schema.Schema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function Schema.Schema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Schema.Schema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function Schema.Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Schema.Schema.GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalPropertiesProperty.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Schema.Schema.GetDefinitions: Blue.Print.JSON.Draft4.Schema.Schema.Schema.DefinitionsProperty;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft4.Schema.Schema.Schema.DefinitionsProperty.Create;

  Result := FDefinitions;
end;

function Schema.Schema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function Schema.Schema.GetProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.PropertiesProperty;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.PropertiesProperty.Create;

  Result := FProperties;
end;

function Schema.Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Schema.Schema.GetPatternProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.PatternPropertiesProperty;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.PatternPropertiesProperty.Create;

  Result := FPatternProperties;
end;

function Schema.Schema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function Schema.Schema.GetDependencies: Blue.Print.JSON.Draft4.Schema.Schema.Schema.DependenciesProperty;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft4.Schema.Schema.Schema.DependenciesProperty.Create;

  Result := FDependencies;
end;

function Schema.Schema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function Schema.Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Schema.Schema.GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty.Create;

  Result := FType;
end;

function Schema.Schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function Schema.Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Schema.Schema.AddAllOf: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  FAllOf := FAllOf + [Result];
end;

function Schema.Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Schema.Schema.AddAnyOf: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function Schema.Schema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function Schema.Schema.AddOneOf: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  FOneOf := FOneOf + [Result];
end;

function Schema.Schema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function Schema.Schema.GetNot: Blue.Print.JSON.Draft4.Schema.Schema.Schema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft4.Schema.Schema.Schema.Create;

  Result := FNot;
end;

function Schema.Schema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ Schema.Schema.AdditionalItemsProperty }

destructor Schema.Schema.AdditionalItemsProperty.Destroy;
begin
  FAdditionalItemsProperty.Free;

  inherited;
end;

function Schema.Schema.AdditionalItemsProperty.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.AdditionalItemsProperty.GetAdditionalItemsProperty: Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalItemsProperty;
begin
  if not Assigned(FAdditionalItemsProperty) then
    FAdditionalItemsProperty := Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalItemsProperty.Create;

  Result := FAdditionalItemsProperty;
end;

function Schema.Schema.AdditionalItemsProperty.GetAdditionalItemsPropertyStored: Boolean;
begin
  Result := Assigned(FAdditionalItemsProperty);
end;

{ Schema.Schema.ItemsProperty }

destructor Schema.Schema.ItemsProperty.Destroy;
begin
  FItemsProperty.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function Schema.Schema.ItemsProperty.GetItemsProperty: Blue.Print.JSON.Draft4.Schema.Schema.Schema.ItemsProperty;
begin
  if not Assigned(FItemsProperty) then
    FItemsProperty := Blue.Print.JSON.Draft4.Schema.Schema.Schema.ItemsProperty.Create;

  Result := FItemsProperty;
end;

function Schema.Schema.ItemsProperty.GetItemsPropertyStored: Boolean;
begin
  Result := Assigned(FItemsProperty);
end;

function Schema.Schema.ItemsProperty.AddSchemaArray: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function Schema.Schema.ItemsProperty.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ Schema.Schema.AdditionalPropertiesProperty }

destructor Schema.Schema.AdditionalPropertiesProperty.Destroy;
begin
  FAdditionalPropertiesProperty.Free;

  inherited;
end;

function Schema.Schema.AdditionalPropertiesProperty.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.AdditionalPropertiesProperty.GetAdditionalPropertiesProperty: Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalPropertiesProperty) then
    FAdditionalPropertiesProperty := Blue.Print.JSON.Draft4.Schema.Schema.Schema.AdditionalPropertiesProperty.Create;

  Result := FAdditionalPropertiesProperty;
end;

function Schema.Schema.AdditionalPropertiesProperty.GetAdditionalPropertiesPropertyStored: Boolean;
begin
  Result := Assigned(FAdditionalPropertiesProperty);
end;

{ Schema.Schema.DefinitionsProperty }

destructor Schema.Schema.DefinitionsProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.DefinitionsProperty.GetAdditionalProperties: TDynamicProperty<Schema.Schema.DefinitionsProperty>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema.Schema.DefinitionsProperty>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.DefinitionsProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.PropertiesProperty }

destructor Schema.Schema.PropertiesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.PropertiesProperty.GetAdditionalProperties: TDynamicProperty<Schema.Schema.PropertiesProperty>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema.Schema.PropertiesProperty>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.PropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.PatternPropertiesProperty }

destructor Schema.Schema.PatternPropertiesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.PatternPropertiesProperty.GetAdditionalProperties: TDynamicProperty<Schema.Schema.PatternPropertiesProperty>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema.Schema.PatternPropertiesProperty>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.PatternPropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.DependenciesProperty }

destructor Schema.Schema.DependenciesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.DependenciesProperty.GetAdditionalProperties: TDynamicProperty<Schema.Schema.DependenciesProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema.Schema.DependenciesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.DependenciesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.DependenciesProperty.additionalPropertiesType }

destructor Schema.Schema.DependenciesProperty.additionalPropertiesType.Destroy;
begin
  FAdditionalPropertiesType.Free;

  inherited;
end;

function Schema.Schema.DependenciesProperty.additionalPropertiesType.GetAdditionalPropertiesType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.DependenciesProperty.additionalPropertiesType;
begin
  if not Assigned(FAdditionalPropertiesType) then
    FAdditionalPropertiesType := Blue.Print.JSON.Draft4.Schema.Schema.Schema.DependenciesProperty.additionalPropertiesType.Create;

  Result := FAdditionalPropertiesType;
end;

function Schema.Schema.DependenciesProperty.additionalPropertiesType.GetAdditionalPropertiesTypeStored: Boolean;
begin
  Result := Assigned(FAdditionalPropertiesType);
end;

function Schema.Schema.DependenciesProperty.additionalPropertiesType.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ Schema.Schema.TypeProperty }

procedure Schema.Schema.TypeProperty.SetSimpleTypes(const Value: Schema.simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function Schema.Schema.TypeProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

end.
