
codeunit 52193478 "Job-Jnl.-B.Post+Print"
{
    TableNo = "HR Employees Supervisees";

    trigger OnRun()
    begin
        JobJnlBatch.Copy(Rec);
        Code();
        Rec.Copy(JobJnlBatch);
    end;

    var
        Text000: Label 'Do you want to post the journals and print the posting report?';
        Text001: Label 'The journals were successfully posted.';
        Text002: Label 'It was not possible to post all of the journals. ';
        Text003: Label 'The journals that were not successfully posted are now marked.';
        JobJnlTemplate: Record "HR Employee Course Comp.";
        JobJnlBatch: Record "HR Employees Supervisees";
        JobJnlLine: Record "HR Employee Attachments";
        JobReg: Record "HR Leave Carry Allocation";
        JobJnlPostbatch: Codeunit "HR Appraisal Jnl.-Post";
        JnlWithErrors: Boolean;

    local procedure "Code"()
    begin
        /*{
        WITH JobJnlBatch DO BEGIN
          ////JobJnlTemplate.GET("Journal Template Name");
         //// JobJnlTemplate.TESTFIELD("Posting Report ID");

          IF NOT CONFIRM(Text000) THEN
            EXIT;

          FIND('-');
          REPEAT
            ////JobJnlLine."Journal Template Name" := "Journal Template Name";
            ////JobJnlLine."Journal Batch Name" := Name;
            ////JobJnlLine."Line No." := 1;
            CLEAR(JobJnlPostbatch);
            ////IF JobJnlPostbatch.RUN(JobJnlLine) THEN BEGIN
              MARK(FALSE);
            ////  IF JobReg.GET(JobJnlLine."Line No.") THEN BEGIN
                JobReg.SETRECFILTER;
                REPORT.RUN(JobJnlTemplate."Posting Report ID",FALSE,FALSE,JobReg);
              END;
            END ELSE BEGIN
              MARK(TRUE);
              JnlWithErrors := TRUE;
            END;
          UNTIL NEXT = 0;

          IF NOT JnlWithErrors THEN
            MESSAGE(Text001)
          ELSE
            MESSAGE(
              Text002 +
              Text003);

          IF NOT FIND('=><') THEN BEGIN
            RESET;
            Name := '';
          END;
        END;
         }*/

    end;
}
