
xmlport 50016 "emp dates"
{
    Format = VariableText;
    Caption = 'emp dates';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'comp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(b; "HR Employees"."Date of Current Employment") { }
                fieldelement(c; "HR Employees"."Contract Start Date") { }
                fieldelement(d; "HR Employees"."Contract Duration") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
