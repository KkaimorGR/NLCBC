
table 52193569 "HR Professional Body Lines"
{
    Caption = 'HR Professional Body Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Employee qualifications code"; Code[20])
        {
            Caption = 'Employee qualifications code';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
