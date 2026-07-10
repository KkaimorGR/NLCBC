
xmlport 50024 "hr-employee"
{
    Format = VariableText;
    Caption = 'hr-employee';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'comp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(b; "HR Employees"."First Name") { }
                fieldelement(c; "HR Employees"."Middle Name") { }
                fieldelement(d; "HR Employees"."Last Name") { }
                fieldelement(TT; "HR Employees"."Full Name") { }
                fieldelement(GH; "HR Employees"."Postal Address") { }
                fieldelement(TG; "HR Employees".City) { }
                fieldelement(GGV; "HR Employees"."Post Code") { }
                fieldelement(YH; "HR Employees".County) { }
                fieldelement(e; "HR Employees"."E-Mail") { }
                fieldelement(f; "HR Employees"."ID Number") { }
                fieldelement(g; "HR Employees".Gender) { }
                fieldelement(h; "HR Employees".Status) { }
                fieldelement(i; "HR Employees"."Company E-Mail") { }
                fieldelement(j; "HR Employees"."Contract Type") { }
                fieldelement(k; "HR Employees"."Marital Status") { }
                fieldelement(RF; "HR Employees".Disabled) { }
                fieldelement(GHJ; "HR Employees"."Second Language (R/W/S)") { }
                fieldelement(IOI; "HR Employees"."Additional Language") { }
                fieldelement(n; "HR Employees"."Job ID") { }
                fieldelement(o; "HR Employees"."PIN No.") { }
                fieldelement(p; "HR Employees"."NSSF No.") { }
                fieldelement(q; "HR Employees"."NHIF No.") { }
                fieldelement(r; "HR Employees".Religion) { }
                fieldelement(s; "HR Employees"."Job Title") { }
                fieldelement(GHH; "HR Employees"."Department Name") { }
                fieldelement(YU; "HR Employees"."County Name") { }
                fieldelement(KL; "HR Employees"."Global Dimension 1 Code") { }
                fieldelement(u; "HR Employees"."Global Dimension 2 Code") { }
                fieldelement(YUI; "HR Employees"."Responsibility Center") { }
                fieldelement(x; "HR Employees"."Cell Phone Number") { }
                fieldelement(OL; "HR Employees".Grade) { }
                fieldelement(PL; "HR Employees"."Basic Pay") { }
                fieldelement(OYGF; "HR Employees"."Job Group Range") { }
                fieldelement(UIOL; "HR Employees"."Contract Duration") { }
                fieldelement(y; "HR Employees".DAge) { }
                fieldelement(HH; "HR Employees".DPension) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
