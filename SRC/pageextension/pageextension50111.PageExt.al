
pageextension 52193438 pageextension50111 extends "Item Ledger Entries"
{
    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""Order No."(Control 54)".

        addafter("Applied Entry to Adjust")
        {
            field("Vendor No"; Rec."Vendor No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vendor No field.';
            }
        }
        addafter("Order No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vendor Name field.';
            }
        }
        addafter("Order Line No.")
        {
            field("Invoice No"; Rec."Invoice No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Invoice No field.';
            }
            field("Employee No"; Rec."Employee No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee No field.';
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Name field.';
            }
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the User ID field.';
            }
        }
    }
}
