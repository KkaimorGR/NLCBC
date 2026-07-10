
report 52193521 "HR Jobs (Occupied)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Jobs (Occupied).rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Jobs (Occupied)';
    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            DataItemTableView = where("Occupied Positions" = filter(> 0));
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002) { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(Grade; Grade)
            {

            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(NoofPosts_HRJobs; "HR Jobs"."No of Posts")
            {
                IncludeCaption = true;
            }
            column(OccupiedPositions_HRJobs; "HR Jobs"."Occupied Positions")
            {
                IncludeCaption = true;
            }
            column(JobID_HRJobs; "HR Jobs"."Job ID")
            {
                IncludeCaption = true;
            }
            column(JobDescription_HRJobs; "HR Jobs"."Job Description")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "Job ID" = field("Job ID");
                DataItemTableView = where(Status = const(Active));
                column(ReportForNavId_1000000001; 1000000001) { }
                column(No_HREmployees; "HR Employees"."No.")
                {
                    IncludeCaption = true;
                }
                column(Sn; Sn)
                { }
                column(FirstName_HREmployees; "HR Employees"."First Name")
                {
                    IncludeCaption = true;
                }
                column(MiddleName_HREmployees; "HR Employees"."Middle Name")
                {
                    IncludeCaption = true;
                }
                column(LastName_HREmployees; "HR Employees"."Last Name")
                {
                    IncludeCaption = true;
                }
                column(JobTitle_HREmployees; "HR Employees"."Job Title")
                {
                    IncludeCaption = true;
                }
                column(UserID_HREmployees; "HR Employees"."User ID")
                {
                    IncludeCaption = true;
                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    // if "HR Employees"."Job ID" <> "HR Employees"."Job ID" then
                    Sn += 1;

                end;
            }

            trigger OnAfterGetRecord()
            begin

                Validate("Vacant Positions");
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
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Jobs_with_OccupantsCaptionLbl: Label 'Jobs with Occupants';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Sn: Integer;
}

