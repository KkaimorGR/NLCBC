
report 52193702 "Employee Grades"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Grades.rdlc';
    ApplicationArea = All;
    Caption = 'Employee Grades';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(Total; Total) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Total: Integer;
}
