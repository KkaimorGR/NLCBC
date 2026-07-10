
pageextension 52193467 pageextension50140 extends "Purchase Lines"
{
    layout
    {
        addafter("Amt. Rcd. Not Invoiced (LCY)")
        {
            field("Routing No."; Rec."Routing No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Routing No. field.';
            }
        }
    }
}
