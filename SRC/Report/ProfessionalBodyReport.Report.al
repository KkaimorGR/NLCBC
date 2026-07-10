
report 52193554 "Professional Body Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Professional Body Report.rdlc';
    ApplicationArea = All;
    Caption = 'Professional Body Report';
    dataset
    {
        dataitem("HR Professional body Header"; "HR Professional body Header")
        {
            column(ReportForNavId_1; 1) { }
            column(No_ProfessionalbodyHeader; "HR Professional body Header"."No.") { }
            column(EmployeeNo_ProfessionalbodyHeader; "HR Professional body Header".UserID) { }
            column(EmployeeName_ProfessionalbodyHeader; "HR Professional body Header"."Employee Name") { }
            column(ShortcutDimensioncode1_ProfessionalbodyHeader; "HR Professional body Header"."Shortcut Dimension code1") { }
            column(ShortcutDimensioncode2_ProfessionalbodyHeader; "HR Professional body Header"."Shortcut Dimension code2") { }
            column(Designation_ProfessionalbodyHeader; "HR Professional body Header".Designation) { }
            column(ProfessionalBodyApplying_ProfessionalbodyHeader; "HR Professional body Header"."Professional Body Applying") { }
            column(Bodyrelevant_ProfessionalbodyHeader; "HR Professional body Header"."Body relevant") { }
            column(Status_ProfessionalbodyHeader; "HR Professional body Header".Status) { }
            column(No_Lines; ProfessionalBodyLines.No) { }
            column(Qualification_Lines; ProfessionalBodyLines."Employee qualifications code") { }
            column(Description_Lines; ProfessionalBodyLines.Description) { }
            column(Name; CompanyInformation.Name) { }
            column(Address; CompanyInformation.Address) { }
            column(Address2; CompanyInformation."Address 2") { }
            column(Picture; CompanyInformation.Picture) { }
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
        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    var
        ProfessionalBodyLines: Record "HR Professional Body Lines";
        CompanyInformation: Record "Company Information";
}
