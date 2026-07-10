
Page 52193478 "Asset Incidence Reporting Card"
{
    DeleteAllowed = false;
    // Editable = false;
    PageType = Card;
    PromotedActionCategories = 'New,Report,Process,Workflow Process,Documents';
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where("Document Type" = const("Asset Incidence"));

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
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestedID; "User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested  ID';
                }
                field(IssuingAdminAsst; "Issuing Admin/Asst")
                {
                    ApplicationArea = Basic;
                }
                field(IssuingAdminAsstName; "Issuing Admin/Asst Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                // field(DocumentType; "Document Type")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Description"; "Request Description")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Description';
                }
            }
            part(Control3; "Asset Incidence Reporting Line")
            {
                Caption = 'Asset Incidence Reporting Lines';
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1; Links)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = "Status" = "Status"::Open;
                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                begin
                    //TESTFIELD(Type);
                    if not LinesExists1 then
                        Error('There are no Lines created for this Document');
                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    Varvariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    ApprovalEntry.Reset();
                    ApprovalEntry.SetRange("Document No.", rec."No.");
                    if ApprovalEntry.Find('-') then begin
                        repeat
                            ApprovalEntry."Document Description" := rec."Request Description";
                            ApprovalEntry.Modify();
                        until ApprovalEntry.Next() = 0;
                    end;
                    CurrPage.Close();
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
                Visible = "Status" = "Status"::"Pending Approval";

                trigger OnAction()
                begin
                    IF CONFIRM('Cancel this Application?', TRUE) = FALSE THEN EXIT;
                    Varvariant := rec;
                    CustomApprovals.OnCancelDocApprovalRequest(Varvariant);
                    CurrPage.Close();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Appromgt: Codeunit "Approvals Mgmt.";
                begin
                    Appromgt.OpenApprovalEntriesPage(rec.RecordId);
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
                Visible = rec.Status = rec.Status::"Pending approval";
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
                    DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 52193551, 'Asset Allocation', '');

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

            action(SubmitReport)
            {
                ApplicationArea = Basic;
                Caption = 'Submit Report';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    if Confirm('Submit this Asset/s Incidence Report?', true) = false then exit;
                    // PortalWebService.ReportAssetIncidences("No.");
                end;
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
        "Document Type" := "document type"::"Asset Incidence";

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Issuing Admin/Asst" := HREmp."No.";
            "Issuing Admin/Asst Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Message('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Asset Incidence";

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Issuing Admin/Asst" := HREmp."No.";
            "Issuing Admin/Asst Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Type := Type::Incidence;
            Message('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
    end;

    var
        RecHeader: Record 52193494;
        Varvariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Line: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        HREmp: Record "HR Employees";
        PortalWebService: Codeunit PortalWebService;


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

