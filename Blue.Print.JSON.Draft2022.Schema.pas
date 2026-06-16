unit Blue.Print.JSON.Draft2022.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from meta/core, meta/applicator, meta/unevaluated, meta/validation, meta/meta-data, meta/format-annotation, meta/content, https://json-schema.org/draft/2020-12/schema;

uses Blue.Print.Types, System.Rtti;

type
  // Forward class declaration
  JSONSchema = class;

  // Types alias
  any = System.Rtti.TValue;

  JSONSchema = class
  public type
    // Forward class declaration
    JSONSchema = class;

    [Flat]
    JSONSchema = class
    public type
      [EnumValue('array, boolean, integer, null, number, object, string')]
      SimpleTypes = (&array, boolean, integer, null, number, &object, &string);

      // Forward class declaration
      &Object = class;

      // Types alias
      anchorString = System.String;
      uriString = System.String;
      uriReferenceString = System.String;
      schemaArray = TArray<Blue.Print.JSON.Draft2022.Schema.JSONSchema>;
      nonNegativeInteger = System.Integer;
      nonNegativeIntegerDefault0 = System.Integer;
      simpleTypes = Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.SimpleTypes;
      stringArray = TArray<System.String>;

      &Object = class
      public type
        // Forward class declaration
        TVocabulary = class;
        TDefs = class;
        TProperties = class;
        TPatternProperties = class;
        TDependentSchemas = class;
        TType = class;
        TDependentRequired = class;
        TDefinitions = class;
        TDependencies = class;

        TVocabulary = class
        private
          FAdditionalProperties: TDynamicProperty<System.Boolean>;

          function GetAdditionalProperties: TDynamicProperty<System.Boolean>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<System.Boolean> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TDefs = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TProperties = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TPatternProperties = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TDependentSchemas = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        [Flat]
        TType = class
        private
          FSimpleTypes: JSONSchema.JSONSchema.SimpleTypes;
          FArray: TArray<JSONSchema.JSONSchema.SimpleTypes>;
          FSimpleTypesIsStored: Boolean;

          function GetArrayStored: Boolean;
          procedure SetSimpleTypes(const Value: JSONSchema.JSONSchema.SimpleTypes);
        public
          property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
          property IsArrayStored: Boolean read GetArrayStored;
        published
          property simpleTypes: JSONSchema.JSONSchema.SimpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
          [FieldName('array')]
          property &array: TArray<JSONSchema.JSONSchema.SimpleTypes> read FArray write FArray stored GetArrayStored;
        end;

        TDependentRequired = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.stringArray>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.stringArray>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema.JSONSchema.stringArray> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TDefinitions = class
        private
          FAdditionalProperties: TDynamicProperty<JSONSchema>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<JSONSchema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TDependencies = class
        public type
          // Forward class declaration
          TadditionalProperties = class;

          [Flat]
          TadditionalProperties = class
          private
            FStringArray: JSONSchema.JSONSchema.stringArray;

            function GetStringArrayStored: Boolean;
          public
            property IsStringArrayStored: Boolean read GetStringArrayStored;
          published
            property stringArray: JSONSchema.JSONSchema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
          end;
        private
          FStringArray: JSONSchema.JSONSchema.stringArray;
          FAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties>;

          function GetAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties>;
          function GetStringArrayStored: Boolean;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsStringArrayStored: Boolean read GetStringArrayStored;
          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property stringArray: JSONSchema.JSONSchema.stringArray read FStringArray write FStringArray stored GetStringArrayStored;
          property additionalProperties: TDynamicProperty<JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FId: JSONSchema.JSONSchema.uriReferenceString;
        FSchema: JSONSchema.JSONSchema.uriString;
        FRef: JSONSchema.JSONSchema.uriReferenceString;
        FAnchor: JSONSchema.JSONSchema.anchorString;
        FDynamicRef: JSONSchema.JSONSchema.uriReferenceString;
        FDynamicAnchor: JSONSchema.JSONSchema.anchorString;
        FVocabulary: JSONSchema.JSONSchema.&Object.TVocabulary;
        FComment: System.String;
        FDefs: JSONSchema.JSONSchema.&Object.TDefs;
        FPrefixItems: JSONSchema.JSONSchema.schemaArray;
        FItems: JSONSchema;
        FContains: JSONSchema;
        FAdditionalProperties: JSONSchema;
        FProperties: JSONSchema.JSONSchema.&Object.TProperties;
        FPatternProperties: JSONSchema.JSONSchema.&Object.TPatternProperties;
        FDependentSchemas: JSONSchema.JSONSchema.&Object.TDependentSchemas;
        FPropertyNames: JSONSchema;
        FIf: JSONSchema;
        FThen: JSONSchema;
        FElse: JSONSchema;
        FAllOf: JSONSchema.JSONSchema.schemaArray;
        FAnyOf: JSONSchema.JSONSchema.schemaArray;
        FOneOf: JSONSchema.JSONSchema.schemaArray;
        FNot: JSONSchema;
        FUnevaluatedItems: JSONSchema;
        FUnevaluatedProperties: JSONSchema;
        FType: JSONSchema.JSONSchema.&Object.TType;
        FConst: any;
        FEnum: TArray<any>;
        FMultipleOf: System.Double;
        FMaximum: System.Double;
        FExclusiveMaximum: System.Double;
        FMinimum: System.Double;
        FExclusiveMinimum: System.Double;
        FMaxLength: JSONSchema.JSONSchema.nonNegativeInteger;
        FMinLength: JSONSchema.JSONSchema.nonNegativeIntegerDefault0;
        FPattern: System.String;
        FMaxItems: JSONSchema.JSONSchema.nonNegativeInteger;
        FMinItems: JSONSchema.JSONSchema.nonNegativeIntegerDefault0;
        FUniqueItems: System.Boolean;
        FMaxContains: JSONSchema.JSONSchema.nonNegativeInteger;
        FMinContains: JSONSchema.JSONSchema.nonNegativeInteger;
        FMaxProperties: JSONSchema.JSONSchema.nonNegativeInteger;
        FMinProperties: JSONSchema.JSONSchema.nonNegativeIntegerDefault0;
        FRequired: JSONSchema.JSONSchema.stringArray;
        FDependentRequired: JSONSchema.JSONSchema.&Object.TDependentRequired;
        FTitle: System.String;
        FDescription: System.String;
        FDefault: any;
        FDeprecated: System.Boolean;
        FReadOnly: System.Boolean;
        FWriteOnly: System.Boolean;
        FExamples: TArray<any>;
        FFormat: System.String;
        FContentEncoding: System.String;
        FContentMediaType: System.String;
        FContentSchema: JSONSchema;
        FDefinitions: JSONSchema.JSONSchema.&Object.TDefinitions;
        FDependencies: JSONSchema.JSONSchema.&Object.TDependencies;
        FRecursiveAnchor: JSONSchema.JSONSchema.anchorString;
        FRecursiveRef: JSONSchema.JSONSchema.uriReferenceString;

        function GetVocabulary: JSONSchema.JSONSchema.&Object.TVocabulary;
        function GetDefs: JSONSchema.JSONSchema.&Object.TDefs;
        function GetItems: JSONSchema;
        function GetContains: JSONSchema;
        function GetAdditionalProperties: JSONSchema;
        function GetProperties: JSONSchema.JSONSchema.&Object.TProperties;
        function GetPatternProperties: JSONSchema.JSONSchema.&Object.TPatternProperties;
        function GetDependentSchemas: JSONSchema.JSONSchema.&Object.TDependentSchemas;
        function GetPropertyNames: JSONSchema;
        function GetIf: JSONSchema;
        function GetThen: JSONSchema;
        function GetElse: JSONSchema;
        function GetNot: JSONSchema;
        function GetUnevaluatedItems: JSONSchema;
        function GetUnevaluatedProperties: JSONSchema;
        function GetType: JSONSchema.JSONSchema.&Object.TType;
        function GetDependentRequired: JSONSchema.JSONSchema.&Object.TDependentRequired;
        function GetContentSchema: JSONSchema;
        function GetDefinitions: JSONSchema.JSONSchema.&Object.TDefinitions;
        function GetDependencies: JSONSchema.JSONSchema.&Object.TDependencies;
        function GetIdStored: Boolean;
        function GetSchemaStored: Boolean;
        function GetRefStored: Boolean;
        function GetAnchorStored: Boolean;
        function GetDynamicRefStored: Boolean;
        function GetDynamicAnchorStored: Boolean;
        function GetVocabularyStored: Boolean;
        function GetCommentStored: Boolean;
        function GetDefsStored: Boolean;
        function GetPrefixItemsStored: Boolean;
        function GetItemsStored: Boolean;
        function GetContainsStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
        function GetPropertiesStored: Boolean;
        function GetPatternPropertiesStored: Boolean;
        function GetDependentSchemasStored: Boolean;
        function GetPropertyNamesStored: Boolean;
        function GetIfStored: Boolean;
        function GetThenStored: Boolean;
        function GetElseStored: Boolean;
        function GetAllOfStored: Boolean;
        function GetAnyOfStored: Boolean;
        function GetOneOfStored: Boolean;
        function GetNotStored: Boolean;
        function GetUnevaluatedItemsStored: Boolean;
        function GetUnevaluatedPropertiesStored: Boolean;
        function GetTypeStored: Boolean;
        function GetConstStored: Boolean;
        function GetEnumStored: Boolean;
        function GetMultipleOfStored: Boolean;
        function GetMaximumStored: Boolean;
        function GetExclusiveMaximumStored: Boolean;
        function GetMinimumStored: Boolean;
        function GetExclusiveMinimumStored: Boolean;
        function GetMaxLengthStored: Boolean;
        function GetMinLengthStored: Boolean;
        function GetPatternStored: Boolean;
        function GetMaxItemsStored: Boolean;
        function GetMinItemsStored: Boolean;
        function GetUniqueItemsStored: Boolean;
        function GetMaxContainsStored: Boolean;
        function GetMinContainsStored: Boolean;
        function GetMaxPropertiesStored: Boolean;
        function GetMinPropertiesStored: Boolean;
        function GetRequiredStored: Boolean;
        function GetDependentRequiredStored: Boolean;
        function GetTitleStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetDefaultStored: Boolean;
        function GetDeprecatedStored: Boolean;
        function GetReadOnlyStored: Boolean;
        function GetWriteOnlyStored: Boolean;
        function GetExamplesStored: Boolean;
        function GetFormatStored: Boolean;
        function GetContentEncodingStored: Boolean;
        function GetContentMediaTypeStored: Boolean;
        function GetContentSchemaStored: Boolean;
        function GetDefinitionsStored: Boolean;
        function GetDependenciesStored: Boolean;
        function GetRecursiveAnchorStored: Boolean;
        function GetRecursiveRefStored: Boolean;
      public
        destructor Destroy; override;

        function AddPrefixItems: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
        function AddAllOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
        function AddAnyOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
        function AddOneOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;

        property IsIdStored: Boolean read GetIdStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsRefStored: Boolean read GetRefStored;
        property IsAnchorStored: Boolean read GetAnchorStored;
        property IsDynamicRefStored: Boolean read GetDynamicRefStored;
        property IsDynamicAnchorStored: Boolean read GetDynamicAnchorStored;
        property IsVocabularyStored: Boolean read GetVocabularyStored;
        property IsCommentStored: Boolean read GetCommentStored;
        property IsDefsStored: Boolean read GetDefsStored;
        property IsPrefixItemsStored: Boolean read GetPrefixItemsStored;
        property IsItemsStored: Boolean read GetItemsStored;
        property IsContainsStored: Boolean read GetContainsStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        property IsPropertiesStored: Boolean read GetPropertiesStored;
        property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
        property IsDependentSchemasStored: Boolean read GetDependentSchemasStored;
        property IsPropertyNamesStored: Boolean read GetPropertyNamesStored;
        property IsIfStored: Boolean read GetIfStored;
        property IsThenStored: Boolean read GetThenStored;
        property IsElseStored: Boolean read GetElseStored;
        property IsAllOfStored: Boolean read GetAllOfStored;
        property IsAnyOfStored: Boolean read GetAnyOfStored;
        property IsOneOfStored: Boolean read GetOneOfStored;
        property IsNotStored: Boolean read GetNotStored;
        property IsUnevaluatedItemsStored: Boolean read GetUnevaluatedItemsStored;
        property IsUnevaluatedPropertiesStored: Boolean read GetUnevaluatedPropertiesStored;
        property IsTypeStored: Boolean read GetTypeStored;
        property IsConstStored: Boolean read GetConstStored;
        property IsEnumStored: Boolean read GetEnumStored;
        property IsMultipleOfStored: Boolean read GetMultipleOfStored;
        property IsMaximumStored: Boolean read GetMaximumStored;
        property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
        property IsMinimumStored: Boolean read GetMinimumStored;
        property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
        property IsMaxLengthStored: Boolean read GetMaxLengthStored;
        property IsMinLengthStored: Boolean read GetMinLengthStored;
        property IsPatternStored: Boolean read GetPatternStored;
        property IsMaxItemsStored: Boolean read GetMaxItemsStored;
        property IsMinItemsStored: Boolean read GetMinItemsStored;
        property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
        property IsMaxContainsStored: Boolean read GetMaxContainsStored;
        property IsMinContainsStored: Boolean read GetMinContainsStored;
        property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
        property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
        property IsRequiredStored: Boolean read GetRequiredStored;
        property IsDependentRequiredStored: Boolean read GetDependentRequiredStored;
        property IsTitleStored: Boolean read GetTitleStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsDefaultStored: Boolean read GetDefaultStored;
        property IsDeprecatedStored: Boolean read GetDeprecatedStored;
        property IsReadOnlyStored: Boolean read GetReadOnlyStored;
        property IsWriteOnlyStored: Boolean read GetWriteOnlyStored;
        property IsExamplesStored: Boolean read GetExamplesStored;
        property IsFormatStored: Boolean read GetFormatStored;
        property IsContentEncodingStored: Boolean read GetContentEncodingStored;
        property IsContentMediaTypeStored: Boolean read GetContentMediaTypeStored;
        property IsContentSchemaStored: Boolean read GetContentSchemaStored;
        property IsDefinitionsStored: Boolean read GetDefinitionsStored;
        property IsDependenciesStored: Boolean read GetDependenciesStored;
        property IsRecursiveAnchorStored: Boolean read GetRecursiveAnchorStored;
        property IsRecursiveRefStored: Boolean read GetRecursiveRefStored;
      published
        [FieldName('$id')]
        property Id: JSONSchema.JSONSchema.uriReferenceString read FId write FId stored GetIdStored;
        [FieldName('$schema')]
        property Schema: JSONSchema.JSONSchema.uriString read FSchema write FSchema stored GetSchemaStored;
        [FieldName('$ref')]
        property Ref: JSONSchema.JSONSchema.uriReferenceString read FRef write FRef stored GetRefStored;
        [FieldName('$anchor')]
        property Anchor: JSONSchema.JSONSchema.anchorString read FAnchor write FAnchor stored GetAnchorStored;
        [FieldName('$dynamicRef')]
        property DynamicRef: JSONSchema.JSONSchema.uriReferenceString read FDynamicRef write FDynamicRef stored GetDynamicRefStored;
        [FieldName('$dynamicAnchor')]
        property DynamicAnchor: JSONSchema.JSONSchema.anchorString read FDynamicAnchor write FDynamicAnchor stored GetDynamicAnchorStored;
        [FieldName('$vocabulary')]
        property Vocabulary: JSONSchema.JSONSchema.&Object.TVocabulary read GetVocabulary write FVocabulary stored GetVocabularyStored;
        [FieldName('$comment')]
        property Comment: System.String read FComment write FComment stored GetCommentStored;
        [FieldName('$defs')]
        property Defs: JSONSchema.JSONSchema.&Object.TDefs read GetDefs write FDefs stored GetDefsStored;
        property prefixItems: JSONSchema.JSONSchema.schemaArray read FPrefixItems write FPrefixItems stored GetPrefixItemsStored;
        property items: JSONSchema read GetItems write FItems stored GetItemsStored;
        property contains: JSONSchema read GetContains write FContains stored GetContainsStored;
        property additionalProperties: JSONSchema read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        property properties: JSONSchema.JSONSchema.&Object.TProperties read GetProperties write FProperties stored GetPropertiesStored;
        property patternProperties: JSONSchema.JSONSchema.&Object.TPatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
        property dependentSchemas: JSONSchema.JSONSchema.&Object.TDependentSchemas read GetDependentSchemas write FDependentSchemas stored GetDependentSchemasStored;
        property propertyNames: JSONSchema read GetPropertyNames write FPropertyNames stored GetPropertyNamesStored;
        [FieldName('if')]
        property &if: JSONSchema read GetIf write FIf stored GetIfStored;
        [FieldName('then')]
        property &then: JSONSchema read GetThen write FThen stored GetThenStored;
        [FieldName('else')]
        property &else: JSONSchema read GetElse write FElse stored GetElseStored;
        property allOf: JSONSchema.JSONSchema.schemaArray read FAllOf write FAllOf stored GetAllOfStored;
        property anyOf: JSONSchema.JSONSchema.schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
        property oneOf: JSONSchema.JSONSchema.schemaArray read FOneOf write FOneOf stored GetOneOfStored;
        [FieldName('not')]
        property &not: JSONSchema read GetNot write FNot stored GetNotStored;
        property unevaluatedItems: JSONSchema read GetUnevaluatedItems write FUnevaluatedItems stored GetUnevaluatedItemsStored;
        property unevaluatedProperties: JSONSchema read GetUnevaluatedProperties write FUnevaluatedProperties stored GetUnevaluatedPropertiesStored;
        [FieldName('type')]
        property &type: JSONSchema.JSONSchema.&Object.TType read GetType write FType stored GetTypeStored;
        [FieldName('const')]
        property &const: any read FConst write FConst stored GetConstStored;
        property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
        property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
        property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
        property exclusiveMaximum: System.Double read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
        property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
        property exclusiveMinimum: System.Double read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
        property maxLength: JSONSchema.JSONSchema.nonNegativeInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
        property minLength: JSONSchema.JSONSchema.nonNegativeIntegerDefault0 read FMinLength write FMinLength stored GetMinLengthStored;
        property pattern: System.String read FPattern write FPattern stored GetPatternStored;
        property maxItems: JSONSchema.JSONSchema.nonNegativeInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
        property minItems: JSONSchema.JSONSchema.nonNegativeIntegerDefault0 read FMinItems write FMinItems stored GetMinItemsStored;
        property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
        property maxContains: JSONSchema.JSONSchema.nonNegativeInteger read FMaxContains write FMaxContains stored GetMaxContainsStored;
        property minContains: JSONSchema.JSONSchema.nonNegativeInteger read FMinContains write FMinContains stored GetMinContainsStored;
        property maxProperties: JSONSchema.JSONSchema.nonNegativeInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
        property minProperties: JSONSchema.JSONSchema.nonNegativeIntegerDefault0 read FMinProperties write FMinProperties stored GetMinPropertiesStored;
        property required: JSONSchema.JSONSchema.stringArray read FRequired write FRequired stored GetRequiredStored;
        property dependentRequired: JSONSchema.JSONSchema.&Object.TDependentRequired read GetDependentRequired write FDependentRequired stored GetDependentRequiredStored;
        property title: System.String read FTitle write FTitle stored GetTitleStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property default: any read FDefault write FDefault stored GetDefaultStored;
        property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
        property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
        property writeOnly: System.Boolean read FWriteOnly write FWriteOnly stored GetWriteOnlyStored;
        property examples: TArray<any> read FExamples write FExamples stored GetExamplesStored;
        property format: System.String read FFormat write FFormat stored GetFormatStored;
        property contentEncoding: System.String read FContentEncoding write FContentEncoding stored GetContentEncodingStored;
        property contentMediaType: System.String read FContentMediaType write FContentMediaType stored GetContentMediaTypeStored;
        property contentSchema: JSONSchema read GetContentSchema write FContentSchema stored GetContentSchemaStored;
        property definitions: JSONSchema.JSONSchema.&Object.TDefinitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
        property dependencies: JSONSchema.JSONSchema.&Object.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
        [FieldName('$recursiveAnchor')]
        property RecursiveAnchor: JSONSchema.JSONSchema.anchorString read FRecursiveAnchor write FRecursiveAnchor stored GetRecursiveAnchorStored;
        [FieldName('$recursiveRef')]
        property RecursiveRef: JSONSchema.JSONSchema.uriReferenceString read FRecursiveRef write FRecursiveRef stored GetRecursiveRefStored;
      end;
    private
      FObject: JSONSchema.JSONSchema.&Object;
      FBoolean: System.Boolean;

      function GetObject: JSONSchema.JSONSchema.&Object;
      function GetObjectStored: Boolean;
      function GetBooleanStored: Boolean;
    public
      destructor Destroy; override;

      property IsObjectStored: Boolean read GetObjectStored;
      property IsBooleanStored: Boolean read GetBooleanStored;
    published
      [FieldName('Object')]
      property &Object: JSONSchema.JSONSchema.&Object read GetObject write FObject stored GetObjectStored;
      property Boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
    end;
  end;

