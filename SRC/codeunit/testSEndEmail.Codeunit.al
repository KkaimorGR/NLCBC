
codeunit 52193426 testSEndEmail
{

    trigger OnRun()
    var
        Subject: Text[250];
        Body: Text[250];
    // SMTPSetup: Codeunit "SMTP Mail";
    begin
        Subject := 'Vehicle Allocation for Transport Request';
        Body := 'This is to inform you that you have been allocated Vehicle No';
        //   SMTPSetup.CreateMessage('TEST','notifications@landcommission.go.ke','nathan.muoka@greencom.co.ke',Subject,Body,true);
        //   SMTPSetup.Send;
    end;
}
