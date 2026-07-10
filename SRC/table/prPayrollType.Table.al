
table 52193600 "prPayroll Type"
{
    DrillDownPageId = "FA Budget Entries";
    LookupPageId = "FA Budget Entries";
    Caption = 'prPayroll Type';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Code"; Code[10])
        {
            Caption = 'Payroll Code';
        }
        field(2; "Payroll Name"; Text[50])
        {
            Caption = 'Payroll Name';
        }
        field(3; Comment; Text[200])
        {
            Caption = 'Comment';
        }
        field(4; "Period Length"; DateFormula)
        {
            Caption = 'Period Length';
        }
        field(5; EntryNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'EntryNo';
        }
    }

    keys
    {
        key(Key1; "Payroll Code")
        {
            Clustered = true;
        }
        key(Key2; EntryNo) { }
    }

    fieldgroups { }
}
