
report 52193558 "OSSafety Checklist"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/OSSafety Checklist.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'OSSafety Checklist';
    dataset
    {
        dataitem("HR OSSafety Checklist"; "HR OSSafety Checklist")
        {
            RequestFilterFields = "Incident No";
            column(ReportForNavId_1; 1) { }
            column(SafetyNo_OSSafetyChecklist; "HR OSSafety Checklist".SafetyNo) { }
            column(SafetyRules_OSSafetyChecklist; "HR OSSafety Checklist"."Safety Rules") { }
            column(Observed_OSSafetyChecklist; "HR OSSafety Checklist".Observed) { }
            column(NotObserved_OSSafetyChecklist; "HR OSSafety Checklist"."Not Observed") { }
            column(AccidentNo_OSSafetyChecklist; "HR OSSafety Checklist"."Accident No") { }
            column(IncidentNo_OSSafetyChecklist; "HR OSSafety Checklist"."Incident No") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
