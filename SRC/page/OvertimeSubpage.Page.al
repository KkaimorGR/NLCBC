

page 50016 "Overtime Subpage"
{
    CardPageId = "Overtime Header Page";
    PageType = ListPart;
    SourceTable = "Overtime Header";
    ApplicationArea = All;
    Caption = 'Overtime Subpage';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("EMp No."; Rec."EMp No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EMp No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Convert to pay"; Rec."Convert to pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convert to pay field.';
                }
                field("Convert to Leave"; Rec."Convert to Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convert to Leave field.';
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
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

#pragma implicitwith restore

