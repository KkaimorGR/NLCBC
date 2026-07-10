
xmlport 50029 "HR Employees XMLBeneficiary"
{
    Format = VariableText;
    Caption = 'HR Employees XMLBeneficiary';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
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
        Message('Process Complete');
    end;
}
