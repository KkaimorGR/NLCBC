report 52193475 "Renaming Jobs on Employees"
{
    ApplicationArea = All;
    Caption = 'Renaming Jobs on Employees';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(HREmployees; "HR Employees")
        {
            DataItemTableView = where(Status = filter(active));
            RequestFilterFields = Grade, "No.";
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                HrEmployeeRec: Record "HR Employees";
                objJobs: Record "HR Jobs";
            begin
                HrEmployeeRec.Reset();
                HrEmployeeRec.SetRange("No.", HREmployees."No.");
                HrEmployeeRec.SetRange(Grade, 'NLC9');
                if HrEmployeeRec.FindFirst() then begin
                    // HrEmployeeRec.CalcFields("Basic Pay");
                    if (HrEmployeeRec.Grade = 'NLC9') and (HrEmployeeRec."Job Title" = 'Driver') then begin
                        HrEmployeeRec.Grade := 'NLC11';
                        HrEmployeeRec."Job ID" := 'JOB-0341';
                        objJobs.Reset();
                        objJobs.SetRange(objJobs."Job ID", HrEmployeeRec."Job ID");
                        if objJobs.Find('-') then
                            HrEmployeeRec."Job Title" := objJobs."Job Description"
                    end;
                    // if (HrEmployeeRec.Grade = 'NLC8') And (HrEmployeeRec."Basic Pay" < 45000) and (HrEmployeeRec."Job Title" = 'Clerical Officer') then begin
                    //     HrEmployeeRec.Grade := 'NLC12';
                    //     HrEmployeeRec."Job ID" := 'JOB-0455';
                    //     objJobs.Reset();
                    //     objJobs.SetRange(objJobs."Job ID", HrEmployeeRec."Job ID");
                    //     if objJobs.Find('-') then
                    //         // "Job Title" := objJobs."Job Description";
                    //     HrEmployeeRec."Job Title" := objJobs."Job Description"

                    // end;
                    HrEmployeeRec.Modify();

                end;

            end;
        }
    }
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('%1  records', HREmployees.Count);
    end;
}
