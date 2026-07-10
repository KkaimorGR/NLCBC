
xmlport 50033 IDs
{
    Direction = Import;
    Format = VariableText;
    Caption = 'IDs';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(Empcode; "HR Employees"."No.") { }
                fieldelement(ID; "HR Employees"."ID Number") { }
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
