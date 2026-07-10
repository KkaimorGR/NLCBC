page 52193529 "Hodling Area"
{
    ApplicationArea = All;
    Caption = 'Holding Area';
    PageType = Card;
    SourceTable = "Holding Area";
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Document Attachment';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("H Code"; Rec."H Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Date Captured"; Rec."Date Captured")
                {
                    ToolTip = 'Specifies the value of the Date Captured field.', Comment = '%';
                    Editable = false;
                }
                field("PO.No"; "PO.No")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ToolTip = 'Specifies the value of the Staff No field.', Comment = '%';
                    Editable = false;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ToolTip = 'Specifies the value of the Staff Name field.', Comment = '%';
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.', Comment = '%';
                }

                field(Suplier; Suplier)
                {
                    ApplicationArea = all;
                    Caption = 'Supplier';
                }
                field("Supplier Name"; "Supplier Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    Editable = false;
                }
            }
            part("holding Lines"; "Holding Lines")
            {
                ApplicationArea = all;
                SubPageLink = "Holding No" = field("H Code");
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("Send Aproval")
            {
                ApplicationArea = Basic;
                Caption = 'Send For Inspection';
                Image = SendApprovalRequest;
                Promoted = true;
                Enabled = rec.Status = rec.Status::Open;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send For Inspection action.';
                trigger OnAction()
                begin
                    if Confirm('Do you want to send this Document for Inspection?', true) = false then
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
                Caption = 'Cancel Inspection';
                Image = Cancel;
                Promoted = true;
                Enabled = rec.Status = rec.Status::"Pending Approval";
                PromotedIsBig = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Cancel Inspection Request action.';
                trigger OnAction()
                begin
                    if not Confirm('Do you want to Cancel Inspection request?') then exit;
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
                Caption = 'Close Inspection';
                Visible = rec.Status = rec.Status::"Pending approval";
                PromotedOnly = true;
                ToolTip = 'Executes the Approval of Document action.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Holdinglines: Record "Holding Lines";
                begin
                    Holdinglines.Reset();
                    Holdinglines.SetRange("Holding No", rec."H Code");
                    if Holdinglines.FindFirst() then begin
                        repeat
                            if Holdinglines.Closed = false then
                                Error('Kindly close all inspection on lines');
                        until Holdinglines.Next() = 0;
                    end;

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
                    EmployeeRec: Record "HR Employee Requisitions";

                begin

                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;

            }
            action(Notification)
            {
                ApplicationArea = Basic;
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Enabled = rec.Status = rec.Status::Open;
                Caption = 'Send Notification';
                // Visible = rec.Status = rec.Status::"Pending approval";
                PromotedOnly = true;
                ToolTip = 'Executes the Approval of Document action.';
                trigger OnAction()
                var
                    EmailParameters: Record "HR E-Mail Parameters";
                    CompanyIInf: Record "Company Information";
                    EmailManger: Codeunit "Email Message";
                    Email: Codeunit Email;
                    msg: Text;
                begin
                    EmailParameters.Reset();
                    EmailParameters.SetRange("Associate With", EmailParameters."Associate With"::Procurement);
                    if EmailParameters.FindFirst() then begin
                        msg := EmailParameters.Body;
                        if EmailParameters."Recipient 1" <> '' then begin
                            EmailManger.Create(EmailParameters."Recipient 1", 'Procurement Notification', msg, true);
                            Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                        end;
                        if EmailParameters."Recipient 2" <> '' then begin
                            EmailManger.Create(EmailParameters."Recipient 1", 'Procurement Notification', msg, true);
                            Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                        end;
                        if EmailParameters."Recipient 3" <> '' then begin
                            EmailManger.Create(EmailParameters."Recipient 1", 'Procurement Notification', msg, true);
                            Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                        end;


                    end;

                end;
            }
            action("Inspection Comittee")
            {
                ApplicationArea = Basic;
                Caption = 'Inspection Comittee';
                Image = SelectField;
                Promoted = true;
                Enabled = rec.Status = rec.Status::"Pending Approval";
                PromotedCategory = Category4;
                RunObject = page "Inspection Committee";
                RunPageLink = "Requisition No" = field("H Code");
                ToolTip = 'Executes theInspection Comittee action.';
                trigger OnAction()
                begin

                end;
            }
            action("Notify Committee")
            {
                ApplicationArea = Basic;
                Caption = 'Notify Inspection Comittee';
                Image = SelectField;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    AccName: Text;
                    HRDiscipMemb: Record "Interview Pannel";
                    Employee: Record "HR Employees";
                    Emailmessage: Codeunit "Email Message";
                    EmailManager: Codeunit "Email Message";
                    msg: Text;
                    MailParam: Record "HR E-Mail Parameters";
                begin
                    if not Confirm('Do you want to invite the panel for Inspection of goods?') then exit;
                    MailParam.Reset();
                    MailParam.SetRange("Associate With", MailParam."Associate With"::"Activity Notifications");
                    if MailParam.Find('-') then
                        msg := MailParam.Body;
                    HRDiscipMemb.Reset();
                    HRDiscipMemb.SetRange(HRDiscipMemb."Requisition No", Rec."H Code");
                    if HRDiscipMemb.Find('-') then
                        repeat
                            if Employee.Get(HRDiscipMemb."Staff No") then begin
                                AccName := '';
                                CompanIn.Get();
                                AccName := Employee."First Name";
                                if AccName = '' then
                                    AccName := Employee."Middle Name";
                                EmailManager.Create(HRDiscipMemb."Company Mail", 'Job Notifications', msg + ' and your Role is ' + Format(HRDiscipMemb.Roles) + '', true);
                                Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                            end;
                        until HRDiscipMemb.Next() = 0;
                    Message('Email sent successfully');

                end;
            }


        }
    }
    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CompanIn: Record "Company Information";
}
