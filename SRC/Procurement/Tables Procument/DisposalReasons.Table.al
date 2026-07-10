
Table 52193437 "Disposal Reasons"
{
    // DrillDownPageID = 50059;
    // LookupPageID = 50059;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Description; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Code", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

