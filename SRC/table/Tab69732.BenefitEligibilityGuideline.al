
Table 52194139 "Benefit Eligibility Guideline"
{

    fields
    {
        field(1; "Benefit ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Eligibility Criteria,General Guideline';
            OptionMembers = "Eligibility Criteria","General Guideline";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[600])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Benefit ID", "Entry Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

