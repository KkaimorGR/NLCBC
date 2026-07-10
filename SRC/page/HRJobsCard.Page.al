
page 52193618 "HR Jobs Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Document Attachment,Job,Workflow Process,Document';
    SourceTable = "HR Jobs";
    ApplicationArea = All;
    Caption = 'HR Jobs Card';
    layout
    {
        area(Content)
        {
            group(General)
            {

                Editable = Pageedita;
                Caption = 'General';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                group(Supervisor)
                {

                    Editable = Pageedita;
                    Caption = 'Supervisor';

                    field("Position Reporting to"; Rec."Position Reporting to")
                    {
                        ApplicationArea = Basic;
                        Importance = Promoted;
                        ToolTip = 'Specifies the value of the Position Reporting to field.';
                    }
                    field("Position Reporting Name"; Rec."Position Reporting Name")
                    {
                        ApplicationArea = Basic;
                        //ShowCaption = false;
                    }

                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Occupied Positions field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                group(Control13)
                {
                    Editable = Pageedita;
                    Caption = 'Responsibility Centre';

                    field("Responsibility Center"; Rec."Responsibility Center")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Department';
                        ToolTip = 'Specifies the value of the Responsibility Center field.';
                    }
                    field("Responsibility Center Name"; Rec."Responsibility Center Name")
                    {
                        ApplicationArea = Basic;
                        Visible = true;
                        Caption = 'Department Name';
                        ToolTip = 'Specifies the value of the Responsibility Center Name field.';
                    }

                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Requisitions field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Attention;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Attention;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Dimensions1)
            {
                Caption = 'Dimensions ';
                //Editable = Pageedita;


                group(Dimension2)
                {
                    Caption = 'Dimension 1';
                    Editable = Pageedita;
                    field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    }
                    field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                    {
                        ApplicationArea = Basic;
                        //ShowCaption = false;
                    }
                }

                //Editable = Pageedita;

                group("Dimension 2")
                {
                    Caption = 'Dimension 2';
                    Editable = Pageedita;
                    field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    }
                    field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                    {
                        ApplicationArea = Basic;
                        //ShowCaption = false;
                    }
                }


            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Jobs Factbox")
            {
                SubPageLink = "Job Description" = field("Job ID");
            }
            systempart(Control1102755006; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Job)
            {
                action("Monthy Salary Scale")
                {
                    ApplicationArea = Basic;
                    Caption = 'Monthy Salary Scale';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "Monthly salary Scale";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Responsibilities action.';
                }
                action(Occupants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Occupants';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Job Occupants";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Occupants action.';
                }
            }
            group(Functions)
            {
                Caption = 'Workflow Process';

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    Visible = rec.Status = Status::New;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::New);
                        Rec.TestField(Rec."No of Posts");
                        Rec.TestField(Rec."Responsibility Center");
                        Rec.CalcFields(Rec."No. of Requirements");
                        if Rec."No. of Requirements" = 0 then
                            Error('Please Specify the Job Requirements');
                        Rec.CalcFields(Rec."No. of Responsibilities");
                        if Rec."No. of Responsibilities" = 0 then
                            Error('Please Specify the Job Responsibilities');

                        if Confirm('Send this Job Title for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                        //AppMgmt.SendJobApprovalRequest(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;
                    Visible = rec.Status = Status::"Pending Approval";
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                        //AppMgmt.CanceljobAppRequest(Rec,true,true);
                    end;
                }
                action("Reopen Document")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Caption = 'Reopen Document';
                    PromotedOnly = true;
                    ToolTip = 'Executes the Reopen Document action.';
                    trigger OnAction()
                    begin
                        if Confirm('Do you want to reopen this Document?') = true then
                            if (Rec.Status = Rec.Status::Rejected) or (rec.Status = rec.Status::Approved) or (rec.Status = rec.Status::"Pending Approval") then begin
                                Rec.Status := Rec.Status::New;
                                Rec.Modify();
                                Message('Document has been Re-Openned');
                                CurrPage.Close();
                            end;
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Caption = 'Approve Document';
                    Visible = rec.Status = Status::"Pending Approval";
                    PromotedOnly = true;
                    ToolTip = 'Executes the Approval of Document action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);


                    end;

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        Appromg: Codeunit "Approvals Mgmt.";
                    begin
                        Appromg.OpenApprovalEntriesPage(rec.RecordId);

                    end;
                }
                action(generateP9)
                {
                    ApplicationArea = Basic;
                    Caption = 'generateP9';
                    Image = Approvals;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        Appromg: Codeunit "Approvals Mgmt.";
                        portaweb: Codeunit PortalWebService;
                    begin
                        // Appromg.OpenApprovalEntriesPage(rec.RecordId);
                        portaweb.GenerateP9Report('2020', 'NLC20150322');

                    end;
                }
                action(StaffFile)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    var
                        DMSInt: Record DMS;
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::"Job Card");
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Job ID");
                    end;
                }

            }
            group(Documents)
            {
                Caption = 'Documents';
                action("Document Attachment")
                {
                    ApplicationArea = all;
                    Caption = 'Document Attachment';
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    // EmployeeRec: Record "HR Employee Requisitions";
                    begin

                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;

                }
                action("Appraisal Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Document Comments';
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Job ID");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        Rec.Validate(Rec."Vacant Positions");
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        UpdateControls();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        UpdateControls();
    end;

    var
        HREmployees: Record "HR Employees";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //AppMgmt: Codeunit "Export F/O Consolidation";
        UserSetup: Record "User Setup";
        Pageedita: Boolean;

    local procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then
            Pageedita := true
        else
            Pageedita := false;
    end;


    procedure RecordLinkCheck(job: Record "HR Jobs") RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        TableCaption: RecordId;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        TableCaption := objRecord_Link.RecordId;
        objRecordLnk.Reset();
        objRecordLnk.SetRange(objRecordLnk."Record ID", TableCaption);
        if objRecordLnk.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}
