
table 52193889 "Vendor Criteria"
{
    Caption = 'Vendor Criteria';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Year; Code[20])
        {
            Caption = 'Year';
        }
        field(2; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Vendor No.';
        }
    }

    keys
    {
        key(Key1; Year)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
