
page 52193723 "PR Bank Branches"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR Bank Branches";
    UsageCategory = Lists;
    Caption = 'PR Bank Branches';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
            }
        }
    }

    actions { }
}
