
table 52194047 "Commitee Guideline"
{
    Caption = 'Commitee Guideline';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
            Caption = 'Committee Type ID';
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; Description; Text[300])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Committee Type ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

