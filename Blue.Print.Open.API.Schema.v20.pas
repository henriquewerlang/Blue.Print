unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema#;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  TsimpleTypes = (Array, Boolean, Integer, Null, Number, Object, String);
  // Forward class declaration
  TSchema = class;
  Properties = class;
  AdditionalItems = class;
  PositiveIntegerDefault0 = class;
  PatternProperties = class;
  Dependencies = class;
  AdditionalProperties = class;
  Definitions = class;
  Items = class;
  Type = class;

  // Forward type alias
  schemaArray = TArray<TSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = TValue;

  TSchema = class
  public type
    [SingleObject]
    PositiveIntegerDefault0 = class
    private
      FPositiveInteger: System.Integer;
    published
      property positiveInteger: System.Integer read FPositiveInteger write FPositiveInteger;
    end;
  private
    FAnyOf: schemaArray;
    FExclusiveMaximum: System.Boolean;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAllOf: schemaArray;
    FSchema: System.String;
    FProperties: Properties;
    FNot: TSchema;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FAdditionalItems: AdditionalItems;
    FId: System.String;
    FPattern: System.String;
    FDefault: any;
    FMinProperties: PositiveIntegerDefault0;
    FMinLength: PositiveIntegerDefault0;
    FTitle: System.String;
    FMultipleOf: System.Double;
    FPatternProperties: PatternProperties;
    FOneOf: schemaArray;
    FMinimum: System.Double;
    FDependencies: Dependencies;
    FAdditionalProperties: AdditionalProperties;
    FDefinitions: Definitions;
    FMaxProperties: positiveInteger;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FItems: Items;
    FMinItems: PositiveIntegerDefault0;
    FRequired: stringArray;
    FType: Type;
    function GetProperties: Properties;
    function GetNot: TSchema;
    function GetAdditionalItems: AdditionalItems;
    function GetMinProperties: PositiveIntegerDefault0;
    function GetMinLength: PositiveIntegerDefault0;
    function GetPatternProperties: PatternProperties;
    function GetDependencies: Dependencies;
    function GetAdditionalProperties: AdditionalProperties;
    function GetDefinitions: Definitions;
    function GetItems: Items;
    function GetMinItems: PositiveIntegerDefault0;
    function GetType: Type;
  public
    destructor Destroy; override;
  published
    property anyOf: schemaArray read FAnyOf write FAnyOf;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum;
    property allOf: schemaArray read FAllOf write FAllOf;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema;
    property properties: Properties read GetProperties write FProperties;
    property not: TSchema read GetNot write FNot;
    property maxLength: positiveInteger read FMaxLength write FMaxLength;
    property enum: TArray<any> read FEnum write FEnum;
    property additionalItems: AdditionalItems read GetAdditionalItems write FAdditionalItems;
    property id: System.String read FId write FId;
    property pattern: System.String read FPattern write FPattern;
    property default: any read FDefault write FDefault;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength;
    property title: System.String read FTitle write FTitle;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf;
    property patternProperties: PatternProperties read GetPatternProperties write FPatternProperties;
    property oneOf: schemaArray read FOneOf write FOneOf;
    property minimum: System.Double read FMinimum write FMinimum;
    property dependencies: Dependencies read GetDependencies write FDependencies;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties;
    property definitions: Definitions read GetDefinitions write FDefinitions;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties;
    property maxItems: positiveInteger read FMaxItems write FMaxItems;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems;
    property description: System.String read FDescription write FDescription;
    property maximum: System.Double read FMaximum write FMaximum;
    property items: Items read GetItems write FItems;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems;
    property required: stringArray read FRequired write FRequired;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  Properties = class
  end;

  [SingleObject]
  AdditionalItems = class
  private
    FSchema: TSchema;
    function GetSchema: TSchema;
  public
    destructor Destroy; override;
  published
    property Schema: TSchema read GetSchema write FSchema;
  end;

  [SingleObject]
  PositiveIntegerDefault0 = class
  private
    FPositiveInteger: positiveInteger;
  published
    property positiveInteger: positiveInteger read FPositiveInteger write FPositiveInteger;
  end;

  PatternProperties = class
  end;

  Dependencies = class
  end;

  [SingleObject]
  AdditionalProperties = class
  private
    FSchema: TSchema;
    function GetSchema: TSchema;
  public
    destructor Destroy; override;
  published
    property Schema: TSchema read GetSchema write FSchema;
  end;

  Definitions = class
  end;

  [SingleObject]
  Items = class
  private
    FSchema: TSchema;
    FSchemaArray: schemaArray;
    function GetSchema: TSchema;
  public
    destructor Destroy; override;
  published
    property Schema: TSchema read GetSchema write FSchema;
    property schemaArray: schemaArray read FSchemaArray write FSchemaArray;
  end;

  [SingleObject]
  Type = class
  private
    FSimpleTypes: TsimpleTypes;
  published
    property simpleTypes: TsimpleTypes read FSimpleTypes write FSimpleTypes;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
begin
  FProperties.Free;

  FNot.Free;

  FAdditionalItems.Free;

  FMinProperties.Free;

  FMinLength.Free;

  FPatternProperties.Free;

  FDependencies.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FItems.Free;

  FMinItems.Free;

  FType.Free;

  inherited;
end;

function TSchema.GetProperties: Properties;
begin
  if not Assigned(FProperties) then
    FProperties := Properties.Create;

  Result := FProperties;
end;

function TSchema.GetNot: TSchema;
begin
  if not Assigned(FNot) then
    FNot := TSchema.Create;

  Result := FNot;
end;

function TSchema.GetAdditionalItems: AdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := AdditionalItems.Create;

  Result := FAdditionalItems;
end;

function TSchema.GetMinProperties: PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TSchema.GetPatternProperties: PatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := PatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.GetDependencies: Dependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Dependencies.Create;

  Result := FDependencies;
end;

function TSchema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TSchema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function TSchema.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

{ AdditionalItems }

destructor AdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function AdditionalItems.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

{ AdditionalProperties }

destructor AdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function AdditionalProperties.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

{ Items }

destructor Items.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Items.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

end.
