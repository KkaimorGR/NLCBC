
report 52193520 "HR Jobs (Vacant)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Jobs (Vacant).rdlc';
    Caption = 'Staff Establishment';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            DataItemTableView = order(ascending) where("Vacant Positions" = filter(> 0));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(HR_Jobs_UserID; "HR Jobs"."User ID") { }
            column(CI_Picture; CI.Picture) { }
            column(CI_City; CI.City) { }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2") { }
            column(CI_Address; CI.Address) { }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(Grade; Grade)
            {

            }
            column(Snum; Snum)
            { }
            column(Position_Reporting_Name; "Position Reporting Name")
            { }
            column(HR_Jobs__Job_ID_; "HR Jobs"."Job ID") { }
            column(HR_Jobs__Job_Description_; "HR Jobs"."Job Description") { }
            column(HR_Jobs__No_of_Posts_; "HR Jobs"."No of Posts") { }
            column(HR_Jobs__Position_Reporting_to_; "HR Jobs"."Position Reporting to") { }
            column(HR_Jobs__Occupied_Positions_; "HR Jobs"."Occupied Positions") { }
            column(HR_Jobs__Vacant_Positions_; "HR Jobs"."Vacant Positions") { }
            column(HR_JobsCaption; HR_JobsCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Jobs_with_Vacant_PositionsCaption; Jobs_with_Vacant_PositionsCaptionLbl) { }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl) { }
            column(HR_Jobs__Job_ID_Caption; "HR Jobs".FieldCaption("HR Jobs"."Job ID")) { }
            column(HR_Jobs__Job_Description_Caption; "HR Jobs".FieldCaption("HR Jobs"."Job Description")) { }
            column(HR_Jobs__No_of_Posts_Caption; "HR Jobs".FieldCaption("HR Jobs"."No of Posts")) { }
            column(HR_Jobs__Position_Reporting_to_Caption; "HR Jobs".FieldCaption("HR Jobs"."Position Reporting to")) { }
            column(HR_Jobs__Occupied_Positions_Caption; "HR Jobs".FieldCaption("HR Jobs"."Occupied Positions")) { }
            column(HR_Jobs__Vacant_Positions_Caption; "HR Jobs".FieldCaption("HR Jobs"."Vacant Positions")) { }

            trigger OnAfterGetRecord()
            begin
                Vacant := 0;
                "HR Jobs".Validate("HR Jobs"."Vacant Positions");
                // Vacant := "No of Posts" - "Occupied Positions";
                // if "HR Jobs"."Job ID" <> '' then
                Snum += 1;

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
        //ERROR('');

        CI.Reset();
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Jobs_with_Vacant_PositionsCaptionLbl: Label 'Jobs with Vacant Positions';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Userid: Label 'USERID';
        HRJobs: Record "HR Jobs";
        Vacant: Integer;
        JobIDDesc: Text;
        Snum: Integer;
}
