
pageextension 52193431 pageextension50104 extends "G/L Account List"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""G/L Account List"(Page 18)".

    layout
    {
        addafter("Direct Posting")
        {
            field("Grant Expense"; Rec."Grant Expense")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grant Expense field.';
            }
        }
    }
}
