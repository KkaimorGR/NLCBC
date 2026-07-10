
page 52194060 "Phase Reporting Schedule"
{
    DelayedInsert = true;
    Editable = false;
    PageType = Card;
    SourceTable = "Phase Reporting Schedules";
    ApplicationArea = All;
    Caption = 'Phase Reporting Schedule';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field(Phase; Rec.Phase)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phase field.';
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
            }
        }
    }

    actions { }
}
