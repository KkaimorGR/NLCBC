
report 52193689 "Job applicants-Reason"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Job applicants-Reason.rdlc';
    ApplicationArea = All;
    Caption = 'Job applicants-Reason';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Job Application No.", "Job Applied For";
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(JobAppliedFor_HRJobApplications; "HR Job Applications"."Job Applied For") { }
            column(EmployeeRequisitionNo_HRJobApplications; "HR Job Applications"."Employee Requisition No") { }
            column(ReApplied_HRJobApplications; "HR Job Applications".ReApplied) { }
            column(Picture; CompInfo.Picture) { }
            column(JobID; JobReq."Job ID") { }
            column(QType; JobReq."Qualification Type") { }
            column(QDescription; JobReq."Qualification Code") { }
            column(AType; AppQua."Qualification Type") { }
            column(ACode; AppQua."Qualification Code") { }
            column(ADescription; AppQua."Qualification Description") { }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                column(ReportForNavId_20; 20) { }
                column(ApplicationNo_HRApplicantQualifications; "HR Applicant Qualifications"."Application No") { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(QualificationType_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type") { }
            }
            dataitem("HR Job Requirements"; "HR Job Requirements")
            {
                DataItemLink = "Job ID" = field("Job Applied For");
                column(ReportForNavId_24; 24) { }
                column(JobID_HRJobRequirements; "HR Job Requirements"."Job ID") { }
                column(QualificationType_HRJobRequirements; "HR Job Requirements"."Qualification Type") { }
                column(QualificationCode_HRJobRequirements; "HR Job Requirements"."Qualification Code") { }
                column(QualificationDescription_HRJobRequirements; "HR Job Requirements"."Qualification Description") { }
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
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
        ShortApp: Record "HR Shortlisted Applicants";
        AppQua: Record "HR Applicant Qualifications";
        JobReq: Record "HR Job Requirements";
}
