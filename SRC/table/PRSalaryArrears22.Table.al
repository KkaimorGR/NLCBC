
table 52193615 "PR Salary Arrears22"
{
    Caption = 'PR Salary Arrears22';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(true));
            Caption = 'Payroll Period';
        }
        field(2; "Employeee Code"; Code[20])
        {
            Editable = false;
            Caption = 'Employeee Code';
        }
        field(3; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(4; "Transaction Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                "Transaction Name" := '';

                PRTransCode.Reset();
                if PRTransCode.Get("Transaction Code") then
                    "Transaction Name" := PRTransCode."Transaction Name";
            end;
        }
        field(5; "Transaction Name"; Text[100])
        {
            Editable = false;
            Caption = 'Transaction Name';
        }
        field(6; "Stop For Next Period"; Boolean)
        {
            Caption = 'Stop For Next Period';
        }
        field(7; "Date of Joining the Company"; Date)
        {
            Caption = 'Date of Joining the Company';
        }
    }

    keys
    {
        key(Key1; "Transaction Code", "Employeee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        PRTransCode: Record "PR Transaction Codes";
}
