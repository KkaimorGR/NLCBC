
table 52193948 "Employee Equipment"
{
    Caption = 'Employee Equipment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee code"; Code[20])
        {
            Caption = 'Employee code';
        }
        field(2; "Office Equipment/Machine"; Text[100])
        {
            Caption = 'Office Equipment/Machine';
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
    }

    keys
    {
        key(Key1; "Employee code", "Office Equipment/Machine")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
