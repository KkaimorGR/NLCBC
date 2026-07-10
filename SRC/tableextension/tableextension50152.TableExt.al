
tableextension 52193479 tableextension50152 extends "Job Planning Line"
{

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ValidateModification;

    IF "Usage Link" THEN BEGIN
    #4..8
    END;

    IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
      JobPlanningLineReserve.DeleteLine(Rec);
      CALCFIELDS("Reserved Qty. (Base)");
      TESTFIELD("Reserved Qty. (Base)",0);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
     // JobPlanningLineReserve.DeleteLine(Rec);
    #13..15
    */
    //end;
}
