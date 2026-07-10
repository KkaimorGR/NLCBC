
table 52193984 "Financial Year Code"
{
    DrillDownPageId = "Financial Year Code";
    LookupPageId = "Financial Year Code";
    Caption = 'Financial Year Code';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(3; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
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

