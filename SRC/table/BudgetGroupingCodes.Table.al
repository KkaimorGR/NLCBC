
table 52193817 "Budget Grouping Codes"
{
    Caption = 'Budget Grouping Codes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Budget Amount"; Decimal)
        {
            Caption = 'Budget Amount';
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
