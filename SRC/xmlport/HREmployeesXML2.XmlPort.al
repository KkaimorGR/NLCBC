
xmlport 50027 "HR Employees XML 2"
{
    Format = VariableText;
    Caption = 'HR Employees XML 2';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(A1; "HR Employees".County) { }
                fieldelement(B; "HR Employees"."Global Dimension 1 Code") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnPostXmlPort()
    begin
        Message('Process Complete');
    end;
}
