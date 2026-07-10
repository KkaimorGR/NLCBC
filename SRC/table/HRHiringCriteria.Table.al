
table 52193912 "HR Hiring Criteria"
{
    Caption = 'HR Hiring Criteria';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Application Code"; Code[50])
        {
            Caption = 'Application Code';
        }
        field(2; "Hiring Criteria"; Text[100])
        {
            Caption = 'Hiring Criteria';
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
