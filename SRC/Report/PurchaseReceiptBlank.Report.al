
report 52193812 "Purchase Receipt Blank"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase Receipt Blank.rdlc';
    ApplicationArea = All;
    Caption = 'Purchase Receipt Blank';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
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
