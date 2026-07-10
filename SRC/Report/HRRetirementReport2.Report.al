
report 52193437 "HR Retirement Report2"
{
    DefaultLayout = RDLC;

    RDLCLayout = './Layouts/HR Retirement Report2.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Retirement Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = filter(Active));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(Gender; Gender)
            {

            }
            column(Grade; Grade)
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(Responsibility_Center; "Responsibility Center")
            {

            }

            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(Snum; Snum)
            { }
            column(dateofB; dateofB)
            { }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(DAge; "HR Employees".DAge) { }
            column(Status_HREmployees; "HR Employees".Status) { }
            column(PeriodToRetire; PeriodToRetire) { }

            trigger OnAfterGetRecord()
            begin
                Clear("HR Employees".DAge);
                dateofB := '';
                if "HR Employees"."No." <> '' then
                    Snum += 1;
                if "HR Employees"."Date Of Birth" <> 0D then
                    dateofB := globalFun.FormatDate("HR Employees"."Date Of Birth");
                if ("HR Employees"."Date Of Birth" <> 0D) then begin
                    "HR Employees".DAge := Dates.DetermineAge("HR Employees"."Date Of Birth", Today);

                    if "HR Employees"."No." <> '' then begin
                        CYR := Date2DMY(Today, 3);
                        DOB := Date2DMY("HR Employees"."Date Of Birth", 3);
                        myAge := CYR - DOB;
                        PeriodToRetire := 60 - myAge;
                    end;

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
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        DAge: Text;
        Dates: Codeunit "HR Dates";
        Snum: Integer;
        PeriodToRetire: Integer;
        globalFun: Codeunit "Global Functions";
        dateofB: Text;
        CYR: Integer;
        DOB: Integer;
        myAge: Integer;
}
