
table 52193832 "Jobs Comments"
{
    Caption = 'Jobs Comments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "jobs no"; Code[50])
        {
            Caption = 'jobs no';
        }
        field(2; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(3; "Date Comments"; Date)
        {
            Caption = 'Date Comments';
        }
    }

    keys
    {
        key(Key1; "jobs no")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
