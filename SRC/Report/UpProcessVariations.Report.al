
report 52193711 "Up-Process Variations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Up-Process Variations.rdlc';
    ApplicationArea = All;
    Caption = 'Up-Process Variations';
    dataset
    {
        dataitem("JV Header"; "JV Header")
        {
            column(ReportForNavId_5357; 5357) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        prPayroll_VariationsCaptionLbl: Label 'prPayroll Variations';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
