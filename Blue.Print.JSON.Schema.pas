unit Blue.Print.JSON.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

uses Blue.Print.Types;

type
  TPropertyType = (Undefined, &array, boolean, null, integer, number, &object, &string);

  TSchema = class
  private
    Fanchor: String;
    Fid: String;
    Fschema: String;
    Fcomment: String;
    Fdefs: TMap<String, TSchema>;
    FdynamicAnchor: String;
    FdynamicRef: String;
    Fvocabulary: TMap<String, Boolean>;
    FallOf: TArray<TSchema>;
    FanyOf: TArray<TSchema>;
    FoneOf: TArray<TSchema>;
    Fif: TSchema;
    Fthen: TSchema;
    Felse: TSchema;
    Fnot: TSchema;
    Fproperties: TMap<String, TSchema>;
    FdependentSchemas: TMap<String, TSchema>;
    FpropertyNames: TSchema;
    Fcontains: TSchema;
    Fitems: TSchema;
    FprefixItems: TArray<TSchema>;
    Ftype: TPropertyType;
    Fenum: TArray<String>;
    FmaxLength: Integer;
    FminProperties: Integer;
    FexclusiveMinimum: Boolean;
    Fpattern: String;
    FminLength: Integer;
    FmaxItems: Integer;
    Fmaximum: Double;
    Frequired: TArray<String>;
    FuniqueItems: Boolean;
    FminItems: Integer;
    Fminimum: Double;
    FmaxProperties: Integer;
    FexclusiveMaximum: Boolean;
    FmultipleOf: Double;
    FdependentRequired: TMap<String, TArray<String>>;
    FmaxContains: Integer;
    FminContains: Integer;
    Ftitle: String;
    Fdescription: String;
    Fdeprecated: Boolean;
    FreadOnly: Boolean;
    FwriteOnly: Boolean;
    Fformat: String;
    FcontentEncoding: String;
    FcontentMediaType: String;
    FcontentSchema: TSchema;
    FunevaluatedItems: TSchema;
    Fref: String;
    FpatternProperties: TMap<String, TSchema>;
    function GetDefs: TMap<String, TSchema>;
    function GeProperties: TMap<String, TSchema>;
    function GetpatternProperties: TMap<String, TSchema>;
  public
    destructor Destroy; override;
  published
    [FieldName('$id')]
    property id: String read Fid write Fid;
    [FieldName('$schema')]
    property schema: String read Fschema write Fschema;
    [FieldName('$ref')]
    property ref: String read Fref write Fref;
    [FieldName('$comment')]
    property comment: String read Fcomment write Fcomment;
    [FieldName('$defs')]
    property defs: TMap<String, TSchema> read GetDefs write Fdefs;
    [FieldName('$anchor')]
    property anchor: String read Fanchor write Fanchor;
    [FieldName('$dynamicAnchor')]
    property dynamicAnchor: String read FdynamicAnchor write FdynamicAnchor;
    [FieldName('$dynamicRef')]
    property dynamicRef: String read FdynamicRef write FdynamicRef;
    property vocabulary: TMap<String, Boolean> read Fvocabulary write Fvocabulary;
    property allOf: TArray<TSchema> read FallOf write FallOf;
    property anyOf: TArray<TSchema> read FanyOf write FanyOf;
    property oneOf: TArray<TSchema> read FoneOf write FoneOf;
    property &if: TSchema read Fif write Fif;
    property &then: TSchema read Fthen write Fthen;
    property &else: TSchema read Felse write Felse;
    property &not: TSchema read Fnot write Fnot;
    property properties: TMap<String, TSchema> read GeProperties write Fproperties;
//    property additionalProperties: TSchema read FadditionalProperties write FadditionalProperties;
    property patternProperties: TMap<String, TSchema> read GetpatternProperties write FpatternProperties;
    property dependentSchemas: TMap<String, TSchema> read FdependentSchemas write FdependentSchemas;
    property propertyNames: TSchema read FpropertyNames write FpropertyNames;
    property contains: TSchema read Fcontains write Fcontains;
    property items: TSchema read Fitems write Fitems;
    property prefixItems: TArray<TSchema> read FprefixItems write FprefixItems;
    property &type: TPropertyType read Ftype write Ftype;
    property enum: TArray<String> read Fenum write Fenum;
//    property const: Any read Fconst write Fconst;
    property multipleOf: Double read FmultipleOf write FmultipleOf;
    property maximum: Double read Fmaximum write Fmaximum;
    property exclusiveMaximum: Boolean read FexclusiveMaximum write FexclusiveMaximum;
    property minimum: Double read Fminimum write Fminimum;
    property exclusiveMinimum: Boolean read FexclusiveMinimum write FexclusiveMinimum;
    property maxLength: Integer read FmaxLength write FmaxLength;
    property minLength: Integer read FminLength write FminLength;
    property pattern: String read Fpattern write Fpattern;
    property maxItems: Integer read FmaxItems write FmaxItems;
    property minItems: Integer read FminItems write FminItems;
    property uniqueItems: Boolean read FuniqueItems write FuniqueItems;
    property maxProperties: Integer read FmaxProperties write FmaxProperties;
    property minProperties: Integer read FminProperties write FminProperties;
    property required: TArray<String> read Frequired write Frequired;
    property dependentRequired: TMap<String, TArray<String>> read FdependentRequired write FdependentRequired;
    property maxContains: Integer read FmaxContains write FmaxContains;
    property minContains: Integer read FminContains write FminContains;
    property title: String read Ftitle write Ftitle;
    property description: String read Fdescription write Fdescription;
//    property default: Any read Fdefault write Fdefault;
    property deprecated: Boolean read Fdeprecated write Fdeprecated;
//    property examples: TArray<Any> read Fexamples write Fexamples;
    property readOnly: Boolean read FreadOnly write FreadOnly;
    property writeOnly: Boolean read FwriteOnly write FwriteOnly;
    property format: String read Fformat write Fformat;
    property contentEncoding: String read FcontentEncoding write FcontentEncoding;
    property contentMediaType: String read FcontentMediaType write FcontentMediaType;
    property contentSchema: TSchema read FcontentSchema write FcontentSchema;
    property unevaluatedItems: TSchema read FunevaluatedItems write FunevaluatedItems;
//    property unevaluatedProperties: TSchema read FunevaluatedProperties write FunevaluatedProperties;

    // Compability properties
    [FieldName('id')]
    property OldId: String read Fid write Fid;
    [FieldName('definitions')]
    property OldDefinitions: TMap<String, TSchema> read Fdefs write Fdefs;
  end;

implementation

uses System.Generics.Collections;

{ TSchema }

destructor TSchema.Destroy;
begin
  Fdefs.Free;

  Fproperties.Free;

  FpatternProperties.Free;

  inherited;
end;

function TSchema.GeProperties: TMap<String, TSchema>;
begin
  if not Assigned(Fproperties) then
    Fproperties := TMap<String, TSchema>.Create([doOwnsValues]);

  Result := Fproperties;
end;

function TSchema.GetDefs: TMap<String, TSchema>;
begin
  if not Assigned(Fdefs) then
    Fdefs := TMap<String, TSchema>.Create([doOwnsValues]);

  Result := Fdefs;
end;

function TSchema.GetpatternProperties: TMap<String, TSchema>;
begin
  if not Assigned(FpatternProperties) then
    FpatternProperties := TMap<String, TSchema>.Create([doOwnsValues]);

  Result := FpatternProperties;
end;

end.

