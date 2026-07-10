

page 52193574 "Store Reuisition Cr"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    // SourceTableView = where("Document Type" = const(SR));
    ApplicationArea = All;
    Caption = 'Requisition Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Received; Rec.Received)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("HOD Comments"; "HOD Comments")
                {
                    ApplicationArea = all;
                    Visible = value;
                }
                field("Approval Comments"; "Approval Comments")
                {
                    ApplicationArea = all;
                    Visible = value;
                }
            }
            part(Control1102755015; "Items Requsition Lines")
            {
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
                        Approvalmgt: Codeunit "Approvals Mgmt.";
                    begin
                        Approvalmgt.OpenApprovalEntriesPage(rec.RecordId);
                        // DocumentType := DocumentType::SReq;
                        // ApprovalEntries.SetRecordFilters(Database::"Store Requistion Header", DocumentType, Rec."No.");
                        // ApprovalEntries.Run();
                    end;
                }

                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Enabled = rec."Approval Status" = rec."Approval Status"::Open;
                    Visible = rec."Approval Status" = rec."Approval Status"::Open;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        if Confirm('Send this Stores Request for Approval?', true) = false then
                            exit;
                        /// ApprovalMgt.SendSRequestApprovalRequest(Rec)
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = all;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    Enabled = rec.Status = rec.Status::"Pending Approval";
                    trigger OnAction()
                    var
                        myInt: Integer;
                        Custom: Codeunit "Custom Approvals Codeunit";
                    begin
                        if not Confirm('Do you want to cancell this approval request?') then exit;
                        Rec.TestField(Status, rec.Status::"Pending approval");
                        VarVariant := Rec;
                        Custom.OnCancelDocApprovalRequest(VarVariant);
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
                    Caption = 'Approve';
                    Enabled = rec.Status = rec.Status::"Pending approval";
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
                action("Reject Approval")
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Enabled = rec.Status = rec.Status::"Pending Approval";
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

                    begin
                        // ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        if not Confirm('Do you want to reject this document?') then exit;
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        rec.Status := rec.Status::Rejected;
                        // rec.Modify();
                        CurrPage.Close();
                    end;
                }
                action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Enabled = rec.Status = rec.Status::Released;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec."Approval Status" := rec."Approval Status"::Open;
                            Rec.Modify();
                            Message('Document Reopened successfully');
                            CurrPage.Close();
                        end;

                    end;
                }

                separator(Action1102755035) { }
                action("Receipt Voucher S13")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Voucher S13';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    Visible = S13Visible;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(50083, true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                action("Print/Preview")
                {
                    Caption = 'Receipt Voucher S11';
                    Image = Print;
                    Promoted = true;
                    Visible = S11Visible;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        // Report.Run(Report::"Store Requisitions", true, true, Rec);
                        Report.Run(Report::"Receipt1 Voucher S11", true, true, Rec);

                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                action(GenerateBarcode)
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = "Report";
                    trigger OnAction()
                    var
                        myInt: Integer;
                        BarCodeString: Text;
                        barcodeSymb: Enum "Barcode Symbology 2D";
                        BarcodeFone: Interface "Barcode Font Provider 2D";
                        EncoredQR: Text;
                    begin
                        barcodeSymb := Enum::"Barcode Symbology 2D"::"QR-Code";
                        BarcodeFone := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                        BarCodeString := rec."No.";
                        EncoredQR := BarcodeFone.EncodeFont(BarCodeString, barcodeSymb);
                    end;
                }
                separator(Action13) { }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        if rec."Document Type" = "Document Type"::PR then
            S13Visible := true
        else
            S13Visible := false;
        if rec."Document Type" = "Document Type"::SR then
            S11Visible := true
        else
            S11Visible := false;
        if rec."Document Type" = "Document Type"::PR then
            value := false
        else
            value := true;

    end;

    trigger OnAfterGetRecord()
    begin
        if rec."Document Type" = "Document Type"::PR then
            S13Visible := true
        else
            S13Visible := false;
        if rec."Document Type" = "Document Type"::SR then
            S11Visible := true
        else
            S11Visible := false;
        if rec."Document Type" = "Document Type"::PR then
            value := false
        else
            value := true;

        // CurrPageUpdate();

        // Rec."Document Type" := Rec."Document Type"::SR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        // Rec."Document Type" := Rec."Document Type"::SR;


        // RequisitionHeader.Reset();
        // RequisitionHeader.SetRange("User ID", UserId);
        // RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        // // RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        // if RequisitionHeader.Find('-') then begin
        //     TotalC := RequisitionHeader.Count;
        //     if TotalC > 4 then
        //         Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        // end;

        // RequisitionHeader.Reset();
        // RequisitionHeader.SetRange("User ID", UserId);
        // RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        // RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        // // RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        // if RequisitionHeader.Find('-') then begin
        //     TotalC := RequisitionHeader.Count;
        //     if TotalC > 4 then
        //         Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        // end;
        if rec."Document Type" = "Document Type"::PR then
            value := false
        else
            value := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec.Validate(Rec."Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec.Validate(Rec."Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate(Rec."Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate(Rec."Shortcut Dimension 4 Code");

        UpdateControls();
        // Rec."Document Type" := Rec."Document Type"::SR;


        // RequisitionHeader.Reset();
        // RequisitionHeader.SetRange("User ID", UserId);
        // RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        // // RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        // if RequisitionHeader.Find('-') then begin
        //     TotalC := RequisitionHeader.Count;
        //     if TotalC > 4 then
        //         Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        // end;

        // RequisitionHeader.Reset();
        // RequisitionHeader.SetRange("User ID", UserId);
        // RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        // RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        // // RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        // if RequisitionHeader.Find('-') then begin
        //     TotalC := RequisitionHeader.Count;
        //     if TotalC > 4 then
        //         Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        // end;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin

        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        if rec."Document Type" = "Document Type"::PR then
            S13Visible := true
        else
            S13Visible := false;
        if rec."Document Type" = "Document Type"::SR then
            S11Visible := true
        else
            S11Visible := false;
        if rec."Document Type" = "Document Type"::PR then
            value := false
        else
            value := true;

        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        // Rec."Document Type" := Rec."Document Type"::SR

    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        S13Visible: Boolean;
        S11Visible: Boolean;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        TotalC: Integer;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Header";

        value: Boolean;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Lines";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    // procedure CurrPageUpdate()
    // begin
    //     xRec := Rec;
    //     UpdateControls();
    //     CurrPage.Update();
    // end;
}
