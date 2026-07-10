
report 52193690 Shortlisted
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Shortlisted.rdlc';
    ApplicationArea = All;
    Caption = 'Shortlisted';
    dataset
    {
        dataitem("HR Shortlisted Applicants"; "HR Shortlisted Applicants")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeRequisitionNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."Employee Requisition No") { }
            column(JobApplicationNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."Job Application No") { }
            column(StageScore_HRShortlistedApplicants; "HR Shortlisted Applicants"."Stage Score") { }
            column(IDNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."ID No") { }
            column(FullName_HRShortlistedApplicants; "HR Shortlisted Applicants"."Full Name") { }
            column(Picture; CompInfo.Picture) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompInfo: Record "Company Information";
}
