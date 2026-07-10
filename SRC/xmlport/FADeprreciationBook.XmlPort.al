
xmlport 50020 "FA Deprreciation Book"
{
    Format = VariableText;
    Caption = 'FA Deprreciation Book';
    schema
    {
        textelement(FADepreciationBook)
        {
            tableelement("FA Depreciation Book"; "FA Depreciation Book")
            {
                MinOccurs = Zero;
                XmlName = 'DepreciationBookTable';
                fieldelement(No; "FA Depreciation Book"."FA No.") { }
                fieldelement(DepreciationBookCode; "FA Depreciation Book"."Depreciation Book Code") { }
                fieldelement(DepreciationMethod; "FA Depreciation Book"."Depreciation Method") { }
                fieldelement(FAPosting; "FA Depreciation Book"."FA Posting Group") { }
                fieldelement(Description; "FA Depreciation Book".Description) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
