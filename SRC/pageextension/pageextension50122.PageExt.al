
pageextension 52193449 pageextension50122 extends "G/L Budget Names"
{
    var
        BatchName: Record "G/L Budget Name";
        GenJnlBatch: Record "G/L Budget Name";
        JournalPosted: Codeunit "Journal Post Successful";
        Text002: Label 'Budget %1 Approvals exists.';
}
