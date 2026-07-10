
page 52194090 "Phase Reporting Schedules"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Phase Reporting Schedules";
    ApplicationArea = All;
    Caption = 'Phase Reporting Schedules';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Partner/Donor"; Rec."Partner/Donor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner/Donor field.';
                }
                field(Months; Rec.Months)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Months field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
                field("Audit Dates"; Rec."Audit Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Dates field.';
                }
                field(AlertSent; Rec.AlertSent)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AlertSent field.';
                }
            }
        }
    }

    actions { }
}
