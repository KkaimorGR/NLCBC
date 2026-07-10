
report 52193658 "transfer data"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/transfer data.rdlc';
    ApplicationArea = All;
    Caption = 'transfer data';
    dataset
    {
        dataitem(old; "HR Individual Objectives")
        {
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin
                new.Init();
                new.TransferFields(old);
                new.Insert();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        new: Record "HR Individual Objectives1";
}
