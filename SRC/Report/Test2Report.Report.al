
report 52193826 "Test 2 Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Test 2 Report.rdlc';
    ApplicationArea = All;
    Caption = 'Test 2 Report';
    dataset
    {
        dataitem(Customer; Customer)
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
