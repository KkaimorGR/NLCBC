
table 52194157 "Leave Log"
{
    Caption = 'Leave Log';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Doc No"; Code[50])
        {
            Caption = 'Doc No';
        }
        field(2; "Prev Status"; Text[50])
        {
            Caption = 'Prev Status';
        }
        field(3; "New Status"; Text[50])
        {
            Caption = 'New Status';
        }
    }

    keys
    {
        key(Key1; "Doc No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
