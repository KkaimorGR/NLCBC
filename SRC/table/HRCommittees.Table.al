
table 52193530 "HR Committees"
{
    Caption = 'HR Committees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[200])
        {
            NotBlank = true;
            Caption = 'Description';
        }
        field(3; Roles; Text[200])
        {
            Caption = 'Roles';
        }
        field(4; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
        }
        field(5; "Transaction Code"; Code[45])
        {
            TableRelation = "Bank Bal. Alert Buffer"."Line No.";
            Caption = 'Transaction Code';
        }
        field(6; "Monetary Benefit?"; Boolean)
        {
            Caption = 'Monetary Benefit?';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
