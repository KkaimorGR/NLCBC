page 52193576 "Returned/Rejcted Items"
{
    ApplicationArea = All;
    Caption = 'Returned/Rejcted Items';
    PageType = Card;
    SourceTable = "Returned /Rejected Goods";
    PromotedActionCategories = 'New,process,report,WorkFlows';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }
                field("Quantity Return/Rejected"; Rec."Quantity Return/Rejected")
                {
                    ToolTip = 'Specifies the value of the Quantity Return/Rejected field.', Comment = '%';
                }
                field("Total Inventory"; Rec."Total Inventory")
                {
                    ToolTip = 'Specifies the value of the Total Inventory field.', Comment = '%';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ToolTip = 'Specifies the value of the Staff No. field.', Comment = '%';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ToolTip = 'Specifies the value of the Staff Name field.', Comment = '%';
                }
                field("Department"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.', Comment = '%';
                }
                field("Workstation"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Workstation field.', Comment = '%';
                    Caption = 'Workstation';
                }
                field("County Name"; Rec."County Name")
                {
                    ToolTip = 'Specifies the value of the Work station Name field.', Comment = '%';
                }


                field("Date captured"; "Date captured")
                {
                    ApplicationArea = all;
                }
                field("Reason for Return"; "Reason for Return")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    Editable = False;
                }


            }
        }


    }
    actions
    {
        area(Processing)
        {
            action("Document Comments")
            {


                ApplicationArea = Basic, Suite;
                Image = ViewComments;
                Caption = 'Document Comments';
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Hr Appraisal Comments";
                RunPageLink = "Sal No." = field("No.");
            }
            action("Send Aproval")
            {
                ApplicationArea = Basic;
                Caption = 'Send For Approval';
                Image = SendApprovalRequest;
                Promoted = true;
                Enabled = rec.Status = rec.Status::Open;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send For Approvalion action.';
                trigger OnAction()
                begin
                    TestField(rec."Reason for Return");
                    if Confirm('Do you want to send this Document for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    CurrPage.Close();

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval';
                Image = Cancel;
                Promoted = true;
                Enabled = rec.Status = rec.Status::"Pending Approval";
                PromotedIsBig = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if not Confirm('Do you want to Cancel Approval request?') then exit;
                    Rec.TestField(Status, rec.Status::"Pending approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    CurrPage.Close();
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
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                    //     Error('cancell the approval Request');
                    if Confirm('Do you want to reopen this document?') = true then begin
                        rec.Status := rec.Status::Open;
                        Rec.Modify();
                        Message('Document Reopend successfully');
                        CurrPage.Close();
                    end;

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                var
                    Approvalmgt: Codeunit "Approvals Mgmt.";
                begin
                    Approvalmgt.OpenApprovalEntriesPage(rec.RecordId);
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

                    if Confirm('Do you want to Close this document?') then
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    CurrPage.close;
                end;
            }
            action("BC Attchements")
            {
                ApplicationArea = all;
                Caption = 'Document Attachment';
                Image = attach;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;


                begin

                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;

            }

        }
    }
    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}
