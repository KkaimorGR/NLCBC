
report 52193624 "prLoan Payment History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prLoan Payment History.rdlc';
    ApplicationArea = All;
    Caption = 'prLoan Payment History';
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
        TotalFor: Label 'Total for ';
        MonthName: Text[100];
        EName: Text[200];
        HREmployee: Record "FA Budget Entry";
        CompanyInfo: Record "Company Information";
        Employee_Transaction_HistoryCaptionLbl: Label 'Employee Transaction History';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_NameCaptionLbl: Label 'Employee Name';
        TransactionCaptionLbl: Label 'Transaction';
        Running_BalanceCaptionLbl: Label 'Running Balance';
        YearCaptionLbl: Label 'Year';
        MonthCaptionLbl: Label 'Month';
}
