
Table 52194058 "Ethnic Group"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Active Employees"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Job Applicants"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Country/Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(6; Blocked; Boolean)
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

