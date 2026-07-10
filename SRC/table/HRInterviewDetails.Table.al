
table 52193910 "HR Interview Details"
{
    Caption = 'HR Interview Details';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Item Description"; Text[200])
        {
            Caption = 'Item Description';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
