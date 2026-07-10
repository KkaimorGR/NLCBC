
xmlport 50003 "Asset Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Asset Upload';
    schema
    {
        textelement(Root)
        {
            tableelement("Fixed Asset"; "Fixed Asset")
            {
                AutoUpdate = false;
                XmlName = 'FixedAsset';
                fieldelement(no; "Fixed Asset"."No.") { }
                fieldelement(class; "Fixed Asset"."FA Class Code") { }
                fieldelement(subclass; "Fixed Asset"."FA Subclass Code") { }
                fieldelement(description; "Fixed Asset".Description)
                {
                    FieldValidate = Yes;
                }
                fieldelement(financedby; "Fixed Asset"."Financed By") { }
                fieldelement(serial; "Fixed Asset"."Serial No.") { }
                fieldelement(tag; "Fixed Asset"."Tagging No") { }
                fieldelement(make; "Fixed Asset"."Make/Model") { }
                fieldelement(datedelivery; "Fixed Asset"."Date of Delivery/Installation") { }
                fieldelement(countyname; "Fixed Asset"."County Name") { }
                fieldelement(locationname; "Fixed Asset"."Location Name") { }
                fieldelement(responsibleofficeofficer; "Fixed Asset"."Staff Name") { }
                fieldelement(condition; "Fixed Asset".Condition) { }
                fieldelement(suppliername; "Fixed Asset"."Supplier Name") { }
                fieldelement(notesremark; "Fixed Asset"."Notes/Remarks") { }
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
