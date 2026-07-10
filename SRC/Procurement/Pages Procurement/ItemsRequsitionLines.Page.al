
Page 52193502 "Items Requsition Lines"
{
    Editable = true;
    PageType = ListPart;
    SaveValues = true;
    DeleteAllowed = true;
    SourceTable = "Store Requisition TT Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requistion No"; "Requistion No")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    OptionCaption = 'Item,Asset';
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;


                    trigger OnValidate()
                    var
                        ItemReq: Record "Store Requistion Headers";
                        ItemLines: Record "Store Requisition TT Line";
                    begin

                        // rec."Requistion No" := ItemReq."No.";
                        ItemLines.Reset();
                        ItemLines.SetRange("Line No.", rec."Line No.");
                        ItemLines.SetRange("Requistion No", rec."Requistion No");
                        if ItemLines.Find('-') then begin
                            ItemRec.Reset;
                            ItemRec.SetRange(ItemRec."No.", "No.");
                            if ItemRec.Find('-') then begin
                                ItemLines."Unit of Measure" := ItemRec."Base Unit of Measure";
                                ItemLines.Quantity := ItemRec."Budget Quantity";
                                ItemLines."Unit Cost" := ItemRec."Unit Cost";
                                ItemLines."Card No." := ItemRec."Card No";
                                ItemReq.Reset();
                                ItemReq.SetRange("No.", ItemLines."Requistion No");
                                if ItemReq.Find('-') then begin
                                    // ItemLines."Card No." := ItemReq."Card No";
                                    ItemReq."Purchase Order No" := ItemRec."Order No";
                                    ItemReq.Modify();
                                end;
                                ItemLines.Modify();
                            end;

                        end;
                        // if "Card No." = '' then begin
                        //     GenLedgerSetup.Get;
                        //     GenLedgerSetup.TestField("Card No");
                        //     NoSeriesMgt.InitSeries(GenLedgerSetup."Card No", xRec."Card No.", 0D, "Card No.", "No. Series");
                        //     //NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
                        // end;
                        // rec.Modify();
                        // Commit();
                        checkApproverId();
                        value := REC."Document Type" = Rec."Document Type"::PR;
                        value3 := REC."Document Type" = Rec."Document Type"::SR;
                        value2 := (REC."Document Type" = Rec."Document Type"::SR) and (Dept = 'SUPPLY CHAIN PROCUREMENT');

                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;

                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                    Editable = "Request Status" = "Request Status"::Open;
                    Visible = value;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        "Line Amount" := "Unit Cost" * Quantity;

                    end;
                }
                field("Qty in store"; "Qty in store")
                {
                    ApplicationArea = ALL;
                    Caption = 'Quantity In Store';
                    Visible = value2;
                }
                field("Quantity Requested"; "Quantity Requested")
                {
                    ApplicationArea = ALL;
                    Caption = 'Quantity Requested';
                    Visible = value3;

                }
                field("Quantity to issue"; Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity to Issue';
                    Visible = value2;
                }


                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                        "Line Amount" := "Unit Cost" * Quantity
                    end;
                }
                field("Line Amount"; "Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate No."; "Certificate No.")
                {
                    ApplicationArea = all;
                }
                field("Request Status"; "Request Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("IFMIS Nos"; "IFMIS Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'PO No';
                    Visible = false;
                }
                field("Card No."; "Card No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    trigger OnValidate()
                    var
                        myInt: Integer;

                    begin
                        // if "Card No." <> xRec."Card No." then begin
                        //     GenLedgerSetup.Get();
                        //     NoSeriesMgt.TestManual(GenLedgerSetup."Card No");
                        //     // "No. Series" := '';
                        // end;
                    end;
                    // Visible = false;
                }

            }
        }
    }

    actions
    {
    }
    trigger OnOpenPage()

    begin
        checkApproverId();
        value := REC."Document Type" = Rec."Document Type"::PR;
        value3 := REC."Document Type" = Rec."Document Type"::SR;
        value2 := (REC."Document Type" = Rec."Document Type"::SR) and (Dept = 'SUPPLY CHAIN PROCUREMENT');
    end;

    trigger OnAfterGetCurrRecord()

    begin
        checkApproverId();
        value := REC."Document Type" = Rec."Document Type"::PR;
        value3 := REC."Document Type" = Rec."Document Type"::SR;
        value2 := (REC."Document Type" = Rec."Document Type"::SR) and (Dept = 'SUPPLY CHAIN PROCUREMENT');
    end;

    trigger OnAfterGetRecord()
    begin

        // if "No." <> '' then begin
        //     ItemRec.Reset;
        //     ItemRec.SetRange(ItemRec."No.", "No.");
        //     if ItemRec.Find('-') then
        //         "Unit of Measure" := ItemRec."Base Unit of Measure";
        // end;
        checkApproverId();
        value := REC."Document Type" = Rec."Document Type"::PR;
        value3 := REC."Document Type" = Rec."Document Type"::SR;
        value2 := (REC."Document Type" = Rec."Document Type"::SR) and (Dept = 'SUPPLY CHAIN PROCUREMENT');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::Item
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Item
    end;

    var
        ItemRec: Record Item;
        GenLedgerSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        value: Boolean;
        value2: Boolean;

        value3: Boolean;
        Approver: Text;

        Dept: Text;

    procedure checkApproverId()
    var
        approvalEntry: Record "Approval Entry";
        Header: Record "Store Requistion Headers";
        UserSetting: Record "User Personalization";
    begin
        Header.Reset();
        Header.SetRange("No.", "Requistion No");
        if Header.FindFirst() then begin
            approvalEntry.SetRange("Document No.", Header."No.");
            approvalEntry.SetFilter(Status, 'Open');
            if approvalEntry.FindFirst() then begin
                approver := approvalEntry."Approver ID";
                UserSetting.SetRange("User ID", Approver);
                if UserSetting.FindFirst() then
                    Dept := UserSetting."Profile ID";

            end;

        end;
    end;
}