implementation

uses System.SysUtils;

{ JSONSchema.JSONSchema }

destructor JSONSchema.JSONSchema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function JSONSchema.JSONSchema.GetObject: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.Create;

  Result := FObject;
end;

function JSONSchema.JSONSchema.GetObjectStored: Boolean;
begin
  Result := Assigned(FObject);
end;

function JSONSchema.JSONSchema.GetBooleanStored: Boolean;
begin
  Result := False;
end;

{ JSONSchema.JSONSchema.&Object }

destructor JSONSchema.JSONSchema.&Object.Destroy;
begin
  FVocabulary.Free;

  FDefs.Free;

  for var AObject in FPrefixItems do
    AObject.Free;

  FItems.Free;

  FContains.Free;

  FAdditionalProperties.Free;

  FProperties.Free;

  FPatternProperties.Free;

  FDependentSchemas.Free;

  FPropertyNames.Free;

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

  FUnevaluatedItems.Free;

  FUnevaluatedProperties.Free;

  FType.Free;

  FDependentRequired.Free;

  FContentSchema.Free;

  FDefinitions.Free;

  FDependencies.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetAnchorStored: Boolean;
begin
  Result := not FAnchor.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetDynamicRefStored: Boolean;
begin
  Result := not FDynamicRef.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetDynamicAnchorStored: Boolean;
