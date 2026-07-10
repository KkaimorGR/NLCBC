
Page 52193510 "HR Asset Issue Card"
{
    Caption = 'Asset Movement Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Document Attachment';
    SourceTableView = where(Type = const(Issue));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Description"; "Request Description")
                {
                    ApplicationArea = all;
                    Caption = 'Description';
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Asset Issue Request Line")
            {
                Editable = Line;
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control21; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control20; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Approvalmgt: Codeunit "Approvals Mgmt.";
                begin
                    Approvalmgt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = IsVisible;

                trigger OnAction()
                begin
                    if not LinesExists then
                        Error('There are no Lines created for this Document');
                    if not Confirm('Do you want to send this document for approval?') then exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    CurrPage.Close();
                    // if ApprovalMgt.SendHrAssetransAppApprovalReq(Rec) then;
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = IsCancel;

                trigger OnAction()
                begin
                    if Confirm('Do you want to cancel this approval request?') then begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                    /// if ApprovalMgt.CancelHrAssetransAppRequest(Rec,true,true) then;
                end;
            }
            action("Reject Approval")
            {
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";

                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    rec.Status := rec.Status::Rejected;
                    rec.Modify();
                    CurrPage.Close();
                end;
            }

            action(PrintReview)
            {
                ApplicationArea = Basic;
                Caption = 'Print Review';
                Visible = false;

                trigger OnAction()
                begin

                    RecHeader.Reset;
                    RecHeader.SetFilter(RecHeader."No.", xRec."No.");
                    Report.Run(39004371, true, true, RecHeader);
                end;
            }
            action(UpdateAssetMovement)
            {
                ApplicationArea = Basic;
                Caption = 'Update Asset Movement';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;


                trigger OnAction()
                begin

                    /*
                   IF Status<>Status::Approved THEN
                       ERROR('The Application is not yet Approved');

                    TransferLinesReq.RESET;
                    TransferLinesReq.SETRANGE(TransferLinesReq."No.","No.");
                    IF TransferLinesReq.FIND('-') THEN BEGIN
                       REPEAT
                          fasset.RESET;
                          fasset.SETRANGE(fasset."No.",TransferLinesReq."Asset No.");
                       IF fasset.FIND('-') THEN BEGIN
                          fasset."Global Dimension 2 Code":=TransferLinesReq."Global Dimension 2 Code";
                          fasset."Responsible Department  Name" :=TransferLinesReq."Dimension 2 Name";
                          fasset."Asset Movement Status":=fasset."Asset Movement Status"::Allocated;
                          fasset.MODIFY;
                      END;
                     UNTIL TransferLinesReq.NEXT=0;
                     Allocated:=TRUE;
                     MODIFY;
                     END;
                    */

                end;
            }
            group("Document Attsachment")
            {
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        DMSManagement: Codeunit PortalWebService;
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::Requisition;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 52193494, 'Asset Movement', '');

                    end;
                }
                action("View EDMS Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        attachLink: Record Attachments1;
                    begin

                        attachLink.setRange(attachLink.Document_No, Rec."No.");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachment, attachLink)
                        else
                            Error('No attached links found');
                    end;
                }

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Updatecontrol;
    end;

    trigger OnAfterGetRecord()
    begin
        Updatecontrol;
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin


        // "Document Type" := "document type"::"Asset Transfer";
        Type := Type::Issue
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        // "Document Type" := "document type"::"Asset Transfer";
        Type := Type::Issue
    end;

    trigger OnOpenPage()
    begin
        IsVisible := true;
        IsCancel := true;
        IsIssue := true;
        if Status <> Status::Open then
            IsVisible := false;

        if Status <> Status::"Pending Approval" then
            IsCancel := false;

        if Status <> Status::Approved then
            IsIssue := false
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        VarVariant: Variant;
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Line: Boolean;
        TransferLinesReq: Record "HR Asset Transfer Lines";
        fasset: Record "Fixed Asset";
        IsVisible: Boolean;
        IsCancel: Boolean;
        IsIssue: Boolean;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";


    procedure Updatecontrol()
    begin
        /*
        IF Status=Status::Open THEN BEGIN
        Edit:=TRUE;
        Line:=TRUE;
        END ELSE IF Status=Status::"Pending Approval" THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END ELSE IF Status=Status::Approved THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END
         */

    end;
}

