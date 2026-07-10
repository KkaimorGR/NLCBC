
report 52193612 "prEmployeeTransation ads"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prEmployeeTransation ads.rdlc';
    ApplicationArea = All;
    Caption = 'prEmployeeTransation ads';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        prEmployee_Transactions_AdsCaptionLbl: Label 'prEmployee Transactions Ads';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