begin
  Result := not FDynamicAnchor.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetVocabulary: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TVocabulary;
begin
  if not Assigned(FVocabulary) then
    FVocabulary := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TVocabulary.Create;

  Result := FVocabulary;
end;

function JSONSchema.JSONSchema.&Object.GetVocabularyStored: Boolean;
begin
  Result := Assigned(FVocabulary);
end;

function JSONSchema.JSONSchema.&Object.GetCommentStored: Boolean;
begin
  Result := not FComment.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetDefs: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDefs;
begin
  if not Assigned(FDefs) then
    FDefs := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDefs.Create;

  Result := FDefs;
end;

function JSONSchema.JSONSchema.&Object.GetDefsStored: Boolean;
begin
  Result := Assigned(FDefs);
end;

function JSONSchema.JSONSchema.&Object.AddPrefixItems: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  FPrefixItems := FPrefixItems + [Result];
end;

function JSONSchema.JSONSchema.&Object.GetPrefixItemsStored: Boolean;
begin
  Result := Assigned(FPrefixItems);
end;

function JSONSchema.JSONSchema.&Object.GetItems: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FItems;
end;

function JSONSchema.JSONSchema.&Object.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function JSONSchema.JSONSchema.&Object.GetContains: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FContains) then
    FContains := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FContains;
