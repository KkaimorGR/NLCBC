codeunit 52193429 "Email Notifications"
{
    //TableNo = "Email Notifications";

    trigger OnRun()
    var
        port: Codeunit PortalWebService;
    begin
        // port.CreateFixedAsset(1, 'Standard ,wooden', '6565', '', '', 2, '', 2, 1, '', 1);
        EmployeeRetirementReminder();


    end;

    procedure EmployeeRetirementReminder()
    var
        CurrDate: Date;

        Emp: Record "HR Employees";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        PRSET: record "prPayroll Setup";
    begin
        CurrDate := Today;
        //1st
        Emp.Reset();
        Emp.SetRange(Status, Emp.Status::Active);
        Emp.SetRange(Emp."Retirement date", CalcDate('3M', CurrDate));
        if Emp.FindSet() then begin
            PRSET.Get();
            PRSET.TestField("Payroll Email Contact");
            EmailRecepient.Add(PRSET."Payroll Email Contact");
            repeat
                EmailSubject := 'RETIREMENT REMINDER';
                EmailBody := 'This is to remind you that the Employee: <b> No. ' + Emp."No." + ' - ' + Emp."Full Name" + '</b>, will be Retiring on date: ' + Format(Emp."Retirement date") + '.';
                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                Email.Send(EmailMessage);
            until Emp.Next() = 0;
        end;
        //2nd
        Emp.Reset();
        Emp.SetRange(Status, Emp.Status::Active);
        Emp.SetRange(Emp."Retirement date", CalcDate('2M', CurrDate));
        if Emp.FindSet() then begin
            PRSET.Get();
            PRSET.TestField("Payroll Email Contact");
            EmailRecepient.Add(PRSET."Payroll Email Contact");
            repeat
                EmailSubject := 'RETIREMENT REMINDER';
                EmailBody := 'This is to remind you that the Employee: <b> No. ' + Emp."No." + ' - ' + Emp."Full Name" + '</b>, will be Retiring on date: ' + Format(Emp."Retirement date") + '.';
                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                Email.Send(EmailMessage);
            until Emp.Next() = 0;
        end;
        //3rd
        Emp.Reset();
        Emp.SetRange(Status, Emp.Status::Active);
        Emp.SetRange(Emp."Retirement date", CalcDate('1M', CurrDate));
        if Emp.FindSet() then begin
            PRSET.Get();
            PRSET.TestField("Payroll Email Contact");
            EmailRecepient.Add(PRSET."Payroll Email Contact");
            repeat
                EmailSubject := 'RETIREMENT REMINDER';
                EmailBody := 'This is to remind you that the Employee: <b> No. ' + Emp."No." + ' - ' + Emp."Full Name" + '</b>, will be Retiring on date: ' + Format(Emp."Retirement date") + '.';
                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                Email.Send(EmailMessage);
            until Emp.Next() = 0;
        end;
    end;

}
