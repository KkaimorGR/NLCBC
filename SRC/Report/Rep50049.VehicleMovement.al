report 52193478 "Vehicle Movement"
{
    ApplicationArea = All;
    Caption = 'Vehicle Movement';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/HR Transport movement.rdlc';
    dataset
    {
        dataitem(HRTransportRequisition; "HR Transport Requisition")
        {
            RequestFilterFields = "Transport Request No";
            column(Departure_Area; "Departure Area")
            {
            }
            column(Start_Date; StartDate)
            { }
            column(End_Date; Enddate)
            {

            }
            column(Transport_Request_No; "Transport Request No")
            {
            }
            column(CName; CName)
            { }
            column(Caddress; Caddress)
            { }
            column(Captured_by; "Captured by")
            {

            }
            column(picture; Compinf.Picture)
            {

            }
            dataitem("HR Transport Requisition Line"; "HR Transport Requisition Line")
            {
                DataItemLink = "Requisition No" = field("Transport Request No");
                column(Employee_No; "Employee No")
                { }
                column(Names; Names)
                {
                }

            }
            dataitem("HR Transport Allocations H"; "HR Transport Allocations H")
            {
                DataItemLink = "Transport Allocation No" = field("Transport Request No");
                column(Assigned_Driver; "Assigned Driver")
                { }
                column(Driver_Name; "Driver Name")
                {
                }
                column(Destination_s_; "Destination(s)")
                {

                }
                column(Vehicle_Reg_Number; "Vehicle Reg Number")
                {

                }
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                GlobalFun: Codeunit "Global Functions";
            begin
                StartDate := '';
                Enddate := '';
                if HRTransportRequisition."Start Date" <> 0D then
                    StartDate := GlobalFun.FormatDate(HRTransportRequisition."Start Date");
                if HRTransportRequisition."Return Date" <> 0D then
                    Enddate := GlobalFun.FormatDate(HRTransportRequisition."Return Date");

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        Compinf.get;
        Compinf.CalcFields(Compinf.Picture);
        Caddress := Compinf.Address;
        CName := Compinf.Name;

    end;

    var
        Compinf: Record "Company Information";
        Caddress: Text;
        CName: Text;
        StartDate: Text;
        Enddate: Text;
}
