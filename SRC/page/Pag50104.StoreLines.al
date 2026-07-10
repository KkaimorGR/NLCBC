
page 52193528 "Store Lines"
{
    PageType = ListPart;
    SourceTable = "Store Requisition TT Line";
    ApplicationArea = All;
    Caption = 'Store Requisition Line';
    PromotedActionCategories = 'New,Process,report,Issuing,Accept Item';
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnValidate()

                    begin
                        CheckStaff();
                        value := Dept = 'SUPPLY CHAIN PROCUREMENT';
                    end;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Qty in store"; Rec."Qty in store")
                {
                    ToolTip = 'Specifies the value of the Qty in store field.';
                    Visible = value;

                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity To Issue';
                    ToolTip = 'Specifies the value of the Quantity To Issue field.';
                    Visible = value;
                }
                field("Description 2"; Rec."Description 2")
                {
                    Caption = 'Remark';
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }

                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                    Visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                    Visible = false;
                }
                field(Issued; Issued)
                {
                    Caption = 'Issued';
                    ToolTip = 'Specifies the value of the Issued field.';
                }

                field("Issuing Store"; Rec."Issuing Store")
                {
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the value of the Bin Code field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Item Status"; Rec."Item Status")
                {
                    ToolTip = 'Specifies the value of the Item Status field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field(ShortcutDimCode3; Rec."Shortcut Dimension 3 Code")
                {
                    CaptionClass = '1,2,3';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    end;
                }
                field(ShortcutDimCode4; Rec."Shortcut Dimension 4 Code")
                {
                    CaptionClass = '1,2,4';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    end;
                }
                /* field(ShortcutDimCode5;"Shortcut Dimension 5 Code")
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(5,ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                } */
                /* field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(6,ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(7,ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(8,ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                } */
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Process")
            {
                Caption = 'Process';
                Image = Line;

                action("Item Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortcutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines();
                    end;
                }
                action("Issue Item")
                // Image=IssueFinanceCharge;
                {
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = rec.Issued = false;
                    Enabled = value;
                    trigger OnAction()
                    var

                        LineNo: Integer;
                        valueEntry: Record "Value Entry";
                        Tejou: Page "Item Journal";
                        ItemLedger: Record "Item Ledger Entry";
                    begin
                        valueEntry.Init();
                        valueEntry."Entry No." := 1;
                        valueEntry."Item Ledger Entry No." := 1;
                        valueEntry.Insert();
                        Storeheaders.Reset();
                        Storeheaders.SetRange("No.", "Requistion No");
                        Storeheaders.SetRange(Status, Storeheaders.Status::Released);
                        if Storeheaders.Find('-') then begin
                            if Storeheaders.Status = Storeheaders.Status::Released then begin
                                if Storeheaders."Action Type" = Storeheaders."Action Type"::Item then begin
                                    if Storeheaders."Document Type" = Storeheaders."Document Type"::SR then begin
                                        // if not LinesExists() then
                                        //     Error('There are no Lines created for this Document');

                                        if Storeheaders.Status = Storeheaders.Status::Posted then
                                            Error('The Document Has Already been Posted');

                                        if Storeheaders.Status <> Storeheaders.Status::Released then
                                            Error('The Document Has not yet been Approved');
                                        ReqLine.Reset();
                                        ReqLine.SetRange(ReqLine."Requistion No", Rec."Requistion No");
                                        ReqLine.SetRange("Line No.", rec."Line No.");
                                        ReqLine.SetFilter(Issued, 'false');
                                        if ReqLine.Find('-') then begin

                                            //Issue
                                            if InventorySetup.Get() then begin
                                                InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                                InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                                GenJnline.Reset();
                                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                                if GenJnline.Find('-') then
                                                    GenJnline.DeleteAll();
                                                LineNo := 105007;
                                                GenJnline.Reset();
                                                if GenJnline.FindLast() then
                                                    LineNo := GenJnline."Line No." + 1
                                                else
                                                    LineNo := LineNo + 10000;
                                                GenJnline.Init();
                                                GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                                GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                                GenJnline."Line No." := LineNo;
                                                GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                                GenJnline.Validate(GenJnline."Entry Type");
                                                GenJnline."Document No." := Rec."Requistion No";
                                                GenJnline."Item No." := ReqLine."No.";
                                                //  GenJnline."Inventory Posting Group":=InventorySetup.INvt;
                                                // if GenJnline."Inventory Posting Group"='' then
                                                // GenJnline."Inventory Posting Group":='GOODS';
                                                // GenJnline."Gen. Prod. Posting Group":=ReqLine."Gen. Prod. Posting Group";
                                                if GenJnline."Gen. Prod. Posting Group" = '' then
                                                    GenJnline."Gen. Prod. Posting Group" := 'GOODS';
                                                // GenJnline.Validate("Item No.");
                                                GenJnline."Location Code" := Rec."Issuing Store";
                                                // GenJnline.Validate("Location Code");
                                                GenJnline."Posting Date" := Storeheaders."Request date";
                                                GenJnline."Inventory Posting Group" := ReqLine."Gen. Prod. Posting Group";
                                                GenJnline.Description := ReqLine.Description;
                                                GenJnline.Quantity := ReqLine.Quantity;
                                                GenJnline."Item Charge No." := ReqLine."No.";
                                                GenJnline."Shortcut Dimension 1 Code" := Storeheaders."Global Dimension 1 Code";
                                                GenJnline.Validate("Shortcut Dimension 1 Code");
                                                GenJnline."Shortcut Dimension 2 Code" := Storeheaders."Shortcut Dimension 2 Code";
                                                GenJnline.Validate("Shortcut Dimension 2 Code");
                                                GenJnline.ValidateShortcutDimCode(3, Storeheaders."Shortcut Dimension 3 Code");
                                                GenJnline.ValidateShortcutDimCode(4, Storeheaders."Shortcut Dimension 4 Code");
                                                GenJnline.Quantity := ReqLine.Quantity;
                                                GenJnline."Quantity (Base)" := ReqLine.Quantity;
                                                GenJnline.Insert(true);
                                            end;
                                            //Post Entries
                                            GenJnline.Reset();
                                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                            Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", GenJnline);
                                            ReqLine.Issued := true;
                                            ReqLine.Modify();
                                            Storeheaders."Issued By" := UserId;
                                            Storeheaders.Modify();
                                            Message('issued and Posted');
                                            exit;
                                        end else
                                            Error('Line Already Issued');

                                    end;
                                end;
                            end;
                        end else
                            Error('Document Cannot be issued untill the document is approved');


                    end;
                }
                action("Accept Items")
                {
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Enabled = value;
                    trigger OnAction()
                    begin
                        Storeheaders.Reset();
                        Storeheaders.SetRange("No.", rec."Requistion No");
                        Storeheaders.SetRange(Status, Storeheaders.Status::Released);
                        if Storeheaders.FindFirst() then begin
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", Rec."Requistion No");
                            if ReqLine.FindSet() then begin
                                repeat
                                    if ReqLine.Issued = false then
                                        Error('You cannot accept if all items have not been issued');
                                until ReqLine.Next() = 0;
                                Storeheaders.Status := Storeheaders.Status::Posted;
                                Storeheaders.Received := true;
                                Storeheaders."Received Date" := Today;
                                Storeheaders."Received By" := UserId;
                                Storeheaders.Modify();
                            end;
                        end;

                    end;

                }
            }
        }
    }
    trigger OnOpenPage()

    begin
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';

    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';
    end;

    trigger OnAfterGetCurrRecord()

    begin
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        Storeheaders: Record "Store Requistion Headers";
        ReqLine: Record "Store Requisition TT Line";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";

        Dept: Code[40];

        value: Boolean;

    procedure CheckStaff()
    var
        UserSetting: Record "User Personalization";
        filemgt: Codeunit "File Management";
    begin

        UserSetting.SetRange("User ID", UserId);
        if UserSetting.FindFirst() then begin
            Dept := UserSetting."Profile ID";
        end;
    end;
}

