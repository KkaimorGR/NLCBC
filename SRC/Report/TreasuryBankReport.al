report 52193474 "Bank Report"
{
    DefaultLayout = RDLC;
    Caption = 'Employee Bank Details';
    RDLCLayout = './Layouts/PR Bankdetails Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = filter(active));
            column(No_; "No.")
            {

            }
            column(Counter; Counter)
            {

            }
            column(Full_Name; "Full Name")
            {

            }
            column(ID_Number; "ID Number")
            {

            }
            column(PIN_No_; "PIN No.")
            {

            }
            column(Date_Of_Birth; DOB)
            {

            }
            column(BankCode; BankCode)
            {

            }
            column(AccountNumber; AccountNumber)
            {

            }
            column(BranchCode; BranchCode)
            {

            }
            column(BranchName; BranchName)
            {

            }
            column(BankName; BankName)
            {

            }
            column(Date_Of_Joining_the_Company; Employemedate)
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(CompanyAdress; CompanyAdress)
            { }
            column(NLCWebsite; NLCWebsite)
            {

            }
            column(Picture; CompanyInfo.Picture)
            { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                BranchCode := '';
                BranchName := '';
                Employemedate := '';
                BankCode := '';
                DOB := '';
                BankName := '';
                AccountNumber := '';
                if "HR Employees"."Date Of Birth" <> 0D then
                    DOB := GlobalFu.FormatDate("HR Employees"."Date Of Birth");
                if "HR Employees"."Date Of Joining the Company" <> 0D then
                    Employemedate := GlobalFu.FormatDate("HR Employees"."Date Of Joining the Company");
                BankAccounts.Reset();
                BankAccounts.SetRange(BankAccounts."Employee Code", "HR Employees"."No.");
                if BankAccounts.FindFirst() then begin
                    BranchCode := BankAccounts."Branch Code";
                    BranchName := BankAccounts."Branch Name";
                    BankCode := BankAccounts."Bank  Code";
                    BankName := BankAccounts."Bank Name";
                    AccountNumber := BankAccounts."A/C  Number";
                end;
                Counter := Counter + 1
            end;
        }

    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        CompanyAdress := CompanyInfo.Address;
        CompanyName := CompanyInfo.Name;
        NLCWebsite := CompanyInfo."NLC Website";
    end;

    var
        myInt: Integer;
        CompanyName: Text;
        BankName: Text;
        CompanyAdress: Text;
        NLCWebsite: Text;
        BranchName: Text;
        GlobalFu: Codeunit "Global Functions";
        Counter: Integer;
        Employemedate: Text;
        DOB: Text;
        BankCode: Code[40];
        BranchCode: Code[40];
        CompanyInfo: Record "Company Information";
        BankAccounts: Record "HR Employee Bank Accounts";
        AccountNumber: code[50];
}