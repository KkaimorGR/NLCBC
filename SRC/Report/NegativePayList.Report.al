
report 52193627 "Negative Pay List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Negative Pay List.rdlc';
    ApplicationArea = All;
    Caption = 'Negative Pay List';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        CompanyInfo: Record "Company Information";
        Negative_Pay_ListCaptionLbl: Label 'Negative Pay List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
}
