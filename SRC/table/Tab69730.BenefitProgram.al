
Table 52194137 "Benefit Program"
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
        field(3; "Benefit Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Other Incentives,Social Security,Health Care,Retirement Plans,Insurance Plans,Mortgage,Other Staff Loans,Staff Housing,Staff Leave,Learning and Skill Development,Recreational';
            OptionMembers = "Other Incentives","Social Security","Health Care","Retirement Plans","Insurance Plans",Mortgage,"Other Staff Loans","Staff Housing","Staff Leave","Learning and Skill Development",Recreational;
        }
        field(4; "No. of Benefit Packages"; Integer)
        {
            CalcFormula = count("Benefit Package" where("Benefit Program ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "No. of Benefit Plans"; Integer)
        {
            CalcFormula = count("Benefit Package");
            FieldClass = FlowField;
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

