
table 52194012 "Case Types"
{
    DrillDownPageId = "Case Types";
    LookupPageId = "Case Types";
    Caption = 'Case Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case Nature"; Code[50])
        {
            TableRelation = "Nature of Cases".Code;
            Caption = 'Case Nature';
        }
        field(2; "Case Type"; Code[50])
        {
            Caption = 'Case Type';
        }
    }

    keys
    {
        key(Key1; "Case Nature", "Case Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

