
report 52193817 "Expire LPOs"
{
    DefaultLayout = RDLC;
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Expire LPOs';
    //RDLCLayout = './Layouts/Expire LPOs.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(ReportForNavId_1102755000; 1102755000) { }

            trigger OnAfterGetRecord()
            begin
                if "Purchase Header"."Expiry Date" = WorkDate() then
                    //"Purchase Header".Status := "Purchase Header".Status::"5";
                    "Purchase Header".Modify();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