end;

function JSONSchema.JSONSchema.&Object.GetContainsStored: Boolean;
begin
  Result := Assigned(FContains);
end;

function JSONSchema.JSONSchema.&Object.GetAdditionalProperties: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function JSONSchema.JSONSchema.&Object.GetProperties: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TProperties.Create;

  Result := FProperties;
end;

function JSONSchema.JSONSchema.&Object.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function JSONSchema.JSONSchema.&Object.GetPatternProperties: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TPatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TPatternProperties.Create;

  Result := FPatternProperties;
end;

function JSONSchema.JSONSchema.&Object.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function JSONSchema.JSONSchema.&Object.GetDependentSchemas: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependentSchemas;
begin
  if not Assigned(FDependentSchemas) then
    FDependentSchemas := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependentSchemas.Create;

  Result := FDependentSchemas;
end;

function JSONSchema.JSONSchema.&Object.GetDependentSchemasStored: Boolean;
begin
  Result := Assigned(FDependentSchemas);
end;

function JSONSchema.JSONSchema.&Object.GetPropertyNames: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FPropertyNames) then
    FPropertyNames := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FPropertyNames;
end;

function JSONSchema.JSONSchema.&Object.GetPropertyNamesStored: Boolean;
begin
  Result := Assigned(FPropertyNames);
