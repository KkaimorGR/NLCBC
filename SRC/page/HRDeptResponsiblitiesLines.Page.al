
page 52194319 "HR Dept. Responsiblities Lines"
{
    PageType = List;
    SourceTable = "HR Dept. Responsibilities";
    ApplicationArea = All;
    Caption = 'HR Dept. Responsiblities Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Responsibility code"; Rec."Responsibility code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility code field.';
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
