
page 52193650 "HR E-Mail Parameters List"
{
    ApplicationArea = Basic;
    CardPageId = "HR E-Mail Parameters Card";
    PageType = List;
    SourceTable = "HR E-Mail Parameters";
    UsageCategory = Administration;
    Caption = 'HR E-Mail Parameters List';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Associate With"; Rec."Associate With")
                {
                    ApplicationArea = all;
                    // OptionMembers = ,"Vacancy Advertisements","Interview Invitations",General,"HR Jobs","Regret Notification","Reliever Notifications","Leave Notifications","Activity Notifications","Send Payslip Email","Training Notifications","Leave Approval Notifications",Retirement,Procurement;
                    OptionCaption = ',Vacancy Advertisements,Interview Invitations,General,HR Jobs,Regret Notification,Reliever Notifications,Leave Notifications,Activity Notifications,Send Payslip Email,Training Notifications,Leave Approval Notifications,Retirement,Procurement';
                    ToolTip = 'Specifies the value of the Associate With field.';
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Name field.';
                }
                field("Sender Address"; Rec."Sender Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Address field.';
                }
                field("Recipient 1"; Rec."Recipient 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient 1 field.';
                }
                field("Recipient 2"; Rec."Recipient 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient 2 field.';
                }
                field("Recipient 3"; Rec."Recipient 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recipient 3 field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Body; Rec.Body)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body field.';
                }
                field("Body 2"; Rec."Body 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 2 field.';
                }
                field("Body 3"; Rec."Body 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body 3 field.';
                }
                field(HTMLFormatted; Rec.HTMLFormatted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HTMLFormatted field.';
                }
            }
        }
    }

    actions { }
}
