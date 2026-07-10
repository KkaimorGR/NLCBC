
report 52193445 "Salary Advance NLC"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Salary Advance NLC.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Salary Advance NLC';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('D57'));
            RequestFilterFields = "Employee Code", "Payroll Period";
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(Balance_PRPeriodTransactions; "PR Period Transactions".Balance) { }
            column(OriginalAmount_PRPeriodTransactions; "PR Period Transactions"."Original Amount") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(Name; CI.Name) { }
            column(picture; CI.Picture) { }
            dataitem("PR Employee Transactions"; "PR Employee Transactions")
            {
                DataItemLink = "Employee Code" = field("Employee Code"), "Transaction Code" = field("Transaction Code"), "Payroll Period" = field("Payroll Period");
                column(ReportForNavId_8; 8) { }
                column(OriginalAmount_PREmployeeTransactions; "PR Employee Transactions"."Original Amount") { }
                dataitem("HR Employees"; "HR Employees")
                {
                    DataItemLink = "No." = field("Employee Code");
                    column(FullName_HREmployees; "HR Employees"."Full Name") { }
                    column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
                    column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                }
            }
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
        CI: Record "Company Information";
}
