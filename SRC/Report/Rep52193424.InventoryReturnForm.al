report 52193424 "Inventory Return Form"
{
    ApplicationArea = All;
    Caption = 'Inventory Return Form';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/InventoryHandover.rdlc';
    dataset
    {
        dataitem(ReturnedRejectedGoods; "Returned /Rejected Goods")
        {
            column(Picture; CI.Picture) { }
            column(Name; CI.Name)
            {

            }
            column(Address; CI.Address)
            {

            }
            column(Adress2; CI."Address 2")
            {

            }
            column(CountyName; "County Name")
            {
            }
            column(Datecaptured; "Date captured")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(ItemDescription; "Item Description")
            {
            }
            column(ItemNo; "Item No")
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(QuantityReturnRejected; "Quantity Return/Rejected")
            {
            }
            column(ReasonforReturn; "Reason for Return")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(StaffName; "Staff Name")
            {
            }
            column(StaffNo; "Staff No.")
            {
            }
            column(Status; Status)
            {
            }
            column(TotalInventory; "Total Inventory")
            {
            }
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
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";


}
