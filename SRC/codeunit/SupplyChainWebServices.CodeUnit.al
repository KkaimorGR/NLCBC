codeunit 52193458 SupplyChainWebServices
{

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure IssueGoods(LineNo3: Integer; RequestNo: code[50]): Text
    var
        myInt: Integer;
        GenJnline: Record "Item Journal Line";
        ReqLine: Record "Store Requisition TT Line";
        InventorySetup: Record "Inventory Setup";
        LineNo: Integer;
        Storeheaders: Record "Store Requistion Headers";
        RequisitionLIne2: Record "Store Requisition TT Line";
    begin
        RequisitionLIne2.Reset();
        RequisitionLIne2.SetRange("Line No.", LineNo3);
        RequisitionLIne2.SetRange("Requistion No", RequestNo);
        if RequisitionLIne2.Find('-') then begin
            Storeheaders.Reset();
            Storeheaders.SetRange("No.", RequisitionLIne2."Requistion No");
            Storeheaders.SetRange(Status, Storeheaders.Status::Released);
            if Storeheaders.Find('-') then begin
                if Storeheaders.Status = Storeheaders.Status::Released then begin
                    if Storeheaders."Action Type" = Storeheaders."Action Type"::Item then begin
                        if Storeheaders."Document Type" = Storeheaders."Document Type"::SR then begin
                            // if not LinesExists() then
                            //     Error('There are no Lines created for this Document');

                            if Storeheaders.Status = Storeheaders.Status::Posted then
                                Error('The Document Has Already been Posted');

                            if Storeheaders.Status <> Storeheaders.Status::Released then
                                Error('The Document Has not yet been Approved');
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", RequisitionLIne2."Requistion No");
                            ReqLine.SetRange("Line No.", RequisitionLIne2."Line No.");
                            if ReqLine.Find('-') then begin
                                if ReqLine.Issued = true then
                                    Error('The item has been issued!');

                                //Issue
                                if InventorySetup.Get() then begin
                                    InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                    InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                    GenJnline.Reset();
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    if GenJnline.Find('-') then
                                        GenJnline.DeleteAll();
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                    GenJnline."Document No." := RequisitionLIne2."Requistion No";
                                    GenJnline."Item No." := ReqLine."No.";
                                    //  GenJnline."Inventory Posting Group":=InventorySetup.INvt;
                                    // if GenJnline."Inventory Posting Group"='' then
                                    // GenJnline."Inventory Posting Group":='GOODS';
                                    // GenJnline."Gen. Prod. Posting Group":=ReqLine."Gen. Prod. Posting Group";
                                    if GenJnline."Gen. Prod. Posting Group" = '' then
                                        GenJnline."Gen. Prod. Posting Group" := 'GOODS';
                                    // GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := RequisitionLIne2."Issuing Store";
                                    // GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Storeheaders."Request date";
                                    GenJnline."Inventory Posting Group" := ReqLine."Gen. Prod. Posting Group";
                                    GenJnline.Description := ReqLine.Description;
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := Storeheaders."Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := Storeheaders."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, Storeheaders."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, Storeheaders."Shortcut Dimension 4 Code");
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Quantity (Base)" := ReqLine.Quantity;
                                    GenJnline.Insert(true);
                                end;
                                //Post Entries
                                GenJnline.Reset();
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                ReqLine.Issued := true;
                                ReqLine.Modify();
                                Storeheaders."Issued By" := UserId;
                                Storeheaders.Modify();
                            end;

                        end;
                    end;
                end;
            end else
                Error('Document Cannot be issued untill the document is approved');
        end;

    end;




    procedure AcceptGoods(RequestNo: code[50]): Text
    var
        LineNo: Integer;
        Storeheaders: Record "Store Requistion Headers";
        ReqLine: Record "Store Requisition TT Line";
    begin
        Storeheaders.Reset();
        Storeheaders.SetRange("No.", RequestNo);
        Storeheaders.SetRange(Status, Storeheaders.Status::Released);
        if Storeheaders.FindFirst() then begin
            ReqLine.Reset();
            ReqLine.SetRange(ReqLine."Requistion No", RequestNo);
            if ReqLine.FindSet() then begin
                repeat
                    if ReqLine.Issued = false then
                        Error('You cannot accept if all items have not been issued');
                until ReqLine.Next() = 0;
                Storeheaders.Status := Storeheaders.Status::Posted;
                Storeheaders.Received := true;
                Storeheaders."Received Date" := Today;
                Storeheaders."Received By" := UserId;
                Storeheaders.Modify();
            end;
        end;

    end;


    procedure GoodsIssueingInsert(RequestDate: Date; CountyCode: Code[20]; DirectorateCode: Code[20]; Description: Text[150]; OrderDate: Date; ResponsibilityCenter: Code[10]; ReceivedDate: Date) status: Text
    var
        storeRequisitionHeaders: Record "Store Requistion Headers";

    begin
        //storeRequisitionHeaders.reset();

        storeRequisitionHeaders.init;
        storeRequisitionHeaders."Request date" := RequestDate;
        storeRequisitionHeaders."Global Dimension 1 Code" := CountyCode;
        storeRequisitionHeaders."Shortcut Dimension 2 Code" := DirectorateCode;
        storeRequisitionHeaders."Request Description" := Description;
        storeRequisitionHeaders."Request date" := OrderDate;
        storeRequisitionHeaders."Issuing Store" := ResponsibilityCenter;
        storeRequisitionHeaders."Received Date" := ReceivedDate;
        storeRequisitionHeaders.Insert(true);
        if storeRequisitionHeaders.Insert(true) then begin
            status := 'Details were successfully submitted';
        end else begin
            status := 'Details Could not be Submitted';
        end;
        exit(status);



    end;

    procedure GoodIssueLineInsert(DocNo: Code[20]; ItemNo: Code[20]; Remarks: Text[150]; Quantity: Decimal; Directorate: Code[20]) status: Text
    var
        ReqLine: Record "Store Requisition TT Line";
        storeRequisitionHeaders: Record "Store Requistion Headers";
    begin

        ReqLine.Reset();
        ReqLine.SetRange("Requistion No", DocNo);
        if ReqLine.Find('-') then begin
            ReqLine.Init();
            ReqLine."No." := ItemNo;
            ReqLine.Remarks := Remarks;
            ReqLine."Quantity Requested" := Quantity;
            ReqLine."Shortcut Dimension 2 Code" := Directorate;
            if ReqLine.Insert(true) then begin
                status := 'Details were successfully submitted';
            end else begin
                status := 'Details Could not be Submitted';
            end;
            exit(status);
        end;
    end;

    procedure FnEditGoodsReceiving(Supplier: Code[50]; DocNo: Code[30]; PoNo: Code[40]; InVNO: Code[50]; DeliverNOte: Code[40]; CaptureDate: Date; ReqDescription: Text; UserCode: Text) status: Text
    var

        StoreHeaders: Record "Store Requistion Headers";
    begin
        StoreHeaders.Reset();
        StoreHeaders.setRange("No.", DocNo);
        if StoreHeaders.FindFirst() then begin
            StoreHeaders."Request date" := CaptureDate;
            StoreHeaders.Validate(StoreHeaders."Request date");
            StoreHeaders."Request Description" := ReqDescription;
            StoreHeaders.Validate(StoreHeaders."Request Description");
            StoreHeaders."Vendor No." := Supplier;
            StoreHeaders.Validate(StoreHeaders."Vendor No.");
            StoreHeaders."Purchase Order No" := PoNo;
            StoreHeaders.Validate(StoreHeaders."Purchase Order No");
            StoreHeaders."Delivery Note" := DeliverNOte;
            StoreHeaders.Validate(StoreHeaders."Delivery Note");
            StoreHeaders."Invoice No" := InVNO;
            StoreHeaders.Validate(StoreHeaders."Invoice No");
            StoreHeaders."Requester ID" := UserCode;
            StoreHeaders.Validate(StoreHeaders."Requester ID");

            StoreHeaders.Modify(true);

        end;


        if StoreHeaders.Modify(true) then begin
            status := 'Document Edited Successfully';
        end
        else
            status := 'An Error Occured';
    end;

    procedure FnDeleteGoodsReceiving(DocNo: Code[30]) status: Text
    var

        StoreHeaders: Record "Store Requistion Headers";
    begin
        StoreHeaders.setRange("No.", DocNo);
        If StoreHeaders.findfirst then begin
            StoreHeaders.Delete(true);
        end;
        if StoreHeaders.Delete(true) then begin
            status := 'The Line Has Been Deleted Successfully';
        end
        else
            status := 'An Error Occured';

        exit(status);


    end;

    procedure SendAssetRecnIssueDocForApproval(DocNo: Code[50]): Text
    var
        myInt: Integer;
        Headers: Record "HR Asset Transfer Header";
        Varvariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ItemLedger: Record "Item Ledger Entry";
    begin
        Headers.Reset();
        Headers.SetRange("No.", DocNo);
        Headers.SetRange(Status, Headers.Status::Open);
        if Headers.Find('-') then begin

            if not Headers.LinesExists1 then
                Error('There are no Lines created for this Document');


            VarVariant := Headers;
            if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovals.OnSendDocForApproval(VarVariant);
            exit('Approval Request has been sent');

        end else
            exit('Cannot sent approval request');

    end;

    procedure FAAllocationFxn(TransactionType: Option New,Modify,Delete; AssetNo: Code[40]; Department: Text; Quantity: Decimal; EntryNo: Integer) status: Text[50]
    var
        Header: Record "Asset Allocation";

    begin
        Header.Init();
        case TransactionType of
            TransactionType::New:
                begin

                    Header."Asset No." := AssetNo;
                    Header.Department := Department;
                    Header.Quantity := Quantity;
                    if Header.Insert(true) then begin
                        status := Header."Asset No.";
                        exit(status);
                    end;



                end;

            TransactionType::Modify:
                begin
                    Header.setRange("Entry No.", EntryNo);
                    if Header.FindFirst() then begin

                        Header."Asset No." := AssetNo;
                        Header.Department := Department;
                        Header.Quantity := Quantity;
                        if Header.Modify(true) then begin
                            status := 'Document Edited Successfully';
                        end
                        else
                            status := 'An Error Occured';
                        exit(status);
                    end;


                end;
            TransactionType::Delete:
                begin
                    Header.setRange("Entry No.", EntryNo);
                    if Header.FindFirst() then begin
                        Header.Delete(true);

                    end;
                end;

        end;
    end;

    procedure CancelApprovalRequest(DocNo: Code[50])
    var
        ApprovalEntry: Record "Approval Entry";
        StoreHeaders: Record "Store Requistion Headers";
    begin
        StoreHeaders.SetRange("No.", DocNo);
        if StoreHeaders.Status = StoreHeaders.Status::"Pending Approval" then begin
            // Find the related approval entry
            if ApprovalEntry.Get(StoreHeaders."No.") then begin
                // Cancel the approval entry
                ApprovalEntry.Status := ApprovalEntry.Status::Canceled;
                ApprovalEntry.Modify(true);
            end;

            // Update the document status to Open
            StoreHeaders.Status := StoreHeaders.Status::Open;
            StoreHeaders.Modify(true);
        end;
    end;

    procedure GetDocument(DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text)
    var
        Ins: InStream;
        Filename: Text;
        Base64: Codeunit "Base64 Convert";
        Base64String: Text;
    begin
        if UploadIntoStream('Choose File', '', '', Filename, Ins) then begin
            Base64String := Base64.ToBase64(Ins);
            if UploadDocument(Base64String, Filename, DocumentType, DocumentNo, RecID, Module, TableId, Desc) = '' then
                Error('Failed to upload document');
        end;
    end;


    procedure UploadDocument(Base64String: Text; FileName: Text; DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text): Text;
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        JMessage, JResponse : JsonObject;
        Logs: Record "Integration logs";
        RecLink: Record "Record Link";
        JToken: JsonToken;
        sharePointUrl: Text;
        docId: Text;
    begin
        Clear(Client);
        Clear(Request);
        Clear(RequestHeader);
        Clear(Content);
        Clear(ContentHeader);
        Clear(Res);
        docId := '';
        sharePointUrl := getUrl('SHAREPOINTURL');

        JMessage.Add('FileBase64String', Base64String);
        JMessage.Add('FileName', FileName);
        JMessage.Add('DocumentType', Format(DocumentType));
        JMessage.Add('DocumentNo', DocumentNo);
        JMessage.Add('Module', Module);
        JMessage.Add('TableId', Format(TableId));
        JMessage.Add('Description', Desc);

        Content.WriteFrom(Format(JMessage));

        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');

        Request.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(sharePointUrl);
        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    if not JResponse.ReadFrom(Res) then
                        Error('Failed to parse response');
                    if JResponse.Get('document_id', JToken) then begin
                        RecLink.Init();
                        RecLink."Record ID" := RecID;
                        RecLink.Description := FileName;
                        RecLink.URL1 := JToken.AsValue().AsText();
                        docId := JToken.AsValue().AsText();
                        RecLink.Insert(true);
                        exit(docId);
                    end
                    // Message(Res);

                end else begin
                    Logs.Init();
                    Logs."Status Message" := CopyStr(Res, 1, 2048);
                    Logs."Document No" := DocumentNo;
                    Logs.Insert();

                end;
            end else begin
                Logs.Init();
                Logs."Status Message" := GetLastErrorText();
                Logs."Document No" := DocumentNo;
                Logs.Insert();
            end;
        end else begin
            Logs.Init();
            Logs."Status Message" := GetLastErrorText();
            Logs."Document No" := DocumentNo;
            Logs.Insert();
        end;
    end;

    procedure getUrl(typeDoc: Text): Text
    var
        smsSetup: Record "HR Setup";

    begin
        smsSetup.get();
        smsSetup.TestField(smsSetup.SharePointUrl);
        // smsSetup.TestField(smsSetup.deleteSharepointUrl);
        if (UpperCase(typeDoc) = 'DELETE') then exit(smsSetup.deleteSharepointUrl);
        if (UpperCase(typeDoc) = 'SHAREPOINTURL') then exit(smsSetup.SharePointUrl);
    end;

    procedure GenerateApiQRlink(TableID: Integer; DocumentNo: Text; ApproverID: Text; ApprovalDateTime: DateTime; OTPCode: Code[20]; Location: Code[200]) QrCode: BigText
    var
        myInt: Integer;
        ReqBody: Text;
        itemcounter: Integer;
        ordernumber: Integer;
        totalamount: Decimal;
        itemcount: Integer;
        IntegrationSetup: Record "Purchases & Payables Setup";
        qrcodeGeneratorURL: Label 'https://192.168.1.129:8009/QrCode/api/values/generateQrCode';
        instreamtxt2QR: Text;
        instreamtxtQR: Text;
        abpOutStream: OutStream;
        Client: HttpClient;
        HttpRespone: HttpResponseMessage;
        ResponseText: Text;
        Url: Text;
        ResTxt: Text;
        EndpointDataQRCode: Text;
        JToken: JsonToken;
        JObject: JsonObject;

        //Receipt: Record "Receipts Header1";
        qrUrl: Text;
    begin
        Clear(RequestQr);
        Clear(ResponseQr);
        IntegrationSetup.Get();

        // IMPORTANT: QR code now contains ONLY the document number in the URL
        // The actual data will be fetched dynamically when the QR is scanned
        qrUrl := IntegrationSetup."Send SMS API URL" + '/api/v1/qrcode/view?documentNo=' + DocumentNo;

        // Store the current data in the table
        StoreQRData(DocumentNo, ApproverID, ApprovalDateTime, OTPCode, Location);

        // Generate QR code with the dynamic link
        EndpointDataQRCode := '{"qrtext": "' + qrUrl + '"}';

        contentHeadersQr.clear();
        requestQr.GetHeaders(contentHeadersQr);
        requestQr.Content.Clear();
        responseQr.Content.Clear();

        if IntegrationSetup.Get then
            requestQr.SetRequestUri(IntegrationSetup."Send SMS API URL");  // Your QR generation API

        requestQr.Content.WriteFrom(EndpointDataQRCode);

        requestQr.Content.GetHeaders(contentHeadersQr);
        if contentHeadersQr.Contains('Content-Type') then
            contentHeadersQr.Remove('Content-Type');
        contentHeadersQr.Add('Content-Type', 'application/json');
        requestQr.Method('POST');

        clientQr.Clear();
        clientQr.Send(requestQr, responseQr);

        Clear(json);
        Clear(JToken);
        Clear(JObject);
        Clear(QrCode);

        responseQr.Content().ReadAs(json);

        JObject.ReadFrom(json);
        JObject.Get('ResponseCode', JToken);
        ReturnId := JToken.AsValue().AsText();

        JObject.Get('Title', JToken);
        ReturnMessage := JToken.AsValue().AsText();

        JObject.Get('Base64Image', JToken);
        ReturnMessage := JToken.AsValue().AsText();
        QrCode.AddText(JToken.AsValue().AsText());
    end;

    local procedure StoreQRData(DocNo: Code[20]; ApprID: Code[300]; ApprDateTime: DateTime; OTP: Code[30]; Loc: Text[100])
    var
        QRData: Record "QR Code Data";
        OldQRData: Record "QR Code Data";
        NewVersionNo: Integer;
        ChangeDesc: Text[250];
    begin
        // Find the current active record for this document
        OldQRData.SetRange("Document No.", DocNo);
        OldQRData.SetRange("Is Current", true);

        if OldQRData.FindFirst() then begin
            // Build change description
            ChangeDesc := BuildChangeDescription(OldQRData, ApprID, ApprDateTime, OTP, Loc);

            // Mark old record as historical
            OldQRData."Is Current" := false;
            OldQRData.Modify();

            NewVersionNo := OldQRData."Version No." + 1;
        end else
            NewVersionNo := 1;

        // Create new version (current record)
        QRData.Init();
        QRData."Document No." := DocNo;
        QRData."Version No." := NewVersionNo;
        QRData."Approver ID" := ApprID;
        QRData."Approval DateTime" := ApprDateTime;
        QRData."OTP Code" := OTP;
        QRData."Location" := Loc;
        QRData."Created DateTime" := CurrentDateTime;
        QRData."Is Current" := true;
        QRData."Modified By" := UserId;
        QRData."Change Description" := ChangeDesc;
        QRData.Insert();
    end;

    procedure DelegateApproval(DocNUm: Code[30])
    var
        myInt: Integer;
        Approvalentry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        Approvalentry.Reset();
        Approvalentry.SetRange("Document No.", DocNUm);
        if Approvalentry.FindFirst() then begin
            ApprovalsMgmt.DelegateRecordApprovalRequest(Approvalentry.RecordId);
        end;
    end;

    procedure CheckContractright(UserIdco: Code[30]): Boolean
    var
        myInt: Integer;
        Userset: Record "User Setup";
    begin
        Userset.Reset();
        Userset.SetRange("User ID", UserIdco);
        if Userset.FindFirst() then begin
            if Userset."Can View Contracts" = true then
                exit(true)
            else
                exit(false);
        end else
            exit(false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnFindOpenApprovalEntryForCurrUserOnAfterApprovalEntrySetFilters', '', false, false)]
    local procedure BypassUserFINDCheck(ApprovalEntry: Record "Approval Entry")
    begin
        if ApprovalEntry."Approver ID" <> '' then
            ApprovalEntry.Comment := true;
        // Set IsHandled to true to bypass the standard approval process
        // IsHandled := true;

        // Implement any additional custom logic here, if necessary
        // For example, log a message or perform other actions
        //Message('Bypassing the check of User ID against Approver ID.');
    end;


    local procedure BuildChangeDescription(OldData: Record "QR Code Data"; NewApprID: Code[500]; NewApprDateTime: DateTime; NewOTP: Code[30]; NewLoc: Text[100]): Text[250]
    var
        Changes: Text[250];
    begin
        Changes := '';

        if OldData."Location" <> NewLoc then
            Changes += 'Location: ' + OldData."Location" + ' → ' + NewLoc + '; ';

        if OldData."Approver ID" <> NewApprID then
            Changes += 'Approver: ' + OldData."Approver ID" + ' → ' + NewApprID + '; ';

        if OldData."Approval DateTime" <> NewApprDateTime then
            Changes += 'Approval Time Updated; ';

        if Changes = '' then
            Changes := 'Record updated';

        exit(Changes);
    end;

    var
        myOutStream: OutStream;
        JToken: JsonToken;
        JObject2: JsonObject;
        JObjectQR: JsonObject;
        ReturnMessage: Text;
        ReturnId: Text;
        success: Text;
        QRCode: Text;
        InvJToken: JsonToken;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        //tempBobTable: Record "Temp Blob";
        RecordRef: RecordRef;
        VarOutStream: OutStream;
        contentHeaders: HttpHeaders;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;

        ClientQr: HttpClient;
        ContentQr: HttpContent;
        contentHeadersQr: HttpHeaders;
        RequestQr: HttpRequestMessage;
        ResponseQr: HttpResponseMessage;
        json: Text;
        jsonResponse: Text;
        jsonResponse2: Text;
        InvalidResponseError: Text;



}
//  procedure ModifyItemsLInes(DocNo: Code[40]; LineNo: Integer; Quantity: Decimal; QuantityRequested: Decimal; UnitCost: Decimal) status: Text
//     var
//         StoreLines: Record "Store Requisition TT Line";

//     begin
//         StoreLines.Reset();
//         StoreLines.SetRange("Requistion No", DocNo);
//         StoreLines.SetRange("Line No.", LineNo);

//         if StoreLines.Find('-') then begin
//             //StoreLines."No." := ItemNo;
//             //StoreLines.Validate(StoreLines."No.");
//             StoreLines.Quantity := Quantity;
//             StoreLines.Validate(StoreLines.Quantity);
//             StoreLines."Quantity Requested" := QuantityRequested;
//             StoreLines.Validate(StoreLines."Quantity Requested");
//             StoreLines."Unit Cost" := UnitCost;
//             StoreLines.Validate(StoreLines."Unit Cost");
//             if StoreLines.Modify(true) then begin
//                 status := 'The Line Has Been Edited Successfully';
//             end
//             else
//                 status := 'Unable to Edit Line';
//         end
//         else
//             status := 'No Item Line Found';


//         exit(status);
//     end;

// procedure CreateFixedAsset(Type: Option " ",Chair,Tables,"Laptops/Computers",Vehicles,Land,Building,"Office Quipment"; Model: Text; FAClassCode: Code[10]; AssetCategory: Code[10]; OriginalLocation: Code[20]; BudgetedAsset: Boolean; SerialNo: Text; Inactive: Boolean; FinancedBy: Text; TagNo: Code[70]; UnitOfMeasure: Code[60]; DateOfDelivery: Date; Condition: Text; Remarks: Text; CardNo: Code[50]; Blocked: Boolean) DocNo: Code[50]
//     var
//         FA: Record "Fixed Asset";
//         FASetup: Record "FA Setup";
//     begin
//         DocNo := '';
//         FA.Init();
//         FASetup.Get();
//         FASetup.TestField(FASetup."Fixed Asset Nos.");
//         DocNo := NoSeriesMgt.GetNextNo(FASetup."Fixed Asset Nos.", 0D, True);
//         FA."No." := DocNo;
//         FA.Validate(FA."No.");
//         FA.Type := Type;
//         FA.Description := Model;
//         FA."FA Class Code" := FAClassCode;
//         FA."FA Subclass Code" := AssetCategory;
//         FA."FA Location Code" := OriginalLocation;
//         FA."Budgeted Asset" := BudgetedAsset;
//         FA."Serial No." := SerialNo;
//         FA."Financed By" := FinancedBy;
//         FA."Tagging No" := TagNo;
//         FA."Unit Of Measure" := UnitOfMeasure;
//         FA."Date of Delivery/Installation" := DateOfDelivery;
//         FA.Condition := Condition;
//         FA."Notes/Remarks" := Remarks;
//         FA."Card No." := CardNo;
//         FA.Blocked := Blocked;
//         if FA.Insert(true) then
//             exit(DocNo)
//         else
//             exit('');
//     end;
