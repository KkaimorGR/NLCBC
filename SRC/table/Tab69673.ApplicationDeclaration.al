
Table 52194080 "Application Declaration"
{

    fields
    {
        field(1; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Declaration Statement"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Candidate Accepted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

