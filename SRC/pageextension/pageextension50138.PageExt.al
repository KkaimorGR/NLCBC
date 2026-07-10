
pageextension 52193465 pageextension50138 extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Stores Requisition No"; Rec."Stores Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Stores Requisition No field.';
            }
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Store Requisition Nos. field.';
            }
            field("Purchase Req No"; Rec."Purchase Req No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Purchase Req No field.';
            }
            field("Start Order from Requisition"; Rec."Start Order from Requisition")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Start Order from Requisition field.';
            }
            field("Requisition Default Vendor"; Rec."Requisition Default Vendor")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition Default Vendor field.';
            }
            field("Quotation Request No"; Rec."Quotation Request No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Quatation Request No field.';
            }
            field("Appraisal Parameter No"; Rec."Appraisal Parameter No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Appraisal Parameter No field.';
            }
            field("Tender No"; Rec."Tender No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tender No field.';
            }
            field("Contract No"; Rec."Contract No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract No field.';
            }
            field("Disposal Process Nos."; "Disposal Process Nos.")
            {
                ApplicationArea = all;
            }
            field(InternalMemoNos; "Internal Memo Nos.")
            {
                ApplicationArea = Basic;
            }
            field(AssetReceivingNo; "Asset Receiving No")
            {
                ApplicationArea = Basic;
            }
            field("Hotel Nos."; "Hotel Nos.")
            {

            }
            field("Holding No"; "Holding No")
            {
                ApplicationArea = all;
            }
            field("Tag No"; "Tag No")
            {
                ApplicationArea = all;
                TableRelation = "No. Series".Code;
            }
            field("Card No"; "Card No")
            {
                ApplicationArea = all;
            }
            field("Returned No"; "Returned No")
            {
                ApplicationArea = all;
            }
            field("Laptop/Computer Tage"; "Laptop/Computer Tage")
            {
                ApplicationArea = all;
                Caption = 'Laptop/Computer Tag';
            }
            field("Chair Tag"; "Chair Tag")
            {
                ApplicationArea = all;
            }
            field("Table Tag"; "Table Tag")
            {
                ApplicationArea = all;
            }
            field("Vehicle Tag"; "Vehicle Tag")
            {
                ApplicationArea = all;
            }
            field("Send SMS API URL"; "Send SMS API URL")
            {
                ApplicationArea = all;
                Caption = 'Qr Code Api';
            }
            field("Items/Assets Closed"; "Items/Assets Closed")
            {
                ApplicationArea = all;
            }
            field("Qr Code Api"; "Qr Code Api")
            {
                ApplicationArea = all;
            }
        }
    }
}
