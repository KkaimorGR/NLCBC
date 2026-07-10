
page 52193682 "HR OSInvestigation List"
{
    ApplicationArea = Basic;
    CardPageId = "HR OSInvestigation Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR OSInvestigation";
    SourceTableView = where(Status = const("Reported Investigation"));
    UsageCategory = Lists;
    Caption = 'HR OSInvestigation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Investigation No"; Rec."Investigation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigation No field.';
                }
                field("Incident No"; Rec."Incident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident No field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Incident field.';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
