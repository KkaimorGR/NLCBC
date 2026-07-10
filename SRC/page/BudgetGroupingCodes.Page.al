
page 52194064 "Budget Grouping Codes"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Budget Grouping Codes";
    ApplicationArea = All;
    Caption = 'Budget Grouping Codes';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Amount field.';
                }
            }
        }
    }

    actions { }
}
