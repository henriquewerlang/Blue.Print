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
    SimpleTypes = (&array, boolean, integer, null, number, &object, &string);

    // Forward class declaration
    PositiveIntegerDefault0 = class;
    Schema = class;

    // Types alias
    schemaArray = TArray<Blue.Print.JSON.Draft4.Schema.Schema>;
    positiveInteger = System.Integer;
    stringArray = TArray<System.String>;

    [Flat]
    PositiveIntegerDefault0 = class
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
      TAdditionalItems = class;
      TItems = class;
      TAdditionalProperties = class;
      TDefinitions = class;
      TProperties = class;
      TPatternProperties = class;
      TDependencies = class;
      TType = class;

      [Flat]
      TAdditionalItems = class
      private
        FBoolean: System.Boolean;
        FSchema: Schema;

        function GetSchema: Schema;
        function GetBooleanStored: Boolean;
        function GetSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read GetBooleanStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
      published
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
        property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      end;

      [Flat]
      TItems = class
      private
        FSchema: Schema;
        FSchemaArray: Schema.schemaArray;

        function GetSchema: Schema;
        function GetSchemaStored: Boolean;
        function GetSchemaArrayStored: Boolean;
      public
        destructor Destroy; override;

        function AddSchemaArray: Blue.Print.JSON.Draft4.Schema.Schema;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
      published
        property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
        property schemaArray: Schema.schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
      end;

      [Flat]
      TAdditionalProperties = class
      private
        FBoolean: System.Boolean;
        FSchema: Schema;

        function GetSchema: Schema;
        function GetBooleanStored: Boolean;
        function GetSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read GetBooleanStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
      published
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
        property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      end;

      TDefinitions = class
      private
        FAdditionalProperties: TDynamicProperty<Schema>;

        function GetAdditionalProperties: TDynamicProperty<Schema>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TProperties = class
      private
        FAdditionalProperties: TDynamicProperty<Schema>;

        function GetAdditionalProperties: TDynamicProperty<Schema>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TPatternProperties = class
      private
        FAdditionalProperties: TDynamicProperty<Schema>;

        function GetAdditionalProperties: TDynamicProperty<Schema>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<Schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TDependencies = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FSchema: Schema;
          FStringArray: Schema.stringArray;

          function GetSchema: Schema;
          function GetSchemaStored: Boolean;
          function GetStringArrayStored: Boolean;
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read GetSchemaStored;
          property IsStringArrayStored: Boolean read GetStringArrayStored;
        published
          property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
          property stringArray: Schema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        end;
      private
        FSchema: Schema;
        FStringArray: Schema.stringArray;
        FAdditionalProperties: TDynamicProperty<Schema.Schema.TDependencies.TadditionalProperties>;

        function GetSchema: Schema;
        function GetAdditionalProperties: TDynamicProperty<Schema.Schema.TDependencies.TadditionalProperties>;
        function GetSchemaStored: Boolean;
        function GetStringArrayStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsStringArrayStored: Boolean read GetStringArrayStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
        property stringArray: Schema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        property additionalProperties: TDynamicProperty<Schema.Schema.TDependencies.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      TType = class
      private
        FSimpleTypes: Schema.SimpleTypes;
        FArray: TArray<Schema.SimpleTypes>;
        FSimpleTypesIsStored: Boolean;

        function GetArrayStored: Boolean;
        procedure SetSimpleTypes(const Value: Schema.SimpleTypes);
      public
        property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
        property IsArrayStored: Boolean read GetArrayStored;
      published
        property SimpleTypes: Schema.SimpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
        [FieldName('array')]
        property &array: TArray<Schema.SimpleTypes> read FArray write FArray stored GetArrayStored;
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
      FMinLength: Schema.PositiveIntegerDefault0;
      FPattern: System.String;
      FAdditionalItems: Schema.Schema.TAdditionalItems;
      FItems: Schema.Schema.TItems;
      FMaxItems: Schema.positiveInteger;
      FMinItems: Schema.PositiveIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxProperties: Schema.positiveInteger;
      FMinProperties: Schema.PositiveIntegerDefault0;
      FRequired: Schema.stringArray;
      FAdditionalProperties: Schema.Schema.TAdditionalProperties;
      FDefinitions: Schema.Schema.TDefinitions;
      FProperties: Schema.Schema.TProperties;
      FPatternProperties: Schema.Schema.TPatternProperties;
      FDependencies: Schema.Schema.TDependencies;
      FEnum: TArray<any>;
      FType: Schema.Schema.TType;
      FFormat: System.String;
      FAllOf: Schema.schemaArray;
      FAnyOf: Schema.schemaArray;
      FOneOf: Schema.schemaArray;
      FNot: Schema;

      function GetMinLength: Schema.PositiveIntegerDefault0;
      function GetAdditionalItems: Schema.Schema.TAdditionalItems;
      function GetItems: Schema.Schema.TItems;
      function GetMinItems: Schema.PositiveIntegerDefault0;
      function GetMinProperties: Schema.PositiveIntegerDefault0;
      function GetAdditionalProperties: Schema.Schema.TAdditionalProperties;
      function GetDefinitions: Schema.Schema.TDefinitions;
      function GetProperties: Schema.Schema.TProperties;
      function GetPatternProperties: Schema.Schema.TPatternProperties;
      function GetDependencies: Schema.Schema.TDependencies;
      function GetType: Schema.Schema.TType;
      function GetNot: Schema;
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
      property Schema: System.String read FSchema write FSchema stored GetSchemaStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: Schema.positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property additionalItems: Schema.Schema.TAdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
      property items: Schema.Schema.TItems read GetItems write FItems stored GetItemsStored;
      property maxItems: Schema.positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property maxProperties: Schema.positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: Schema.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: Schema.stringArray read FRequired write FRequired stored GetRequiredStored;
      property additionalProperties: Schema.Schema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property definitions: Schema.Schema.TDefinitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property properties: Schema.Schema.TProperties read GetProperties write FProperties stored GetPropertiesStored;
      property patternProperties: Schema.Schema.TPatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      property dependencies: Schema.Schema.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      [FieldName('type')]
      property &type: Schema.Schema.TType read GetType write FType stored GetTypeStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property allOf: Schema.schemaArray read FAllOf write FAllOf stored GetAllOfStored;
      property anyOf: Schema.schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
      property oneOf: Schema.schemaArray read FOneOf write FOneOf stored GetOneOfStored;
      [FieldName('not')]
      property &not: Schema read GetNot write FNot stored GetNotStored;
    end;
  end;

