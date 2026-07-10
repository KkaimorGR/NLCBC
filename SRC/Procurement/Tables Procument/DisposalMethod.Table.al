
Table 52193478 "Disposal Method"
{
    DrillDownPageID = 50035;
    LookupPageID = 50035;
    ObsoleteState = Removed;

    fields
    {
        field(1; "Disposal Methods"; Code[20])
        {
        }
        field(2; "Disposal Description"; Text[30])
        {
        }
        field(3; Date; Date)
        {
        }
    }
    keys
    {
        key(Key1; "Disposal Methods", "Disposal Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

