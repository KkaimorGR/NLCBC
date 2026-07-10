
table 52193652 "Applicant Personal Attributes"
{
    Caption = 'Applicant Personal Attributes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Personal Attributes"; Text[250])
        {
            Caption = 'Personal Attributes';
        }
        field(3; "Applicant No"; Text[100])
        {
            Caption = 'Applicant No';
        }
        field(4; "Date Entered"; Date)
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
