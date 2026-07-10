
xmlport 50013 Dimension
{
    Format = VariableText;
    Caption = 'Dimension';
    schema
    {
        textelement(root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                XmlName = 'dim';
                fieldelement(a; "Dimension Value"."Dimension Code") { }
                fieldelement(b; "Dimension Value".Code) { }
                fieldelement(c; "Dimension Value".Name) { }
                fieldelement(d; "Dimension Value"."Global Dimension No.") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
