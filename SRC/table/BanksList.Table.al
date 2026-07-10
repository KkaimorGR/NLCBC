
table 52193867 "Banks List"
{
    Caption = 'Banks List';
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
        field(6; "Name Of Bank"; Text[100])
        {
            Caption = 'Name Of Bank';
        }
        field(7; "Amount Deposited Bank"; Decimal)
        {
            Caption = 'Amount Deposited Bank';
        }
        field(8; "Account Name In Bank"; Text[100])
        {
            Caption = 'Account Name In Bank';
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
