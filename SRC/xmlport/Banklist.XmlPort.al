
xmlport 50006 Banklist
{
    Format = VariableText;
    Caption = 'Banklist';
    schema
    {
        textelement(root)
        {
            tableelement("Bank Account"; "Bank Account")
            {
                XmlName = 'BankAccount';
                fieldelement(a; "Bank Account"."No.") { }
                fieldelement(b; "Bank Account".Name) { }
                fieldelement(c; "Bank Account"."Bank Branch No.") { }
                fieldelement(c1; "Bank Account"."Search Name") { }
                fieldelement(d; "Bank Account".Address) { }
                fieldelement(e; "Bank Account".City) { }
                fieldelement(f; "Bank Account".Contact) { }
                fieldelement(g; "Bank Account"."Bank Account No.") { }
                fieldelement(h; "Bank Account"."Bank Acc. Posting Group")
                {
                    MaxOccurs = Once;
                    MinOccurs = Zero;
                }
                fieldelement(i; "Bank Account"."Currency Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(j; "Bank Account"."Post Code")
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