end;

function JSONSchema.JSONSchema.&Object.GetIf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FIf) then
    FIf := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FIf;
end;

function JSONSchema.JSONSchema.&Object.GetIfStored: Boolean;
begin
  Result := Assigned(FIf);
end;

function JSONSchema.JSONSchema.&Object.GetThen: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FThen) then
    FThen := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FThen;
end;

function JSONSchema.JSONSchema.&Object.GetThenStored: Boolean;
begin
  Result := Assigned(FThen);
end;

function JSONSchema.JSONSchema.&Object.GetElse: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FElse) then
    FElse := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FElse;
end;

function JSONSchema.JSONSchema.&Object.GetElseStored: Boolean;
begin
  Result := Assigned(FElse);
end;

function JSONSchema.JSONSchema.&Object.AddAllOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function JSONSchema.JSONSchema.&Object.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function JSONSchema.JSONSchema.&Object.AddAnyOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function JSONSchema.JSONSchema.&Object.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function JSONSchema.JSONSchema.&Object.AddOneOf: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function JSONSchema.JSONSchema.&Object.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function JSONSchema.JSONSchema.&Object.GetNot: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FNot;
end;

function JSONSchema.JSONSchema.&Object.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function JSONSchema.JSONSchema.&Object.GetUnevaluatedItems: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FUnevaluatedItems) then
    FUnevaluatedItems := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FUnevaluatedItems;
