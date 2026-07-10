
Table 52193475 "Disposal Periods"
{
    DrillDownPageID = "Disposal Periods";
    LookupPageID = "Disposal Periods";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "From Date"; Date)
        {
        }
        field(3; "To Date"; Date)
        {
        }
        field(4; Description; Text[30])
        {
        }
        field(5; "Financial Year"; Code[10])
        {
        }
        field(6; "Previous Year"; Boolean)
        {
        }
        field(7; "Current Year"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

