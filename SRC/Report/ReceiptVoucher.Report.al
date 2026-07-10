
report 52193747 "Receipt Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt Voucher.rdlc';
    ApplicationArea = All;
    Caption = 'Receipt Voucher';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(ReportForNavId_1; 1) { }
            column(Project_User; "Purch. Rcpt. Header"."Responsibility Center") { }
            column(Supplier; "Purch. Rcpt. Header"."Buy-from Vendor Name") { }
            column(Address; "Purch. Rcpt. Header"."Buy-from Address") { }
            column(Date; "Purch. Rcpt. Header"."Posting Date") { }
            column(LPO_LSO; "Purch. Rcpt. Header"."Order No.") { }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_7; 7) { }
                column(ItemNo; "Purch. Rcpt. Line"."No.") { }
                column(Description; "Purch. Rcpt. Line".Description) { }
                column(UnitofMeasure; "Purch. Rcpt. Line"."Unit of Measure") { }
                column(CityOrdered; "Purch. Rcpt. Line"."Location Code") { }
                column(CityReceived; "Purch. Rcpt. Line"."Location Code") { }
                column(UnitCost; "Purch. Rcpt. Line"."Direct Unit Cost") { }
                column(QuantityOrdered; "Purch. Rcpt. Line".Quantity) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
