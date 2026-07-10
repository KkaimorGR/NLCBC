
table 52193755 "HR Qualification Cartegories"
{
    Caption = 'HR Qualification Cartegories';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; Cartegory; Code[50])
        {
            Caption = 'Cartegory';
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
