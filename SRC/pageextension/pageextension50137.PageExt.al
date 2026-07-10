
pageextension 52193464 pageextension50137 extends "No. Series Lines"
{
    layout
    {
        addafter("Increment-by No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
        }
    }
}
