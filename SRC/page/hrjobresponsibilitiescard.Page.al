
page 52193630 "hr job responsibilities card"
{
    PageType = Card;
    SourceTable = "HR Job Responsiblities";
    ApplicationArea = All;
    Caption = 'hr job responsibilities card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Description field.';
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
