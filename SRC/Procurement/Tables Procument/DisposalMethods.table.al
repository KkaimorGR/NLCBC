
Table 50000 "Disposal Methods"
{
    DrillDownPageID = 52193560;
    LookupPageID = 52193560;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Disposal Methods"; Code[50])
        {
        }
        field(3; "Disposal Description"; Text[50])
        {
        }

    }
    keys
    {
        key(Key1; "Entry No.", "Disposal Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

