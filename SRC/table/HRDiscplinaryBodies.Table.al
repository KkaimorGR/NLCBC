
table 52194149 "HR Discplinary Bodies"
{
    DrillDownPageId = "Disciplinary Bodies";
    LookupPageId = "Disciplinary Bodies";
    Caption = 'HR Discplinary Bodies';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
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

