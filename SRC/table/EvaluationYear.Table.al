
table 52193841 "Evaluation Year"
{
    DrillDownPageId = "Evaluation Year List";
    LookupPageId = "Evaluation Year List";
    Caption = 'Evaluation Year';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Year; Integer)
        {
            Caption = 'Year';
        }
        field(3; Description; Code[20])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; Year, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
