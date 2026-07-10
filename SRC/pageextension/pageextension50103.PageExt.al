
pageextension 52193430 pageextension50103 extends "G/L Account Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""G/L Account Card"(Page 17)".

    layout
    {
        addafter("Direct Posting")
        {
            field("Expense Code"; Rec."Expense Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Expense Code field.';
            }
            field("Budget Controlled"; Rec."Budget Controlled")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Controlled field.';
            }
            field("Budget Control Account"; Rec."Budget Control Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Control Account field.';
            }
            field("Grant Expense"; Rec."Grant Expense")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grant Expense field.';
            }
        }
        addafter("Last Date Modified")
        {
            field("Donor defined Account"; Rec."Donor defined Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Donor defined Account field.';
            }
        }
    }
}
