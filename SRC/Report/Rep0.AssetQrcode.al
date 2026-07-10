report 50001 "Asset Qrcode"
{
    Caption = 'Asset Qrcode';
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            trigger OnAfterGetRecord()
            var
                approvalEntry: Record "Approval Entry";
                StoreHeadears: Record "Fixed Asset";
                HrEmployees: Record "HR Employees";


            begin
                EncoredQR := '';
                RequID2 := '';
                RequID := '';
                StoreHeadears.Reset();
                StoreHeadears.SetRange("No.", "Fixed Asset"."No.");
                if StoreHeadears.Find('-') then begin
                    // useerSet.Reset();
                    // useerSet.SetRange("User ID", "Fixed Asset"."Requester ID");
                    // if useerSet.FindFirst() then begin
                    //     useerSet.CalcFields("User Signature");
                    // end;
                    // HrEmployees.Reset();
                    // HrEmployees.SetRange("User ID", StoreHeadears."Requester ID");
                    // if HrEmployees.FindFirst() then
                    //     RequID := HrEmployees."Job Title";
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
                GetQRCodes("Fixed Asset"."No.");
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
                ApprovalMgt.GetDocApprovers("Fixed Asset".RecordId, PreparedBy, CheckedBy, ApprovedBy, ApprovalDates);
                "Fixed Asset".CalcFields(Objective);
                Objective.CreateInStream(Instr);
                ObjBigTxt.Read(Instr);
                // if format(ObjBigTxt) <> Narration then begin
                //     Objective.CreateOutStream(OuStr);
                //     OuStr.WriteText(Narration);
                // end;

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
    procedure GetQRCodes(PvNo: Text)
    var
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        // Bytes: dotnet Array;
        InStr: InStream;
        Txt: Text;
        EmpName: Text;
        B64: BigText;
        OutStr: OutStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        // InStream: InStream;
        // OutStream: OutStream;
        HrEmp: Record "HR Employees";
        // EmpName: Text;
        // B64: BigText;
        ByteCount: Integer;
        // Base64Convert: Codeunit "Base64 Convert";
        QRCodeUnit: Codeunit SupplyChainWebServices;
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
            B64 := QRCodeUnit.GenerateApiQRlink(52193901, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", HrEmp."OTP Code", HrEmp."County Name");
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
                        StoreHeaders.Reset();
                        StoreHeaders.SetRange("No.", ApprovalEntry."Document No.");
                        if StoreHeaders.FindFirst() then
                            if HrEmp.Get(StoreHeaders."Employee Code") then EmpName := '; Staff: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApiQRlink(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."County Name");

                        B64.GetSubText(Txt, 1, B64.Length);

                        // Decode Base64 into TempBlob
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Txt, OutStr);

                        // Import the decoded stream into the Media field
                        TempBlob.CreateInStream(InStr);
                        // Bytes := Convert.FromBase64String(B64);
                        // MemoryStream := MemoryStream.MemoryStream(Bytes);
                        CashMgnt."Approver 1 QR Code".CreateOutStream(OutStr);
                        Base64Convert.FromBase64(Format(B64), OutStr);

                        CheckedByUser := ApprovalEntries."Approver ID";

                    end;
                    if ApprovalEntries."Sequence No." = 2 then begin

                        if UserSetup.Get(ApprovalEntries."Approver ID") then
                            if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Approver: No: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                        B64 := QRCodeUnit.GenerateApiQRlink(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."Cell Phone Number");
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
                        B64 := QRCodeUnit.GenerateApiQRlink(52193901, PvNo, EmpName, ApprovalEntries."Last Date-Time Modified", HrEmp."OTP Code", HrEmp."Cell Phone Number");
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

