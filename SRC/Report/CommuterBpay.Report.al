
report 52193448 "Commuter/Bpay"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CommuterBpay.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Commuter/Bpay';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Period Filter", "Employee Code";
            column(ReportForNavId_1; 1) { }
            column(Bpay; Bpay) { }
            column(House; House) { }
            column(Comm; Comm) { }
            column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
            column(EmpName_PRSalaryCard; "PR Salary Card"."Emp Name") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(PeriodFilter; PeriodFilter) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                RequestFilterFields = Status;
                column(ReportForNavId_10; 10) { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            }

            trigger OnAfterGetRecord()
            begin
                PeriodTrans1.Reset();
                PeriodTrans1.SetRange(PeriodTrans1."Employee Code", "PR Salary Card"."Employee Code");
                PeriodTrans1.SetRange(PeriodTrans1."Payroll Period", SelectedPeriod);
                PeriodTrans1.SetRange(PeriodTrans1."Transaction Code", 'BPAY');

                Bpay := 0;
                if PeriodTrans1.Find('-') then
                    Bpay := PeriodTrans1.Amount;

                //Standard Amount*
                PeriodTrans1.Reset();
                PeriodTrans1.SetRange(PeriodTrans1."Employee Code", "PR Salary Card"."Employee Code");
                PeriodTrans1.SetRange(PeriodTrans1."Payroll Period", SelectedPeriod);
                PeriodTrans1.SetRange(PeriodTrans1."Transaction Code", 'E02');
                PeriodTrans1.SetCurrentKey(PeriodTrans1."Employee Code", PeriodTrans1."Period Month", PeriodTrans1."Period Year");

                Comm := 0;
                if PeriodTrans1.Find('-') then
                    Comm := PeriodTrans1.Amount;

                PeriodTrans1.Reset();
                PeriodTrans1.SetRange(PeriodTrans1."Employee Code", "PR Salary Card"."Employee Code");
                PeriodTrans1.SetRange(PeriodTrans1."Payroll Period", SelectedPeriod);
                PeriodTrans1.SetRange(PeriodTrans1."Transaction Code", 'E01');

                House := 0;
                if PeriodTrans1.Find('-') then
                    House := PeriodTrans1.Amount;
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
        CI.Reset();
        CI.CalcFields(Picture);



        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";
    end;

    var
        PeriodFilter: Text[50];
        PeriodName: Text[50];
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        Bpay: Decimal;
        PeriodTrans1: Record "PR Period Transactions";
        Comm: Decimal;
        House: Decimal;
        CI: Record "Company Information";
        HrEmp: Record "HR Employees";
}
