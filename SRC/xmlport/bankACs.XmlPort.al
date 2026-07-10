
xmlport 50005 "bank A/Cs"
{
    Format = VariableText;
    Caption = 'bank A/Cs';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "HR Employee Kin"."Employee Code") { }
                fieldelement(surName; "HR Employee Kin"."Full Name")
                {
                    FieldValidate = Yes;
                }
                fieldelement(othernames; "HR Employee Kin".Name) { }
                fieldelement(Relationship; "HR Employee Kin".Relationship) { }
                fieldelement(Address; "HR Employee Kin".Address) { }
                fieldelement(Tel; "HR Employee Kin"."Home Tel No") { }
                fieldelement(mail; "HR Employee Kin"."E-mail") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
