
xmlport 50000 address
{
    Caption = 'address';
    schema
    {
        textelement(root)
        {
            tableelement("HR Transport Allocations"; "HR Transport Allocations")
            {
                XmlName = 't';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
