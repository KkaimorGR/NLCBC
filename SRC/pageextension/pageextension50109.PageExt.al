
pageextension 52193436 pageextension50109 extends "Item Card"
{
    layout
    {
        addafter("Application Wksh. User ID")
        {
            field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item G/L Budget Account field.';
            }
        }
    }
}
