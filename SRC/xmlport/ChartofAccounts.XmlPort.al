
xmlport 50007 "Chart of Accounts"
{
    Format = VariableText;
    Caption = 'Chart of Accounts';
    schema
    {
        textelement(root)
        {
            tableelement("G/L Account"; "G/L Account")
            {
                XmlName = 'General';
                fieldelement(a; "G/L Account"."No.") { }
                fieldelement(b; "G/L Account".Name) { }
                fieldelement(c; "G/L Account"."Search Name") { }
                fieldelement(d; "G/L Account"."Income/Balance") { }
                fieldelement(e; "G/L Account"."Account Type") { }
                fieldelement(f; "G/L Account"."Direct Posting")
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
