
Table 52193983 "Funding Source"
{
    //DrillDownPageID = "Funding Source List";
    // LookupPageID = "Funding Source List";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Funding Source Text Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Short Name"; Text[250])
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

