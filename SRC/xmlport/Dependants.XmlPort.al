
xmlport 50010 Dependants
{
    Format = VariableText;
    Caption = 'Dependants';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "HR Employee Kin"."Employee Code") { }
                fieldelement(Name; "HR Employee Kin".Name)
                {
                    FieldValidate = Yes;
                }
                fieldelement(Relationship; "HR Employee Kin".Relationship) { }
                fieldelement(Address; "HR Employee Kin".Address) { }
                fieldelement(Tel; "HR Employee Kin"."Home Tel No") { }
                fieldelement(mail; "HR Employee Kin"."E-mail") { }
                fieldelement(ty; "HR Employee Kin".Type) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
