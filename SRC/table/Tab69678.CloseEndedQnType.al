
Table 52194085 "Close Ended Qn Type"
{

    fields
    {
        field(1; "Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Default Responses"; Integer)
        {
            CalcFormula = count("Closed Qn Response Option" where("Type ID" = field("Type ID")));
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Type ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

