report 52193481 "Update Transactions for Leave"
{
    ApplicationArea = All;
    Caption = 'Update Transactions for Leave';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(HREmployees; "HR Employees")
        {
            DataItemTableView = where(Status = const(active));
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                // if not Confirm('Do you want to update Leave Transactions on employees?') then
                //     exit;

            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                payperiod.Reset();
                payperiod.SetRange(Closed, false);
                if payperiod.FindFirst() then begin
                    PRSalary.Reset();
                    PRSalary.SetRange(PRSalary."Employee Code", HREmployees."No.");
                    PRSalary.SetRange(PRSalary."Transaction Code", 'E14');
                    PRSalary.SetRange(PRSalary."Payroll Period", payperiod."Date Opened");
                    if not PRSalary.Find('-') then begin
                        PRSalary.Init();
                        PRSalary."Employee Code" := HREmployees."No.";
                        PRSalary."Payroll Period" := payperiod."Date Opened";
                        PRSalary."Transaction Code" := 'E14';
                        PRSalary."Transaction Name" := 'Leave Allowance';
                        PRSalary."Period Month" := payperiod."Period Month";
                        PRSalary."Period Year" := payperiod."Period Year";
                        SalaryScale.Reset();
                        SalaryScale.SetRange(Grade, HREmployees.Grade);
                        if SalaryScale.FindFirst() then
                            PRSalary.Amount := SalaryScale."Leave Allowance Amount";
                        // if HREmployees.Grade = 'NLC1' then
                        //     PRSalary.Amount := 50000;
                        // if (HREmployees.Grade = 'NLC2') OR (HREmployees.Grade = 'NLC3') then
                        //     PRSalary.Amount := 30000;
                        // if (HREmployees.Grade = 'NLC4') OR (HREmployees.Grade = 'NLC5') or (HREmployees.Grade = 'NLC6') then
                        //     PRSalary.Amount := 20000;
                        // if (HREmployees.Grade = 'NLC7') OR (HREmployees.Grade = 'NLC9') or (HREmployees.Grade = 'NLC10') then
                        //     PRSalary.Amount := 15000;
                        // if (HREmployees.Grade = 'NLC11') OR (HREmployees.Grade = 'NLC12') or (HREmployees.Grade = 'NLC13') then
                        //     PRSalary.Amount := 10000;
                        // if (HREmployees.Grade = '') and (HREmployees."Job Title" = 'Deployed Security') then
                        //     PRSalary.Amount := 11000;
                        PRSalary."Stop for Next Period" := true;
                        if PRSalary.Amount <> 0 then
                            PRSalary.Insert();
                    end else begin
                        PRSalary."Employee Code" := HREmployees."No.";
                        PRSalary."Payroll Period" := payperiod."Date Opened";
                        PRSalary."Transaction Code" := 'E14';
                        PRSalary."Transaction Name" := 'Leave Allowance';
                        PRSalary."Period Month" := payperiod."Period Month";
                        PRSalary."Period Year" := payperiod."Period Year";
                        SalaryScale.Reset();
                        SalaryScale.SetRange(Grade, HREmployees.Grade);
                        if SalaryScale.FindFirst() then
                            PRSalary.Amount := SalaryScale."Leave Allowance Amount";
                        // if HREmployees.Grade = 'NLC1' then
                        //     PRSalary.Amount := 50000;
                        // if (HREmployees.Grade = 'NLC2') OR (HREmployees.Grade = 'NLC3') then
                        //     PRSalary.Amount := 30000;
                        // if (HREmployees.Grade = 'NLC4') OR (HREmployees.Grade = 'NLC5') or (HREmployees.Grade = 'NLC6') then
                        //     PRSalary.Amount := 20000;
                        // if (HREmployees.Grade = 'NLC7') OR (HREmployees.Grade = 'NLC9') or (HREmployees.Grade = 'NLC10') then
                        //     PRSalary.Amount := 15000;
                        // if (HREmployees.Grade = 'NLC11') OR (HREmployees.Grade = 'NLC12') or (HREmployees.Grade = 'NLC13') then
                        //     PRSalary.Amount := 10000;
                        // if (HREmployees.Grade = '') and (HREmployees."Job Title" = 'Deployed Security') then
                        //     PRSalary.Amount := 11000;
                        PRSalary."Stop for Next Period" := true;
                        PRSalary.Modify();
                    end;
                end;

            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        // if not Confirm('Do you want to update Leave Transactions on employees?') then
        //     exit;

    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('Done');

    end;

    var
        PRSalary: Record "PR Employee Transactions";
        payperiod: Record "PR Payroll Periods";
        salaryCard: Record "PR Salary Card";
        SalaryScale: Record "PR Employees Salary Scale1";
}
