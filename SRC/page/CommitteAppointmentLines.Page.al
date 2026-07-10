

page 50067 "Committe Appointment Lines"
{
    PageType = ListPart;
    SourceTable = "Commitee Appointed Member";
    ApplicationArea = All;
    Caption = 'Committe Appointment Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field("Member Email"; Rec."Member Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Email field.';
                }


            }
        }
    }

    actions { }
}

#pragma implicitwith restore

