
pageextension 52193446 pageextension50119 extends "Purchase Quote Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Routing No."; Rec."Routing No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Routing No. field.';
            }
        }
        addafter("Direct Unit Cost")
        {
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition No field.';
            }
        }
    }
}
