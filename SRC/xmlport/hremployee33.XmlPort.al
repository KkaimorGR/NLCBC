
xmlport 50025 "hr-employee33"
{
    Format = VariableText;
    Caption = 'hr-employee33';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'comp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(B; "HR Employees"."ID Number") { }
                fieldelement(N; "HR Employees"."PIN No.") { }
                fieldelement(GH; "HR Employees"."NSSF No.") { }
                fieldelement(BB; "HR Employees"."NHIF No.") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
