
report 52193808 "UNIT OF MEASURE TRANS"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'UNIT OF MEASURE TRANS';
    dataset
    {
        dataitem(Item; Item)
        {
            column(ReportForNavId_1; 1) { }
            column(No; Item."No.") { }
            column(Unit_of_Measure; Item."Base Unit of Measure") { }

            trigger OnAfterGetRecord()
            begin
                ItemUnitofMeasure.Reset();
                ItemUnitofMeasure.SetRange(ItemUnitofMeasure."Item No.", Item."No.");
                if not ItemUnitofMeasure.Find('-') then begin
                    ItemUnitofMeasure."Item No." := Item."No.";
                    ItemUnitofMeasure.Validate(ItemUnitofMeasure."Item No.");
                    ItemUnitofMeasure.Code := Item."Base Unit of Measure";
                    //ItemUnitofMeasure.VALIDATE(ItemUnitofMeasure.Code);
                    ItemUnitofMeasure."Qty. per Unit of Measure" := 1;
                    ItemUnitofMeasure.Validate(ItemUnitofMeasure."Qty. per Unit of Measure");
                    ItemUnitofMeasure.Insert();



                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Item units of measure transfer complete');
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
        ItemUnitofMeasure: Record "Item Unit of Measure";
}
