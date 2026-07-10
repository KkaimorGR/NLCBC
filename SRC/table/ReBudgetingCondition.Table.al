
table 52193818 "Re-Budgeting Condition"
{
    Caption = 'Re-Budgeting Condition';
    DataClassification = CustomerContent;
    fields
    {
        field(1; LineNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'LineNo';
        }
        field(2; "Re-Budgeting Condition"; Text[100])
        {
            Caption = 'Re-Budgeting Condition';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; "Project Code"; Code[10])
        {
            Caption = 'Project Code';
        }
    }

    keys
    {
        key(Key1; LineNo, "Project Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
