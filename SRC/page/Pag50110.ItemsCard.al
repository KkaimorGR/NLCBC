page 52193534 "Procurement Items Card"
{
    ApplicationArea = All;
    Caption = 'Procurement Items Card';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approve Item';
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if "Card No" = '' then begin
                            GenLedgerSetup.Get;
                            GenLedgerSetup.TestField("Card No");
                            NoSeriesMgt.InitSeries(GenLedgerSetup."Card No", xRec."Card No", 0D, "Card No", "No. Series");
                            //NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
                        end;

                    end;
                }
                field("Card No"; "Card No")
                {
                    ApplicationArea = All;

                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = all;
                }

                field(Model; Model)
                {
                    ApplicationArea = all;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    ApplicationArea = all;
                }
                field(Inventory; Inventory)
                {
                    ApplicationArea = all;
                }
                field("Budget Quantity"; "Budget Quantity")
                {
                    ApplicationArea = all;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = all;
                }
                field("Qty. Returned"; "Qty. Returned")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = all;
                }
                field("Approved By"; "Approved By")
                {
                    ApplicationArea = all;
                }
            }
            group(Repleshiment)
            {
                field("Replenishment System"; "Replenishment System")
                {
                    ApplicationArea = all;
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    ApplicationArea = all;
                }
                field("Stock Out Warning"; "Stockout Warning")
                {
                    ApplicationArea = all;
                }

            }
            group(Planning)
            {
                field("Reordering Policy"; "Reordering Policy")
                {
                    ApplicationArea = all;
                }
                field(Reserve; Reserve)
                {
                    ApplicationArea = all;
                }
                field("Reorder Point"; "Reorder Point")
                {
                    ApplicationArea = all;
                }
                field("Reorder Quantity"; "Reorder Quantity")
                {
                    ApplicationArea = all;
                }
                field("Maximum Order Quantity"; "Maximum Order Quantity")
                {
                    ApplicationArea = all;
                }
                field("Maximum Inventory"; "Maximum Inventory")
                {
                    ApplicationArea = all;
                }
                field("Minimum Order Quantity"; "Minimum Order Quantity")
                {
                    ApplicationArea = all;
                }
            }
            group(Tracking)
            {
                field("Item Tracking Code"; "Item Tracking Code")
                {
                    ApplicationArea = all;
                }
                field("Serial Nos."; "Serial Nos.")
                {
                    ApplicationArea = all;
                }
                field("Lot Nos."; "Lot Nos.")
                {
                    ApplicationArea = all;
                }

            }
            group("Posting Groups")
            {
                Caption = 'Posting Details';
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                    ApplicationArea = All;
                }

            }
        }

    }
    actions
    {
        area(Navigation)
        {
            action("Approve Item")
            {
                trigger OnAction()
                begin
                    if not confirm('Do you want to approve this item') then exit;
                    rec.Status := rec.Status::Approved;
                    rec."Approved By" := UserId;
                    rec.Modify();
                    Message('Item Approved');
                    CurrPage.Close();

                end;
            }
            action(S3)
            {
                Caption = 'S3 Report';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the GRN action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("No.", Rec."No.");
                    Report.Run(Report::S3, true, true, Rec);
                    Rec.Reset();
                end;
            }
        }
    }
    var
        GenLedgerSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}
