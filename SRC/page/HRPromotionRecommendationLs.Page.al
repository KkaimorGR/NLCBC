
page 52194272 "HR Promotion Recommendation Ls"
{
    PageType = ListPart;
    SourceTable = "HR Promo. Recommend Lines";
    ApplicationArea = All;
    Caption = 'HR Promotion Recommendation Ls';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee Abilities"; Rec."Employee Abilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Abilities field.';
                }
                field(Experience; Rec.Experience)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience field.';
                }
            }
        }
    }

    actions { }
}
