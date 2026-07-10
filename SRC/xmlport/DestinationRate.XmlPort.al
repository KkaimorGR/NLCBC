
xmlport 50012 "Destination Rate"
{
    Format = VariableText;
    Caption = 'Destination Rate';
    schema
    {
        textelement(root)
        {
            tableelement("Destination Rate Entry"; "Destination Rate Entry")
            {
                XmlName = 'Destinationrate';
                fieldelement(a; "Destination Rate Entry"."Advance Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(b; "Destination Rate Entry"."Destination Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(d; "Destination Rate Entry"."Destination Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(e; "Destination Rate Entry"."Daily Rate (Amount)")
                {
                    MinOccurs = Zero;
                }
                fieldelement(f; "Destination Rate Entry"."Employee Job Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(g; "Destination Rate Entry"."Destination Name")
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
