
page 52194365 "Clearance Certificate Card"
{
    PageType = Card;
    SourceTable = "Clearance Certificate";
    ApplicationArea = All;
    Caption = 'Clearance Certificate Card';
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Clearance Comments';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Clearance No."; Rec."Clearance No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Clearance No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("P/No"; Rec."P/No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the P/No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }

                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Reasons Of Leaving"; Rec."Reasons Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons Of Leaving field.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Separation No"; "Separation No")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("USER ID"; Rec."USER ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Captured By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the USER ID field.';
                }
                field("Cleared By"; "Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Clearance Cleared"; "Clearance Cleared")
                {
                    ApplicationArea = all;
                    Editable = false;
                }


            }
            group("Finance and Cooparate planning")
            {
                field(Imprest; Rec.Imprest)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."FN Cleared By" := UserId;
                    end;
                }
                field("Petty Cash"; Rec."Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."FN Cleared By" := UserId;
                    end;
                }
                field("Fn Cleared"; "Fn Cleared")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }

            group("Human Resource and Administration")
            {
                Caption = 'Human Resource and Administration';
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."HR Cleared By" := UserId;
                    end;
                }
                field("Car Loan"; Rec."Car Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan field.';
                }
                field(Mortgage; Rec.Mortgage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage field.';
                }
                field("Working Tools"; Rec."Working Tools")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Working Tools field.';
                }
                field("Office & Desk Keys"; Rec."Office & Desk Keys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office & Desk Keys field.';
                }
                field("Car Keys"; Rec."Car Keys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Keys field.';
                }
                field("Other Fin"; Rec."Other Fin")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Other Fin field.';
                }
                field("NLC ID Card"; Rec."NLC ID Card")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NLC ID Card field.';
                }
                field("Medical Card"; Rec."Medical Card")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Card field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }

                field("Final Wealth"; "Final Wealth")
                {
                    ApplicationArea = all;
                }
                field("Comments HR"; Rec."Comments HR")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments HR field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."HR Cleared By" := UserId;
                    end;
                }
                field("Hr Cleared"; "Hr Cleared")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group(ICT)
            {

                field(Laptop; Rec.Laptop)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Laptop field.';
                }
                field("Ipad/Tablet"; Rec."Ipad/Tablet")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ipad/Tablet field.';
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone field.';
                }
                field("ICT & Security Clearance"; Rec."ICT & Security Clearance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ICT & Security Clearance field.';
                }
                field("Others ICT"; Rec."Others ICT")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Others ICT field.';
                }
                field("ICT Computer"; "ICT Computer")
                {
                    ApplicationArea = all;
                }
                field("Comments ICT"; "Comments ICT")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."ict Cleared By" := UserId;
                    end;
                }
                field("ICT Cleared"; "ICT Cleared")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group("Supply Chain Management")
            {
                field(Store; Rec.Store)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store field.';
                }
                field("Comments NLIMS"; "Comments NLIMS")
                {
                    ApplicationArea = all;
                    Caption = 'Store Comments';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Store Cleared By" := UserId;
                    end;
                }
                field("Supply Cleared"; "Supply Cleared")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Other SCM field.';
                }
            }
            group("Corporate Communication and advocacy")
            {
                field(Library; Rec.Library)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Library field.';
                }
                field("Other Comm"; Rec."Other Comm")
                {
                    ApplicationArea = Basic;
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Other Comm field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Communication Cleared By" := UserId;
                    end;
                }
            }
            group("Land Administration and management")
            {
                field(LAdm; Rec.LAdm)
                {
                    ApplicationArea = Basic;
                    Caption = 'Land ADM Comments';
                    ToolTip = 'Specifies the value of the LAdm field.';
                }
                field("Land ADM Comments"; "Land ADM Comments")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Land ADM Cleared By"; "Land ADM Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }
            group(NLIMS1)
            {
                Visible = false;
                field(NLIMS; Rec.NLIMS)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NLIMS field.';
                }

            }
            group("Legal Affairs & Dispute resolution")
            {
                Caption = 'Legal Affairs & Dispute resolution';
                field(Legal; Rec.Legal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Leqal Cleared By" := UserId;
                    end;
                }
                field("Leqal Cleared By"; "Leqal Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }
            group("Land Use Planningg & Research")
            {
                field("Research & Advocacy Comments"; Rec."Research & Advocacy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research & Advocacy field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Land Use Cleared By" := UserId;
                    end;
                }
                field("Land Use Cleared By"; "Land Use Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }
            group("Natural Resource1")
            {
                Visible = false;
                field("Natural Resource"; Rec."Natural Resource")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Natural Resource field.';
                }
            }
            group("Valuation & Taxation1")
            {
                Caption = 'Valuation & Taxation';
                field("Valuation & Taxation"; Rec."Valuation & Taxation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation & Taxation field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Taxation Cleared By" := UserId;
                    end;
                }
                field("Taxation Cleared By"; "Taxation Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group("Survey Adjudication & Settleme")
            {
                Visible = false;
                field(Survey; Rec.Survey)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey field.';
                }
            }
            group("County Coordination Office")
            {
                Caption = 'County Coordination Office';
                field(CLMB; Rec.CLMB)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CLMB field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."County Cleared By" := UserId;
                    end;

                }
                field("County Cleared By"; "County Cleared By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group("Audit & Risk Management")
            {
                field("Audit Cleared"; "Audit Cleared")
                {
                    ApplicationArea = all;
                }
                field(Audit; Rec.Audit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec."Audit Cleared By" := UserId;
                    end;
                }
                field("Audit Cleared By"; "Audit Cleared By")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Enabled = not OpenApprovalEntriesExist;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()

                    begin
                        rec.TestField(Status, rec.Status::New);
                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Enabled = OpenApprovalEntriesExist;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        rec.TestField(Status, rec.Status::"Pending Approval");
                        if Confirm('Cancel the approval request?') = true then begin
                            VarVariant := Rec;
                            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        end;
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
                        if rec.Status = rec.Status::"Pending approval" then
                            Error('Cancell the approval request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec.Status := rec.Status::New;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        Approv: Codeunit "Approvals Mgmt.";

                    begin
                        Approv.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action("Clearance Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Clearance Comments';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Separation No");
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        ControlPPage();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        ControlPPage();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        ControlPPage();

    end;

    local procedure ControlPPage()
    var
        myInt: Integer;
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        // if rec.Status <> rec.Status::New then
        //     CurrPage.Editable := false
        // else
        //     CurrPage.Editable := true;

    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Requisition,ImpSurr,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails,Qualified,Disc,Clear;
}
