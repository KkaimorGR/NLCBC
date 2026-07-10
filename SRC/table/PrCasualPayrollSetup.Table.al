
table 52193625 "PrCasual Payroll Setup"
{
    Caption = 'PrCasual Payroll Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Setup Code"; Code[20])
        {
            Caption = 'Setup Code';
        }
        field(5; "Normal Hours Rate per Hour"; Decimal)
        {
            Caption = 'Normal Hours Rate per Hour';
        }
        field(10; "Overtime Hours Rate per Hour"; Decimal)
        {
            Caption = 'Overtime Hours Rate per Hour';
        }
        field(15; "PHs and Weekends Rate per Hour"; Decimal)
        {
            Caption = 'PHs and Weekends Rate per Hour';
        }
    }

    keys
    {
        key(Key1; "Setup Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
