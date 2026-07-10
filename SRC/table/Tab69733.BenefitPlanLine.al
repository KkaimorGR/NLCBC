
Table 52194140 "Benefit Plan Line"
{

    fields
    {
        field(1; "Package ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefit Plan Grade"."Plan ID";
        }
        field(3; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Job Grades"; Integer)
        {
            CalcFormula = count("Benefit Plan Grade" where("Plan ID" = field("Plan ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
    }

    keys
    {
        key(Key1; "Package ID", "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

