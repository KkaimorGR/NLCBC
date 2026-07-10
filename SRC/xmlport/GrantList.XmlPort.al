
xmlport 50023 "Grant List"
{
    Format = VariableText;
    Caption = 'Grant List';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Qualifications"; "HR Employee Qualifications")
            {
                AutoReplace = false;
                XmlName = 'Job';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
