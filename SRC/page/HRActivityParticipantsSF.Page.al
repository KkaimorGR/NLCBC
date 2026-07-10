
page 52194327 "HR Activity Participants SF"
{
    Caption = 'Activity Participants';
    PageType = List;
    SaveValues = true;
    SourceTable = "HR Activity Participants";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field(Participant; Rec.Participant)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Participant field.';
                }
                field("Partipant Name"; Rec."Partipant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partipant Name field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Email Address';
                    ToolTip = 'Specifies the value of the Email Message field.';
                }
                field("Attendance Confimed"; Rec."Attendance Confimed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendance Confimed field.';
                }
            }
        }
    }

    actions { }
}
