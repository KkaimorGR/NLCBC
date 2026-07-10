
xmlport 50021 "FA Locations"
{
    Format = VariableText;
    Caption = 'FA Locations';
    schema
    {
        textelement(FixedAssets)
        {
            tableelement("FA Location"; "FA Location")
            {
                MinOccurs = Zero;
                XmlName = 'LocationsTable';
                fieldelement(Code; "FA Location".Code) { }
                fieldelement(Name; "FA Location".Name) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
