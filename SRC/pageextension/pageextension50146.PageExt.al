/* 
PageExtension 52193473 pageextension50146 extends "Approval Setup"
{
    layout
    {
        modify(Cancellations)
        {
            Visible = false;
        }
        modify(Rejections)
        {
            Visible = false;
        }
        modify(Delegations)
        {
            Visible = false;
        }
        addafter("Request Rejection Comment")
        {
            field("Responsibility Center Required";Rec."Responsibility Center Required")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
 */