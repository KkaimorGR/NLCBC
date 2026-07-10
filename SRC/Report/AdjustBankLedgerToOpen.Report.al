
report 52193782 "Adjust Bank Ledger To Open"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Adjust Bank Ledger To Open.rdlc';
    ApplicationArea = All;
    Caption = 'Adjust Bank Ledger To Open';
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                "Bank Account Ledger Entry".Open := false;
                "Bank Account Ledger Entry".Modify();
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
        GLAccount: Record "G/L Account";
}
