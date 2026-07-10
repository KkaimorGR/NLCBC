
table 52193521 "HR Applicant Hobbies"
{
    Caption = 'HR Applicant Hobbies';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "HR Job Applications"."Job Application No.";
            Caption = 'Job Application No';
        }
        field(2; Hobby; Text[200])
        {
            Caption = 'Hobby';
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(4; "Applicant No"; Text[30])
        {
            Caption = 'Applicant No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
