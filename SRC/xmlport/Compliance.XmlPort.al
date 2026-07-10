
xmlport 50008 Compliance
{
    Format = VariableText;
    Caption = 'Compliance';
    schema
    {
        textelement(root)
        {
            tableelement("HR OSIncident"; "HR OSIncident")
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
