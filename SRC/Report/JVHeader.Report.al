
report 52193795 "JV Header"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/JV Header.rdlc';
    ApplicationArea = All;
    Caption = 'JV Header';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        NumberText: array[2] of Text[120];
        CheckReport: Report Check;
}
