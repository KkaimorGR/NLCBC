
table 52193972 "Case Year Setups"
{
    DrillDownPageId = "Case Year Setups";
    LookupPageId = "Case Year Setups";
    Caption = 'Case Year Setups';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
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