end;

function JSONSchema.JSONSchema.&Object.GetUnevaluatedItemsStored: Boolean;
begin
  Result := Assigned(FUnevaluatedItems);
end;

function JSONSchema.JSONSchema.&Object.GetUnevaluatedProperties: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FUnevaluatedProperties) then
    FUnevaluatedProperties := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FUnevaluatedProperties;
end;

function JSONSchema.JSONSchema.&Object.GetUnevaluatedPropertiesStored: Boolean;
begin
  Result := Assigned(FUnevaluatedProperties);
end;

function JSONSchema.JSONSchema.&Object.GetType: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TType.Create;

  Result := FType;
end;

function JSONSchema.JSONSchema.&Object.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function JSONSchema.JSONSchema.&Object.GetConstStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function JSONSchema.JSONSchema.&Object.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetExclusiveMaximumStored: Boolean;
begin
  Result := FExclusiveMaximum <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetExclusiveMinimumStored: Boolean;
begin
  Result := FExclusiveMinimum <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMinLengthStored: Boolean;
begin
  Result := FMinLength <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMinItemsStored: Boolean;
begin
  Result := FMinItems <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetMaxContainsStored: Boolean;
begin
  Result := FMaxContains <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMinContainsStored: Boolean;
begin
  Result := FMinContains <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetMinPropertiesStored: Boolean;
