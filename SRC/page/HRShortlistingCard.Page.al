
page 52193690 "HR Shortlisting Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Shortlistling';
    SourceTable = "HR Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(true));
    ApplicationArea = All;
    Caption = 'HR Shortlisting Card';
    layout
    {
        area(Content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = true;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    // Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Requisition No."; "Requisition No.")
                {
                    ApplicationArea = all;

                    // trigger OnValidate()
                    // var
                    //     myInt: Integer;
                    //     Requisions: Record "HR Employee Requisitions";
                    // begin
                    //     Requisions.Reset();
                    //     Requisions.SetRange("Requisition No.", Rec."Requisition No.");
                    //     if Requisions.Find('-') then begin
                    //         rec."Requisition Date" := Requisions."Requisition Date";
                    //         rec.Priority := Requisions.Priority;
                    //         rec."Required Positions" := Requisions."Required Positions";
                    //     end;

                    // end;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Shortlisted; "HR Shortlisting Lines")
            {
                Editable = ShortlistedEditable;
                ToolTip = 'Qualified Applicants be marked as qualified in the column';
                SubPageLink = "Employee Requisition No" = field("Requisition No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755001; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("&ShortList Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Qualified Applicants be marked as qualified in the column';

                }
                action(Filters)
                {
                    ApplicationArea = Basic;
                    Caption = 'Filters';
                    Promoted = true;
                    PromotedCategory = Category4;
                    // PromotedCategory = Process;
                    RunObject = page "HR Shortlisting Filters";
                    RunPageLink = "Job ID" = field("Job ID"),
                                  "Requisition No." = field("Requisition No.");
                    Visible = false;
                    ToolTip = 'Executes the Filters action.';
                }
                action(Action3)
                {
                    ApplicationArea = Basic;
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &ShortList Applicants action.';
                    trigger OnAction()
                    var
                        Qual: Boolean;
                        Scor: Decimal;
                        Qualifications: Record "Application Qualification";
                        Jobreq: Record "HR Job Requirements";
                        TQual: Integer;
                        TMandary: Integer;
                    begin

                        if Confirm('Do you want to proceed shortlisting?') = true then begin
                            // HRJobRequirements.Reset();
                            // HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            // if HRJobRequirements.Count = 0 then begin
                            //     Message('Job Requirements for the job ' + Rec."Job ID" + ' have not been setup');
                            //     exit;
                            // end else begin
                            //GET JOB REQUIREMENTS
                            //DELETE ALL RECORDS FROM THE SHORTLISTED APPLICANTS TABLE
                            HRShortlistedApplicants.Reset();
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Employee Requisition No", Rec."Requisition No.");
                            HRShortlistedApplicants.DeleteAll();
                            //GET JOB APPLICANTS
                            HRJobApplications.Reset();
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            if not HRJobApplications.Find('-') then
                                Error('No Applicants have applied for this Job');
                            // HRJobApplications.FindFirst();
                            // repeat
                            //     HRJobApplications.Qualified := false;
                            //     HRJobApplications.Modify();
                            // until HRJobApplications.Next() = 0;
                            //MOVE TO FIRST RECORD AGAIN
                            HRJobApplications.Reset();
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            HRJobApplications.FindFirst();
                            repeat
                                Rec.Qualified := true;
                                // HRJobRequirements.Reset();
                                // HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                                // if HRJobRequirements.Find('-') then
                                //     repeat
                                Scor := 0;
                                Qual := false;
                                TQual := 0;
                                TMandary := 0;
                                //GET THE APPLICANTS QUALIFICATIONS AND COMPARE THEM WITH THE JOB REQUIREMENTS
                                // HRApplicantRequirements.Reset();
                                // HRApplicantRequirements.SetRange(HRApplicantRequirements."Application No", HRJobApplications."Job Application No.");
                                // HRApplicantRequirements.SetRange(HRApplicantRequirements."Qualification Code", HRJobRequirements."Qualification Code");
                                // if HRApplicantRequirements.Find('-') then begin
                                Qualifications.Reset();
                                // Qualifications.SetRange(Qualifications."Application No.", HRJobApplications."Employee Requisition No");
                                Qualifications.SetRange(Qualifications."Candidate No.", HRJobApplications."Candidate No.");
                                if Qualifications.Find('-') then
                                    TQual := Qualifications.Count;
                                Jobreq.Reset();
                                // Jobreq.SetRange("Applicant No", HRJobApplications."Job Application No.");
                                Jobreq.SetRange(Jobreq."Job ID", rec."Job ID");
                                Jobreq.SetRange(Mandatory, true);
                                if Jobreq.Find('-') then
                                    TMandary := Jobreq.Count;
                                Scor := Rec.Score + HRApplicantRequirements."Score ID";
                                //Condition 1
                                //     if (HRApplicantRequirements."Score ID" < HRJobRequirements."Minimum Score")
                                //     or
                                //        (HRApplicantRequirements."Score ID" < HRJobRequirements."Maximum Score")
                                //    then
                                //         Qual := false
                                //     else
                                //         Qual := true;
                                if (TMandary = TQual) or (TQual > TMandary) then begin
                                    Qual := true;
                                    HRJobApplications."Application Status" := HRJobApplications."Application Status"::Inprogress;
                                end
                                else begin
                                    Qual := false;
                                    HRJobApplications."Application Status" := HRJobApplications."Application Status"::Unsuccessful;
                                end;
                                if HRJobApplications."Cummulative Experience" >= rec."Expected Experience" then begin
                                    Qual := true;
                                    HRJobApplications."Application Status" := HRJobApplications."Application Status"::Inprogress;
                                end else begin
                                    Qual := false;
                                    HRJobApplications."Application Status" := HRJobApplications."Application Status"::Unsuccessful;
                                end;
                                // end else
                                //     //IF WE DO NOT FIND ANY APPLICANT QUALIFICATIONS
                                //     Qual := false;
                                // until HRJobRequirements.Next() = 0;
                                HRShortlistedApplicants.Init();
                                HRShortlistedApplicants."Employee Requisition No" := Rec."Requisition No.";
                                HRShortlistedApplicants."Job Application No" := HRJobApplications."Job Application No.";
                                HRShortlistedApplicants."Stage Score" := Scor;
                                HRShortlistedApplicants.Qualified := Qual;
                                HRShortlistedApplicants."First Name" := HRJobApplications."First Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."First Name");
                                HRShortlistedApplicants."Middle Name" := HRJobApplications."Middle Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."Middle Name");
                                HRShortlistedApplicants."Last Name" := HRJobApplications."Last Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."Last Name");
                                HRShortlistedApplicants."ID No" := HRJobApplications."ID Number";
                                HRShortlistedApplicants.Gender := HRJobApplications.Gender;
                                HRShortlistedApplicants."Marital Status" := HRJobApplications."Marital Status";
                                HRShortlistedApplicants."Job applied" := HRJobApplications."Job Applied For";
                                HRShortlistedApplicants.Insert();
                                HRJobApplications."Total Score" := Scor;
                                HRJobApplications.Qualified := Qual;
                                HRJobApplications.Modify();
                            until HRJobApplications.Next() = 0;
                            Message('Shortlisting Competed Successfully for %1', Rec."Job ID");
                        end else
                            exit;
                    end;
                }
                action("Shortlising Panel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Shortlising Panel';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Interview Pannel";
                    RunPageLink = "Requisition No" = field("Requisition No.");
                    ToolTip = 'Executes the Shortlising Panel action.';
                    trigger OnAction()
                    var
                        Requestision: Record "HR Employee Requisitions";
                        PanelRec: Record "Interview Pannel";
                    begin
                        Requestision.Reset();
                        Requestision.SetRange("Requisition No.", Rec."Requisition No.");
                        if Requestision.Find('-') then begin
                            PanelRec.Reset();
                            PanelRec.SetRange("Requisition No", rec."Requisition No.");
                            if PanelRec.Find('-') then begin
                                PanelRec."JOb ID" := Requestision."Job ID";
                                PanelRec.Modify();
                            end;
                        end;
                    end;
                }
                action("Invite Pannel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invite Pannel';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Interview Pannel";
                    RunPageLink = "Requisition No" = field("Requisition No.");
                    ToolTip = 'Executes theInvite Pannel action.';
                    trigger OnAction()
                    var
                        AccName: Text;
                        HRDiscipMemb: Record "Interview Pannel";
                        Employee: Record "HR Employees";
                        Emailmessage: Codeunit "Email Message";
                        EmailManager: Codeunit "Email Message";
                        msg: Text;
                    begin
                        rec.TestField("Job ID");
                        if not Confirm('Do you want to invite the pannel for the interview?') then exit;
                        HRDiscipMemb.Reset();
                        HRDiscipMemb.SetRange(HRDiscipMemb."Requisition No", Rec."Requisition No.");
                        if HRDiscipMemb.Find('-') then
                            repeat
                                if Employee.Get(HRDiscipMemb."Staff No") then begin
                                    AccName := '';
                                    CompanIn.Get();
                                    AccName := Employee."First Name";
                                    if AccName = '' then
                                        AccName := Employee."Middle Name";
                                    msg := 'Dear ' + AccName + ', you have  been Selected to be a shortlisting Commitee member Of Job Title. ' + ' ' + '-' + rec."Job Description" + ' and you will play the role of the ' + Format(HRDiscipMemb.Roles) + '' + ' ' + '.Shortling will be done on ' + Format(HRDiscipMemb."Shortlisting Date") + '. Kindly for Further Information Contact the commission. Thank you.';
                                    EmailManager.Create(HRDiscipMemb."Company Mail", 'Job Notifications', msg, true);
                                    Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                                end;
                            until HRDiscipMemb.Next() = 0;
                        Message('Email sent successfully');

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord();
    end;

    trigger OnInit()
    begin
        "Required PositionsEditable" := true;
        PriorityEditable := true;
        ShortlistedEditable := true;
        "Requisition DateEditable" := true;
        "Job IDEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        HRJobRequirements: Record "HR Job Requirements";
        AppQualifications: Record "HR Applicant Qualifications";
        HRJobApplications: Record "HR Job Applications";
        Qualified: Boolean;
        Emailmessage: Codeunit "Email Message";
        EmailTable: Record "Email Account";
        Email: Codeunit Email;
        CompanIn: Record "Company Information";
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HR Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "HR Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: Label 'Short Listed Candidates';
        HRShorlistedApps: Record "HR Shortlisted Applicants";
        HRShortFilters: Record "HR Shortlisting Filters";
        HRJobApps: Record "HR Job Applications";
        HRAppQual: Record "HR Applicant Qualifications";
        RelatedQualification: Record "HR Job Related Requirements";
        found: Integer;
        HRApplicantRequirements: Record "HR Appplicants Requirements";
        HRApplicantRelatedQualifications: Record "HR Applic Related Requirements";


    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls();
    end;
}
