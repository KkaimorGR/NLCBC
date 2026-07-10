
page 52193722 "prEmployee Banks"
{
    PageType = List;
    SourceTable = "prEmployee Banks";
    ApplicationArea = All;
    Caption = 'prEmployee Banks';
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
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions { }
}
