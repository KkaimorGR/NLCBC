
table 52193651 "HR Knowledge and Skills"
{
    Caption = 'HR Knowledge and Skills';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Knowledge and Skills"; Text[250])
        {
            Caption = 'Knowledge and Skills';
        }
        field(3; "Applicant No"; Code[50])
        {
            Caption = 'Applicant No';
        }
        field(6; "Date Entered"; Date)
        {
            Caption = 'Date Entered';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
