
xmlport 50041 "My salcard"
{
    Format = VariableText;
    Caption = 'My salcard';
    schema
    {
        textelement(root)
        {
            tableelement("prSalary Card Casual"; "prSalary Card Casual")
            {
                XmlName = 'MyTemp';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
