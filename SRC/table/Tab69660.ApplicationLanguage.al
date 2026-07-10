
Table 52194069 "Application Language"
{

    fields
    {
        field(1; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(2; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Language Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Proficiency Level"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Candidate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

