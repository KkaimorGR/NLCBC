
page 52193703 "HR Commitee Members"
{
    PageType = List;
    SourceTable = "HR Commitee Members";
    ApplicationArea = All;
    Caption = 'HR Commitee Members';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Date Appointed"; Rec."Date Appointed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Appointed field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
            }
        }
    }

    actions { }
}
