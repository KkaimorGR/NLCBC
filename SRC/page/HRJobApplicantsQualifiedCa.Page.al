
page 52194314 "HR Job Applicants Qualified Ca"
{
    Caption = 'HR Job Applicants Qualified Card';
    DeleteAllowed = false;
    Description = 'HR Job Applicants Qualified Card';
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "HR Job Applications";
    PromotedActionCategories = 'New,Report,Process,Workflow Process,Notification,Disqualify Candidate,Job,Candidate Details';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                // field(Age; Rec.Age)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Age field.';
                // }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }

            }
            group("Interview Details")
            {
                // ApplicationAr;
                Caption = 'Interview Details';
                // Style = StrongAccent;
                // StyleExpr = true;

                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = Basic;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date of Interview field.';
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
                field("Total Score After Interview"; Rec."Total Score After Interview")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Score After Interview field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Comment"; "Document Comment")
                {
                    ApplicationArea = all;
                    Caption = 'Document Comment';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                Enabled = rec."Approval Status" = rec."Approval Status"::New;
                PromotedOnly = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField("Approval Status", Rec."Approval Status"::New);
                    if Confirm('Send this Job Applicant for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendQualifiedAplicantApprovalReq(Rec);

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Enabled = rec."Approval Status" = rec."Approval Status"::"Pending Approval";
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField("Approval Status", rec."Approval Status"::"Pending Approval");
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelEmpChangeDetailsRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalMG: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalMG.OpenApprovalEntriesPage(rec.RecordId);

                end;
            }
            action("Re-open Document")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                Enabled = rec."Approval Status" = rec."Approval Status"::Approved;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        Error('cancell the approval Request');
                    rec.TestField("Approval Status", "Approval Status"::Approved);
                    if Confirm('Do you want to reopen this document?') = true then begin
                        rec."Approval Status" := rec."Approval Status"::New;
                        Rec.Modify();
                        Message('Document Reopend successfully');
                        CurrPage.Close();
                    end;

                end;
            }

            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Caption = 'Approve Document';
                Visible = rec."Approval Status" = rec."Approval Status"::"Pending approval";
                PromotedOnly = true;
                ToolTip = 'Executes the Approval of Document action.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if Confirm('Do you want to approve this document?') then
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    CurrPage.close;
                end;
            }
            action("Send Interview Invitation")
            {
                ApplicationArea = Basic;
                Caption = 'Send Interview Invitation';
                Image = SendMail;
                Promoted = true;
                Enabled = rec."Approval Status" = rec."Approval Status"::Approved;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Interview Invitation action.';
                trigger OnAction()
                var
                    FN: Text;
                begin
                    Rec.TestField(Rec.Qualified, true);
                    Rec.TestField(Rec."Date of Interview");
                    Rec.TestField(Rec."From Time");
                    Rec.TestField(Rec."To Time");
                    Rec.TestField(Rec.Venue);
                    rec.TestField("Approval Status", "Approval Status"::Approved);


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
                            EmailMessage.Create(HRJobApplications."E-Mail",
                            HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                            + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                            + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                            + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                            + '<br><br>Best Regards' + '<br>' + CompanyName, true);

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
                Enabled = rec."Approval Status" = rec."Approval Status"::Approved;
                PromotedIsBig = true;

                ToolTip = 'Executes the Send Interview Invitation action.';
                trigger OnAction()
                var
                    FN: Text;
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
                        EmailMessage.Create(HRJobApplications."E-Mail",
                        HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                        + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                        + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                        + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                        + '<br><br>Best Regards' + '<br>' + CompanyName, true);

                        Email.Send(EmailMessage);
                        // until HRJobApplications.Next() = 0;

                        Rec."Interview Invitation Sent" := true;
                        Rec.Modify();
                        Message('%1 has been invited for the Interview Invitation via E-Mail ', FN)
                    end;
                end;
            }
            action(Disqualify)
            {
                ApplicationArea = Basic;
                Caption = 'Disqualify';
                Image = Comment;
                Promoted = true;
                PromotedCategory = category6;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    Shortlisted: Record "HR Shortlisted Applicants";
                begin
                    rec.TestField("Document Comment");
                    if Confirm('Do you want to disqualify the candidate?') then begin
                        Shortlisted.Reset();
                        Shortlisted.SetRange("Job Application No", rec."Job Application No.");
                        Shortlisted.SetRange("Employee Requisition No", rec."Employee Requisition No");
                        if Shortlisted.Find('-') then begin
                            Shortlisted.Qualified := false;
                            rec.Qualified := false;
                            rec."Application Status" := rec."Application Status"::Unsuccessful;
                            rec.Modify();
                            Shortlisted.Modify();
                            CurrPage.Close();
                        end;

                    end;

                end;
            }
            action(Qualifications)
            {
                ApplicationArea = Basic;
                Caption = 'Qualifications';
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category8;
                // RunObject = page "Applicant Job Requirements";
                // RunPageLink = "Candidate No." = field("Candidate No.");
                ToolTip = 'Executes the Qualifications action.';
                trigger OnAction()
                var
                    myInt: Integer;
                    Qualifca: Record "Application Qualification";
                begin
                    Qualifca.Reset();
                    Qualifca.SetRange("Candidate No.", Rec."Candidate No.");
                    Qualifca.SetFilter("Qualification Type", '<>%1&<>%2', 'Work Experience', 'Professional Body');
                    if Qualifca.Find('-') then begin
                        Page.Run(Page::"Applicant Job Requirements", Qualifca);
                    end else
                        Message('There is no Submitted qualifications');

                end;
            }
            action("Work Experience")
            {
                ApplicationArea = Basic;
                Caption = 'Work Experience';
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category8;
                // RunObject = page "Applicant Job Requirements";
                // RunPageLink = "Candidate No." = field("Candidate No.");
                ToolTip = 'Executes the Work Experience action.';
                trigger OnAction()
                var
                    JobApplicantsQualification: Record "Job Applicants Qualification";
                begin
                    JobApplicantsQualification.Reset();
                    JobApplicantsQualification.SetRange("Candidate No.", rec."Candidate No.");
                    JobApplicantsQualification.SetRange(JobApplicantsQualification."Qualification Category", 'Work Experience');
                    if JobApplicantsQualification.Find('-') then begin
                        Page.Run(Page::"Work Experience", JobApplicantsQualification);
                    end else
                        Message('There is no Submitted Work experience');
                end;
            }
            action("Proffessional Bodies")
            {
                ApplicationArea = Basic;
                Caption = 'Proffessional Bodies';
                // Image = ;
                Promoted = true;
                PromotedCategory = Category8;
                // RunObject = page "Applicant Job Requirements";
                // RunPageLink = "Candidate No." = field("Candidate No.");
                ToolTip = 'Executes the Proffessional Bodies action.';
                trigger OnAction()
                var
                    JobApplicantsQualification: Record "Job Applicants Qualification";
                begin
                    JobApplicantsQualification.Reset();
                    JobApplicantsQualification.SetRange("Candidate No.", rec."Candidate No.");
                    JobApplicantsQualification.SetRange(JobApplicantsQualification."Qualification Category", 'Professional Body');
                    if JobApplicantsQualification.Find('-') then begin
                        Page.Run(Page::"Proffessional Bodies", JobApplicantsQualification);
                    end else
                        Message('There is no Submitted Proffessional bodies');
                end;
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Caption = 'Referees';
                Image = ContactReference;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                // RunObject = page "HR Applicant Referees";
                // RunPageLink = "Application No." = field("Employee Requisition No");

                ToolTip = 'Executes the Referees action.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ApprReff: Record "Application Referees";
                begin
                    ApprReff.Reset();
                    ApprReff.SetRange("Candidate No.", Rec."Candidate No.");
                    if ApprReff.Find('-') then begin
                        Page.Run(Page::"HR Applicant Referees", ApprReff);
                    end else
                        Message('There is no referees submitted');
                end;
            }
            action(Requirements)
            {
                ApplicationArea = Basic;
                Caption = 'Requirements';
                Image = Card;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = page "HR Job Requirement Lines";
                RunPageLink = "Job ID" = field("Job Applied For");
                ToolTip = 'Executes the Requirements action.';
            }
            action(Responsibilities)
            {
                ApplicationArea = Basic;
                Caption = 'Responsibilities';
                Image = JobResponsibility;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = page "HR Job Responsiblities Lines";
                RunPageLink = "Job ID" = field("Job Applied For");
                ToolTip = 'Executes the Responsibilities action.';
            }


        }
    }

    var
        HRJobApplicants: Record "HR Job Applications";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        HRJobApplications: Record "HR Job Applications";
        HREmailParameters: Record "HR E-Mail Parameters";
        Text001: Label 'Are you sure you want to upload "%1" to the Employee List?';
        Text002: Label 'Are you sure you want to Send this Interview invitation to\%1?';

        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
