unit Blue.Print.JSON.Draft2022.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from meta/core, meta/applicator, meta/unevaluated, meta/validation, meta/meta-data, meta/format-annotation, meta/content, https://json-schema.org/draft/2020-12/schema;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  simpleTypes = (&array, boolean, integer, null, number, &object, &string);
  // Forward class declaration
  TSchema = class;

  // Forward type alias
  anchorString = System.String;
  uriString = System.String;
  uriReferenceString = System.String;
  schemaArray = TArray<Blue.Print.JSON.Draft2022.Schema.TSchema>;
  nonNegativeInteger = System.Integer;
  nonNegativeIntegerDefault0 = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;

  [Flat]
  TSchema = class
  public type
    TObject = class
    public type
      TVocabulary = class
      private
        FBoolean: TDynamicProperty<System.Boolean>;

        function GetBoolean: TDynamicProperty<System.Boolean>;
        function GetBooleanStored: Boolean;
      public
        destructor Destroy; override;

        property IsBooleanStored: Boolean read GetBooleanStored;
      published
        property boolean: TDynamicProperty<System.Boolean> read GetBoolean write FBoolean stored GetBooleanStored;
      end;

      TDefs = class
      private
        FDefs: TDynamicProperty<TSchema>;

        function GetDefs: TDynamicProperty<TSchema>;
        function GetDefsStored: Boolean;
      public
        destructor Destroy; override;

        property IsDefsStored: Boolean read GetDefsStored;
      published
        property Defs: TDynamicProperty<TSchema> read GetDefs write FDefs stored GetDefsStored;
      end;

      TProperties = class
      private
        FProperties: TDynamicProperty<TSchema>;

        function GetProperties: TDynamicProperty<TSchema>;
        function GetPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsPropertiesStored: Boolean read GetPropertiesStored;
      published
        property Properties: TDynamicProperty<TSchema> read GetProperties write FProperties stored GetPropertiesStored;
      end;

      TPatternProperties = class
      private
        FPatternProperties: TDynamicProperty<TSchema>;

        function GetPatternProperties: TDynamicProperty<TSchema>;
        function GetPatternPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
      published
        property PatternProperties: TDynamicProperty<TSchema> read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      end;

      TDependentSchemas = class
      private
        FDependentSchemas: TDynamicProperty<TSchema>;

        function GetDependentSchemas: TDynamicProperty<TSchema>;
        function GetDependentSchemasStored: Boolean;
      public
        destructor Destroy; override;

        property IsDependentSchemasStored: Boolean read GetDependentSchemasStored;
      published
        property DependentSchemas: TDynamicProperty<TSchema> read GetDependentSchemas write FDependentSchemas stored GetDependentSchemasStored;
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

      TDependentRequired = class
      private
        FStringArray: TDynamicProperty<stringArray>;

        function GetStringArray: TDynamicProperty<stringArray>;
        function GetStringArrayStored: Boolean;
      public
        destructor Destroy; override;

        property IsStringArrayStored: Boolean read GetStringArrayStored;
      published
        property stringArray: TDynamicProperty<stringArray> read GetStringArray write FStringArray stored GetStringArrayStored;
      end;

      TDefinitions = class
      private
        FDefinitions: TDynamicProperty<TSchema>;

        function GetDefinitions: TDynamicProperty<TSchema>;
        function GetDefinitionsStored: Boolean;
      public
        destructor Destroy; override;

        property IsDefinitionsStored: Boolean read GetDefinitionsStored;
      published
        property Definitions: TDynamicProperty<TSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      end;

      TDependencies = class
      public type
        [Flat]
        TAnonymous = class
        private
          FStringArray: stringArray;

          function GetStringArrayStored: Boolean;
        public
          property IsStringArrayStored: Boolean read GetStringArrayStored;
        published
          property stringArray: stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        end;
      private
        FStringArray: stringArray;
        FAnonymous: TDynamicProperty<TSchema.TObject.TDependencies.TAnonymous>;

        function GetAnonymous: TDynamicProperty<TSchema.TObject.TDependencies.TAnonymous>;
        function GetStringArrayStored: Boolean;
        function GetAnonymousStored: Boolean;
      public
        destructor Destroy; override;

        property IsStringArrayStored: Boolean read GetStringArrayStored;
        property IsAnonymousStored: Boolean read GetAnonymousStored;
      published
        property stringArray: stringArray read FStringArray write FStringArray stored GetStringArrayStored;
        property Anonymous: TDynamicProperty<TSchema.TObject.TDependencies.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
      end;
    private
      FId: uriReferenceString;
      FSchema: uriString;
      FRef: uriReferenceString;
      FAnchor: anchorString;
      FDynamicRef: uriReferenceString;
      FDynamicAnchor: anchorString;
      FVocabulary: TSchema.TObject.TVocabulary;
      FComment: System.String;
      FDefs: TSchema.TObject.TDefs;
      FPrefixItems: schemaArray;
      FItems: TSchema;
      FContains: TSchema;
      FAdditionalProperties: TSchema;
      FProperties: TSchema.TObject.TProperties;
      FPatternProperties: TSchema.TObject.TPatternProperties;
      FDependentSchemas: TSchema.TObject.TDependentSchemas;
      FPropertyNames: TSchema;
      FIf: TSchema;
      FThen: TSchema;
      FElse: TSchema;
      FAllOf: schemaArray;
      FAnyOf: schemaArray;
      FOneOf: schemaArray;
      FNot: TSchema;
      FUnevaluatedItems: TSchema;
      FUnevaluatedProperties: TSchema;
      FType: TSchema.TObject.TType;
      FConst: any;
      FEnum: TArray<any>;
      FMultipleOf: System.Double;
      FMaximum: System.Double;
      FExclusiveMaximum: System.Double;
      FMinimum: System.Double;
      FExclusiveMinimum: System.Double;
      FMaxLength: nonNegativeInteger;
      FMinLength: nonNegativeIntegerDefault0;
      FPattern: System.String;
      FMaxItems: nonNegativeInteger;
      FMinItems: nonNegativeIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxContains: nonNegativeInteger;
      FMinContains: nonNegativeInteger;
      FMaxProperties: nonNegativeInteger;
      FMinProperties: nonNegativeIntegerDefault0;
      FRequired: stringArray;
      FDependentRequired: TSchema.TObject.TDependentRequired;
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
      FContentSchema: TSchema;
      FDefinitions: TSchema.TObject.TDefinitions;
      FDependencies: TSchema.TObject.TDependencies;
      FRecursiveAnchor: anchorString;
      FRecursiveRef: uriReferenceString;
      FCore: TSchema;
      FApplicator: TSchema;
      FUnevaluated: TSchema;
      FValidation: TSchema;
      FMetaData: TSchema;
      FFormatAnnotation: TSchema;
      FContent: TSchema;
      FConstIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;
      FDefaultIsStored: Boolean;
      FDeprecatedIsStored: Boolean;
      FReadOnlyIsStored: Boolean;
      FWriteOnlyIsStored: Boolean;

      function GetVocabulary: TSchema.TObject.TVocabulary;
      function GetDefs: TSchema.TObject.TDefs;
      function GetItems: TSchema;
      function GetContains: TSchema;
      function GetAdditionalProperties: TSchema;
      function GetProperties: TSchema.TObject.TProperties;
      function GetPatternProperties: TSchema.TObject.TPatternProperties;
      function GetDependentSchemas: TSchema.TObject.TDependentSchemas;
      function GetPropertyNames: TSchema;
      function GetIf: TSchema;
      function GetThen: TSchema;
      function GetElse: TSchema;
      function GetNot: TSchema;
      function GetUnevaluatedItems: TSchema;
      function GetUnevaluatedProperties: TSchema;
      function GetType: TSchema.TObject.TType;
      function GetDependentRequired: TSchema.TObject.TDependentRequired;
      function GetContentSchema: TSchema;
      function GetDefinitions: TSchema.TObject.TDefinitions;
      function GetDependencies: TSchema.TObject.TDependencies;
      function GetCore: TSchema;
      function GetApplicator: TSchema;
      function GetUnevaluated: TSchema;
      function GetValidation: TSchema;
      function GetMetaData: TSchema;
      function GetFormatAnnotation: TSchema;
      function GetContent: TSchema;
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
      function GetMaxContainsStored: Boolean;
      function GetMinContainsStored: Boolean;
      function GetMaxPropertiesStored: Boolean;
      function GetMinPropertiesStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetDependentRequiredStored: Boolean;
      function GetTitleStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetFormatStored: Boolean;
      function GetContentEncodingStored: Boolean;
      function GetContentMediaTypeStored: Boolean;
      function GetContentSchemaStored: Boolean;
      function GetDefinitionsStored: Boolean;
      function GetDependenciesStored: Boolean;
      function GetRecursiveAnchorStored: Boolean;
      function GetRecursiveRefStored: Boolean;
      function GetCoreStored: Boolean;
      function GetApplicatorStored: Boolean;
      function GetUnevaluatedStored: Boolean;
      function GetValidationStored: Boolean;
      function GetMetaDataStored: Boolean;
      function GetFormatAnnotationStored: Boolean;
      function GetContentStored: Boolean;
      procedure SetConst(const Value: any);
      procedure SetUniqueItems(const Value: System.Boolean);
      procedure SetDefault(const Value: any);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetReadOnly(const Value: System.Boolean);
      procedure SetWriteOnly(const Value: System.Boolean);
    public
      destructor Destroy; override;

      function AddPrefixItems: TSchema;
      function AddAllOf: TSchema;
      function AddAnyOf: TSchema;
      function AddOneOf: TSchema;

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
      property IsConstStored: Boolean read FConstIsStored;
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
      property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
      property IsMaxContainsStored: Boolean read GetMaxContainsStored;
      property IsMinContainsStored: Boolean read GetMinContainsStored;
      property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
      property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsDependentRequiredStored: Boolean read GetDependentRequiredStored;
      property IsTitleStored: Boolean read GetTitleStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsDefaultStored: Boolean read FDefaultIsStored;
      property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
      property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
      property IsWriteOnlyStored: Boolean read FWriteOnlyIsStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsContentEncodingStored: Boolean read GetContentEncodingStored;
      property IsContentMediaTypeStored: Boolean read GetContentMediaTypeStored;
      property IsContentSchemaStored: Boolean read GetContentSchemaStored;
      property IsDefinitionsStored: Boolean read GetDefinitionsStored;
      property IsDependenciesStored: Boolean read GetDependenciesStored;
      property IsRecursiveAnchorStored: Boolean read GetRecursiveAnchorStored;
      property IsRecursiveRefStored: Boolean read GetRecursiveRefStored;
      property IsCoreStored: Boolean read GetCoreStored;
      property IsApplicatorStored: Boolean read GetApplicatorStored;
      property IsUnevaluatedStored: Boolean read GetUnevaluatedStored;
      property IsValidationStored: Boolean read GetValidationStored;
      property IsMetaDataStored: Boolean read GetMetaDataStored;
      property IsFormatAnnotationStored: Boolean read GetFormatAnnotationStored;
      property IsContentStored: Boolean read GetContentStored;
    published
      [FieldName('$id')]
      property Id: uriReferenceString read FId write FId stored GetIdStored;
      [FieldName('$schema')]
      property Schema: uriString read FSchema write FSchema stored GetSchemaStored;
      [FieldName('$ref')]
      property Ref: uriReferenceString read FRef write FRef stored GetRefStored;
      [FieldName('$anchor')]
      property Anchor: anchorString read FAnchor write FAnchor stored GetAnchorStored;
      [FieldName('$dynamicRef')]
      property DynamicRef: uriReferenceString read FDynamicRef write FDynamicRef stored GetDynamicRefStored;
      [FieldName('$dynamicAnchor')]
      property DynamicAnchor: anchorString read FDynamicAnchor write FDynamicAnchor stored GetDynamicAnchorStored;
      [FieldName('$vocabulary')]
      property Vocabulary: TSchema.TObject.TVocabulary read GetVocabulary write FVocabulary stored GetVocabularyStored;
      [FieldName('$comment')]
      property Comment: System.String read FComment write FComment stored GetCommentStored;
      [FieldName('$defs')]
      property Defs: TSchema.TObject.TDefs read GetDefs write FDefs stored GetDefsStored;
      property prefixItems: schemaArray read FPrefixItems write FPrefixItems stored GetPrefixItemsStored;
      property items: TSchema read GetItems write FItems stored GetItemsStored;
      property contains: TSchema read GetContains write FContains stored GetContainsStored;
      property additionalProperties: TSchema read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property properties: TSchema.TObject.TProperties read GetProperties write FProperties stored GetPropertiesStored;
      property patternProperties: TSchema.TObject.TPatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
      property dependentSchemas: TSchema.TObject.TDependentSchemas read GetDependentSchemas write FDependentSchemas stored GetDependentSchemasStored;
      property propertyNames: TSchema read GetPropertyNames write FPropertyNames stored GetPropertyNamesStored;
      [FieldName('if')]
      property &If: TSchema read GetIf write FIf stored GetIfStored;
      [FieldName('then')]
      property &Then: TSchema read GetThen write FThen stored GetThenStored;
      [FieldName('else')]
      property &Else: TSchema read GetElse write FElse stored GetElseStored;
      property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
      property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
      property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
      [FieldName('not')]
      property &Not: TSchema read GetNot write FNot stored GetNotStored;
      property unevaluatedItems: TSchema read GetUnevaluatedItems write FUnevaluatedItems stored GetUnevaluatedItemsStored;
      property unevaluatedProperties: TSchema read GetUnevaluatedProperties write FUnevaluatedProperties stored GetUnevaluatedPropertiesStored;
      [FieldName('type')]
      property &Type: TSchema.TObject.TType read GetType write FType stored GetTypeStored;
      [FieldName('const')]
      property &Const: any read FConst write SetConst stored FConstIsStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Double read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Double read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: nonNegativeInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: nonNegativeIntegerDefault0 read FMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property maxItems: nonNegativeInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: nonNegativeIntegerDefault0 read FMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
      property maxContains: nonNegativeInteger read FMaxContains write FMaxContains stored GetMaxContainsStored;
      property minContains: nonNegativeInteger read FMinContains write FMinContains stored GetMinContainsStored;
      property maxProperties: nonNegativeInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: nonNegativeIntegerDefault0 read FMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: stringArray read FRequired write FRequired stored GetRequiredStored;
      property dependentRequired: TSchema.TObject.TDependentRequired read GetDependentRequired write FDependentRequired stored GetDependentRequiredStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: any read FDefault write SetDefault stored FDefaultIsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
      property writeOnly: System.Boolean read FWriteOnly write SetWriteOnly stored FWriteOnlyIsStored;
      property examples: TArray<any> read FExamples write FExamples stored GetExamplesStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property contentEncoding: System.String read FContentEncoding write FContentEncoding stored GetContentEncodingStored;
      property contentMediaType: System.String read FContentMediaType write FContentMediaType stored GetContentMediaTypeStored;
      property contentSchema: TSchema read GetContentSchema write FContentSchema stored GetContentSchemaStored;
      property definitions: TSchema.TObject.TDefinitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property dependencies: TSchema.TObject.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
      [FieldName('$recursiveAnchor')]
      property RecursiveAnchor: anchorString read FRecursiveAnchor write FRecursiveAnchor stored GetRecursiveAnchorStored;
      [FieldName('$recursiveRef')]
      property RecursiveRef: uriReferenceString read FRecursiveRef write FRecursiveRef stored GetRecursiveRefStored;
      property core: TSchema read GetCore write FCore stored GetCoreStored;
      property applicator: TSchema read GetApplicator write FApplicator stored GetApplicatorStored;
      property unevaluated: TSchema read GetUnevaluated write FUnevaluated stored GetUnevaluatedStored;
      property validation: TSchema read GetValidation write FValidation stored GetValidationStored;
      [FieldName('meta-data')]
      property MetaData: TSchema read GetMetaData write FMetaData stored GetMetaDataStored;
      [FieldName('format-annotation')]
      property FormatAnnotation: TSchema read GetFormatAnnotation write FFormatAnnotation stored GetFormatAnnotationStored;
      property content: TSchema read GetContent write FContent stored GetContentStored;
    end;
  private
    FObject: TSchema.TObject;
    FBoolean: System.Boolean;
    FBooleanIsStored: Boolean;

    function GetObject: TSchema.TObject;
    function GetObjectStored: Boolean;
    procedure SetBoolean(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsObjectStored: Boolean read GetObjectStored;
    property IsBooleanStored: Boolean read FBooleanIsStored;
  published
    [FieldName('Object')]
    property &Object: TSchema.TObject read GetObject write FObject stored GetObjectStored;
    property Boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function TSchema.GetObject: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.Create;

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

  FCore.Free;

  FApplicator.Free;

  FUnevaluated.Free;

  FValidation.Free;

  FMetaData.Free;

  FFormatAnnotation.Free;

  FContent.Free;

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

function TSchema.TObject.GetAnchorStored: Boolean;
begin
  Result := not FAnchor.IsEmpty;
end;

function TSchema.TObject.GetDynamicRefStored: Boolean;
begin
  Result := not FDynamicRef.IsEmpty;
end;

function TSchema.TObject.GetDynamicAnchorStored: Boolean;
begin
  Result := not FDynamicAnchor.IsEmpty;
end;

function TSchema.TObject.GetVocabulary: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TVocabulary;
begin
  if not Assigned(FVocabulary) then
    FVocabulary := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TVocabulary.Create;

  Result := FVocabulary;
end;

function TSchema.TObject.GetVocabularyStored: Boolean;
begin
  Result := Assigned(FVocabulary);
end;

function TSchema.TObject.GetCommentStored: Boolean;
begin
  Result := not FComment.IsEmpty;
end;

function TSchema.TObject.GetDefs: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDefs;
begin
  if not Assigned(FDefs) then
    FDefs := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDefs.Create;

  Result := FDefs;
end;

function TSchema.TObject.GetDefsStored: Boolean;
begin
  Result := Assigned(FDefs);
end;

function TSchema.TObject.AddPrefixItems: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  FPrefixItems := FPrefixItems + [Result];
end;

function TSchema.TObject.GetPrefixItemsStored: Boolean;
begin
  Result := Assigned(FPrefixItems);
end;

function TSchema.TObject.GetItems: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FItems;
end;

function TSchema.TObject.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.TObject.GetContains: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FContains) then
    FContains := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FContains;
