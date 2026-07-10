report 52193477 "Salary Advance Report"
{
    ApplicationArea = All;
    Caption = 'Salary Advance Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SalaryAdvanceReport.rdlc';

    dataset
    {
        dataitem(StaffAdvanceHeaders; "Staff Advance Headers")
        {
            RequestFilterFields = "Employee No";
            column(PayMode; "Pay Mode")
            {
            }
            column(No_; "No.")
            {

            }
            column(Address; Address)
            {

            }
            column(Employee_No; "Employee No")
            {

            }
            column(ComName; ComName)
            {

            }
            column(Picture; CompanIn.Picture)
            {

            }
            column(Staffname1; Staffname1)
            {

            }
            column(Staffname2; Staffname2)
            {

            }
            column(Designation1; Designation1)
            { }
            column(Designation2; Designation2)
            {

            }
            column(StaffNo1; StaffNo1)
            {

            }
            column(StaffNo2; StaffNo2)
            {

            }
            dataitem("Staff Advance Line"; "Staff Advance Line")
            {
                DataItemLink = No = field("No.");
                column(Amount; Amount)
                {

                }
                column(Net_Pay; "Net Pay")
                {

                }
                column(Monthly_Repayment_Amount; "Monthly Repayment Amount")
                {
                }
                column(Employee_Name; "Employee Name")
                {
                }
                column(No_of_Months_to_Repay; "No.of Months to Repay")
                {

                }
                column(Payroll_Deduct_Month; payrolldate)
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                    datesform: Codeunit "Global Functions";
                begin
                    payrolldate := '';
                    if "Payroll Deduct Month" <> 0D then
                        payrolldate := datesform.FormatDate("Payroll Deduct Month");

                end;

            }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee No");
                column(Full_Name; "Full Name")
                {

                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {

                }

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Approvalentry.Reset();
                Approvalentry.SetRange("Document No.", StaffAdvanceHeaders."No.");
                Approvalentry.SetRange("Sequence No.", 1);
                if Approvalentry.FindFirst() then begin
                    Hremplo.Reset();
                    Hremplo.SetRange("User ID", Approvalentry."Approver ID");
                    if Hremplo.FindFirst() then begin
                        StaffNo1 := Hremplo."No.";
                        Staffname1 := Hremplo."Full Name";
                        Designation1 := Hremplo."Job Title";

                    end;

                end;
                Approvalentry.Reset();
                Approvalentry.SetRange("Document No.", StaffAdvanceHeaders."No.");
                Approvalentry.SetRange("Sequence No.", 2);
                if Approvalentry.FindFirst() then begin
                    Hremplo.Reset();
                    Hremplo.SetRange("User ID", Approvalentry."Approver ID");
                    if Hremplo.FindFirst() then begin
                        StaffNo2 := Hremplo."No.";
                        Staffname2 := Hremplo."Full Name";
                        Designation2 := Hremplo."Job Title";
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
        CompanIn.get;
        CompanIn.CalcFields(CompanIn.Picture);
        Address := CompanIn.Address;
        ComName := CompanIn.Name;

    end;

    var
        CompanIn: Record "Company Information";
        Address: Text;
        ComName: Text;
        Hremplo: Record "HR Employees";
        Approvalentry: Record "Approval Entry";
        StaffNo1: Code[30];
        Staffname1: Text[100];
        payrolldate: Text;
        Designation1: Text;
        StaffNo2: Code[30];
        Staffname2: Text[100];
        Designation2: Text;
}
