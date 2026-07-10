
report 52193598 "prAllowances Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prAllowances Report.rdlc';
    ApplicationArea = All;
    Caption = 'prAllowances Report';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        ///SelectedPeriod:="prPeriod Transactions".GETRANGEMIN("Payroll Period");
        // objPeriod.Reset();
        // ///objPeriod.SETRANGE(objPeriod."Date Opened",SelectedPeriod);
        // if objPeriod.Find('-') then;
        // ////   PeriodName:=objPeriod."Period Name";

        if CompanyInfo.Get() then
;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        PeriodTrans: Record "Cshmgt PV Audit";
        GroupOrder: Label '3';
        // objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        CompanyInfo: Record "Company Information";
        TotalsAllowances: Decimal;
        Dept: Boolean;
        Allowances_ReportCaptionLbl: Label 'Allowances Report';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Transaction_Name_CaptionLbl: Label 'Transaction Name:';
        Period_Amount_CaptionLbl: Label 'Period Amount:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Employee_Name: Text[250];
        objEmp: Record "FA Budget Entry";
        UserSetup: Record "User Setup";
        objPeriodTrans: Record "Cshmgt PV Audit";
}

