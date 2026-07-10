
table 52193528 "HR Non Working Days & Dates"
{
    Caption = 'HR Non Working Days & Dates';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Date; Date)
        {
            Caption = 'Date';
        }
        field(2; Reason; Text[100])
        {
            Caption = 'Reason';
        }
        field(3; Recurring; Boolean)
        {
            Caption = 'Recurring';
        }
    }

    keys
    {
        key(Key1; Date)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
