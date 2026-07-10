report 52193482 "Receipt Voucher S11"
{
    ApplicationArea = All;
    Caption = 'Receipt Voucher S11';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/ReceiptVoucherS11Report.rdlc';

    dataset
    {

        dataitem(StoreRequistionHeaders; "Store Requistion Headers")
        {
            RequestFilterFields = "No.";
            column(ActionType; "Action Type")
            {
            }
            column(Allocated; Allocated)
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(Approved; Approved)
            {
            }
            column(ApprovedIFMISOrder; "Approved IFMIS Order")
            {
            }
            column(BookingType; "Booking Type")
            {
            }
            column(BudgetCenterName; "Budget Center Name")
            {
            }
            column(Currency; Currency)
            {
            }
            column(CurrentLocationStore; "Current Location Store")
            {
            }
            column(DateReceived; "Date Received")
            {
            }
            column(DateSigned; "Date Signed")
            {
            }
            column(DeliveryNote; "Delivery Note")
            {
            }
            column(Dim3; Dim3)
            {
            }
            column(Dim4; Dim4)
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EmployeeCode; "Employee Code")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(FileMovementCode; "File Movement Code")
            {
            }
            column(FunctionName; "Function Name")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(InvoiceNo; "Invoice No")
            {
            }
            column(IssuingStore; "Issuing Store")
            {
            }
            column(JobNo; "Job No")
            {
            }
            column(Justification; Justification)
            {
            }
            column(NoofLines; "No of Lines")
            {
            }
            column(No; "No.")
            {
            }
            column(NoPrinted; "No. Printed")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Open; Open)
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(OrderNo; "Order No")
            {
            }
            column(PendingApproval; "Pending Approval")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PurchaseOrderNo; "Purchase Order No")
            {
            }
            column(PurchasingStore; "Purchasing Store")
            {
            }
            column(Received; Received)
            {
            }
            column(ReceivedBy; "Received By")
            {
            }
            column(ReceivedDate; "Received Date")
            {
            }
            column(Rejected; Rejected)
            {
            }
            column(RejectedBy; "Rejected By")
            {
            }
            column(RejectedDate; "Rejected Date")
            {
            }
            column(RejectedPONo; "Rejected PO No.")
            {
            }
            column(RequestDescription; "Request Description")
            {
            }
            column(Requestdate; "Request date")
            {
            }
            column(RequesterID; "Requester ID")
            {
            }
            column(RequiredDate; "Required Date")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SerialNo; "Serial No.")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(Status; Status)
            {
            }
            column(Supplier; Supplier)
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(UserID; "User ID")
            {
            }
            column(UserSignature; "User Signature")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name)
            {

            }
            column(Required_Date; "Required Date")
            {

            }
            column(Request_Description; "Request Description")
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Approver; Approver)
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Function_Name; "Function Name")
            {

            }


            dataitem("Store Requistion Line"; "Store Requisition TT Line")
            {
                DataItemLink = "Requistion No" = field("No.");
                DataItemLinkReference = StoreRequistionHeaders;
                column(Description; Description)
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Quantity_Requested; "Quantity Requested")
                {

                }
                column(Approved_Qty; "Approved Qty")
                {

                }
                column(No_; "No.")
                {

                }
                column(FA_No_; "FA No.")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }

                column(Issuing_Store; "Issuing Store")
                {

                }
                column(Item_Status; "Item Status")
                {

                }
                column(Card_No_; "Card No.")
                {

                }
                column(Approved_Quantity; "Approved Quantity")
                {

                }
                column(Quantity; "Quantity")
                {

                }
                column(Quantity_to_Reject; "Quantity to Reject")
                {

                }






            }
            trigger OnAfterGetRecord()

            begin
                AP.SetRange("Sender ID", "Requester ID");
                IF AP.FindFirst() then
                    Approver := AP."Approver ID";
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
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        HRAppraisalHeader: Record "HR Appraisal Header";
        AP: Record "Approval Entry";
        Approver: code[100];
}
