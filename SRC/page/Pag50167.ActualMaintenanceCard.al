
Page 52193592 "Actual Maintenance Card"
{
    PageType = Card;
    SourceTable = "Actual Maintenance";
    PromotedActionCategories = 'ENU=New,Process,Reports,Functions,Confirmation of Work';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(MaintenanceNo; Rec."Maintenance No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Ambiguous;
                    StyleExpr = true;
                }
                field(PlannedDate; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension1Code; Rec."Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2Code; Rec."Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(PlanNo; Rec."Plan No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(TotalCost; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibilityCenter; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12; "Actual Maintenance Lines")
            {
                SubPageLink = "Maintenance No." = field("Maintenance No.");
                UpdatePropagation = Both;
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
                PromotedIsBig = false;

                trigger OnAction()
                begin
                    Message('Send approval request');
                end;
            }

            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;

                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request for this Maintenance?', true) = false then exit;
                    Message('Cancel approval request');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetFilter(Rec."Maintenance No.", Rec."Maintenance No.");
                    // Report.Run(Report::"Asset Maintenance", true, true, Rec);
                end;
            }
            action(Action13)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId)
                end;
            }
            action("Confirmation of Work")
            {
                //  ApplicationArea = Basic;
                //  Caption = 'Confirmation of Work';
                //  Image = AdjustEntries;
                //  Promoted = true;
                //  PromotedCategory = Category5;
                //  PromotedIsBig = true;
                //  RunObject = Page "Confirmation of Work";
                //  RunPageLink = "Gate Pass No." = field("Maintenance No.");
            }
        }
    }
}
