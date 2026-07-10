
page 52194158 "Contract Line"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Lines";
    UsageCategory = Lists;
    Caption = 'Contract Line';
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
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Line Type")
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Lines Type";
                RunPageLink = "Contract Line Code" = field("Contract Line Code");
                ToolTip = 'Executes the Line Type action.';
            }
        }
    }
}
