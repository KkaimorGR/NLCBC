
xmlport 50035 "Item export"
{
    Format = VariableText;
    Caption = 'Item export';
    schema
    {
        textelement(ItemList)
        {
            tableelement(Item; Item)
            {
                XmlName = 'ItemTable';
                fieldelement(ItemNo; Item."No.") { }
                fieldelement(Description; Item.Description) { }
                fieldelement(Unitomeasure; Item."Base Unit of Measure") { }
                fieldelement(GeneralProd; Item."Gen. Prod. Posting Group") { }
                fieldelement(InventoryProd; Item."Inventory Posting Group") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
