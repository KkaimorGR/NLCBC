
xmlport 50040 "Items Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Items Upload';
    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                AutoUpdate = false;
                XmlName = 'Item';
                fieldelement(no; Item."No.") { }
                fieldelement(description; Item.Description)
                {
                    FieldValidate = Yes;
                }
                fieldelement(category; Item."Item Category Code") { }
                fieldelement(postinggroup; Item."Inventory Posting Group") { }
                fieldelement(Suppliername; Item."Supplier Name") { }
                fieldelement(deliverydate; Item."Delivery Date") { }
                fieldelement(financialyear; Item."Financial Year") { }
                fieldelement(deliverynote; Item."Delivery Note") { }
                fieldelement(invoiceno; Item."Invoice No") { }
                fieldelement(orderno; Item."Order No") { }
                fieldelement(unitmeasure; Item."Base Unit of Measure") { }
                fieldelement(GenProduct; Item."Gen. Prod. Posting Group") { }

                trigger OnBeforeInsertRecord()
                begin
                    Item."VAT Prod. Posting Group" := 'ZERO'
                end;
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnPostXmlPort()
    begin
        Message('done');
    end;
}
