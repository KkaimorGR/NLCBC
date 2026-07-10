report 52193492 "Hr Assets S11"
{
    Caption = 'Hr Assets S11';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HrAssetsS11.rdlc';
    dataset
    {
        dataitem(HRAssetTransferHeader; "HR Asset Transfer Header")
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {

            }
            column(Approver; Approver)
            {

            }
            column(ReceivedDate; "Received Date")
            {

            }
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
            column(Requestdate; "Document Date")
            {

            }
            column(RequestDescription; "Request Description")
            {

            }

            column(ApprovalDate; ApprovalDate)
            {

            }
            column(Issued_By; "Approved By")
            {

            }
            column(RequID; RequID)
            {

            }
            column(RequID2; RequID2)
            {

            }
            column(ApprSIg; useerSet."User Signature")
            {

            }
            column(CaptureSIg; UserSetup."User Signature")
            {

            }

            column(EmployeeCode; "Staff No.")
            { }
            column(UserSignature; "User Signature")
            { }
            column(EmployeeName; "Staff Name")
            {

            }
            column(PurchaseOrderNo; "Purchase Order No")
            {

            }
            column(InvoiceNo; "Invoice No")
            {

            }
            column(Delivery_Note; "Delivery Note")
            {

            }
            column(DeliveryNote; "Delivery Note")
            {
            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(RequesterID; "User ID")
            { }
            dataitem("Store Requisition TT Line"; "Store Requisition TT Line")
            {
                DataItemLink = "Requistion No" = field("No.");

                column(Unit_of_Measure; "Unit Of Measure")
                {

                }

                column(Asset_No_; "No.")
                {

                }

                column(Card_No_; "Card No.")
                {

                }
                column(Description; "Make/Model")
                { }
                column(Asset_Serial_No; "Serial No.")
                {

                }
                column(Quantity; Quantity)
                {

                }


                column(Tag_No; "Tag No.")
                { }

                // DataItemLinkReference = StoreRequistionHeaders;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                useerSet.Reset();
                useerSet.SetRange("User ID", HRAssetTransferHeader."User ID");
                if useerSet.FindFirst() then begin
                    useerSet.CalcFields("User Signature");
                end;
                HrEmployees.Reset();
                HrEmployees.SetRange("User ID", StoreHeadears."Requester ID");
                if HrEmployees.FindFirst() then
                    RequID := HrEmployees."Job Title";
                AP.Reset();
                AP.SetRange("Document No.", "No.");
                AP.SetFilter(Status, '=%1', AP.Status::Approved);
                IF AP.Find('-') then begin
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", AP."Approver ID");
                    if UserSetup.FindFirst() then begin
                        UserSetup.CalcFields("User Signature");
                    end;
                    HrEmployees.Reset();
                    HrEmployees.SetRange("User ID", AP."Approver ID");
                    if HrEmployees.FindFirst() then
                        RequID2 := HrEmployees."Job Title";
                    Approver := AP."Approver ID";
                    ApprovalDate := AP."Last Date-Time Modified";
                end;

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
        ApprovalDate: DateTime;
        useerSet: Record "User Setup";
        RequID: Text;
        RequID2: Text;
        UserSetup: Record "User Setup";
        StoreHeadears: Record "Store Requistion Headers";
        HrEmployees: Record "HR Employees";
}
