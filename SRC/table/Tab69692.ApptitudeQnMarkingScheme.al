
Table 52194099 "Apptitude Qn Marking Scheme"
{

    fields
    {
        field(1; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question";
        }
        field(2; "Correct Choice ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Apptitude Question Choice";
        }
        field(3; Explanation; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

