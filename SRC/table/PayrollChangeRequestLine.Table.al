
table 52193662 "Payroll Change Request Line"
{
    Caption = 'Payroll Change Request Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Change No"; Code[20])
        {
            Editable = false;
            Caption = 'Payroll Change No';
        }
        field(2; "Change Type"; Option)
        {
            OptionMembers = Income,Deduction,None;
            Caption = 'Change Type';
        }
        field(3; "Old Value"; Decimal)
        {
            Caption = 'Old Value';
        }
        field(4; "New Value"; Decimal)
        {
            Caption = 'New Value';
        }
        field(5; "Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = field("Change Type"));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                "Old Value" := 0;
                "New Value" := 0;
                //"Transaction Name":='';
                //"Effective Payroll Period":=0D;


                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Transaction Code");
                PRTransCode.SetFilter(PRTransCode."Transaction Code", '<>%1', 'BPAY');
                if PRTransCode.Find('-') then begin
                    CalcFields("Effective Payroll Period");
                    PREmpTrans.Reset();
                    PREmpTrans.SetRange(PREmpTrans."Employee Code", "Employee Code");
                    PREmpTrans.SetRange(PREmpTrans."Payroll Period", "Effective Payroll Period");
                    PREmpTrans.SetRange(PREmpTrans."Transaction Code", "Transaction Code");
                    if PREmpTrans.Find('-') then begin
                        //"Transaction Name":=PRTransCode."Transaction Name";
                        "Old Value" := PREmpTrans.Amount;
                        if "Old Value" <> 0 then
                            Error('Old Value cannot have an amount');

                        "Old Balance" := PREmpTrans.Balance;
                        if "Old Balance" <> 0 then
                            Error('Old Balance cannot have an amount');

                        "Old Original Amount" := PREmpTrans."Original Amount";
                        if "Old Original Amount" <> 0 then
                            Error('Old Original Amount cannot have an amount');

                        "Old Stop for Next Period" := PREmpTrans."Stop for Next Period";
                        "Old Stopped" := PREmpTrans.Stopped;
                    end;
                end;


                /*
                PRTransCode.RESET;
                PRTransCode.SETRANGE(PRTransCode."Transaction Code",'BPAY');
                IF PRTransCode.FIND('-') THEN
                BEGIN
                //MESSAGE(PREmpTrans."Transaction Code");
                 */

                if "Transaction Code" = 'BPAY' then begin
                    PRSalary.Reset();
                    PRSalary.SetRange(PRSalary."Employee Code", "Employee Code");
                    if PRSalary.Find('-') then begin
                        "Transaction Name" := PRTransCode."Transaction Name";
                        "Old Value" := PRSalary."Basic Pay";
                    end;
                end;

            end;
        }
        field(6; "Transaction Name"; Text[50])
        {
            Caption = 'Transaction Name';
        }
        field(7; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Employee Code';
            trigger OnValidate()
            var
                UserSet: Record "User Setup";
                PRPeriod: Record "PR Period Transactions";
                HrSetup: Record "HR Setup";
                "Gross Pay": Decimal;
            begin
                UserSet.Reset();
                UserSet.SetRange("User ID", UserId);
                UserSet.SetRange("Modify payroll", true);
                if not UserSet.FindFirst() then
                    Error('You cannot modify or amend Salaries');
                if Emp.Get("Employee Code") then begin
                    Status := Emp.Status;
                    "Employee Name" := Emp."Full Name";
                    "New Status" := "New Status"::Inactive;
                end;

                rec.CalcFields("Effective Payroll Period");
                PRPeriod.Reset();
                PRPeriod.SetRange(PRPeriod."Employee Code", rec."Employee Code");
                PRPeriod.SetRange(PRPeriod."Transaction Code", 'GPAY');
                PRPeriod.SetRange(PRPeriod."Payroll Period", Rec."Effective Payroll Period");
                if PRPeriod.Find('-') then begin
                    "A Third Basic Pay" := Round(HrSetup."Basic Muiltipier" * PRPeriod.Amount, 0.01, '>');
                    "Gross Pay" := Round(PRPeriod.Amount, 0.01, '>');
                    "Emeployee Gross Pay" := "Gross Pay";
                end;
                PRPeriod.Reset();
                PRPeriod.SetRange(PRPeriod."Employee Code", "Employee Code");
                PRPeriod.SetRange(PRPeriod."Transaction Code", 'NPAY');
                PRPeriod.SetRange(PRPeriod."Payroll Period", rec."Effective Payroll Period");
                if PRPeriod.Find('-') then
                    "Net Pay" := Round(PRPeriod.Amount, 0.01, '>');
                "A Third Rule" := 1 / 3 * "Gross Pay";
            end;
        }
        field(8; "Effective Payroll Period"; Date)
        {
            CalcFormula = lookup("Payroll Changes"."Payroll Period" where("Payroll Change No" = field("Payroll Change No")));
            FieldClass = FlowField;
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'Effective Payroll Period';
            Editable = false;
        }
        field(9; Reason; Option)
        {
            Editable = true;
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Reason';
        }
        field(10; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Active,Inactive,New,Pending Approval,Rejected';
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;
            Caption = 'Status';
        }
        field(11; "Employee Name"; Text[100])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(12; "New Status"; Option)
        {
            OptionCaption = 'Active,Inactive,New,Pending Approval,Rejected';
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;
            Caption = 'New Status';
        }
        field(13; "New Balance"; Decimal)
        {
            Caption = 'New Balance';

        }
        field(14; "New Original Amount"; Decimal)
        {
            Caption = 'New Original Amount';
        }
        field(15; "New Stop for Next Period"; Boolean)
        {
            Caption = 'New Stop for Next Period';
        }
        field(16; "New Stopped"; Boolean)
        {
            Caption = 'New Stopped';
        }
        field(17; "Old Balance"; Decimal)
        {
            Caption = 'Old Balance';

        }
        field(18; "Old Original Amount"; Decimal)
        {
            Caption = 'Old Original Amount';
        }
        field(19; "Old Stop for Next Period"; Boolean)
        {
            Caption = 'Old Stop for Next Period';
        }
        field(20; "Old Stopped"; Boolean)
        {
            Caption = 'Old Stopped';
        }
        field(21; "New Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = field("Change Type"));
            Caption = 'New Transaction Code';
            trigger OnValidate()
            begin
                "Old Value" := 0;
                "New Value" := 0;
                //"Transaction Name":='';
                //"Effective Payroll Period":=0D;


                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Transaction Code");
                if PRTransCode.Find('-') then begin
                    CalcFields("Effective Payroll Period");
                    PREmpTrans.Reset();
                    PREmpTrans.SetRange(PREmpTrans."Employee Code", "Employee Code");
                    PREmpTrans.SetRange(PREmpTrans."Payroll Period", "Effective Payroll Period");
                    PREmpTrans.SetRange(PREmpTrans."Transaction Code", "Transaction Code");
                    if PREmpTrans.Find('-') then begin
                        //"Transaction Name":=PRTransCode."Transaction Name";
                        "Old Value" := PREmpTrans.Amount;
                        "Old Balance" := PREmpTrans.Balance;
                        "Old Original Amount" := PREmpTrans."Original Amount";
                        "Old Stop for Next Period" := PREmpTrans."Stop for Next Period";
                        "Old Stopped" := PREmpTrans.Stopped;
                    end;
                end;


                /*
                PRTransCode.RESET;
                PRTransCode.SETRANGE(PRTransCode."Transaction Code",'BPAY');
                IF PRTransCode.FIND('-') THEN
                BEGIN
                //MESSAGE(PREmpTrans."Transaction Code");
                 */

                if "Transaction Code" = 'BPAY' then begin
                    PRSalary.Reset();
                    PRSalary.SetRange(PRSalary."Employee Code", "Employee Code");
                    if PRSalary.Find('-') then begin
                        "Transaction Name" := PRTransCode."Transaction Name";
                        "Old Value" := PRSalary."Basic Pay";
                    end;
                end;

            end;
        }
        field(22; "New Transaction Name"; Text[50])
        {
            Caption = 'New Transaction Name';
        }
        field(23; "Existing Transaction Code"; Code[20])
        {
            TableRelation = "PR Employee Transactions"."Transaction Code" where("Employee Code" = field("Employee Code"),
                                                                                 "Payroll Period" = field("Effective Payroll Period"));
            Caption = 'Existing Transaction Code';
            trigger OnValidate()
            begin

                CalcFields("Effective Payroll Period");
                PayrollReqLines.Reset();
                PayrollReqLines.SetRange(PayrollReqLines."Employee Code", "Employee Code");
                PayrollReqLines.SetRange(PayrollReqLines."Effective Payroll Period", "Effective Payroll Period");
                PayrollReqLines.SetRange(PayrollReqLines."Existing Transaction Code", "Existing Transaction Code");
                if PayrollReqLines.Find('-') then
                    Error('This Transaction Code has already been captured for this Employee for this Payroll Month');



                "Old Value" := 0;
                "New Value" := 0;

                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Existing Transaction Code");
                if PRTransCode.Find('-') then begin
                    CalcFields("Effective Payroll Period");
                    PREmpTrans.Reset();
                    PREmpTrans.SetRange(PREmpTrans."Employee Code", "Employee Code");
                    PREmpTrans.SetRange(PREmpTrans."Payroll Period", "Effective Payroll Period");
                    PREmpTrans.SetRange(PREmpTrans."Transaction Code", "Existing Transaction Code");
                    if PREmpTrans.Find('-') then begin
                        "Existing Transaction Name" := PRTransCode."Transaction Name";
                        "Old Value" := PREmpTrans.Amount;
                        "Old Balance" := PREmpTrans.Balance;
                        "Old Original Amount" := PREmpTrans."Original Amount";
                        "Old Stop for Next Period" := PREmpTrans."Stop for Next Period";
                        "Old Stopped" := PREmpTrans.Stopped;
                    end;
                end;

                if "Existing Transaction Code" = 'BPAY' then begin
                    PRSalary.Reset();
                    PRSalary.SetRange(PRSalary."Employee Code", "Employee Code");
                    if PRSalary.Find('-') then begin
                        "Existing Transaction Name" := PRTransCode."Transaction Name";
                        "Old Value" := PRSalary."Basic Pay";
                    end;
                end;
            end;
        }
        field(24; "Existing Transaction Name"; Text[50])
        {
            Caption = 'Existing Transaction Name';
        }
        field(25; "Date Of Leaving"; Date)
        {
            Caption = 'Date Of Leaving';
        }
        field(26; "Line NUmber"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(27; "A Third Basic Pay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Emeployee Gross Pay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Net Pay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "A Third Rule"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Payroll Change No", "Employee Code", "Transaction Code", "Line NUmber")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        PayrollChanges.Reset();
        // if PayrollChanges.Get("Payroll Change No") then
        if PayrollChanges.Status <> PayrollChanges.Status::New then
            Error('You are not allowed to delete at this level');
    end;

    var
        PRTransCode: Record "PR Transaction Codes";
        PREmpTrans: Record "PR Employee Transactions";
        PRSalary: Record "PR Salary Card";
        Emp: Record "HR Employees";
        PayrollChanges: Record "Payroll Changes";
        PayrollReqLines: Record "Payroll Change Request Line";
}
