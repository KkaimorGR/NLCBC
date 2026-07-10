
table 52193606 prTimeSheets
{
    Caption = 'prTimeSheets';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Schedule Code"; Text[30])
        {
            Caption = 'Schedule Code';
        }
        field(2; "Primary File Path"; Text[150])
        {
            Caption = 'Primary File Path';
        }
        field(3; "Secondary File Path"; Text[150])
        {
            Caption = 'Secondary File Path';
        }
        field(4; "Delete After Import"; Boolean)
        {
            Caption = 'Delete After Import';
        }
    }

    keys
    {
        key(Key1; "Schedule Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
