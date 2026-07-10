
table 52193650 "Applicant Employment Profile"
{
    Caption = 'Applicant Employment Profile';
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(3; Employer; Text[250])
        {
            Caption = 'Employer';
        }
        field(4; Contacts; Text[250])
        {
            Caption = 'Contacts';
        }
        field(5; Department; Text[250])
        {
            Caption = 'Department';
        }
        field(6; Position; Text[250])
        {
            Caption = 'Position';
        }
        field(7; StaffNumber; Text[250])
        {
            Caption = 'StaffNumber';
        }
        field(8; DateEmployed; Date)
        {
            Caption = 'DateEmployed';
        }
        field(9; DateLeft; Date)
        {
            Caption = 'DateLeft';
        }
        field(50001; "Position Type"; Text[100])
        {
            Caption = 'Position Type';
        }
        field(50002; "Current Salary"; Text[100])
        {
            Caption = 'Current Salary';
        }
        field(50003; "Description of Duties"; Text[250])
        {
            Caption = 'Description of Duties';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
