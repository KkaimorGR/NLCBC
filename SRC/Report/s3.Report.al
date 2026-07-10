report 52193490 "S3"
{
    Caption = 'Stores Ledger & Stock Control';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StoresLedgersNew.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";

            column(Description; Description) { }
            column(No; "No.") { }
            column(Deptment; Deptment) { }
            column(Location; Location) { }
            column(UnitofMeasureId; "Unit of Measure Id") { }
            column(VendorItemNo; "Vendor Item No.") { }
            column(VendorNo; "Vendor No.") { }
            column(Base_Unit_of_Measure; "Base Unit of Measure") { }
            column(CardNo; "Card No") { }
            column(Pic; CI.Picture) { }
            column(Name; CI.Name) { }

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemLinkReference = Item;
                // Sort by "Entry No." for received entries
                // DataItemTableView = sorting("Entry No.") where("Entry Type" = const("Positive Adjmt."));

                column(Posting_Date; "Posting Date") { }
                column(Document_No_; "Document No.") { }
                column(Vendor_Name; supplier) { }
                column(Entry_Type1; "Entry Type") { }
                column(Quantity; Quantity) { }
                column(Quantity1; Quantity1) { }
                column(UnitPrice; UnitPrice) { }
                column(value1; value1) { }
                column(Cost_Amount__Actual_1; "Cost Amount (Actual)") { }
                column(Quantity2; Quantity2) { }
                column(office; office) { }
                column(price; price) { }
                column(value2; value2) { }
                trigger OnAfterGetRecord()
                var
                    storeRequisitionHeaders: Record "Store Requistion Headers";
                    ReqLine: Record "Store Requisition TT Line";
                begin



                    if ("Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Positive Adjmt.") then begin
                        Quantity1 := Quantity;
                        Quantity2 := novalue;
                        storeRequisitionHeaders.Reset();
                        storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
                        if storeRequisitionHeaders.FindSet() then begin
                            supplier := storeRequisitionHeaders."Vendor Name";
                            //Clear(office);
                            office := ' ';
                            ReqLine.Reset();
                            ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
                            if ReqLine.FindFirst() then begin
                                UnitPrice := ReqLine."Unit Cost";
                                value1 := ReqLine."Unit Cost" * Quantity1;
                                Clear(price);
                                clear(value2);
                            end;
                        end;

                    end;
                    if ("Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Negative Adjmt.") then begin
                        Quantity2 := Quantity;
                        Clear(Quantity1);
                        storeRequisitionHeaders.Reset();
                        storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
                        if storeRequisitionHeaders.FindFirst() then begin
                            office := storeRequisitionHeaders."Responsibility Center";
                            Clear(supplier);
                            ReqLine.Reset();
                            ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
                            if ReqLine.FindFirst() then begin
                                price := ReqLine."Unit Cost";
                                value2 := ReqLine."Unit Cost" * Quantity;
                                Clear(UnitPrice);
                                clear(value1);
                            end;
                        end;
                    end;

                end;
            }
            trigger OnAfterGetRecord()
            var
                itemLedgerEntry: Record "Item Ledger Entry";
            begin
                itemLedgerEntry.Reset();
                itemLedgerEntry.SetRange("Item No.", "No.");
                if itemLedgerEntry.FindFirst() then begin
                    Deptment := itemLedgerEntry."Global Dimension 1 Code";
                    Location := itemLedgerEntry."Global Dimension 2 Code";
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                }
            }
        }
    }

    var
        Location: Code[50];
        Deptment: Code[50];
        value1: Decimal;
        value2: Decimal;
        TotalInvRec: Decimal;
        TotalInvIssued: Decimal;
        Quantity1: Integer;
        Quantity2: Integer;
        Quantity3: Integer;
        InventoryRec: Decimal;
        VendorName: Text;
        UnitPrice: Decimal;
        supplier: Text;
        ItemRec: Record Item;
        office: Text[100];
        price: Decimal;
        CI: Record "Company Information";
        novalue: Integer;

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;
}

