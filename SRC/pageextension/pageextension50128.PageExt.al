
pageextension 52193455 pageextension50128 extends "General Journal Batches"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field(BatchApprovalNo; Rec.BatchApprovalNo)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the BatchApprovalNo field.';
            }
            field("Batch Workflow No. Series"; Rec."Batch Workflow No. Series")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Batch Workflow No. Series field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
        }
        addafter("Allow Payment Export")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
    }
}
