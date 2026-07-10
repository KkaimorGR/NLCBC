
xmlport 50042 prPAYE
{
    Format = VariableText;
    Caption = 'prPAYE';
    schema
    {
        textelement(Root)
        {
            tableelement("PR PAYE"; "PR PAYE")
            {
                XmlName = 'prPAYE';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
