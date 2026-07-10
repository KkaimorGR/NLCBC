
Page 52193547 "Items Requisitions Lists"
{
    Caption = 'Items PO List';
    CardPageID = "Items  Requisition Cards";
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    // SourceTableView = where("Document Type" = const(PR),
    //                         "Action Type" = const(Item));
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Request date"; "Request date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Capture Date';
                }
                field("Request Description"; "Request Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("Employee Code"; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier No';
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Name';
                }


                field("Purchasing Store"; "Purchasing Store")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receiver ID';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Purchase Order No"; "Purchase Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Note"; "Delivery Note")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Invoice No"; "Invoice No")
                {
                    ApplicationArea = all;
                }
                field("Budget Center Name"; "Budget Center Name")
                {
                    ApplicationArea = all;
                    Caption = 'Responsibility Center Name';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = all;
                    Visible = False;
                }
                field("Order No"; "Order No")
                {
                    ApplicationArea = all;
                    Visible = False;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = all;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = all;
                    Visible = False;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = all;
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = all;
                }

                field("Date Received"; "Date Received")
                {
                    ApplicationArea = all;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
                }
                field("Approval Comments"; "Approval Comments")
                {
                    ApplicationArea = all;
                }


            }
        }
        area(factboxes)
        {
            systempart(Control9; Links)
            {
            }
            part(Control8; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control7; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("<Action1102755026>")
            {
                Caption = '&Functions';
                action("<Action1102755028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Store Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if Status = Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Status <> Status::Released then
                            Error('The Document Has not yet been Approved');


                        TestField("Issuing Store");
                        ReqLine.Reset;
                        ReqLine.SetRange(ReqLine."Requistion No", "No.");
                        TestField("Issuing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Issue
                                if InventorySetup.Get then begin
                                    InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                    InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                    GenJnline.Reset;
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    if GenJnline.Find('-') then GenJnline.DeleteAll;
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init;
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."entry type"::"Negative Adjmt.";
                                    GenJnline."Document No." := "No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := "Issuing Store";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := "Request date";
                                    GenJnline.Description := ReqLine.Description;
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    GenJnline."Reason Code" := '221';
                                    GenJnline.Validate("Reason Code");
                                    GenJnline.Insert(true);

                                    ReqLine."Request Status" := ReqLine."request status"::Posted;

                                end;
                            until ReqLine.Next = 0;
                            //Post Entries
                            GenJnline.Reset;
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            Post := false;
                            Post := JournlPosted.PostedSuccessfully();
                            // if Post then begin
                            //     ReqLine."Request Status" := ReqLine."request status"::Posted;
                            //     ReqLine.Modify();
                            // end;
                        end;
                    end;
                }
                separator(Action1102755018)
                {
                }
                action("<Action1102755032>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := Documenttype::GRN;
                        ApprovalEntries.SetRecordFilters(Database::"Store Requistion Headers", DocumentType, "No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("<Action1102755030>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        ///IF ApprovalMgt.SendSRequestApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1102755031>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //// IF ApprovalMgt.CancelSRRequestApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                separator(Action1102755014)
                {
                }
                action("<Action1102755036>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requsition';
                    Image = Print;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(50082, true, true, Rec);
                        Reset;
                    end;
                }
                action(GRN)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Voucher S13';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(50083, true, true, Rec);
                        Reset;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        "Approval Status" := Status
    end;

    trigger OnAfterGetRecord()
    begin

        "Document Type" := "document type"::PR;
        "Approval Status" := Status
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        
        IF UserMgt.GetSetDimensions(USERID,2) <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Shortcut Dimension 2 Code",UserMgt.GetSetDimensions(USERID,2));
          FILTERGROUP(0);
        END;
        */

        "Document Type" := "document type"::PR;
        "Approval Status" := Status

    end;

    var
        UserMgt: Codeunit 52193453;
        ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        "Approval Status": Option Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Lines";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Requistion No", "No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;
}

