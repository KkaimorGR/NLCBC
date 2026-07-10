codeunit 52193456 "Haki kwa ground Api"
{
    procedure GetAvailableEmployees(StartDate: Date; EndDate: Date) Data: Text
    var
        myInt: Integer;
        LeaveApplication: Record "HR Leave Application";
        HrEmployees: Record "HR Employees";
        EmploReec: Record "HR Employees";
    begin
        if StartDate = 0D then
            StartDate := Today;
        if EndDate = 0D then
            EndDate := Today;
        EmploReec.Reset();
        EmploReec.SetRange(EmploReec.Status, EmploReec.Status::Active);
        EmploReec.SetRange(EmploReec."Global Dimension 2 Code", 'LA&R');
        // EmploReec.SetRange(lea);
        if EmploReec.FindSet() then
            repeat
                LeaveApplication.Reset();
                LeaveApplication.SetRange("Employee No", EmploReec."No.");
                LeaveApplication.SetFilter("Start Date", '>=%1', StartDate);
                LeaveApplication.SetFilter("End Date", '>=%1', EndDate);
                LeaveApplication.SetRange(Status, LeaveApplication.Status::Approved);
                if not LeaveApplication.FindFirst() then
                    Data += EmploReec."No." + '*' + EmploReec."Full Name" + '::'
            until EmploReec.Next() = 0;

    end;

    procedure GetICTAvailableEmployees(StartDate: Date; EndDate: Date) Data: Text
    var
        myInt: Integer;
        LeaveApplication: Record "HR Leave Application";
        HrEmployees: Record "HR Employees";
        EmploReec: Record "HR Employees";
    begin
        if StartDate = 0D then
            StartDate := Today;
        if EndDate = 0D then
            EndDate := Today;
        EmploReec.Reset();
        EmploReec.SetRange(EmploReec.Status, EmploReec.Status::Active);
        EmploReec.SetRange(EmploReec."Global Dimension 2 Code", 'ICT');
        // EmploReec.SetRange(lea);
        if EmploReec.FindSet() then
            repeat
                LeaveApplication.Reset();
                LeaveApplication.SetRange("Employee No", EmploReec."No.");
                LeaveApplication.SetFilter("Start Date", '>=%1', StartDate);
                LeaveApplication.SetFilter("End Date", '>=%1', EndDate);
                LeaveApplication.SetRange(Status, LeaveApplication.Status::Approved);
                if not LeaveApplication.FindFirst() then
                    Data += EmploReec."Full Name" + '*' + EmploReec."Company E-Mail" + '::'
            until EmploReec.Next() = 0;

    end;

}
