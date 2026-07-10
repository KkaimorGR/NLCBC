report 50000 "FIxed Asset Tags"
{
    Caption = 'FIxed Asset Tags';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Asset Tags.rdlc';
    ApplicationArea = All;
    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            RequestFilterFields = "No.";
            column(Tagging_No; "Tagging No")
            {

            }
            column(EncoredQR; EncoredQR)
            {

            }
            column(Approver1QRCode; CashMgnt."Approver 1 QR Code")
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                approvalEntry: Record "Approval Entry";
                StoreHeadears: Record "Fixed Asset";
                StoreHeadearsLines: Record "Store Requisition TT Line";
                HrEmployees: Record "HR Employees";
                UoMCaptionLbl: Label 'UoM';
                Date_CaptionLbl: Label 'Date:';
                ApprovalDates: array[3] of DateTime;
                BarCodeString: Text;
                barcodeSymb: Enum "Barcode Symbology 2D";
                BarcodeFone: Interface "Barcode Font Provider 2D";

                DocHeader: Text;
                CompanyInfo: Record "Company Information";
                Approver: Code[100];
                ApprovalDate: DateTime;
                RequID: Text;
                RequID2: Text;
                useerSet: Record "User Setup";
                PreparedBy, CheckedBy, ApprovedBy : Record "User Setup";

            begin
                EncoredQR := '';
                RequID2 := '';
                RequID := '';
                StoreHeadears.Reset();
                StoreHeadears.SetRange("No.", FixedAsset."No.");
                if StoreHeadears.Find('-') then begin
                    HrEmployees.Reset();
                    HrEmployees.SetRange("No.", FixedAsset."Staff No");
                    if HrEmployees.Find('-') then begin
                        useerSet.Reset();
                        useerSet.SetRange("User ID", HrEmployees."User ID");
                        if useerSet.FindFirst() then begin
                            useerSet.CalcFields("User Signature");
                        end;
                    end;
                    HrEmployees.Reset();
                    HrEmployees.SetRange("User ID", UserId);
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
                GetQRCodes(FixedAsset."No.");
                if CashMgnt.Get() then begin
                    CashMgnt.CalcFields("Sender QR Code");
                    CashMgnt.CalcFields("Approver 1 QR Code");
                    CashMgnt.CalcFields("Approver 2 QR Code");
                    CashMgnt.CalcFields("Approver 3 QR Code");
                end;
                clear(PreparedBy);
                Clear(CheckedBy);
                clear(ApprovedBy);
                clear(ApprovalDates);
                ApprovalMgt.GetDocApprovers(FixedAsset.RecordId, PreparedBy, CheckedBy, ApprovedBy, ApprovalDates);
                FixedAsset.CalcFields(Objective);
                Objective.CreateInStream(Instr);
                ObjBigTxt.Read(Instr);
                // if format(ObjBigTxt) <> Narration then begin
                //     Objective.CreateOutStream(OuStr);
                //     OuStr.WriteText(Narration);
                // end;
                Narration := Format(ObjBigTxt);
                barcodeSymb := Enum::"Barcode Symbology 2D"::Aztec;
                BarcodeFone := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarCodeString := FixedAsset."No.";
                EncoredQR := BarcodeFone.EncodeFont(BarCodeString, barcodeSymb);



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
        TempBlob: Codeunit "Temp Blob";
        HrEmp: Record "HR Employees";
        EmpName: Text;
        B64: BigText;
        ByteCount: Integer;
        Base64Convert: Codeunit "Base64 Convert";
        QRCodeUnit: Codeunit QRCodeUnit;
        // Convert: dotnet Convert;
        ApprovalEntry: Record "Approval Entry";

        ApprovalEntries: Record "Approval Entry";
        i: Integer;
        InStr: InStream;
        Txt: Text;
        OutStr: OutStream;

    begin

        ApprovalEntry.Reset();
        ApprovalEntry.setrange(ApprovalEntry."Document No.", PvNo);
        //ApprovalEntry.setrange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
        if ApprovalEntry.find('-') then begin
            PreparedByUser := ApprovalEntries."Sender ID";
            if UserSetup.Get(ApprovalEntry."Sender ID") then
                if HrEmp.Get(UserSetup."Employee No.") then EmpName := '; Initiator: PJ: ' + HrEmp."No." + ' : Names: ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            B64 := QRCodeUnit.GenerateApprovalQRCode(52193901, PvNo, EmpName, ApprovalEntry."Date-Time Sent for Approval", HrEmp."OTP Code", HrEmp."Cell Phone Number");
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
        CheckedByUser: Text;
        ApprovedByUser: Text;
        PreparedByUser: Text;
        ApprovedUser: Text;
        EncoredQR: Text;
        CashMgnt: Record "Digital Signature";

        Narration: Text;
        ObjBigTxt: BigText;
        Instr: InStream;

        UserSetup: Record "User Setup";
        OuStr: OutStream;
        ApprovalMgt: Codeunit "Custom Approvals Codeunit";
}
