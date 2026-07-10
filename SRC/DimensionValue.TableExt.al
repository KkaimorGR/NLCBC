// 
// tableextension 52193470 tableextension50143 extends "Dimension Value"
// {
//     fields
//     {

//     keys
//     {
//         // Unsupported feature: Key containing base fields
//         // key(Key1;Name)
//         // {
//         // }
//     }


//     //Unsupported feature: Code Modification on "OnInsert".

//     //trigger OnInsert()
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     GLSetup.GET;
//     "Global Dimension No." := 0;
//     IF GLSetup."Global Dimension 1 Code" = "Dimension Code" THEN
//       "Global Dimension No." := 1;
//     IF GLSetup."Global Dimension 2 Code" = "Dimension Code" THEN
//       "Global Dimension No." := 2;

//     IF CostAccSetup.GET THEN BEGIN
//       CostAccMgt.UpdateCostCenterFromDim(Rec,Rec,0);
//       CostAccMgt.UpdateCostObjectFromDim(Rec,Rec,0);
//     END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     #1..7
//     //IF CostAccSetup.GET THEN BEGIN
//     //  CostAccMgt.UpdateCostCenterFromDim(Rec,Rec,0);
//     //  CostAccMgt.UpdateCostObjectFromDim(Rec,Rec,0);
//     //END;
//     */
//     //end;


//     //Unsupported feature: Code Modification on "OnModify".

//     //trigger OnModify()
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     IF "Dimension Code" <> xRec."Dimension Code" THEN BEGIN
//       GLSetup.GET;
//       "Global Dimension No." := 0;
//       IF GLSetup."Global Dimension 1 Code" = "Dimension Code" THEN
//         "Global Dimension No." := 1;
//       IF GLSetup."Global Dimension 2 Code" = "Dimension Code" THEN
//         "Global Dimension No." := 2;
//     END;
//     IF CostAccSetup.GET THEN BEGIN
//       CostAccMgt.UpdateCostCenterFromDim(Rec,xRec,1);
//       CostAccMgt.UpdateCostObjectFromDim(Rec,xRec,1);
//     END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     #1..8

//     //IF CostAccSetup.GET THEN BEGIN
//     //  CostAccMgt.UpdateCostCenterFromDim(Rec,xRec,1);
//     //  CostAccMgt.UpdateCostObjectFromDim(Rec,xRec,1);
//     //END;
//     */
//     //end;


//     //Unsupported feature: Code Modification on "OnRename".

//     //trigger OnRename()
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     RenameBudgEntryDim;
//     RenameAnalysisViewEntryDim;
//     RenameItemBudgEntryDim;
//     RenameItemAnalysisViewEntryDim;

//     IF CostAccSetup.GET THEN BEGIN
//       CostAccMgt.UpdateCostCenterFromDim(Rec,xRec,3);
//       CostAccMgt.UpdateCostObjectFromDim(Rec,xRec,3);
//     END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     #1..5
//     //IF CostAccSetup.GET THEN BEGIN
//     //  CostAccMgt.UpdateCostCenterFromDim(Rec,xRec,3);
//     //  CostAccMgt.UpdateCostObjectFromDim(Rec,xRec,3);
//     //END;
//     */
//     //end;

//     //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".

// }
