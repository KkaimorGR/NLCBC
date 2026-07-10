
table 52193871 "Business Referees"
{
    Caption = 'Business Referees';
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
        field(6; "Name Of Company"; Text[100])
        {
            Caption = 'Name Of Company';
        }
        field(7; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(8; "Telephone No"; Text[50])
        {
            Caption = 'Telephone No';
        }
        field(9; "Contact Person"; Text[100])
        {
            Caption = 'Contact Person';
        }
        field(10; "Contract Value"; Decimal)
        {
            Caption = 'Contract Value';
        }
        field(11; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(12; "To Date"; Date)
        {
            Caption = 'To Date';
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