begin
  Result := FMinProperties <> 0;
end;

function JSONSchema.JSONSchema.&Object.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function JSONSchema.JSONSchema.&Object.GetDependentRequired: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependentRequired;
begin
  if not Assigned(FDependentRequired) then
    FDependentRequired := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependentRequired.Create;

  Result := FDependentRequired;
end;

function JSONSchema.JSONSchema.&Object.GetDependentRequiredStored: Boolean;
begin
  Result := Assigned(FDependentRequired);
end;

function JSONSchema.JSONSchema.&Object.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetWriteOnlyStored: Boolean;
begin
  Result := False;
end;

function JSONSchema.JSONSchema.&Object.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function JSONSchema.JSONSchema.&Object.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetContentEncodingStored: Boolean;
begin
  Result := not FContentEncoding.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetContentMediaTypeStored: Boolean;
begin
  Result := not FContentMediaType.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetContentSchema: Blue.Print.JSON.Draft2022.Schema.JSONSchema;
begin
  if not Assigned(FContentSchema) then
    FContentSchema := Blue.Print.JSON.Draft2022.Schema.JSONSchema.Create;

  Result := FContentSchema;
end;

function JSONSchema.JSONSchema.&Object.GetContentSchemaStored: Boolean;
begin
  Result := Assigned(FContentSchema);
