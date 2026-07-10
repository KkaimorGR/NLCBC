
report 52193669 SRBS33
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SRBS33.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'SRBS';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('D162'));
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code")
            {
            }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount)
            {
            }
            column(Name; CI.Name)
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(EmpAmount; EmpAmount)
            {
            }
            column(Total; Total)
            {
            }
            column(pension; pension)
            {
            }
            column(bPAY; bPAY)
            {
            }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period")
            {
            }
            column(EmployeeAmount; EmployeeAmount)
            {
            }
            column(EmployerAmount; EmployerAmount)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                RequestFilterFields = "No.";
                // DataItemTableView = where(Status = filter(active), "Contract Type" = filter(<> Contract));
                column(ReportForNavId_19; 19) { }
                column(No_HREmployees; "HR Employees"."No.")
                {
                }
                column(FullName_HREmployees; "HR Employees"."Full Name")
                {
                }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center")
                {
                }
                column(DepartmentName_HREmployees; "HR Employees"."Department Name")
                {
                }
                column(IDNumber_HREmployees; "HR Employees"."ID Number")
                {
                }
                column(PINNo_HREmployees; "HR Employees"."PIN No.")
                {
                }
                column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth")
                {
                }
                column(ContractType_HREmployees; "HR Employees"."Contract Type")
                {
                }
                column(Status_HREmployees; "HR Employees".Status)
                {
                }

                dataitem("PR Salary Card"; "PR Salary Card")
                {
                    DataItemLink = "Employee Code" = field("No.");
                    column(ReportForNavId_4; 4) { }
                    column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }
                }
            }

            trigger OnAfterGetRecord()
            var
                HrEmployees: Record "HR Employees";
            begin
                /* EmpAmount:=("PR Period Transactions".Amount)*2;
                 Total :=("PR Period Transactions".Amount)*3;  */
                // PerTrans.Reset();
                // PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                // PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                // PerTrans.SetRange(PerTrans."Transaction Code", 'BPAY');
                // if PerTrans.Find('-') then begin
                //     bPAY := 0;
                //     repeat
                //         bPAY := bPAY + PerTrans.Amount;
                //     until PerTrans.Next() = 0;
                // end;

                // PerTrans.Reset();
                // PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                // // PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                // PerTrans.SetRange(PerTrans."Transaction Code", 'D162');
                // if PerTrans.Find('-') then begin
                //     repeat
                //         pension := pension + PerTrans.Amount;
                //     until PerTrans.Next() = 0;
                // end;
                // PerTrans.Reset();
                // PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                // // PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                // PerTrans.SetRange(PerTrans."Transaction Code", 'D162');
                // if PerTrans.Find('-') then begin
                //     repeat
                //         Pension2 := Pension2 + PerTrans.Amount * 2;
                //     until PerTrans.Next() = 0;
                // end;
                // PerTrans.Reset();
                // PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                // PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                // PerTrans.SetRange(PerTrans."Transaction Code", 'BPAY');
                // if PerTrans.Find('-') then begin
                //     // BankLines.Reset();
                //     // BankLines.SetRange("Employee Code", PerTrans."Employee Code");
                //     // BankLines.SetRange("From payroll Period", PerTrans."Payroll Period");
                //     // if BankLines.Find('-') then begin
                //     HrEmployees.Reset();
                //     HrEmployees.SetRange("No.", PerTrans."Employee Code");
                //     if HrEmployees.Find('-') then begin
                //         if HrEmployees.Status = HrEmployees.Status::Inactive then
                //             CurrReport.Skip();
                //         if HrEmployees."Contract Type" = HrEmployees."Contract Type"::Contract then
                //             CurrReport.Skip();
                //     end else
                //         CurrReport.Skip();

                //     // end;
                //     // CurrReport.Skip();
                // end;
                PerTrans.Reset;
                PerTrans.SetRange(PerTrans."Payroll Period", "Payroll Period");
                //PerTrans.setrange(PerTrans.)
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'BPAY');
                if PerTrans.Find('-') then
                    bPAY := 0;
                EmployeeAmount := 0;
                EmployerAmount := 0;
                TotalAmount := 0;
                begin

                    repeat
                        bPAY := ROUND(PerTrans.Amount, 1, '<');
                        //ERROR(FORMAT(bPAY))
                        EmployeeAmount := ROUND(bPAY * 0.1, 1, '<');
                        EmployerAmount := EmployeeAmount * 2;
                        //EmployerAmount:=ROUND(bPAY*0.2,1,'<');
                        TotalAmount := EmployeeAmount + EmployerAmount;
                    until PerTrans.Next = 0;
                end;




                PerTrans.Reset;
                PerTrans.SetRange(PerTrans."Payroll Period", "Payroll Period");
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'D162');
                if PerTrans.Find('-') then begin
                    repeat
                        pension := PerTrans.Amount;
                    // ERROR(FORMAT(bPAY))
                    until PerTrans.Next = 0;

                end;

            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        PREmployerDeductions: Record "PR Employer Deductions";
        BankLines: Record "HR Employee Bank Accounts";
        HREmployees: Record "HR Employees";
        PREmployeeTransactions: Record "PR Employee Transactions";
        CI: Record "Company Information";
        EmpAmount: Decimal;
        Pension2: Decimal;
        Total: Decimal;
        PerTrans: Record "PR Period Transactions";
        bPAY: Decimal;

        EmployeeAmount: Decimal;
        EmployerAmount: Decimal;
        TotalAmount: Decimal;
        pension: Decimal;
}
