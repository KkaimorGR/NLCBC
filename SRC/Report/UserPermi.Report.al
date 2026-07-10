
report 52193670 "User Permi"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/User Permi.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'User Permi';
    dataset
    {
        dataitem("Access Control"; "Access Control")
        {
            column(ReportForNavId_1; 1) { }
            column(UserName_AccessControl; "Access Control"."User Name") { }
            column(RoleName_AccessControl; "Access Control"."Role Name") { }
            column(RoleID_AccessControl; "Access Control"."Role ID") { }
            column(No; No) { }

            trigger OnAfterGetRecord()
            begin
                HREmployees.Reset();
                HREmployees.SetRange(HREmployees."User ID", "Access Control"."User Name");
                if HREmployees.Find('-') then
                    No := HREmployees."No."
                else
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HREmployees: Record "HR Employees";
        No: Code[100];
}
