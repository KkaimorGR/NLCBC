
report 52193608 prEmployeeAdvupdates
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prEmployeeAdvupdates.rdlc';
    ApplicationArea = All;
    Caption = 'prEmployeeAdvupdates';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        EmployeeTrans: Record "CshMgt Approvals";
        strPeriodName: Text[50];
        // payperiod: Record Banks;
        PeriodFilter: Text[50];
        SelectedPeriod: Date;
        // objPeriod: Record Banks;
        PeriodName: Text[50];
        employeeAdvance: Record "G/L Entry Change log";
        EmployeeTrans2: Record "CshMgt Approvals";
        AdvAmount: Decimal;
        AdvRef: Text[250];
        AdvBal: Decimal;
}