end;

function TSchema.TObject.GetContainsStored: Boolean;
begin
  Result := Assigned(FContains);
end;

function TSchema.TObject.GetAdditionalProperties: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FAdditionalProperties;
end;

function TSchema.TObject.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.TObject.GetProperties: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TProperties.Create;

  Result := FProperties;
end;

function TSchema.TObject.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.TObject.GetPatternProperties: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TPatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TPatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.TObject.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.TObject.GetDependentSchemas: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependentSchemas;
begin
  if not Assigned(FDependentSchemas) then
    FDependentSchemas := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependentSchemas.Create;

  Result := FDependentSchemas;
end;

function TSchema.TObject.GetDependentSchemasStored: Boolean;
begin
  Result := Assigned(FDependentSchemas);
end;

function TSchema.TObject.GetPropertyNames: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FPropertyNames) then
    FPropertyNames := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FPropertyNames;
end;

function TSchema.TObject.GetPropertyNamesStored: Boolean;
begin
  Result := Assigned(FPropertyNames);
end;

function TSchema.TObject.GetIf: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FIf) then
    FIf := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FIf;
end;

function TSchema.TObject.GetIfStored: Boolean;
begin
  Result := Assigned(FIf);
end;

function TSchema.TObject.GetThen: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FThen) then
    FThen := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FThen;
