
page 52194359 "HR  App Qualified Applicants"
{
    ApplicationArea = Basic;
    CardPageId = "HR Job Applicants Qualified Ca";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,process,report,Notification,Process';
    SourceTable = "HR Job Applications";
    SourceTableView = where(Qualified = const(true),
                            Uploaded = const(false),
                            "Approval Status" = filter(Approved));
    UsageCategory = Lists;
    Caption = 'HR  App Qualified Applicants';
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
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation Sent field.';
                }
                field("T Scores"; "T Scores")
                {
                    ApplicationArea = all;
                    Caption = 'Total Scores';
                    Editable = false;
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
                action("Send Interview Invitation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send Interview Invitation action.';
                    trigger OnAction()
                    var
                        FN: Text;
                        Msg: Text;
                        globalFun: Codeunit "Global Functions";
                    begin
                        Rec.TestField(Rec.Qualified, true);
                        Rec.TestField(Rec."Date of Interview");
                        Rec.TestField(Rec."From Time");
                        Rec.TestField(Rec."To Time");
                        Rec.TestField(Rec.Venue);


                        FN := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
                        if not Confirm(Text002, false, FN) then
                            exit;



                        if Rec."Interview Invitation Sent" = true then
                            Error('Applicant has already been notified');

                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);

                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
                        if not HREmailParameters.Find('-') then
                            Error('Please setup Email Parameters');
                        begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                                Msg := 'Dear ' + HRJobApplications."First Name" + ', We are pleased to inform you that you have been shortlisted for an interview for the ' + HRJobApplications."Job Applied for Description" + ' role at NLC you applied on ' + Format(HRJobApplications."Date Applied") + '. We were impressed with your application and would like to learn more about your skills and experience.The Interview will be done On ' + Format(HRJobApplications."Date of Interview") + '.Venue: ' + HRJobApplications.Venue + '. Time: from ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + '. ';
                                EmailMessage.Create(HRJobApplications."E-Mail", HREmailParameters.Subject, Msg, true);

                                // EmailMessage.Create(HRJobApplications."E-Mail",
                                // HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                                // + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                                // + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                                // + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                                // + '<br><br>Best Regards' + '<br>' + CompanyName, true);

                                Email.Send(EmailMessage);
                            until HRJobApplications.Next() = 0;

                            Rec."Interview Invitation Sent" := true;
                            Rec.Modify();
                            Message('%1 has been invited for the Interview Invitation via E-Mail ', FN)
                        end;
                    end;
                }
                action("Single invitation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Single invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = category5;
                    PromotedIsBig = true;

                    ToolTip = 'Executes the Send Interview Invitation action.';
                    trigger OnAction()
                    var
                        FN: Text;
                        Msg: Text;
                        globalFun: Codeunit "Global Functions";

                    begin
                        Rec.TestField(Rec.Qualified, true);
                        Rec.TestField(Rec."Date of Interview");
                        Rec.TestField(Rec."From Time");
                        Rec.TestField(Rec."To Time");
                        Rec.TestField(Rec.Venue);
                        rec.TestField(rec."Approval Status", rec."Approval Status"::Approved);
                        FN := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
                        if not Confirm(Text002, false, FN) then
                            exit;



                        if Rec."Interview Invitation Sent" = true then
                            Error('Applicant has already been notified');
                        HRJobApplications.Reset();
                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);

                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
                        if not HREmailParameters.Find('-') then
                            Error('Please setup Email Parameters');
                        begin

                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            // EmailMessage.Create(HRJobApplications."E-Mail",
                            // HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                            // + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                            // + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                            // + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                            // + '<br><br>Best Regards' + '<br>' + CompanyName, true);
                            Msg := 'Dear ' + HRJobApplications."First Name" + ', We are pleased to inform you that you have been shortlisted for an interview for the ' + HRJobApplications."Job Applied for Description" + ' role at NLC you applied on ' + Format(HRJobApplications."Date Applied") + '. We were impressed with your application and would like to learn more about your skills and experience.The Interview will be done On ' + Format(HRJobApplications."Date of Interview") + '.Venue: ' + HRJobApplications.Venue + '. Time: from ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + '. ';
                            EmailMessage.Create(HRJobApplications."E-Mail", HREmailParameters.Subject, Msg, true);

                            Email.Send(EmailMessage);
                            // until HRJobApplications.Next() = 0;

                            Rec."Interview Invitation Sent" := true;
                            Rec.Modify();
                            Message('%1 has been invited for the Interview Invitation via E-Mail ', FN)
                        end;
                    end;
                }
                action("Job Interview details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Interview details';
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = page "HR Job Interview";
                    RunPageLink = "Applicant No" = field("Job Application No.");
                    ToolTip = 'Executes the Job Interview details action.';
                }
                action("Job Applicant Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Applicant Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    RunObject = page "HR Job Applications Card";
                    RunPageLink = "Job Application No." = field("Job Application No.");
                    ToolTip = 'Executes the Job Applicant Card action.';
                }
                action("Applicant Qualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Qualifications';
                    Image = QualificationOverview;
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Applicant Qualifications action.';
                }
                action("Applicant Referees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Referees';
                    Image = ContactReference;
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Referees";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    ToolTip = 'Executes the Applicant Referees action.';
                }
                action("Applicant Hobbies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Hobbies';
                    Image = Holiday;
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Applicant Hobbies action.';
                }
                action("Upload to Employees Registration")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Caption = 'Upload to Employees Registration';
                    PromotedIsBig = true;
                    // RunObject = report "HR Applicant to Employee";
                    Visible = true;
                    ToolTip = 'Executes the Upload to Employees action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        JobApplications: Record "HR Job Applications";
                    begin
                        JobApplications.Reset();
                        JobApplications.SetRange("Job Application No.", rec."Job Application No.");
                        if JobApplications.Find('-') then begin
                            Report.Run(Report::"HR Applicant to Employee", true, false, JobApplications);

                        end;

                    end;

                }
            }
        }

    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        rec.CalcFields("T Scores");
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        rec.CalcFields("T Scores");
    end;

    var
        Text001: Label 'Are you sure you want to upload "%1" to the Employee List?';
        Text002: Label 'Are you sure you want to Send this Interview invitation to\%1?';
        HRJobApplications: Record "HR Job Applications";
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Interview: Record "HR Job Interview";
        fn: Text;
}
