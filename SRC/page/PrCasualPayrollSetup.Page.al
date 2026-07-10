
page 52193746 "PrCasual Payroll Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "PrCasual Payroll Setup";
    UsageCategory = Administration;
    Caption = 'PrCasual Payroll Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Normal Hours Rate per Hour"; Rec."Normal Hours Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Normal Hours Rate per Hour field.';
                }
                field("Overtime Hours Rate per Hour"; Rec."Overtime Hours Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Hours Rate per Hour field.';
                }
                field("PHs and Weekends Rate per Hour"; Rec."PHs and Weekends Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PHs and Weekends Rate per Hour field.';
                }
            }
        }
    }

    actions { }
}
