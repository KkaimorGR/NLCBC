/* 
Codeunit 52193512 "Mail Management9520"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Mail Management"(Codeunit 9520)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09262018D;
        //      Time=114847T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Mail Management"(Codeunit 9520);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF Recipients = '' THEN
        //                                            ERROR(InvalidEmailAddressErr,Recipients);
        //
        //                                          #4..6
        //                                            TmpRecipients := COPYSTR(TmpRecipients,STRPOS(TmpRecipients,';') + 1);
        //                                          END;
        //                                          CheckValidEmailAddress(TmpRecipients);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //
        //                                          #1..9
        //                                        END;
        //
        //                           Target=CheckValidEmailAddresses(PROCEDURE 8) }
        //    }
        //    CODE
        //    {
        //
        //      BEGIN
        //      END.
        //    }
        //  }
        //
        //

    end;
}
 */