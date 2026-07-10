
table 52193593 "prUnused Relief"
{
    Caption = 'prUnused Relief';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
        }
        field(2; "Unused Relief"; Decimal)
        {
            Caption = 'Unused Relief';
        }
        field(3; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(4; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Period Month", "Period Year")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
