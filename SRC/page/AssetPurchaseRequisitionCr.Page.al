
page 52194259 "Asset Purchase Requisition Cr"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    UsageCategory = Administration;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Document Attachment,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR),
                            "Action Type" = const(Asset));
    ApplicationArea = All;
    Caption = 'Asset Recieving Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    Enabled = false;
                }
                field("Request date"; Rec."Request date")
                {
                    Editable = StatusEditable;
                    Caption = 'Capture Date';
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                    Caption = 'Supplier No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                    Editable = false;
                    Caption = 'Supplier Name';
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
                field("Purchase Order No"; Rec."Purchase Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
                    Caption = 'PO No.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ToolTip = 'Specifies the value of the Employee Code field.';
                    Caption = 'Staff No.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Caption = 'Staff Name';
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    Caption = 'Location';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Delivery Note"; Rec."Delivery Note")
                {
                    ApplicationArea = all;
                    Caption = 'Delivery Note No.';
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    Caption = 'Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    // Editable = StatusEditable;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    Editable = StatusEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                    Caption = 'Store location';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = StatusEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                    Editable = false;
                    Caption = 'Receiver ID';
                }
                field("Action Type"; Rec."Action Type")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Approval Comments"; Rec."Approval Comments")
                {
                    ApplicationArea = all;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            part("Asset Receiving Lines"; "Asset Receiving Lines1")
            {
                Caption = 'Asset Receiving Lines';
                Editable = true;
                SubPageLink = "Requistion No" = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Post Purchase Requisition")
                {
                    Caption = 'Post Purchase Requisition';
                    Image = Post;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Post Purchase Requisition action.';
                    trigger OnAction()
                    begin

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        //IF Status<>Status::Released    THEN
                        // ERROR('The Document Has not yet been Approved');

                        GenJnline.Reset();
                        GenJnline.SetRange(GenJnline."Journal Template Name", 'ASSETS');
                        GenJnline.SetRange(GenJnline."Journal Batch Name", 'ACQ');
                        if GenJnline.Find('-') then
                            GenJnline.DeleteAll();

                        Rec.TestField("Purchasing Store");

                        ReqLine.Reset();
                        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                        Rec.TestField("Purchasing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Purchase Fixed Assets
                                LineNo := LineNo + 1000;
                                GenJnline.Init();
                                GenJnline."Journal Template Name" := 'ASSETS';
                                GenJnline."Journal Batch Name" := 'ACQ';
                                GenJnline."Line No." := LineNo;
                                //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                GenJnline."Document No." := Rec."No.";
                                GenJnline."FA No." := ReqLine."No.";
                                GenJnline.Validate(GenJnline."FA No.");
                                GenJnline."FA Posting Date" := Rec."Request date";
                                GenJnline.Description := ReqLine.Description;
                                GenJnline.Amount := ReqLine."Line Amount";
                                GenJnline."External Document No." := Rec."Order No";
                                GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                                GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                GenJnline.Validate("Shortcut Dimension 2 Code");
                                GenJnline.Insert(true);
                            until ReqLine.Next() = 0;

                            //Post Entries
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", FASetup."FA Jnl. Template Name");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", FASetup."FA Jnl. Batch Name");
                            ////CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                            Codeunit.Run(Codeunit::"FA. Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            //Post:=FALSE;
                            //Post:=JournlPosted.PostedSuccessfully();
                            //IF Post THEN BEGIN
                            //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                            ////Status:=Status::Posted;
                            // Rec.Modify();
                        end;
                        //END;
                    end;
                }

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        Appromgt: Codeunit "Approvals Mgmt.";
                    begin
                        Appromgt.OpenApprovalEntriesPage(rec.RecordId);

                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        ApprovalEntry: Record "Approval Entry";
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        // IF ApprovalMgt.SendPRequestApprovalRequest(Rec) THEN;
                        if Confirm('Send this Request for Approval?', true) = false then exit;
                        VarVariant := Rec;
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
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        if not Confirm('Do you want to Cancell this approval') then exit;
                        rec.TestField("Approval Comments");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();

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
                action("Document Attachement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scanned Attachement';
                    Image = Post;
                    Promoted = true;
                    Visible = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Document Attachement action.';
                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        attachLink: Record Attachments1;

                    begin

                        // RecRef.GetTable(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RunModal();
                        attachLink.Reset();
                        attachLink.setRange(attachLink.Document_No, Rec."Purchase Order No");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachment, attachLink)
                        else
                            Error('No attached links found');
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit SupplyChainWebServices;
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::HRNotice;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'HRMD', 50001, 'Memo');//tbc
                    end;
                }

                action("View EDMS Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        attachLink: Record Attachments1;
                        docAttachedNo: Code[20];
                        attachmentsPage: Page Attachments1;


                    begin

                        attachLink.Reset();
                        attachLink.setRange(attachLink.Document_No, Rec."No.");

                        if attachLink.FindSet then
                            Page.Run(Page::Attachments1, attachLink)
                        else
                            Error('No attached links found');

                        // DMSManagement.FnUploadPurchaseOrderDocs(Rec."No.", 'Purchase Order', Rec.RecordId);
                    end;
                }
                action("Receipt Voucher S13")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Voucher S13';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(52193508, true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                action("Genrate QR Tag")
                {
                    ApplicationArea = all;
                    Caption = 'Genrate QR Tag';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(52193425, true, true, Rec);

                    end;
                }


            }
            group("Document Management")
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        if CompanyInfo.Get() then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }


                action("Print/Previews")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(39005887, true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
            }
            group(DM)
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Links")
                {
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        if CompanyInfo.Get() then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action("View Attached Documents")
                {
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    // RunObject = Page 50010;
                    //                 RunPageLink = Field1=FIELD("No.");
                    RunPageMode = View;
                    ToolTip = 'Executes the View Attached Documents action.';
                }
                action(Sign)
                {
                    Caption = 'Sign';
                    Description = 'Digital Signature';
                    Image = Agreement;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Sign action.';

                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        CalcFields(TotalAmount);
    end;

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;
        CalcFields(TotalAmount);

        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Action Type" := Rec."Action Type"::Asset
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Action Type" := Rec."Action Type"::Asset;
        Rec."Document Type" := Rec."Document Type"::PR;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));

        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /*
        "Responsibility Center" := UserMgt.GetPurchasesFilter();
         //Add dimensions if set by default here
         "Global Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
         VALIDATE("Global Dimension 1 Code");
         "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
         VALIDATE("Shortcut Dimension 2 Code");
         "Shortcut Dimension 3 Code":=UserMgt.GetSetDimensions(USERID,3);
         VALIDATE("Shortcut Dimension 3 Code");
         "Shortcut Dimension 4 Code":=UserMgt.GetSetDimensions(USERID,4);
         VALIDATE("Shortcut Dimension 4 Code");
        */

        UpdateControls();


        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Action Type" := Rec."Action Type"::Asset;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
         */

    end;


    trigger OnOpenPage()
    begin
        CalcFields(TotalAmount);
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        Rec."Document Type" := Rec."Document Type"::PR

    end;

    var
        //ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Lines";
        GenJnline: Record "FA Journal Line";
        LineNo: Integer;
        VarVariant: Variant;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        ApprovalEntries: Page "Approval Entries";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        StatusEditable: Boolean;
        FASetup: Record "FA Journal Setup";
        CompanyInfo: Record "Company Information";
        Link: Text[250];

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requisition TT Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;

    //[Scope('Internal')]
    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;

    local procedure replaceString(String: Text[50]; FindWhat: Text[10]; ReplaceWith: Text[10]) NewString: Text
    begin
        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;
    end;
}

#pragma implicitwith restore

