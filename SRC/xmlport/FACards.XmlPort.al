
xmlport 50019 FACards
{
    Format = VariableText;
    Caption = 'FACards';
    schema
    {
        textelement(FACards)
        {
            tableelement("Fixed Asset"; "Fixed Asset")
            {
                MinOccurs = Zero;
                XmlName = 'FATable';
                fieldelement("No."; "Fixed Asset"."No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Description; "Fixed Asset".Description)
                {
                    MinOccurs = Zero;
                }
                fieldelement(SearchDescription; "Fixed Asset"."Search Description")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FAClassCode; "Fixed Asset"."FA Class Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FASubclassCode; "Fixed Asset"."FA Subclass Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FALocation; "Fixed Asset"."FA Location Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement("SerialNo."; "Fixed Asset"."Serial No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FAPostinggroup; "Fixed Asset"."FA Posting Group")
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
