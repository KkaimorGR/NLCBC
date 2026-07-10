
page 52193633 "HR Job Applications Card"
{
    Editable = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details,Job Details';
    SourceTable = "HR Job Applications";
    ApplicationArea = All;
    Caption = 'HR Job Applications Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
            }
            group("Job Details1")
            {
                Caption = '"Job Details';


                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Application Reff No. field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Applied For';
                    Editable = false;
                    Enabled = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Position Applied For field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Job Title';

                    // ShowCaption = false;
                }

            }
            group("Personal Infomation")
            {
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Initials field.';
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Residential Address field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Country Details"; Rec."Citizenship Details")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowCaption = false;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }


            }
            group(Languages)
            {
                Visible = false;


                field("First Language"; "First Language")
                {
                    ApplicationArea = Basic;
                    Caption = 'First Language';
                    Importance = Promoted;
                    StyleExpr = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the 1st Language (R/W/S) field.';
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = Basic;
                    Caption = 'R';
                    Visible = false;
                    ToolTip = 'Specifies the value of the R field.';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = Basic;
                    Caption = 'W';
                    Visible = false;
                    ToolTip = 'Specifies the value of the W field.';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = Basic;
                    Caption = 'S';
                    Visible = false;
                    ToolTip = 'Specifies the value of the S field.';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Caption = '2nd Language (R/W/S)';
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the 2nd Language (R/W/S) field.';
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'R';
                    ToolTip = 'Specifies the value of the R field.';
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = Basic;
                    Caption = 'W';
                    Visible = false;
                    ToolTip = 'Specifies the value of the W field.';
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'S';
                    ToolTip = 'Specifies the value of the S field.';
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    ToolTip = 'Specifies the value of the Additional Language field.';
                }


            }
            group("Important Dates")
            {

                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                    trigger OnValidate()
                    begin

                        if Rec."Date Of Birth" >= Today then
                            Error('Invalid Entry');
                        DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
                        Rec.Age := DAge;
                    end;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Cummulative Experience"; "Cummulative Experience")
                {
                    ApplicationArea = all;
                }

            }


        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
            systempart(Control3; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
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
                        ApprReff.SetRange("Application No.", rec."Employee Requisition No");
                        if ApprReff.Find('-') then begin
                            Page.Run(Page::"HR Applicant Referees", ApprReff);
                        end else
                            Message('There is no referees submitted');
                    end;
                }
                action(Hobbies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Hobbies action.';
                }
                action("Character Response")
                {
                    ApplicationArea = Basic;
                    Caption = 'Character Response';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        survery: Record "Survey Character";
                    begin
                        survery.Reset();
                        survery.SetRange("Candidate No.", rec."Candidate No.");
                        if survery.Find('-') then begin
                            Page.Run(Page::"Survey Character", survery);
                        end else
                            Message('There no character response submitted');


                    end;
                }
                action("Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'Documents';
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    trigger OnAction()
                    begin
                        if rec."Candidate No." <> '' then
                            Hyperlink('https://hrms.landcommission.go.ke:2022/Home/GetCandidateAttachments?candidateNo=' + rec."Candidate No." + '');

                    end;
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                    PromotedCategory = Category6;
                    RunObject = page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = field("Job Applied For");
                    ToolTip = 'Executes the Responsibilities action.';
                }
            }
            group(Workflows)
            {
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

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Applicant Type" := Rec."Applicant Type"::Internal;
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
        Qualifca: Record "Application Qualification";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        TExperience: Integer;
    begin
        // TExperience := 0;
        // JobApplicantsQualification.Reset();
        // JobApplicantsQualification.SetRange("Candidate No.", rec."Candidate No.");
        // JobApplicantsQualification.SetRange(JobApplicantsQualification."Qualification Category", 'Work Experience');
        // if JobApplicantsQualification.Find('-') then begin
        //     repeat
        //         TExperience += JobApplicantsQualification."To Date" - JobApplicantsQualification."From Date";
        //     until JobApplicantsQualification.Next() = 0;
        // end;
        // if TExperience <> 0 then
        //     rec."Cummulative Experience" := Round((TExperience / 365), 1)
        // Qualifca.Reset();
        // Qualifca.SetRange("Candidate No.", Rec."Candidate No.");
        // if Qualifca.FindSet() then begin
        //     Qualifca."Application No." := rec."Employee Requisition No";
        //     Qualifca.Modify();
        // end;

    end;

    var
        HRJobApplications: Record "HR Job Applications";
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        Employee: Record "HR Employees";
        Text19064672: Label 'Shortlisting Summary';
        Dates: Codeunit "HR Dates";
        DAge: Text[100];
        Text0000: Label '                     ';
}
