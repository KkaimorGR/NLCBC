
Table 52194027 "Recruitment Plan Principle"
{

    fields
    {
        field(1; "Recruitment Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";
        }
        field(2; "Guiding Principle ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Recruitment Plan ID", "Guiding Principle ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

