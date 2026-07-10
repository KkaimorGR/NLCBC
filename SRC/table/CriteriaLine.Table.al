
table 52193890 "Criteria Line"
{
    Caption = 'Criteria Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Vendor; Code[20])
        {
            Caption = 'Vendor';
        }
        field(2; Year; Integer)
        {
            Caption = 'Year';
        }
        field(3; "Minimum Scores"; Decimal)
        {
            Caption = 'Minimum Scores';
        }
        field(4; "Maximum Scores"; Decimal)
        {
            Caption = 'Maximum Scores';
        }
        field(5; "Assigned Weight"; Decimal)
        {
            Caption = 'Assigned Weight';
        }
        field(6; "Actual Scores"; Decimal)
        {
            Caption = 'Actual Scores';
        }
    }

    keys
    {
        key(Key1; Vendor)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
