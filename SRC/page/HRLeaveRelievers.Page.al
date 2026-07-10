
page 52193672 "HR Leave Relievers"
{
    PageType = ListPart;
    SourceTable = "HR Leave Relievers";
    ApplicationArea = All;
    Caption = 'HR Leave Relievers';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Reliever No"; Rec."Reliever No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever No field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Pending Assignment"; Rec."Pending Assignment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Assignment field.';
                }
            }
        }

    }

    actions { }
}
