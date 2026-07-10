
report 52193706 "Validate Employee Period"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Validate Employee Period.rdlc';
    ApplicationArea = All;
    Caption = 'Validate Employee Period';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HREmployee: Record "FA Budget Entry";
        AdjustRunningBal: Option " ","Reduce 1 Installment","Increase 1 Installment";
        Trans: Record "Bank Bal. Alert Buffer";
        prEmployee_TransactionsCaptionLbl: Label 'prEmployee Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
