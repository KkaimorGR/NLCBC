
xmlport 50001 "Asset Depreciation Book Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Asset Depreciation Book Upload';
    schema
    {
        textelement(Root)
        {
            tableelement("FA Depreciation Book"; "FA Depreciation Book")
            {
                AutoUpdate = false;
                XmlName = 'DepreciationBook';
                fieldelement(FANo; "FA Depreciation Book"."FA No.") { }
                fieldelement(FAPostingGroup; "FA Depreciation Book"."FA Posting Group")
                {
                    FieldValidate = Yes;
                }
                fieldelement(FADepreBook; "FA Depreciation Book"."Depreciation Book Code") { }
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
