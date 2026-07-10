
page 52194165 "Contract Lines Types Card"
{
    PageType = Card;
    SourceTable = "Contract Lines Types";
    ApplicationArea = All;
    Caption = 'Contract Lines Types Card';
    layout
    {
        area(Content)
        {
            group(General)
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
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Type field.';
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle field.';
                }
            }
        }
    }

    actions { }
}
