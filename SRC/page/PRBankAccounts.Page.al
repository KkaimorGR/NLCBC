
page 52193715 "PR Bank Accounts"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR Bank Accounts";
    UsageCategory = Lists;
    Caption = 'PR Bank Accounts';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Branches)
            {
                ApplicationArea = Basic;
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "PR Bank Branches";
                RunPageLink = "Bank Code" = field("Bank Code");
                ToolTip = 'Executes the Branches action.';
            }
        }
    }
}
