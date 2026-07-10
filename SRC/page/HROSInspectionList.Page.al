
page 52193684 "HR OSInspection List"
{
    ApplicationArea = Basic;
    CardPageId = "HR OSInspection Card";
    PageType = List;
    SourceTable = "HR OSInvestigation";
    SourceTableView = where(Status = const("Assigned Investigation"));
    UsageCategory = Lists;
    Caption = 'HR OSInspection List';
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
            }
        }
    }

    actions { }
}
