
table 52193560 "HR Employee Course of Study"
{
    Caption = 'HR Employee Course of Study';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Description = 'Code';
            Caption = 'Code';
        }
        field(2; Description; Text[75])
        {
            Description = 'Description';
            Caption = 'Description';
        }
        field(3; "Years of Study"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Years of Study';
            Caption = 'Years of Study';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
