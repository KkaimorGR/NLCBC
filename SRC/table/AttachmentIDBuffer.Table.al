
table 52193644 "Attachment ID Buffer"
{
    Caption = 'Attachment ID Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry Num"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry Num';
        }
        field(2; "ID Number"; Text[50])
        {
            Caption = 'ID Number';
        }
    }

    keys
    {
        key(Key1; "Entry Num")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
