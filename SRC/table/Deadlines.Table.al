
table 52193935 Deadlines
{
    Caption = 'Deadlines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Inv. Code"; Code[10])
        {
            Caption = 'Inv. Code';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Line No", "Inv. Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
