
Table 52193441 "Asset Actions"
{
    Caption = 'Asset Actions';
    // DrillDownPageID = 50098;
    // LookupPageID = 50098;

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

