
table 52194153 "Tables With Data"
{
    Caption = 'Tables With Data';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Names; Text[100])
        {
            Caption = 'Names';
        }
    }

    keys
    {
        key(Key1; Names)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