end;

function TSchema.TObject.GetThenStored: Boolean;
begin
  Result := Assigned(FThen);
end;

function TSchema.TObject.GetElse: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FElse) then
    FElse := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FElse;
end;

function TSchema.TObject.GetElseStored: Boolean;
begin
  Result := Assigned(FElse);
end;

function TSchema.TObject.AddAllOf: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TSchema.TObject.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TSchema.TObject.AddAnyOf: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TSchema.TObject.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TSchema.TObject.AddOneOf: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  Result := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TSchema.TObject.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TSchema.TObject.GetNot: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FNot;
end;

function TSchema.TObject.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function TSchema.TObject.GetUnevaluatedItems: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FUnevaluatedItems) then
    FUnevaluatedItems := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FUnevaluatedItems;
end;

function TSchema.TObject.GetUnevaluatedItemsStored: Boolean;
begin
  Result := Assigned(FUnevaluatedItems);
end;

function TSchema.TObject.GetUnevaluatedProperties: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FUnevaluatedProperties) then
    FUnevaluatedProperties := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FUnevaluatedProperties;
end;

function TSchema.TObject.GetUnevaluatedPropertiesStored: Boolean;
begin
  Result := Assigned(FUnevaluatedProperties);
end;

function TSchema.TObject.GetType: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TType.Create;

  Result := FType;
