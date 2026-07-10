
page 52194057 "Reporing Period"
{
    PageType = Card;
    SourceTable = "Reporting Date";
    ApplicationArea = All;
    Caption = 'Reporing Period';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("code"; Rec.code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field("Financial Reporting Date"; Rec."Financial Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Reporting Date field.';
                }
                field("Technical Reporting Date"; Rec."Technical Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Reporting Date field.';
                }
            }
        }
    }

    actions { }
}
