report 52193486 "Stores Ledger & Stock Control"
{
    Caption = 'Stores Ledger & Stock Control';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StoresLedgers.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";


            column(Description; Description)
            {
            }


            column(No; "No.")
            {
            }
            column(Deptment; Deptment)
            {

            }
            column(Location; Location)
            {

            }



            column(UnitofMeasureId; "Unit of Measure Id")
            {
            }

            column(VendorItemNo; "Vendor Item No.")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(Base_Unit_of_Measure; "Base Unit of Measure")
            {

            }
            column(CardNo; "Card No")
            {

            }

            column(Pic; CI.Picture) { }
            column(Name; CI.Name) { }

            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemLinkReference = Item;
                DataItemTableView = sorting("Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Global Dimension 1 Code", "Global Dimension 2 Code", "Location Code", "Posting Date");
                //RequestFilterFields = "Posting Date";

                column(Posting_Date; "Posting Date")
                { }

                column(Document_No_; "Document No.")
                { }
                column(Vendor_Name; supplier)
                { }
                column(Entry_Type1; "Entry Type") { }

                column(Quantity1; Quantity)
                {

                }

                column(ReceivedTotals; value1)
                {

                }


                column(TotalInvRec; TotalInvRec)
                {

                }
                column(UnitPriceR; UnitPrice)
                {
                }

                column(InventoryReceived; ItemRec.Inventory)
                {

                }



                column(Remaining_QuantityR; "Remaining Quantity")
                {

                }
                column(Cost_Amount__Actual_1; "Cost Amount (Actual)")
                {

                }
                column(Entry_No_1; "Entry No.")
                {

                }

                trigger OnPreDataItem()

                begin
                    SetRange("Entry Type", "Entry Type"::"Positive Adjmt.");
                end;

                trigger OnAfterGetRecord()
                var

                    storeRequisitionHeaders: Record "Store Requistion Headers";
                    ReqLine: Record "Store Requisition TT Line";
                begin



                    //UnitPrice := value1 / Quantity1;
                    storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
                    if storeRequisitionHeaders.FindSet() then begin
                        supplier := storeRequisitionHeaders."Vendor Name";
                        ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
                        if ReqLine.FindFirst() then begin
                            UnitPrice := Reqline."Unit Cost";
                            value1 := ReqLine."Unit Cost" * Quantity;
                        end;
                    end;


                    //     "Item Ledger Entry".SetRange("Entry Type", "Entry Type"::"Negative Adjmt.");
                    //     if "Item Ledger Entry".Findset() then begin
                    //         Quantity2 := "Item Ledger Entry".Quantity;
                    //         value2 := UnitPrice * Quantity2;
                    //     end;
                    ItemRec.Reset();
                    ItemRec.SetRange("No.", "Item Ledger Entry"."Item No.");
                    if itemRec.Findset() then begin
                        ItemRec.CalcFields(Inventory);

                        vendorName := itemRec."Supplier Name";

                        TotalInvRec := "Remaining Quantity" * UnitPrice;
                    end;



                end;





            }
            dataitem("Item Ledger Entry2"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemLinkReference = Item;
                DataItemTableView = sorting("Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Global Dimension 1 Code", "Global Dimension 2 Code", "Location Code", "Posting Date");
                //RequestFilterFields = "Posting Date";

                column(DateIssued; "Posting Date")
                { }

                column(Document_No_Issued; "Document No.")
                { }
                column(office; office)
                {

                }
                column(Entry_Type2; "Entry Type") { }


                column(Quantity2; Quantity)
                {

                }

                column(IssuedTotal; value2)
                {

                }

                column(TotalInvIssued; TotalInvIssued)
                {

                }
                column(UnitPriceI; UnitPrice)
                {
                }

                column(Inventory1; ItemRec.Inventory)
                {

                }



                column(Remaining_QuantityIs; "Remaining Quantity")
                {

                }
                column(Cost_Amount__Actual2; "Cost Amount (Actual)")
                {

                }
                column(Sales_Amount__Actual_2; "Sales Amount (Actual)")
                {

                }
                column(price; price)
                {

                }
                column(Entry_No_2; "Entry No.")
                {

                }
                trigger OnPreDataItem()

                begin
                    SetRange("Entry Type", "Entry Type"::"Negative Adjmt.");
                end;

                trigger OnAfterGetRecord()
                var
                    storeRequisitionHeaders: Record "Store Requistion Headers";
                    ReqLine: Record "Store Requisition TT Line";
                begin

                    storeRequisitionHeaders.SetRange("No.", "Item Ledger Entry"."Document No.");
                    if storeRequisitionHeaders.FindFirst() then begin
                        office := storeRequisitionHeaders."Budget Center Name";
                        ReqLine.SetRange("Requistion No", storeRequisitionHeaders."No.");
                        if ReqLine.FindFirst() then begin
                            price := Reqline."Unit Cost";
                            value2 := ReqLine."Unit Cost" * Quantity;
                        end;
                    end;

                    ItemRec.Reset();
                    ItemRec.SetRange("No.", "Item Ledger Entry"."Item No.");
                    if itemRec.Findset() then begin
                        ItemRec.CalcFields(Inventory);

                        vendorName := itemRec."Supplier Name";

                        TotalInvIssued := (ItemRec.Inventory) * price;
                    end;

                end;
            }
            trigger OnAfterGetRecord()
            var
                itemledgerEntry: Record "Item Ledger Entry";

            begin
                itemledgerEntry.SetRange("Item No.", "No.");
                if itemledgerEntry.FindFirst() then begin
                    Deptment := itemledgerEntry."Global Dimension 1 Code";
                    Location := itemledgerEntry."Global Dimension 2 Code";

                end;

            end;

        }
    }


    requestpage
    {
        //SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    // field(Date; Date)
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ShowMandatory = true;
                    //     Caption = 'Date';
                    // }
                }
            }
        }
        actions
        {
            area(Processing)
            {
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
        //Date: Date;
        ItemRec: Record Item;
        office: Text[100];
        price: Decimal;




    trigger OnPreReport()

    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";

}

