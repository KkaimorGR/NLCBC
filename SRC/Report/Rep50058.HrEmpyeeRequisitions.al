report 52193487 "Hr Empyee Requisitions"
{
    ApplicationArea = All;
    Caption = 'Hr Empyee Requisitions';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(HREmployeeRequisitions; "HR Employee Requisitions")
        {
            DataItemTableView = where(Status = const(Approved), Closed = const(false), Advertised = const(true));
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                RequistionRec: Record "HR Employee Requisitions";
                FivePM: Time;
            begin
                RequistionRec.Reset();
                RequistionRec.SetRange("Requisition No.", HREmployeeRequisitions."Requisition No.");
                RequistionRec.SetRange(Closed, false);
                RequistionRec.SetRange(Advertised, true);
                RequistionRec.SetRange(Status, Status::Approved);
                RequistionRec.SetRange("Closing Date", Today);
                if RequistionRec.Find('-') then begin
                    //170000
                    Evaluate(FivePM, '170000');
                    if Time >= FivePM then begin
                        RequistionRec.Closed := true;
                        RequistionRec.Advertised := false;
                        RequistionRec.Modify();
                    end;
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
}
