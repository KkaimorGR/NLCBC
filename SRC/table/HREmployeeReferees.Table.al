
table 52193838 "HR Employee Referees"
{
    Caption = 'HR Employee Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee code"; Code[20])
        {
            Caption = 'Employee code';
        }
        field(2; "Full Name"; Text[30])
        {
            Caption = 'Full Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; Telephone; Code[10])
        {
            Caption = 'Telephone';
        }
        field(5; "Business/Occupation"; Text[50])
        {
            Caption = 'Business/Occupation';
        }
    }

    keys
    {
        key(Key1; "Employee code", "Full Name")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
