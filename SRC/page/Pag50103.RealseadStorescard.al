 

page 52193527 "Realsead Stores card"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(SR));
    ApplicationArea = All;
    Caption = 'Store Requisition Card';
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
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reopened By";"Reopened By")
                {
                    ApplicationArea=all;
                }
                field("HOD Comments";"HOD Comments")
                {
                    ApplicationArea=all;
                }
                field("Approval Comments";"Approval Comments")
                {
                    ApplicationArea=all;
                }
            }
            part(Control1102755015; "Store Lines")
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
                separator(Action1102755029) { }
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
                    end;
                }
                 action("<Action1102755028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Store Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Post Store Requisition action.';
                    trigger OnAction()
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');


                        Rec.TestField(Rec."Issuing Store");
                        ReqLine.Reset();
                        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                        Rec.TestField(Rec."Issuing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Issue
                                if InventorySetup.Get() then begin
                                    InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                    InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                    GenJnline.Reset();
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    if GenJnline.Find('-') then
                                        GenJnline.DeleteAll();
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    //  GenJnline."Inventory Posting Group":=InventorySetup.INvt;
                                    // if GenJnline."Inventory Posting Group"='' then
                                    // GenJnline."Inventory Posting Group":='GOODS';
                                    // GenJnline."Gen. Prod. Posting Group":=ReqLine."Gen. Prod. Posting Group";
                                    if GenJnline."Gen. Prod. Posting Group"='' then
                                    GenJnline."Gen. Prod. Posting Group":='GOODS';
                                    // GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := Rec."Issuing Store";
                                    // GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Rec."Request date";
                                    GenJnline."Inventory Posting Group":=ReqLine."Gen. Prod. Posting Group";
                                    GenJnline.Description := ReqLine.Description;
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                                     GenJnline.Quantity:=ReqLine.Quantity;
                                     GenJnline."Quantity (Base)":=ReqLine.Quantity;
                                    // GenJnline.Validate("Unit Amount");
                                    // GenJnline."Reason Code" := '221';
                                    // GenJnline.Validate("Reason Code");
                                    GenJnline.Insert(true);

                                    // ReqLine."Request Status":=ReqLine."request status"::"7";

                                end;
                            until ReqLine.Next() = 0;
                            //Post Entries
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            // Post := true;
                            rec.Status:=rec.Status::Posted;
                            rec.Modify();
                            // Post := JournlPosted.PostedSuccessfully();
                            //if Post then
                            //     ReqLine.ModifyAll(ReqLine."Request Status",ReqLine."request status"::"7");
                        end;
                    end;
                }
                 action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec."Approval Status" := rec."Approval Status"::Open;
                            rec.Status:=rec.Status::Open;
                            rec."Reopened By":=UserId;
                            Rec.Modify();
                            Message('Document Reopend successfully');
                            CurrPage.Close();
                        end;

                    end;
                }
              action("Document Attachement")
              {
                 ApplicationArea = Basic;
                    Caption = 'Document Attachement';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Document Attachement action.';
                trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        EmployeeRec: Record "HR Employee Requisitions";
                    begin

                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
              }

                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Visible=false;
                    PromotedCategory = Category4;
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
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    Visible=false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                action(Reject)
                {
                    trigger OnAction()
                    begin
                        rec.TestField(Received,false);
                         if Confirm('Reject this Items contained in this Requisition?', true) = false then
                            exit;

                        if Rec.Received = false then begin
                            Rec.Rejected := true;
                            Rec."Rejected By" := UserId;
                            Rec."Rejected Date" := WorkDate();
                            //MODIFY;
                            Message('Item(s) rejected Successful');
                        end
                        
                    end;
                }
                separator(Action1102755035) { }
                action("Print/Preview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Voucher S11';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(50056, true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                separator(Action13) { }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        // CurrPageUpdate();

        Rec."Document Type" := Rec."Document Type"::SR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.Find('-') then begin
            TotalC := RequisitionHeader.Count;
            if TotalC > 4 then
                Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        end;

        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.Find('-') then begin
            TotalC := RequisitionHeader.Count;
            if TotalC > 4 then
                Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        end;
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
        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.Find('-') then begin
            TotalC := RequisitionHeader.Count;
            if TotalC > 4 then
                Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        end;

        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.Find('-') then begin
            TotalC := RequisitionHeader.Count;
            if TotalC > 4 then
                Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
        end;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin

        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        Rec."Document Type" := Rec."Document Type"::SR

    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ReqLine: Record "Store Requisition TT Line";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        TotalC: Integer;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Header";


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
