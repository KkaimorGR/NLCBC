report 52193502 "Updat HomCounty"
{
    ApplicationArea = All;
    Caption = 'Update HomCounty';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(HREmployees; "HR Employees")
        {
            DataItemTableView = where(Status = const(active));
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                HrEmployeesRec: Record "HR Employees";
            begin
                HrEmployeesRec.Reset();
                HrEmployeesRec.SetRange(HrEmployeesRec."No.", HREmployees."No.");
                HrEmployeesRec.SetRange(Status, HrEmployeesRec.Status::Active);
                HrEmployeesRec.SetRange(County, '');
                if HrEmployeesRec.Find('-') then begin
                    HrEmployeesRec.County := HREmployees."Global Dimension 1 Code";
                    HrEmployeesRec.Validate(HrEmployeesRec.County);
                    HrEmployeesRec.Modify();
                end;

            end;
        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        Message('Done');

    end;
}
