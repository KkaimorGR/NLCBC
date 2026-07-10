
codeunit 52193451 "Update Analysis View410"
{
    var

    // //[Scope('OnPrem')]
    procedure UpdateAnalysisView_Budget(Rec: Record "Analysis View")
    var
        MaxNumber: Integer;
        Updatanalysisview: Codeunit "Update Analysis View";
        Text000: Label 'Do you want to update %1 %2?';
    begin
        //Will Update Analysis View from Budgetary Control
        MaxNumber := 2147483647;
        if Rec.Code <> '' then
            if Confirm(Text000, true, Rec.TableCaption, Rec.Code) then begin
                Rec.Modify();
                //Updatanalysisview.UpdateOne(Rec, 2, TRUE);
                Updatanalysisview.Update(Rec, 2, true);
            end;
    end;

}
