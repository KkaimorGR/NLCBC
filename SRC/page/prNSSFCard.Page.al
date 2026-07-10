
page 52193740 "prNSSF Card"
{
    PageType = Card;
    SourceTable = "prNSSF Tiers";
    ApplicationArea = All;
    Caption = 'prNSSF Card';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Tier; Rec.Tier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier field.';
                }
                field(Earnings; Rec.Earnings)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earnings field.';
                }
                field("Pensionable Earnings"; Rec."Pensionable Earnings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pensionable Earnings field.';
                }
                field("Tier 1 earnings"; Rec."Tier 1 earnings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 1 earnings field.';
                }
                field("Tier 1 Employee Deduction"; Rec."Tier 1 Employee Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 1 Employee Deduction field.';
                }
                field("Tier 1 Employer Contribution"; Rec."Tier 1 Employer Contribution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 1 Employer Contribution field.';
                }
                field("Tier 2 earnings"; Rec."Tier 2 earnings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 2 earnings field.';
                }
                field("Tier 2 Employee Deduction"; Rec."Tier 2 Employee Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 2 Employee Deduction field.';
                }
                field("Tier 2 Employer Contribution"; Rec."Tier 2 Employer Contribution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier 2 Employer Contribution field.';
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
            }
        }
    }

    actions { }
}
