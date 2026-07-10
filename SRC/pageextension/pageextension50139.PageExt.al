
pageextension 52193466 pageextension50139 extends "Inventory Setup"
{
    layout
    {
        addafter("Internal Movement Nos.")
        {
            field("Item Jnl Template"; Rec."Item Jnl Template")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Jnl Template field.';
            }
            field("Item Jnl Batch"; Rec."Item Jnl Batch")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Jnl Batch field.';
            }
        }
    }
}
