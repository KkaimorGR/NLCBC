
table 52193604 "prFormula Results"
{
    Caption = 'prFormula Results';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Result Figure"; Decimal)
        {
            Caption = 'Result Figure';
        }
    }

    keys
    {
        key(Key1; "Result Figure")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
