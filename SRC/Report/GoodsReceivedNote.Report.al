
report 52193508 "Goods Received Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Goods Received Note.rdlc';
    ApplicationArea = All;
    Caption = 'Receipts Voucher';
    dataset
    {
        dataitem("Store Requistion Headers"; "Store Requistion Headers")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_1826; 1826) { }
            column(RequID; RequID)
            {

            }
            column(EncoredQR; EncoredQR)
            {

            }
            column(Approver2QRCode; CashMgnt."Approver 2 QR Code")
            {

            }
            column(Approver1QRCode; CashMgnt."Approver 1 QR Code")
            {

            }
            column(RequID2; RequID2)
            {

            }
            column(CaptureSIg; useerSet."User Signature")
            {

            }
            column(ApprSIg; UserSetup."User Signature")
            {

            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Invoice_No; "Invoice No")
            { }
            column(Purchase_Order_No; "Purchase Order No")
            { }
            column(Delivery_Note; "Delivery Note")
            { }
            column(Store_Requistion_Header__Required_Date_; "Store Requistion Headers"."Required Date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_; "Store Requistion Headers"."Shortcut Dimension 4 Code") { }
            column(Store_Requistion_Header_Dim4; "Store Requistion Headers".Dim4) { }
            column(Store_Requistion_Header__Request_date_; "Store Requistion Headers"."Request date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_; "Store Requistion Headers"."Shortcut Dimension 3 Code") { }
            column(Store_Requistion_Header_Dim3; "Store Requistion Headers".Dim3) { }
            column(Store_Requistion_Header__Request_Description_; "Store Requistion Headers"."Request Description") { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_; "Store Requistion Headers"."Shortcut Dimension 2 Code") { }
            column(Store_Requistion_Header__Budget_Center_Name_; "Store Requistion Headers"."Budget Center Name") { }
            column(Store_Requistion_Header__No__; "Store Requistion Headers"."No.") { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_; "Store Requistion Headers"."Global Dimension 1 Code") { }
            column(Store_Requistion_Header__Function_Name_; "Store Requistion Headers"."Function Name") { }
            column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(USERID_Control1102755048; UserId) { }
            column(Store_RequistionCaption; Store_RequistionCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Store_Requistion_Lines_DescriptionCaption; "Store Requistion Line".FieldCaption(Description)) { }
            column(Store_Requistion_Lines_QuantityCaption; "Store Requistion Line".FieldCaption(Quantity)) { }
            column(UoMCaption; UoMCaptionLbl) { }
            column(Store_Requistion_Lines__Line_Amount_Caption; "Store Requistion Line".FieldCaption("Line Amount")) { }
            column(Store_Requistion_Lines__Unit_Cost_Caption; "Store Requistion Line".FieldCaption("Unit Cost")) { }
            column(Store_Requistion_Header__Required_Date_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Required Date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 4 Code")) { }
            column(Store_Requistion_Lines__No__Caption; "Store Requistion Line".FieldCaption("No.")) { }
            column(Store_Requistion_Header__Request_date_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Request date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 3 Code")) { }
            column(Store_Requistion_Header__Request_Description_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Request Description")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 2 Code")) { }
            column(Store_Requistion_Header__No__Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."No.")) { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Global Dimension 1 Code")) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(RecipientCaption; RecipientCaptionLbl) { }
            column(Printed_By_Caption; Printed_By_CaptionLbl) { }
            column(Name_Caption_Control1102755052; Name_Caption_Control1102755052Lbl) { }
            column(Date_Caption_Control1102755053; Date_Caption_Control1102755053Lbl) { }
            column(Signature_Caption; Signature_CaptionLbl) { }
            column(AuthorisationsCaption; AuthorisationsCaptionLbl) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(Signature_Caption_Control1102755000; Signature_Caption_Control1102755000Lbl) { }
            column(DocHeader; DocHeader) { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoAdd; CompanyInfo.Address) { }
            column(CompanyInfoAdd2; CompanyInfo."Address 2") { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            column(OrderNo_StoreRequistionHeaders; "Store Requistion Headers"."Order No") { }
            column(VendorName_StoreRequistionHeaders; "Store Requistion Headers"."Vendor Name") { }
            column(RequesterID_StoreRequistionHeaders; "Store Requistion Headers"."Requester ID") { }
            column(DateReceived_StoreRequistionHeaders; "Store Requistion Headers"."Date Received") { }
            column(Approver; Approver) { }
            column(ApprovalDate; ApprovalDate) { }
            dataitem("Store Requistion Line"; "Store Requisition TT Line")
            {
                DataItemLink = "Requistion No" = field("No.");
                DataItemTableView = sorting("Requistion No", "Line No.") order(ascending);
                column(ReportForNavId_7187; 7187) { }
                column(Store_Requistion_Lines__No__; "Store Requistion Line"."No.") { }
                column(Store_Requistion_Lines_Description; "Store Requistion Line".Description) { }
                column(Store_Requistion_Lines_Quantity; "Store Requistion Line".Quantity) { }
                column(Store_Requistion_Lines__Unit_of_Measure_; "Store Requistion Line"."Unit of Measure") { }
                column(Store_Requistion_Lines__Line_Amount_; "Store Requistion Line"."Line Amount") { }
                column(Store_Requistion_Lines__Unit_Cost_; "Store Requistion Line"."Unit Cost") { }
                column(QuantityDelivered_StoreRequistionLine; "Store Requistion Line"."Quantity Delivered") { }
                column(Store_Requistion_Lines_Requistion_No; "Store Requistion Line"."Requistion No") { }
                column(Card_No_; "Card No.") { }
                column(Certificate_No_; "Certificate No.") { }
                column(Quantity_Requested; "Quantity Requested")
                {

                }
                column(Approved_Quantity; "Approved Quantity")
                {

                }
                column(Quantity_Delivered; "Quantity Delivered")
                {

                }



            }

            trigger OnAfterGetRecord()
            var
                approvalEntry: Record "Approval Entry";
                StoreHeadears: Record "Store Requistion Headers";
                HrEmployees: Record "HR Employees";


            begin
                EncoredQR := '';
                RequID2 := '';
                RequID := '';
                StoreHeadears.Reset();
                StoreHeadears.SetRange("No.", "Store Requistion Headers"."No.");
                if StoreHeadears.Find('-') then begin
                    useerSet.Reset();
                    useerSet.SetRange("User ID", "Store Requistion Headers"."Requester ID");
                    if useerSet.FindFirst() then begin
                        useerSet.CalcFields("User Signature");
                    end;
                    HrEmployees.Reset();
                    HrEmployees.SetRange("User ID", StoreHeadears."Requester ID");
                    if HrEmployees.FindFirst() then
                        RequID := HrEmployees."Job Title";
                end;
                approvalEntry.Reset();
                approvalEntry.SetRange("Document No.", "No.");
                //approvalEntry.SetFilter(Status, '=%1', approvalEntry.Status::Approved);
                if approvalEntry.Find('-') then begin
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", approvalEntry."Approver ID");
                    if UserSetup.FindFirst() then begin
                        UserSetup.CalcFields("User Signature");
                    end;
                    HrEmployees.Reset();
                    HrEmployees.SetRange("User ID", approvalEntry."Approver ID");
                    if HrEmployees.FindFirst() then
                        RequID2 := HrEmployees."Job Title";
                    Approver := approvalEntry."Approver ID";
                    ApprovalDate := approvalEntry."Last Date-Time Modified";
                end;
                GetQRCodes("Store Requistion Headers"."No.");
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
                ApprovalMgt.GetDocApprovers("Store Requistion Headers".RecordId, PreparedBy, CheckedBy, ApprovedBy, ApprovalDates);
                "Store Requistion Headers".CalcFields(Objective);
                Objective.CreateInStream(Instr);
                ObjBigTxt.Read(Instr);
                // if format(ObjBigTxt) <> Narration then begin
                //     Objective.CreateOutStream(OuStr);
                //     OuStr.WriteText(Narration);
                // end;
                Narration := Format(ObjBigTxt);
                barcodeSymb := Enum::"Barcode Symbology 2D"::Aztec;
                BarcodeFone := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeString := "Store Requistion Headers"."No.";
                EncoredQR := BarcodeFone.EncodeFont(BarCodeString, barcodeSymb);

            end;

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture)
    end;

    procedure GetQRCodes(PvNo: Text)
    var
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        Txt: Text;

        B64: BigText;
        // Bytes: dotnet Array;
        TempBlob: Codeunit "Temp Blob";
        // InStream: InStream;
        // OutStream: OutStream;
        InStr: InStream;
        OutStr: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        HrEmp: Record "HR Employees";
        EmpName: Text;

        ByteCount: Integer;
        Base64Conv: Codeunit "Base64 Convert";
        QRCodeUnit: Codeunit QRCodeUnit;
        // Convert: dotnet Convert;
        ApprovalEntry: Record "Approval Entry";

        ApprovalEntries: Record "Approval Entry";
        StoreHeaders: Record "Store Requistion Headers";
        i: Integer;

    begin

        ApprovalEntry.Reset();
        ApprovalEntry.setrange(ApprovalEntry."Document No.", PvNo);
        //ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
        if ApprovalEntry.find('-') then begin
            PreparedByUser := ApprovalEntries."Sender ID";
            StoreHeaders.Reset();
            StoreHeaders.SetRange("No.", ApprovalEntry."Document No.");
            if StoreHeaders.FindFirst() then
                // if UserSetup.Get(ApprovalEntry."Sender ID") then
                if HrEmp.Get(StoreHeaders."Employee Code") then EmpName := '; Staff Info: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", HrEmp."OTP Code", HrEmp."County Name");
            // Bytes := Convert.FromBase64String(B64);
            // MemoryStream := MemoryStream.MemoryStream(Bytes);
            //
            B64.GetSubText(Txt, 1, B64.Length);

            // Decode Base64 into TempBlob
            TempBlob.CreateOutStream(OutStr);
            Base64Conv.FromBase64(Txt, OutStr);

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
                        StoreHeaders.Reset();
                        StoreHeaders.SetRange("No.", ApprovalEntry."Document No.");
                        if StoreHeaders.FindFirst() then
                            if HrEmp.Get(StoreHeaders."Employee Code") then EmpName := '; Staff: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."County Name");
                        // Bytes := Convert.FromBase64String(B64);
                        // MemoryStream := MemoryStream.MemoryStream(Bytes);
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Conv.FromBase64(Txt, OutStr);

                        // Import the decoded stream into the Media field
                        TempBlob.CreateInStream(InStr);
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Conv.FromBase64(Txt, OutStr);

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
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Conv.FromBase64(Txt, OutStr);

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
                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Conv.FromBase64(Txt, OutStr);

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
        Store_RequistionCaptionLbl: Label 'Store Requistion';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        UoMCaptionLbl: Label 'UoM';
        Date_CaptionLbl: Label 'Date:';
        BarCodeString: Text;
        barcodeSymb: Enum "Barcode Symbology 2D";
        BarcodeFone: Interface "Barcode Font Provider 2D";
        EncoredQR: Text;

        Name_CaptionLbl: Label 'Name:';
        RecipientCaptionLbl: Label 'Received By:';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Name_Caption_Control1102755052Lbl: Label 'Name:';
        Date_Caption_Control1102755053Lbl: Label 'Date:';
        Signature_CaptionLbl: Label 'Signature:';
        AuthorisationsCaptionLbl: Label 'Authorisations';
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        Signature_Caption_Control1102755000Lbl: Label 'Signature:';
        DocHeader: Text;
        CompanyInfo: Record "Company Information";
        Approver: Code[100];
        ApprovalDate: DateTime;
        RequID: Text;
        RequID2: Text;
        useerSet: Record "User Setup";
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
