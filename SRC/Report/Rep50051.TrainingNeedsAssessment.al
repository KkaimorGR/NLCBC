
report 52193480 "Training Needs Assessment"
{
    ApplicationArea = All;
    Caption = 'Training Needs Assessment';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Needs Assessment.rdlc';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            column(ReportForNavId_1; 1) { }
            column(Address; Address)
            {

            }
            column(snum; snum)
            { }
            column(Picture; CompInfo.Picture)
            { }
            column(CompName; CompName)
            {

            }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            { }
            column(Ethnicity_HREmployees; "HR Employees".Ethnicity) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(County_Name; "County Name")
            {

            }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            dataitem("HR Training Needs"; "HR Training Needs")
            {
                DataItemLink = "Employee No" = field("No.");
                column(ReportForNavId_9; 9) { }
                column(Code; Code)
                {

                }
                column(Qualification_Code; "Qualification Code")
                {

                }
                column(Qualification_Description; "Qualification Description")
                {

                }
                column(Course_Title; "Course Title")
                {

                }
                column(Start_Date; "Start Date")
                {

                }
                column(Location; Location)
                {

                }
                column(Duration; Duration)
                {

                }
                column(End_Date; "End Date")
                {

                }
                column(Estimated_Cost; "Estimated Cost")
                {

                }
                column(Provider_Name; "Provider Name")
                { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if "HR Training Needs".Code <> '' then
                        snum += 1;
                end;
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
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
        CompName := CompInfo.Name;
        Address := CompInfo.Address;

    end;

    var
        CompInfo: Record "Company Information";
        IDNumber: Text;
        TermsService: Text;
        Workstation: Text;
        Department: Text;
        EmployeeEmail: Text;
        Gender: Text;
        CompName: Text;
        Address: Text;
        snum: Integer;
        JobGroup: Text;
        IM_SupervisorDesignation: Text;
        SC_SupervisorDesignation: Text;
        HREmp: Record "HR Employees";
        DimVal: Record "Dimension Value";
        ApprCommentEndYear: Text;
        SupCommentEndYear: Text;
        HROverall: Record "HR Overall Comments";
}

