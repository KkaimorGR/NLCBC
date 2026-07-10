
pageextension 52193429 pageextension50102 extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies either the G/L account''s total budget or, if you have specified a name in the Budget Name field, a specific budget.';
            }
        }
        addafter("Consol. Translation Method")
        {
            field("Expense Code"; Rec."Expense Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Expense Code field.';
            }
        }
    }
}
