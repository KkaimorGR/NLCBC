
report 52193731 valki
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/valki.rdlc';
    ApplicationArea = All;
    Caption = 'valki';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin
                if "HR Employees".Find('-') then
                    repeat
                        "HR Employees".Validate("HR Employees"."Date Of Birth");

                        "HR Employees".Modify();
                    until "HR Employees".Next() = 0;
            end;

            trigger OnPostDataItem()
            begin
                Message('validated')
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        hremp: Record "HR Employees";
}
