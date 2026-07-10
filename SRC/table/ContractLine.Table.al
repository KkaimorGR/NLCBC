
table 52193898 "Contract Line"
{
    Caption = 'Contract Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[10])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Detail; Text[30])
        {
            Caption = 'Detail';
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(5; "Amount Awarded"; Decimal)
        {
            Caption = 'Amount Awarded';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", Detail, Description)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
