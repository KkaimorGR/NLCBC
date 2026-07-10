
Table 52194142 "Vacancy Declaration"
{

    fields
    {
        field(1; "Vacancy No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header";
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
    }

    keys
    {
        key(Key1; "Vacancy No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