end;

function JSONSchema.JSONSchema.&Object.GetDefinitions: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDefinitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDefinitions.Create;

  Result := FDefinitions;
end;

function JSONSchema.JSONSchema.&Object.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function JSONSchema.JSONSchema.&Object.GetDependencies: Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependencies.Create;

  Result := FDependencies;
end;

function JSONSchema.JSONSchema.&Object.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function JSONSchema.JSONSchema.&Object.GetRecursiveAnchorStored: Boolean;
begin
  Result := not FRecursiveAnchor.IsEmpty;
end;

function JSONSchema.JSONSchema.&Object.GetRecursiveRefStored: Boolean;
begin
  Result := not FRecursiveRef.IsEmpty;
end;

{ JSONSchema.JSONSchema.&Object.TVocabulary }

destructor JSONSchema.JSONSchema.&Object.TVocabulary.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TVocabulary.GetAdditionalProperties: TDynamicProperty<System.Boolean>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.Boolean>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TVocabulary.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TDefs }

destructor JSONSchema.JSONSchema.&Object.TDefs.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TDefs.GetAdditionalProperties: TDynamicProperty<JSONSchema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TDefs.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TProperties }

destructor JSONSchema.JSONSchema.&Object.TProperties.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TProperties.GetAdditionalProperties: TDynamicProperty<JSONSchema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TProperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TPatternProperties }

destructor JSONSchema.JSONSchema.&Object.TPatternProperties.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TPatternProperties.GetAdditionalProperties: TDynamicProperty<JSONSchema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TPatternProperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TDependentSchemas }

destructor JSONSchema.JSONSchema.&Object.TDependentSchemas.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TDependentSchemas.GetAdditionalProperties: TDynamicProperty<JSONSchema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TDependentSchemas.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TType }

procedure JSONSchema.JSONSchema.&Object.TType.SetSimpleTypes(const Value: JSONSchema.JSONSchema.SimpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function JSONSchema.JSONSchema.&Object.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ JSONSchema.JSONSchema.&Object.TDependentRequired }

destructor JSONSchema.JSONSchema.&Object.TDependentRequired.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TDependentRequired.GetAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.stringArray>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<TArray<System.String>>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TDependentRequired.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TDefinitions }

destructor JSONSchema.JSONSchema.&Object.TDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TDefinitions.GetAdditionalProperties: TDynamicProperty<JSONSchema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TDependencies }

destructor JSONSchema.JSONSchema.&Object.TDependencies.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function JSONSchema.JSONSchema.&Object.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

function JSONSchema.JSONSchema.&Object.TDependencies.GetAdditionalProperties: TDynamicProperty<JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function JSONSchema.JSONSchema.&Object.TDependencies.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties }

function JSONSchema.JSONSchema.&Object.TDependencies.TadditionalProperties.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

end.
