
report 52193455 "Petty Cash Requisition NCA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Petty Cash Requisition NCA.rdlc';
    ApplicationArea = All;
    Caption = 'Petty Cash Requisition NCA';
    dataset
    {
        dataitem("Staff Advance Headers"; "Staff Advance Headers")
        {
            column(ReportForNavId_1; 1) { }
            column(Date; "Staff Advance Headers".Date) { }
            column(Payee; "Staff Advance Headers".Payee) { }
            column(Account_No; "Staff Advance Headers"."Account No.") { }
            column(Logo; CompanyInfo.Picture) { }
            dataitem("Staff Advance Line"; "Staff Advance Line")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_6; 6) { }
                column(Account_No_Lines; "Staff Advance Line"."Account No:") { }
                column(Account_Name; "Staff Advance Line"."Account Name") { }
                column(Amount; "Staff Advance Line".Amount) { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_10; 10) { }
                column(Approver_ID; "Approval Entry"."Approver ID") { }
                column(Date_Approved; "Approval Entry"."Last Date-Time Modified") { }
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompanyInfo: Record "Company Information";
}
