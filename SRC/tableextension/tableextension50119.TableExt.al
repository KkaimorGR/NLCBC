
tableextension 52193446 tableextension50119 extends "Inventory Posting Group"
{

    //Unsupported feature: Code Insertion on "OnDelete".

    //trigger OnDelete()
    //begin
    /*

    //Prevent deletion once entries exist
    TestNoEntriesExist(FIELDCAPTION(Code));
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        ItemLedgEntry: Record "Value Entry";
    begin
        //To prevent change of field
        ItemLedgEntry.SetCurrentKey(ItemLedgEntry."Inventory Posting Group");
        ItemLedgEntry.SetRange("Inventory Posting Group", Rec.Code);
        if ItemLedgEntry.Find('-') then
            Error(
              Text001,
              CurrentFieldName);
    end;

    var
        Text001: Label 'You cannot delete the contents of the %1 field because this %2 has one or more  ledger entries posted with this code.';
}
