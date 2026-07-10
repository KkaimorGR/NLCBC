
report 52193700 "Reconciliation - By Entry/Exit"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Reconciliation - By EntryExit.rdlc';
    ApplicationArea = All;
    Caption = 'Reconciliation - By Entry/Exit';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        VariationRemarks: Text[1000];
        MonthlyRecon: Record "Quotation Specification Lines";
        SelectedPeriod: Date;
        CompanyInfo: Record "Company Information";
        Salary_Reconciliations___By_Staff_Entry_ExitsCaptionLbl: Label 'Salary Reconciliations - By Staff Entry/Exits';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
        RemarksCaptionLbl: Label 'Remarks';
}
