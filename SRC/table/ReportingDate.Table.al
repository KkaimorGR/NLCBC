
table 52193810 "Reporting Date"
{
    Caption = 'Reporting Date';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "code"; Code[20])
        {
            Caption = 'code';
        }
        field(2; "Financial Reporting Date"; Date)
        {
            Caption = 'Financial Reporting Date';
        }
        field(3; "Technical Reporting Date"; Date)
        {
            Caption = 'Technical Reporting Date';
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