end;

function TSchema.TObject.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
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

function TSchema.TObject.GetMinLengthStored: Boolean;
begin
  Result := FMinLength <> 0;
end;

function TSchema.TObject.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TSchema.TObject.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TSchema.TObject.GetMinItemsStored: Boolean;
begin
  Result := FMinItems <> 0;
end;

procedure TSchema.TObject.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TSchema.TObject.GetMaxContainsStored: Boolean;
begin
  Result := FMaxContains <> 0;
end;

function TSchema.TObject.GetMinContainsStored: Boolean;
begin
  Result := FMinContains <> 0;
end;

function TSchema.TObject.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TSchema.TObject.GetMinPropertiesStored: Boolean;
begin
  Result := FMinProperties <> 0;
end;

function TSchema.TObject.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TSchema.TObject.GetDependentRequired: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependentRequired;
begin
  if not Assigned(FDependentRequired) then
    FDependentRequired := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependentRequired.Create;

  Result := FDependentRequired;
end;

function TSchema.TObject.GetDependentRequiredStored: Boolean;
begin
  Result := Assigned(FDependentRequired);
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

procedure TSchema.TObject.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
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

function TSchema.TObject.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TSchema.TObject.GetContentEncodingStored: Boolean;
begin
  Result := not FContentEncoding.IsEmpty;
