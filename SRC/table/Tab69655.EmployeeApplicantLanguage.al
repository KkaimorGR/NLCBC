
Table 52194064 "Employee_Applicant Language"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Job Applicant';
            OptionMembers = Employee,"Job Applicant";
        }
        field(2; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
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
        key(Key1; "Document Type", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

