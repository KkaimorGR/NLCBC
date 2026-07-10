 
 page 52193565 "Rejected Goods"
{
    ApplicationArea = All;
    Caption = 'Rejected Goods';
    PageType = ListPart;
    SourceTable = "Holding Lines";
    Editable=false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';

                    Editable = false;
                    Visible = false;
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }
                field(Model; Model)
                {
                    ApplicationArea = all;
                }
                field("Unit of measure"; "Unit of measure")
                {
                    ApplicationArea = all;
                }
                field("Quantity as LPO"; "Quantity as LPO")
                {
                    ApplicationArea = all;
                }
                field("Quantiy Delivered"; Rec."Quantiy Delivered")
                {
                    ToolTip = 'Specifies the value of the Quantiy Delivered field.', Comment = '%';
                }
                field("Quantity  Rejected"; "Quantity  Rejected")
                {
                    ApplicationArea = all;
                    // Visible = false;

                }
                field("Quanity Approved"; "Quanity Approved")

                {
                    ApplicationArea = all;
                }
                field("Line Cost"; Rec."Line Cost")
                {
                    ToolTip = 'Specifies the value of the Line Cost field.', Comment = '%';
                    Caption = 'Line Cost(KES)';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                    Caption = 'Total Cost(KES)';
                }
                field("Inspection Date"; "Inspection Date")
                {
                    ApplicationArea = all;

                }
                field("Inspecion No"; "Inspecion No")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = all;
                    Caption = 'Inspection Remarks';
                }
                field("Reopening Remarks"; "Reopening Remarks")
                {
                    ApplicationArea = all;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Accept Inspection")
            {
                Visible=false;
                trigger OnAction()
                var
                    HoldingLines: Record "Holding Lines";
                begin
                    HoldingArea.Reset();
                    HoldingArea.SetRange("H Code", rec."Holding No");
                    HoldingArea.SetRange(Status, HoldingArea.Status::"Pending Approval");
                    if not HoldingArea.Find('-') then
                        Error('You cannot accept this item if the document is not in stage Pending inspection');
                    if not Confirm('Do you want to Accept this Document after Inpection?') then exit;
                    rec.TestField(Remarks);
                    HoldingLines.Reset();
                    HoldingLines.SetRange(HoldingLines."Entry No", rec."Entry No");
                    HoldingLines.SetRange("Holding No", rec."Holding No");
                    if HoldingLines.Find('-') then begin
                        HoldingLines.Status := HoldingLines.Status::Accepted;
                        HoldingLines.Modify();
                    end;
                end;
            }
            action("Reject Inspection")
            {
                 Visible=false;
                trigger OnAction()
                var
                    HoldingLines: Record "Holding Lines";

                begin
                    HoldingArea.Reset();
                    HoldingArea.SetRange("H Code", rec."Holding No");
                    HoldingArea.SetRange(Status, HoldingArea.Status::"Pending Approval");
                    if not HoldingArea.Find('-') then
                        Error('You cannot Reject this item if the document is not in stage Pending inspection');
                    if not Confirm('Do you want to Reject this Document?') then exit;
                    rec.TestField(Remarks);
                    HoldingLines.Reset();
                    HoldingLines.SetRange(HoldingLines."Entry No", rec."Entry No");
                    HoldingLines.SetRange("Holding No", rec."Holding No");
                    if HoldingLines.Find('-') then begin
                        HoldingLines.Status := HoldingLines.Status::Rejected;
                        HoldingLines.Modify();
                    end;
                end;
            }
            action("Reopen For Inspection")
            {
                 Visible=false;
                trigger OnAction()
                var
                    HoldingLines: Record "Holding Lines";
                begin
                    HoldingArea.Reset();
                    HoldingArea.SetRange("H Code", rec."Holding No");
                    HoldingArea.SetRange(Status, HoldingArea.Status::"Pending Approval");
                    if not HoldingArea.Find('-') then
                        Error('You cannot Reopen this item if the document is not in stage Pending inspection');
                    if not Confirm('Do you want to reopen this Document For inspection?') then exit;
                    rec.TestField("Reopening Remarks");
                    HoldingLines.Reset();
                    HoldingLines.SetRange(HoldingLines."Entry No", rec."Entry No");
                    HoldingLines.SetRange("Holding No", rec."Holding No");
                    if HoldingLines.Find('-') then begin
                        HoldingLines.Status := HoldingLines.Status::"Pending Inspection";
                        HoldingLines.Modify();
                    end;
                end;
            }
            action("Close Inspection")
            {
                 Visible=false;
                trigger OnAction()
                var
                    HoldingLines: Record "Holding Lines";
                    ItemRec: Record Item;
                    DocNo: Code[30];
                    HRSetup: Record "Inventory Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                begin
                    HoldingArea.Reset();
                    HoldingArea.SetRange("H Code", rec."Holding No");
                    HoldingArea.SetRange(Status, HoldingArea.Status::"Pending Approval");
                    if not HoldingArea.Find('-') then
                        Error('You cannot Close this item if the document is not in stage Pending inspection');
                    rec.TestField(Closed, false);
                    if not Confirm('Do you want to Close this Document after Inpection?') then exit;
                    rec.TestField(Remarks);
                    HoldingLines.Reset();
                    HoldingLines.SetRange(HoldingLines."Entry No", rec."Entry No");
                    HoldingLines.SetRange("Holding No", rec."Holding No");
                    if HoldingLines.Find('-') then begin
                        if HoldingLines.Status = HoldingLines.Status::Accepted then begin
                            HRSetup.Get;
                            HRSetup.TestField(HRSetup."Item Nos.");
                            DocNo := '';
                            ItemRec.Init();
                            DocNo := NoSeriesMgt.GetNextNo(HRSetup."Item Nos.", 0D, True);
                            ItemRec."No." := DocNo;
                            ItemRec."Budget Quantity" := HoldingLines."Quanity Approved";
                            ItemRec."Unit Cost" := HoldingLines."Line Cost";
                            ItemRec."Base Unit of Measure" := HoldingLines."Unit of measure";
                            ItemRec.Description := HoldingLines."Item Description";
                            ItemRec.Status := ItemRec.Status::Approved;
                            ItemRec."Approved By" := UserId;
                            ItemRec."Minimum Order Quantity" := rec."Quanity Approved";
                            ItemRec."Last Date Modified" := Today;
                            ItemRec.Model := HoldingLines.Model;
                            ItemRec.Insert(true);
                        end else begin
                            if HoldingLines.Status = HoldingLines.Status::Rejected then begin
                                HoldingLines.TestField(Remarks);
                                HoldingLines.Closed := true;
                            end;
                        end;
                        HoldingLines.Modify();
                        Message('Item Created Succefully');
                    end;

                end;

            }

        }
    }
    var
        HoldingArea: Record "Holding Area";
}
