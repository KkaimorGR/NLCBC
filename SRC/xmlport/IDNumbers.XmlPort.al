
xmlport 50032 "ID Numbers"
{
    Format = VariableText;
    Caption = 'ID Numbers';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'employeeCard';
                fieldelement(a; "HR Employees"."No.")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        CounterVar += 1;
                    end;
                }
                fieldelement(b; "HR Employees"."ID Number")
                {
                    FieldValidate = Yes;
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

    trigger OnPostXmlPort()
    begin
        Message('%1 Records Imported', CounterVar);
    end;

    trigger OnPreXmlPort()
    begin
        CounterVar := 0;
    end;

    var
        CounterVar: Integer;
}
