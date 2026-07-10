
page 52194151 "Evaluation Parameters Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Evaluation Parameters Setup";
    UsageCategory = Lists;
    Caption = 'Evaluation Parameters Setup';
    layout
    {
        area(Content)
        {
            repeater(Group)
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
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Outlook) { }
        }
    }

    actions { }
}
