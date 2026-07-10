
report 52193780 "Modify Item Ledger"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Modify Item Ledger.rdlc';
    ApplicationArea = All;
    Caption = 'Modify Item Ledger';
    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Entry Type" = const(Output));
            column(ReportForNavId_1102755000; 1102755000) { }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