end;

function TSchema.TObject.GetContentMediaTypeStored: Boolean;
begin
  Result := not FContentMediaType.IsEmpty;
end;

function TSchema.TObject.GetContentSchema: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FContentSchema) then
    FContentSchema := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FContentSchema;
end;

function TSchema.TObject.GetContentSchemaStored: Boolean;
begin
  Result := Assigned(FContentSchema);
end;

function TSchema.TObject.GetDefinitions: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDefinitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDefinitions.Create;

  Result := FDefinitions;
end;

function TSchema.TObject.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchema.TObject.GetDependencies: Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependencies.Create;

  Result := FDependencies;
end;

function TSchema.TObject.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TSchema.TObject.GetRecursiveAnchorStored: Boolean;
begin
  Result := not FRecursiveAnchor.IsEmpty;
end;

function TSchema.TObject.GetRecursiveRefStored: Boolean;
begin
  Result := not FRecursiveRef.IsEmpty;
end;

function TSchema.TObject.GetCore: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FCore) then
    FCore := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FCore;
end;

function TSchema.TObject.GetCoreStored: Boolean;
begin
  Result := Assigned(FCore);
end;

function TSchema.TObject.GetApplicator: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FApplicator) then
    FApplicator := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FApplicator;
end;

function TSchema.TObject.GetApplicatorStored: Boolean;
begin
  Result := Assigned(FApplicator);
