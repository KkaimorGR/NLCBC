
codeunit 52193493 "Journal Post Successful"
{



    procedure PostedSuccessfully() Posted: Boolean
    var
        ValPost: Record "Value Posting";
    begin

        Posted := false;
        ValPost.SetRange(ValPost.UserID, UserId);
        ValPost.SetRange(ValPost."Value Posting", 1);
        if ValPost.Find('-') then
            Posted := true;
    end;
}
