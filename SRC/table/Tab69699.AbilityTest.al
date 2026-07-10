
Table 52194106 "Ability Test"
{

    fields
    {
        field(1; "Test ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Maximum Duration(Min)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Questions"; Integer)
        {
            CalcFormula = count("Ability Test Question" where("Test ID" = field("Test ID")));
            FieldClass = FlowField;
        }
        field(5; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Test ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

