
xmlport 50043 "PR Salary Card"
{
    Format = VariableText;
    Caption = 'PR Salary Card';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Salary Card"; "PR Salary Card")
            {
                AutoUpdate = true;
                XmlName = 'PRSalaryCard';
                fieldelement(a; "PR Salary Card"."Employee Code")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        CounterVar += 1;
                    end;
                }
                fieldelement(b; "PR Salary Card"."Basic Pay")
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
