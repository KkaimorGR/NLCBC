
pageextension 52193443 pageextension50116 extends "Purchase Order Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Quantity Received"(Control 20)".


        //Unsupported feature: Property Modification (Name) on ""Quantity Received"(Control 20)".

        addafter("No.")
        {
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition No field.';
            }
        }
    }
}
