
pageextension 52193457 pageextension50130 extends "Bank Account Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Bank Account Card"(Page 370)".

    layout
    {
        addafter("Last Date Modified")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
            field("Bank Type"; Rec."Bank Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Type field.';
            }
        }
    }
}
