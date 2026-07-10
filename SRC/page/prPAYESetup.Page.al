
page 52193714 "prP.A.Y.E Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR PAYE";
    UsageCategory = Lists;
    Caption = 'prP.A.Y.E Setup';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier Code field.';
                }
                field("PAYE Tier"; Rec."PAYE Tier")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Tier field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
            }
        }
    }

    actions { }
}
