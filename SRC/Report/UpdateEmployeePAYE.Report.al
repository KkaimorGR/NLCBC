
report 52193715 "Update Employee PAYE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Employee PAYE.rdlc';
    ApplicationArea = All;
    Caption = 'Update Employee PAYE';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        // objPayrollPeriod: Record Banks;
        EmpTrans: Record "CshMgt Approvals";
        EmpTransR: Record "CshMgt Approvals";
        Employee: Record "FA Budget Entry";
        Salary_Step_Notch_TransactionsCaptionLbl: Label 'Salary Step/Notch Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
