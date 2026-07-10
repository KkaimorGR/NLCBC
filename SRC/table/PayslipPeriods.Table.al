
table 52193760 "Payslip Periods"
{
    Caption = 'Payslip Periods';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[3])
        {
            Caption = 'Code';
        }
        field(2; "Month Name"; Text[20])
        {
            Caption = 'Month Name';
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
