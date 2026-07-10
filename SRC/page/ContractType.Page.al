
page 52194157 "Contract Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Types";
    UsageCategory = Lists;
    Caption = 'Contract Type';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract Code"; Rec."Contract Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Code field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Contract Lines")
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Line";
                RunPageLink = "Contract Type" = field("Contract Code");
                ToolTip = 'Executes the Contract Lines action.';
            }
        }
    }
}
