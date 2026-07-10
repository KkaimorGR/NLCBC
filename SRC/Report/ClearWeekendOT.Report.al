
report 52193710 "Clear Weekend OT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Clear Weekend OT.rdlc';
    ApplicationArea = All;
    Caption = 'Clear Weekend OT';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        prEmployee_TransactionsCaptionLbl: Label 'prEmployee Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
