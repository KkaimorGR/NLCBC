
report 52193449 "Fixed assets dimensions"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Fixed assets dimensions';
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                if "Fixed Asset"."No." > 'FA00015' then begin

                    "Fixed Asset"."Global Dimension 1 Code" := 'DON0000060';
                    "Fixed Asset".Validate("Fixed Asset"."Global Dimension 1 Code");
                    "Fixed Asset"."Global Dimension 2 Code" := 'GR000015';
                    "Fixed Asset".Validate("Fixed Asset"."Global Dimension 2 Code");
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Complete!');
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
