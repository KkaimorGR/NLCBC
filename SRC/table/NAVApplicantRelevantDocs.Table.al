
table 52193719 "NAV Applicant Relevant Docs"
{
    Caption = 'NAV Applicant Relevant Docs';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Applicant No"; Integer)
        {
            Caption = 'Applicant No';
        }
        field(2; "Job Application No"; Code[100])
        {
            Caption = 'Job Application No';
        }
        field(3; "Helb Certificate"; Boolean)
        {
            Caption = 'Helb Certificate';
        }
        field(4; "Good Conduct Certificate"; Boolean)
        {
            Caption = 'Good Conduct Certificate';
        }
        field(5; "CRB Certificate"; Boolean)
        {
            Caption = 'CRB Certificate';
        }
        field(6; "EACC Certificate"; Boolean)
        {
            Caption = 'EACC Certificate';
        }
        field(7; "KRA Pin Certificate"; Boolean)
        {
            Caption = 'KRA Pin Certificate';
        }
        field(8; "Date Modified"; Date)
        {
            Caption = 'Date Modified';
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Applicant No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
