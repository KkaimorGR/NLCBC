
page 52194159 "Contract Lines Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Lines Types";
    UsageCategory = Lists;
    Caption = 'Contract Lines Type';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract Line Code"; Rec."Contract Line Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Code field.';
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
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
            action("Contract &Cycle")
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Cycle Stage";
                RunPageLink = "Contract Line Type" = field("Contract Line Type");
                ToolTip = 'Executes the Contract &Cycle action.';
            }
        }
    }
}
