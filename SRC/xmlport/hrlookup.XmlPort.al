
xmlport 50031 "hr lookup"
{
    Format = VariableText;
    Caption = 'hr lookup';
    schema
    {
        textelement(root)
        {
            tableelement("HR Lookup Values"; "HR Lookup Values")
            {
                XmlName = 'comp';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
