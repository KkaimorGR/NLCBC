
table 52193922 Partnership
{
    Caption = 'Partnership';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Questionaire No"; Integer)
        {
            Editable = false;
            Caption = 'Questionaire No';
        }
        field(2; "Tender No."; Code[20])
        {
            Caption = 'Tender No.';
        }
        field(3; "PIN No."; Code[20])
        {
            Editable = false;
            Caption = 'PIN No.';
        }
        field(4; "Receipt No."; Code[20])
        {
            Editable = false;
            Caption = 'Receipt No.';
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
        field(6; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(7; Nationality; Code[20])
        {
            Caption = 'Nationality';
        }
        field(8; "Shares Held"; Decimal)
        {
            Caption = 'Shares Held';
        }
    }

    keys
    {
        key(Key1; "Questionaire No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