end;

function TSchema.TObject.GetUnevaluated: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FUnevaluated) then
    FUnevaluated := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FUnevaluated;
end;

function TSchema.TObject.GetUnevaluatedStored: Boolean;
begin
  Result := Assigned(FUnevaluated);
end;

function TSchema.TObject.GetValidation: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FValidation) then
    FValidation := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FValidation;
end;

function TSchema.TObject.GetValidationStored: Boolean;
begin
  Result := Assigned(FValidation);
end;

function TSchema.TObject.GetMetaData: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FMetaData) then
    FMetaData := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FMetaData;
end;

function TSchema.TObject.GetMetaDataStored: Boolean;
begin
  Result := Assigned(FMetaData);
end;

function TSchema.TObject.GetFormatAnnotation: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FFormatAnnotation) then
    FFormatAnnotation := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FFormatAnnotation;
end;

function TSchema.TObject.GetFormatAnnotationStored: Boolean;
begin
  Result := Assigned(FFormatAnnotation);
end;

function TSchema.TObject.GetContent: Blue.Print.JSON.Draft2022.Schema.TSchema;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.JSON.Draft2022.Schema.TSchema.Create;

  Result := FContent;
end;

function TSchema.TObject.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

{ TSchema.TObject.TVocabulary }

