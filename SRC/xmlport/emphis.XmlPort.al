
xmlport 50017 "emp his"
{
    Format = VariableText;
    Caption = 'emp his';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Qualifications"; "HR Employee Qualifications")
            {
                XmlName = 'comp';
                fieldelement(a; "HR Employee Qualifications"."Employee No.") { }
                fieldelement(b; "HR Employee Qualifications"."Institution/Company") { }
                fieldelement(c; "HR Employee Qualifications"."Qualification Type") { }
                fieldelement(d; "HR Employee Qualifications".Description) { }
                fieldelement(rt; "HR Employee Qualifications"."From Date") { }
                fieldelement(yy; "HR Employee Qualifications"."To Date") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
