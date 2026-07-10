
report 52193640 "Recruitment Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Recruitment Details.rdlc';
    ApplicationArea = All;
    Caption = 'Recruitment Details';
    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            RequestFilterFields = "Job ID";
            column(ReportForNavId_19; 19) { }
            column(JobID_HRJobs; "HR Jobs"."Job ID") { }
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
        SNO := SNO + 1;
    end;

    var
        SNO: Integer;
        HRJobApplications: Record "HR Job Applications";
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        HREmploymentHistory: Record "HR Employment History";
        CompanyInformation: Record "Company Information";
}