destructor TSchema.TObject.TVocabulary.Destroy;
begin
  FBoolean.Free;

  inherited;
end;

function TSchema.TObject.TVocabulary.GetBoolean: TDynamicProperty<System.Boolean>;
begin
  if not Assigned(FBoolean) then
    FBoolean := TDynamicProperty<System.Boolean>.Create;

  Result := FBoolean;
end;

function TSchema.TObject.TVocabulary.GetBooleanStored: Boolean;
begin
  Result := Assigned(FBoolean);
end;

{ TSchema.TObject.TDefs }

destructor TSchema.TObject.TDefs.Destroy;
begin
  FDefs.Free;

  inherited;
end;

function TSchema.TObject.TDefs.GetDefs: TDynamicProperty<TSchema>;
begin
  if not Assigned(FDefs) then
    FDefs := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema>.Create;

  Result := FDefs;
end;

function TSchema.TObject.TDefs.GetDefsStored: Boolean;
begin
  Result := Assigned(FDefs);
end;

{ TSchema.TObject.TProperties }

destructor TSchema.TObject.TProperties.Destroy;
begin
  FProperties.Free;

  inherited;
end;

function TSchema.TObject.TProperties.GetProperties: TDynamicProperty<TSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema>.Create;

  Result := FProperties;
end;

function TSchema.TObject.TProperties.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

{ TSchema.TObject.TPatternProperties }

destructor TSchema.TObject.TPatternProperties.Destroy;
begin
  FPatternProperties.Free;

  inherited;
end;

function TSchema.TObject.TPatternProperties.GetPatternProperties: TDynamicProperty<TSchema>;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema>.Create;

  Result := FPatternProperties;
end;

function TSchema.TObject.TPatternProperties.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

{ TSchema.TObject.TDependentSchemas }

destructor TSchema.TObject.TDependentSchemas.Destroy;
begin
  FDependentSchemas.Free;

  inherited;
end;

function TSchema.TObject.TDependentSchemas.GetDependentSchemas: TDynamicProperty<TSchema>;
begin
  if not Assigned(FDependentSchemas) then
    FDependentSchemas := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema>.Create;

  Result := FDependentSchemas;
end;

function TSchema.TObject.TDependentSchemas.GetDependentSchemasStored: Boolean;
begin
  Result := Assigned(FDependentSchemas);
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

{ TSchema.TObject.TDependentRequired }

destructor TSchema.TObject.TDependentRequired.Destroy;
begin
  FStringArray.Free;

  inherited;
end;

function TSchema.TObject.TDependentRequired.GetStringArray: TDynamicProperty<stringArray>;
begin
  if not Assigned(FStringArray) then
    FStringArray := TDynamicProperty<TArray<System.String>>.Create;

  Result := FStringArray;
end;

function TSchema.TObject.TDependentRequired.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TSchema.TObject.TDefinitions }

destructor TSchema.TObject.TDefinitions.Destroy;
begin
  FDefinitions.Free;

  inherited;
end;

function TSchema.TObject.TDefinitions.GetDefinitions: TDynamicProperty<TSchema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema>.Create;

  Result := FDefinitions;
end;

function TSchema.TObject.TDefinitions.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

{ TSchema.TObject.TDependencies }

destructor TSchema.TObject.TDependencies.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function TSchema.TObject.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

function TSchema.TObject.TDependencies.GetAnonymous: TDynamicProperty<TSchema.TObject.TDependencies.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.JSON.Draft2022.Schema.TSchema.TObject.TDependencies.TAnonymous>.Create;

  Result := FAnonymous;
end;

function TSchema.TObject.TDependencies.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ TSchema.TObject.TDependencies.TAnonymous }

function TSchema.TObject.TDependencies.TAnonymous.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

end.
