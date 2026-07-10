
xmlport 50011 "Destination Code List"
{
    Format = VariableText;
    Caption = 'Destination Code List';
    schema
    {
        textelement(root)
        {
            tableelement("Travel Destination"; "Travel Destination")
            {
                XmlName = 'Destinationcodelist';
                fieldelement(a; "Travel Destination"."Destination Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(b; "Travel Destination"."Destination Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(c; "Travel Destination"."Destination Type")
                {
                    MinOccurs = Zero;
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
