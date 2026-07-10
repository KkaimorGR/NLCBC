
xmlport 50022 FAopenning
{
    Format = VariableText;
    Caption = 'FAopenning';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Employee Transactions"; "PR Employee Transactions")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "PR Employee Transactions"."Employee Code") { }
                fieldelement(TransactionCode; "PR Employee Transactions"."Transaction Code")
                {
                    FieldValidate = Yes;
                }
                fieldelement(PeriodMonth; "PR Employee Transactions"."Period Month") { }
                fieldelement(PeriodYear; "PR Employee Transactions"."Period Year") { }
                fieldelement(PayrollPeriod; "PR Employee Transactions"."Payroll Period") { }
                fieldelement(amount; "PR Employee Transactions".Amount) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
