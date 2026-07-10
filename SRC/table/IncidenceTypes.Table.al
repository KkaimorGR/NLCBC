
Table 52193476 "Incidence Types"
{
    Caption = 'Incidence Types';
    // DrillDownPageID = 50084;
    // LookupPageID = 50084;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;
        }
        field(2; Description; Text[250])
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