implementation

uses System.SysUtils;

{ Schema.PositiveIntegerDefault0 }

function Schema.PositiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
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

function Schema.Schema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

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

function Schema.Schema.GetAdditionalItems: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TAdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TAdditionalItems.Create;

  Result := FAdditionalItems;
end;

function Schema.Schema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function Schema.Schema.GetItems: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TItems.Create;

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

function Schema.Schema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

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

function Schema.Schema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

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

function Schema.Schema.GetAdditionalProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Schema.Schema.GetDefinitions: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TDefinitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TDefinitions.Create;

  Result := FDefinitions;
end;

function Schema.Schema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function Schema.Schema.GetProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TProperties.Create;

  Result := FProperties;
end;

function Schema.Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Schema.Schema.GetPatternProperties: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TPatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TPatternProperties.Create;

  Result := FPatternProperties;
end;

function Schema.Schema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function Schema.Schema.GetDependencies: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TDependencies.Create;

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

function Schema.Schema.GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TType.Create;

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

function Schema.Schema.GetNot: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FNot;
end;

function Schema.Schema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ Schema.Schema.TAdditionalItems }

destructor Schema.Schema.TAdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Schema.Schema.TAdditionalItems.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.TAdditionalItems.GetSchema: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FSchema;
end;

function Schema.Schema.TAdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ Schema.Schema.TItems }

destructor Schema.Schema.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function Schema.Schema.TItems.GetSchema: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FSchema;
end;

function Schema.Schema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.Schema.TItems.AddSchemaArray: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  Result := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function Schema.Schema.TItems.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ Schema.Schema.TAdditionalProperties }

destructor Schema.Schema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Schema.Schema.TAdditionalProperties.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function Schema.Schema.TAdditionalProperties.GetSchema: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FSchema;
end;

function Schema.Schema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ Schema.Schema.TDefinitions }

destructor Schema.Schema.TDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.TDefinitions.GetAdditionalProperties: TDynamicProperty<Schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.TDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.TProperties }

destructor Schema.Schema.TProperties.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.TProperties.GetAdditionalProperties: TDynamicProperty<Schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.TProperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.TPatternProperties }

destructor Schema.Schema.TPatternProperties.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.TPatternProperties.GetAdditionalProperties: TDynamicProperty<Schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.TPatternProperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.TDependencies }

destructor Schema.Schema.TDependencies.Destroy;
begin
  FSchema.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function Schema.Schema.TDependencies.GetSchema: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FSchema;
end;

function Schema.Schema.TDependencies.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.Schema.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

function Schema.Schema.TDependencies.GetAdditionalProperties: TDynamicProperty<Schema.Schema.TDependencies.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft4.Schema.Schema.Schema.TDependencies.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function Schema.Schema.TDependencies.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ Schema.Schema.TDependencies.TadditionalProperties }

destructor Schema.Schema.TDependencies.TadditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Schema.Schema.TDependencies.TadditionalProperties.GetSchema: Blue.Print.JSON.Draft4.Schema.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.JSON.Draft4.Schema.Schema.Create;

  Result := FSchema;
end;

function Schema.Schema.TDependencies.TadditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.Schema.TDependencies.TadditionalProperties.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ Schema.Schema.TType }

procedure Schema.Schema.TType.SetSimpleTypes(const Value: Schema.SimpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function Schema.Schema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

end.
