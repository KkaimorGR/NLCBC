
report 52193722 "Staff Age Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Age Report.rdlc';
    ApplicationArea = All;
    Caption = 'Staff Age Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_1; 1) { }
            column(CountN; CountN)
            { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(DAge_HREmployees; "HR Employees".DAge) { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Title_HREmployees; "HR Employees".Title) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(Position_HREmployees; "HR Employees".Position) { }
            column(E_Mail; "E-Mail")
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(Job_Title; "Job Title")
            {
            }
            column(Date_of_Current_Employment; "Date of Current Employment")
            {

            }
            column(Gender; Gender)
            { }
            column(Compicture; companyIn.Picture)
            {

            }
            column(Grade; Grade)
            {

            }
            column(PWD; Disabled)
            {

            }
            column(HighestEduLevel; "Highest Leverl Description")
            {

            }
            column(Ethnicity; Ethnicity)
            {
            }
            column(Phone_Number; "Cell Phone Number")
            {

            }
            column(EmpAge; EmpAge)
            { }
            column(CompanyName; CompanyName)
            {

            }
            column(CompanyPhone; CompanyPhone)
            {

            }
            column(CompanyAdress; CompanyAdress)
            { }
            column(DOB; DOB)
            { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                HREmploRec: Record "HR Employees";
                GlobalFun: Codeunit "Global Functions";
            begin
                EmpAge := '';
                if "HR Employees"."No." <> '' then
                    CountN := CountN + 1;
                DOB := '';
                HREmploRec.Reset();
                HREmploRec.SetRange("No.", "HR Employees"."No.");
                if HREmploRec.FindFirst() then
                    if HREmploRec."Date Of Birth" <> 0D then
                        DOB := GlobalFun.FormatDate(HREmploRec."Date Of Birth");
                if ("HR Employees"."Date Of Birth" <> 0D) then
                    EmpAge := Dates.DetermineAge("HR Employees"."Date Of Birth", Today);



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
    var
        myInt: Integer;
    begin
        companyIn.get();
        companyIn.CalcFields(companyIn.Picture);
        CompanyName := companyIn.Name;
        CompanyPhone := companyIn."Phone No.";
        CompanyAdress := companyIn.Address;

    end;

    var
        no: Integer;
        EmpAge: Text;
        DOB: Text;
        companyIn: Record "Company Information";
        CompanyAdress: Text;
        CompanyName: text;
        CompanyPhone: Text;
        Dates: Codeunit "HR Dates";
        CountN: Integer;
}
