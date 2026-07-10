
pageextension 52193470 pageextension50143 extends "Default Dimensions-Multiple"
{
    procedure SetMultiJob2(var Job: Record Job)
    begin
        TempDefaultDim2.DeleteAll();
        if Job.Find('-') then
            repeat
                CopyDefaultDimToDefaultDim(Database::Job, Job."No.");
            until Job.Next() = 0;
    end;

    //Unsupported feature: Property Modification (Subtype) on "SetMultiJob(PROCEDURE 8).Job(Parameter 1000)".
    var
        TempDefaultDim2: Record "Default Dimension" temporary;
}
