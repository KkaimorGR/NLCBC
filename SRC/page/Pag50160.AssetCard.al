

page 52193585 "Asset Card"
{
    DeleteAllowed = false;
    Caption = 'Asset  Card';
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";
    // SourceTableView = where("Document Type" = const("Asset Allocation"));
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Allocation Process,Document Management';

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
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }

                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Caption = 'Capture Date';
                }
                field("Received Date"; "Received Date")
                {
                    ApplicationArea = all;

                }
                field("Staff No."; "Staff No.")
                {
                    ApplicationArea = all;
                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = all;
                }

                field(RequestedID; "User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested  ID';
                }
                field(Store; Store)
                {
                    ApplicationArea = Basic;
                    Caption = 'Store';
                    Visible = false;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Type';
                    Editable = false;
                    Visible = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;

                }
                field(Allocated; Allocated)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control6; "AssetPurchase Requisition Lin")
            {
                Caption = 'Asset Issuing Lines';
                Visible = rec."Document Type" = rec."Document Type"::"Asset Allocation";
                SubPageLink = "Requistion No" = field("No.");
            }
            part(Control7; "Asset Returning Lines")
            {
                Caption = 'Asset Returning Lines';
                Visible = rec."Document Type" = rec."Document Type"::Returning;
                SubPageLink = "No." = field("No.");
            }

            part(Control8; "Asset Allocation Lines")
            {
                Caption = 'Asset Allocation Lines';
                Visible = rec."Document Type" = rec."Document Type"::"Department Allocation";
                SubPageLink = "No." = field("No.");
            }
            //added this
            part(Control9; "Asset Issue Request Line")
            {
                Caption = 'Asset Movement Lines';
                Visible = rec."Document Type" = rec."Document Type"::"Asset Transfer";
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control4; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control3; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control2; Notes)
            {
            }
            systempart(Control1; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Caption = 'Receipt Voucher S11';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                Visible = rec."Document Type" = rec."Document Type"::"Asset Allocation";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print/Preview action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("No.", Rec."No.");
                    // Report.Run(Report::"Store Requisitions", true, true, Rec);
                    Report.Run(Report::"Hr Assets S11", true, true, Rec);

                    Rec.Reset();

                    /*
                    RESET;
                    SETFILTER("No.","No.");
                    REPORT.RUN(39003922,TRUE,TRUE,Rec);
                    RESET;
                     */

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
                Visible = "Status" = "Status"::Open;
                trigger OnAction()
                begin
                    //TESTFIELD(Type);

                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    Varvariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
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
            action(UpdateAssetAllocation)
            {
                ApplicationArea = Basic;
                Caption = 'Update Asset Issuing';
                Image = UpdateXML;
                Visible = rec."Document Type" = rec."Document Type"::"Asset Allocation";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Allocated = true then Error('This Application %1 has already been issued', "No.");

                    if Status <> Status::Approved then
                        Error('The Application is not yet Approved');

                    TransferLinesReq.Reset;
                    TransferLinesReq.SetRange(TransferLinesReq."Requistion No", "No.");
                    if TransferLinesReq.Find('-') then begin
                        repeat
                            fasset.Reset;
                            fasset.SetRange(fasset."No.", TransferLinesReq."No.");
                            if fasset.Find('-') then begin
                                if TransferLinesReq."New Asset Location" <> '' then
                                    fasset."Location Name" := TransferLinesReq."New Asset Location";
                                // fasset."Global Dimension 2 Code" := TransferLinesReq."Global Dimension 2 Code";
                                // fasset."Responsible Office/Officer" := TransferLinesReq."Dimension 2 Name";
                                fasset."Staff No" := rec."Staff No.";
                                // fasset."Location Name":=TransferLinesReq.New
                                fasset."Staff Name" := rec."Staff Name";
                                fasset."Asset Movement Status" := fasset."asset movement status"::Allocated;
                                fasset.Modify;
                            end;
                            TransferLinesReq."Asset Code" := TransferLinesReq."No.";
                            TransferLinesReq.Modify;
                        until TransferLinesReq.Next = 0;
                        rec.Status := rec.Status::Issued;
                        rec.Allocated := true;
                        Modify;
                        Message('Updated successfully');
                    end;
                end;
            }
            group(DocumentManagement)
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Visible = false;
                    // Visible = "Status" = "Status"::Open;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action(ViewAttachedDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page Attachment;
                    //RunPageLink = IFMIS_No = field("No.");
                    RunPageMode = View;
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

    trigger OnDeleteRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // "Document Type" := "document type"::"Asset Allocation";
        // Type := Type::Allocation;
    end;

    trigger OnModifyRecord(): Boolean
    begin

        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // "Document Type" := "document type"::"Asset Allocation";
        // Type := Type::Allocation;
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit "Approvals Mgt";

        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Varvariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Line: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        HREmp: Record 52193433;
        TransferLinesReq: Record "Store Requisition TT Line";
        fasset: Record "Fixed Asset";


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

