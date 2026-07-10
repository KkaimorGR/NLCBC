
table 52194150 "Mode of Lodging Case"
{
    DrillDownPageId = "Mode of Lodging Case";
    LookupPageId = "Mode of Lodging Case";
    Caption = 'Mode of Lodging Case';
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

