
page 52193694 "HR Applicants UnQualified L"
{
    ApplicationArea = Basic;
    CardPageId = "HR Applicants UnQualified Card";
    PageType = List;
    SourceTable = "HR Job Applications";
    PromotedActionCategories = 'New,report,process,Send Regret alert';
    SourceTableView = where(Qualified = filter(false));
    UsageCategory = Lists;
    Caption = 'HR Applicants UnQualified L';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application Ref. No.';
                    ToolTip = 'Specifies the value of the Application Ref. No. field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job ID';
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Description';
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Applicant)
            {
                Caption = 'Applicant';
                action("Send Regret Alert")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Regret Alert';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Regret Alert action.';
                    trigger OnAction()
                    var
                        msg: Text;
                        globalFun: Codeunit "Global Functions";
                    begin

                        //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;
                        if not Confirm(Text003, false) then
                            exit;

                        Rec.TestField(Rec.Qualified, false);
                        HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Regret Notification");
                        if HREmailParameters.Find('-') then begin
                            HRJobApplications.Reset();
                            HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                            HRJobApplications.SetRange(Qualified, false);
                            // CurrPage.SetSelectionFilter(HRJobApplications);
                            if HRJobApplications.Find('-') then
                                //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                                repeat
                                    Msg := 'Dear ' + HRJobApplications."First Name" + ', Thank you for your interest in the role ' + HRJobApplications."Job Applied for Description" + ' at NLC and for participating in our selection process.' +
            'After careful consideration, we regret to inform you that you were not selected.' +
            'The competition was strong, and we had to make difficult choices.' +
            'We appreciate your effort and encourage you to explore future opportunities with us.' +
            'Wishing you success in your career.';
                                    HRJobApplications.TestField(HRJobApplications."E-Mail");
                                    EmailMessage.Create(HRJobApplications."E-Mail",
                                       HREmailParameters.Subject, msg, true);
                                    // HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ', ' + HREmailParameters.Body + ' .' + HRJobApplications."Job Applied for Description" + ' ' + 'applied on' + ' ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2", true);
                                    //HREmailParameters."Body 2"+' '+ FORMAT("Date Applied")+'. '+
                                    // HREmailParameters.Body,TRUE);
                                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                                until HRJobApplications.Next() = 0;
                            Message('Unqualified  candidates have been sent regret alerts');
                        end;
                    end;
                }
            }
        }
    }

    var
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send this Interview invitation?';
        HRJobApplications: Record "HR Job Applications";
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Text003: Label 'Are you sure you want to Send Regret Notification?';
}
