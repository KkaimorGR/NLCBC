report 52193485 "Receipt1 Voucher S11"
{
    ApplicationArea = All;
    Caption = 'Receipt Voucher S11';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt1VoucherS11Report.rdlc';

    dataset
    {

        dataitem(StoreRequistionHeaders; "Store Requistion Headers")
        {
            RequestFilterFields = "No.";
            column(ActionType; "Action Type")
            {
            }
            column(RequID; RequID)
            {

            }
            column(RequID2; RequID2)
            {

            }
            column(CaptureSIg; useerSet."User Signature")
            {

            }
            column(AppprovedBySignature; CashMgnt."Approver 2 QR Code")
            {
            }
            column(CheckedBySignature; CashMgnt."Approver 1 QR Code")
            {
            }
            column(ApprSIg; UserSetup."User Signature")
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
            column(Address; CI.Address)
            {

            }
            column(Adress2; CI."Address 2")
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
            column(ApprovalDate; ApprovalDate)
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Function_Name; "Function Name")
            {

            }
            column(Issued_By; "Issued By")
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
                useerSet.Reset();
                useerSet.SetRange("User ID", StoreRequistionHeaders."Requester ID");
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
                GetQRCodes(StoreRequistionHeaders."No.");
                if CashMgnt.Get() then begin
                    CashMgnt.CalcFields("Sender QR Code");
                    CashMgnt.CalcFields("Approver 1 QR Code");
                    CashMgnt.CalcFields("Approver 2 QR Code");
                    CashMgnt.CalcFields("Approver 3 QR Code");
                end;
                clear(ExpenseReqLineCounter);
                clear(ImprestCounter);
                clear(DirectExpenseCounter);

                clear(PreparedBy);
                Clear(CheckedBy);
                clear(ApprovedBy);
                clear(ApprovalDates);
                ApprovalMgt.GetDocApprovers(StoreRequistionHeaders.RecordId, PreparedBy, CheckedBy, ApprovedBy, ApprovalDates);
                StoreRequistionHeaders.CalcFields(Objective);
                Objective.CreateInStream(Instr);
                ObjBigTxt.Read(Instr);
                // if format(ObjBigTxt) <> Narration then begin
                //     Objective.CreateOutStream(OuStr);
                //     OuStr.WriteText(Narration);
                // end;
                Narration := Format(ObjBigTxt);

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

    procedure GetQRCodes(PvNo: Text)
    var
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        InStr: InStream;
        Txt: Text;
        EmpName: Text;
        B64: BigText;
        OutStr: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        // Bytes: dotnet Array;
        // TempBlob: Codeunit "Temp Blob";
        // InStream: InStream;
        // OutStream: OutStream;
        HrEmp: Record "HR Employees";
        // EmpName: Text;
        // B64: BigText;
        ByteCount: Integer;
        // Base64Convert: Codeunit "Base64 Convert";
        QRCodeUnit: Codeunit QRCodeUnit;
        // Convert: dotnet Convert;
        ApprovalEntry: Record "Approval Entry";

        ApprovalEntries: Record "Approval Entry";
        i: Integer;

    begin

        ApprovalEntry.Reset();
        ApprovalEntry.setrange(ApprovalEntry."Document No.", PvNo);
        //ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
        if ApprovalEntry.find('-') then begin
            PreparedByUser := ApprovalEntries."Sender ID";
            if UserSetup.Get(ApprovalEntry."Sender ID") then
                if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Initiator: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            B64 := QRCodeUnit.GenerateApprovalQRCode(50110, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", HrEmp."OTP Code", HrEmp."Cell Phone Number");
            // Bytes := Convert.FromBase64String(B64);
            // MemoryStream := MemoryStream.MemoryStream(Bytes);
            //
            B64.GetSubText(Txt, 1, B64.Length);

            // Decode Base64 into TempBlob
            TempBlob.CreateOutStream(OutStr);
            Base64Convert.FromBase64(Txt, OutStr);

            // Import the decoded stream into the Media field
            TempBlob.CreateInStream(InStr);
            CashMgnt.DeleteAll();
            CashMgnt.Init();
            CashMgnt."Sender QR Code".CreateOutStream(OutStr);
            Base64Convert.FromBase64(Format(B64), OutStr);
            ApprovalEntries.Reset;
            ApprovalEntries.SetRange("Table ID", 52193901);
            ApprovalEntries.SetRange("Document No.", PvNo);
            // ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
            if ApprovalEntries.FindSet() then begin
                i := 0;
                repeat
                    i := i + 1;
                    if ApprovalEntries."Sequence No." = 1 then begin
                        PreparedByUser := ApprovalEntries."Sender ID";
                        if UserSetup.Get(ApprovalEntries."Approver ID") then
                            if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."Cell Phone Number");
                        // Bytes := Convert.FromBase64String(B64);
                        // MemoryStream := MemoryStream.MemoryStream(Bytes);

                        //
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Txt, OutStr);

                        // Import the decoded stream into the Media field
                        TempBlob.CreateInStream(InStr);
                        CashMgnt."Approver 1 QR Code".CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Format(B64), OutStr);

                        CheckedByUser := ApprovalEntries."Approver ID";

                    end;
                    if ApprovalEntries."Sequence No." = 2 then begin

                        if UserSetup.Get(ApprovalEntries."Approver ID") then
                            if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."Cell Phone Number");
                        // Bytes := Convert.FromBase64String(B64);
                        // MemoryStream := MemoryStream.MemoryStream(Bytes);
                        //
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Txt, OutStr);

                        // Import the decoded stream into the Media field
                        TempBlob.CreateInStream(InStr);
                        CashMgnt."Approver 2 QR Code".CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Format(B64), OutStr);
                        ApprovedByUser := ApprovalEntries."Approver ID";
                    end;

                    if ApprovalEntries."Sequence No." = 3 then begin
                        if UserSetup.Get(ApprovalEntries."Approver ID") then
                            if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."Cell Phone Number");
                        // Bytes := Convert.FromBase64String(B64);
                        // MemoryStream := MemoryStream.MemoryStream(Bytes);
                        //
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Txt, OutStr);

                        // Import the decoded stream into the Media field
                        TempBlob.CreateInStream(InStr);
                        CashMgnt."Approver 3 QR Code".CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Format(B64), OutStr);
                        ApprovedUser := ApprovalEntries."Approver ID";
                    end;
                until
               ApprovalEntries.Next = 0;
            end;
            CashMgnt.Insert();
            if CashMgnt.Get() then begin
                CashMgnt.CalcFields("Sender QR Code");
                CashMgnt.CalcFields("Approver 1 QR Code");
                CashMgnt.CalcFields("AIE QR Code");
                CashMgnt.CalcFields("Approver 2 QR Code");
                CashMgnt.CalcFields("Approver 3 QR Code");
            end;
        end else begin
            CashMgnt.DeleteAll();

        end;
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
        CompInfo: Record "Company Information";
        DimensionValue: Record "Dimension Value";
        ExpenseReqLineCounter, ImprestCounter, DirectExpenseCounter : Integer;
        PreparedBy, CheckedBy, ApprovedBy : Record "User Setup";
        ApprovalDates: array[3] of DateTime;
        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
        CheckedByUser: Text;
        ApprovedByUser: Text;
        PreparedByUser: Text;
        ApprovedUser: Text;
        CashMgnt: Record "Digital Signature";

        Narration: Text;
        ObjBigTxt: BigText;
        Instr: InStream;
        OuStr: OutStream;
}
