
report 52193798 "Cheque Confirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cheque Confirmation.rdlc';
    ApplicationArea = All;
    Caption = 'Cheque Confirmation';
    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(ReportForNavId_1102755019; 1102755019) { }

            trigger OnPreDataItem()
            begin
                if "Bank Account".GetFilter("Bank Account"."Date Filter") = '' then
                    Error('Specify a date filter');
            end;
        }
    }

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
        SNo := 0;
    end;

    var
        CompanyInfo: Record "Company Information";
        Bank: Record "Bank Account";
        SNo: Integer;
        TotalNetAmount: Decimal;
        NumberText: array[2] of Text[120];
        CheckReport: Report Check;
}