// column(ReceivedTotals; value1) { }
// column(TotalInvRec; TotalInvRec) { }
// column(UnitPriceR; UnitPrice) { }
// column(InventoryReceived; ItemRec.Inventory) { }
// column(Remaining_QuantityR; "Remaining Quantity") { }
// column(Cost_Amount__Actual_1; "Cost Amount (Actual)") { }
// column(Entry_No_1; "Entry No.") { }

// trigger OnAfterGetRecord()
// var
//     storeRequisitionHeaders: Record "Store Requistion Headers";
//     ReqLine: Record "Store Requisition TT Line";
// begin
//     // Existing logic remains unchanged
//     storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
//     if storeRequisitionHeaders.FindSet() then begin
//         supplier := storeRequisitionHeaders."Vendor Name";
//         ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
//         if ReqLine.FindFirst() then begin
//             UnitPrice := ReqLine."Unit Cost";
//             value1 := ReqLine."Unit Cost" * Quantity;
//         end;
//     end;

//     ItemRec.Reset();
//     ItemRec.SetRange("No.", "Item Ledger Entry"."Item No.");
//     if ItemRec.FindSet() then begin
//         ItemRec.CalcFields(Inventory);
//         vendorName := ItemRec."Supplier Name";
//         TotalInvRec := "Remaining Quantity" * UnitPrice;
//     end;
// end;
//}

// dataitem("Item Ledger Entry2"; "Item Ledger Entry")
// {
//     DataItemLink = "Item No." = field("No.");
//     DataItemLinkReference = Item;
//     // Sort by "Entry No." for issued entries
//     DataItemTableView = sorting("Entry No.") where("Entry Type" = const("Negative Adjmt."));

//     column(DateIssued; "Posting Date") { }
//     column(Document_No_Issued; "Document No.") { }
//     column(office; office) { }
//     column(Entry_Type2; "Entry Type") { }
//     column(Quantity2; Quantity) { }
//     column(IssuedTotal; value2) { }
//     column(TotalInvIssued; TotalInvIssued) { }
//     column(UnitPriceI; UnitPrice) { }
//     column(Inventory1; ItemRec.Inventory) { }
//     column(Remaining_QuantityIs; "Remaining Quantity") { }
//     column(Cost_Amount__Actual2; "Cost Amount (Actual)") { }
//     column(Sales_Amount__Actual_2; "Sales Amount (Actual)") { }
//     column(price; price) { }
//     column(Entry_No_2; "Entry No.") { }

//     trigger OnAfterGetRecord()
//     var
//         storeRequisitionHeaders: Record "Store Requistion Headers";
//         ReqLine: Record "Store Requisition TT Line";
//     begin
//         // Existing logic remains unchanged
//         storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
//         if storeRequisitionHeaders.FindFirst() then begin
//             office := storeRequisitionHeaders."Budget Center Name";
//             ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
//             if ReqLine.FindFirst() then begin
//                 price := ReqLine."Unit Cost";
//                 value2 := ReqLine."Unit Cost" * Quantity;
//             end;
//         end;

//         ItemRec.Reset();
//         ItemRec.SetRange("No.", "Item Ledger Entry"."Item No.");
//         if ItemRec.FindSet() then begin
//             ItemRec.CalcFields(Inventory);
//             vendorName := ItemRec."Supplier Name";
//             TotalInvIssued := ItemRec.Inventory * price;
//         end;
//     end;
// }

// trigger OnAfterGetRecord()
// var
//     itemLedgerEntry: Record "Item Ledger Entry";
// begin
//     itemLedgerEntry.SetRange("Item No.", "No.");
//     if itemLedgerEntry.FindFirst() then begin
//         Deptment := itemLedgerEntry."Global Dimension 1 Code";
//         Location := itemLedgerEntry."Global Dimension 2 Code";
//     end;
// end;