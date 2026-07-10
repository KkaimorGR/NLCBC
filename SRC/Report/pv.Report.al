
report 52193753 pv
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/pv.rdlc';
    ApplicationArea = All;
    Caption = 'pv';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompanyInfo: Record "Company Information";
        Address: Text;
        Particulars: Text;
        Total: Decimal;
        objLogos: Record "HR Job Responsiblities";
        DimVal: Record "Dimension Value";
        Project: Text;
        CheckReport: Report Check;
        NumberText: array[2] of Text;
}
