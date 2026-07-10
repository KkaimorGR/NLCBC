
Table 52193997 "Ethnic Background"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Ethnic group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Ethnic group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

