
pageextension 52193437 pageextension50110 extends "Item List"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Substitutes Exist"(Control 97)".


        //Unsupported feature: Property Insertion (Visible) on ""Assembly BOM"(Control 8)".


        //Unsupported feature: Property Insertion (Visible) on ""Production BOM No."(Control 99)".


        //Unsupported feature: Property Insertion (Visible) on ""Routing No."(Control 101)".


        //Unsupported feature: Property Insertion (Visible) on ""Cost is Adjusted"(Control 122)".

        addafter("Last Direct Cost")
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
            }
            field("Qty. Returned"; "Qty. Returned")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the quantity returned';
            }
        }
    }
}
