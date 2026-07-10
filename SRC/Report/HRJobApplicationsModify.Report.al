
report 52193831 "HR Job Applications Modify"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Applications Modify.rdlc';
    ApplicationArea = All;
    Caption = 'HR Job Applications Modify';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
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
