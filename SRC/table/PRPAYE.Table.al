
table 52193583 "PR PAYE"
{
    Caption = 'PR PAYE';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tier Code"; Code[10])
        {
            Caption = 'Tier Code';
        }
        field(2; "PAYE Tier"; Decimal)
        {
            MinValue = 0;
            Caption = 'PAYE Tier';
        }
        field(3; Rate; Decimal)
        {
            MinValue = 0;
            Caption = 'Rate';
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
