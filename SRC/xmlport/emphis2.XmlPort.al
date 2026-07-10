
xmlport 50018 "emp his2"
{
    Format = VariableText;
    Caption = 'emp his2';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employment History"; "HR Employment History")
            {
                XmlName = 'comp';
                fieldelement(hhhfh; "HR Employment History".JobID) { }
                fieldelement(hh; "HR Employment History"."Employee No.") { }
                fieldelement(a; "HR Employment History"."Name of Previous Employer") { }
                fieldelement(jk; "HR Employment History"."Type of Business") { }
                fieldelement(b; "HR Employment History"."Previous Employer Contacts") { }
                fieldelement(c; "HR Employment History"."Date Employed") { }
                fieldelement(d; "HR Employment History"."Benefits/Other Allowances") { }
                fieldelement(rt; "HR Employment History".StaffNumber) { }
                fieldelement(yy; "HR Employment History".Salary) { }
                fieldelement(hj; "HR Employment History".Title) { }
                fieldelement(kl; "HR Employment History"."Number of Employees Supervised") { }
                fieldelement(kk; "HR Employment History"."Reason for Leaving") { }
                fieldelement(yi; "HR Employment History"."Terms of Service") { }
                fieldelement(k; "HR Employment History"."Description of Duties") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
