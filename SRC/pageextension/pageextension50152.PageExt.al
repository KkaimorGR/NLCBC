
pageextension 52193479 pageextension50152 extends "Job Task Lines"
{
    actions
    {
        addafter("<Action49>")
        {
            action("FA WIP Cost Transfer")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP Cost Transfer';
                Image = TransferToLines;
                ToolTip = 'Executes the FA WIP Cost Transfer action.';
                trigger OnAction()
                begin
                    Rec.TestField(Rec."Job No.");


                    Job.Get(Rec."Job No.");
                    if Job.Blocked = Job.Blocked::All then
                        Job.TestBlocked();

                    Clear(Job);
                    Job.SetRange("No.", Rec."Job No.");
                    Job.FindFirst();

                    Report.RunModal(Report::"Convert WIP to FA", true, false, Job);
                end;
            }
        }
    }

    var
        Job: Record Job;
}
