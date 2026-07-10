
Table 52194141 "Benefit Plan Grade"
{

    fields
    {
        field(1; "Package ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefit Package";
        }
        field(2; "Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
    }

    keys
    {
        key(Key1; "Package ID", "Plan ID", "Job Grade ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

