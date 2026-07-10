
report 52193440 "Item List with Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Item List with Dimensions.rdlc';
    ApplicationArea = All;
    Caption = 'Item List with Dimensions';
    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(ReportForNavId_1000000000; 1000000000) { }
            column(ItemNo; "Item Ledger Entry"."Item No.") { }
            column(Description; "Item Ledger Entry".Description) { }
            column(Quantity; "Item Ledger Entry".Quantity) { }
            column(TotalCost; "Item Ledger Entry"."Cost Amount (Actual)") { }
            column(DonorCode; "Item Ledger Entry"."Global Dimension 1 Code") { }
            column(ProjectCode; "Item Ledger Entry"."Global Dimension 2 Code") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
