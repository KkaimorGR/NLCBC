
table 52193520 "HR Applicant Referees"
{
    Caption = 'HR Applicant Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "HR Job Applications"."Job Application No.";
            Caption = 'Job Application No';
        }
        field(2; Names; Text[250])
        {
            Caption = 'Names';
        }
        field(3; Designation; Text[250])
        {
            Caption = 'Designation';
        }
        field(4; Institution; Text[250])
        {
            Caption = 'Institution';
        }
        field(5; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(6; "Telephone No"; Text[250])
        {
            Caption = 'Telephone No';
        }
        field(7; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
        }
        field(8; "Employee No"; Integer)
        {
            Caption = 'Employee No';
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Telephone No", "E-Mail")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
