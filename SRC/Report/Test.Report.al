
report 52193825 Test
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Test.rdlc';
    ApplicationArea = All;
    Caption = 'Test';
    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            column(ReportForNavId_1; 1) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
