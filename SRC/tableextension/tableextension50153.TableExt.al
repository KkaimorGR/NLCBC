
tableextension 52193480 tableextension50153 extends "Job Entry No."
{
    procedure GetNextEntryNo(): Integer
    begin
        Rec.LockTable();
        if not Rec.Get() then
            Rec.Insert();
        Rec."Entry No." := Rec."Entry No." + 1;
        Rec.Modify();
        exit(Rec."Entry No.");
    end;
}
