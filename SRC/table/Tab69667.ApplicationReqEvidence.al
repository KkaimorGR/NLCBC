
Table 52194075 "Application Req.  Evidence"
{

    fields
    {
        field(1; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vacancy No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Requirement ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Remarks/Evidence/Comment"; Text[800])
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

