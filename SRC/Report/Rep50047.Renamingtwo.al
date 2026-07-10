report 52193476 "Renaming two"
{
    ApplicationArea = All;
    Caption = 'Renaming two';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
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
                Dimensi: Record "Dimension Value";
            begin
                if HREmployees."County Name" = '' then begin
                    HrEmployeeRec.Reset();
                    HrEmployeeRec.SetRange("No.", HREmployees."No.");
                    if HrEmployeeRec.FindFirst() then begin
                        Dimensi.Reset();
                        Dimensi.SetRange(Code, HREmployees."Global Dimension 1 Code");
                        if Dimensi.FindFirst() then begin
                            HrEmployeeRec."County Name" := Dimensi.Name;
                            HrEmployeeRec.Modify();
                        end;

                    end;

                end;

            end;
        }
    }
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('Done');
    end;
}

