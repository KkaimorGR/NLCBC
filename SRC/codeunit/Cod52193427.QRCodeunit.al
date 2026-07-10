
codeunit 52193427 QRCodeUnit
{
    var
        PostUrl: Text;
        ReqBodyGoods: Text;
        ReqBodyInvoice: Text;
        myOutsream: OutStream;
        RequestBodyContent: Text;
        requestBody: Text;
        RequestBodyBigText: BigText;
        EndpointData: Text;
        EndpointDataQRCode: Text;
        HttpWebRequestMgt: Codeunit "Http Web Request Mgt.";
        instreamtxt: Text;
        instreamtxt2: Text;
        Instr: InStream;
        InstrQR: InStream;
        BaseUrl: Text;
        Method: Text;
        REstMethod: Text;
        url1: Label 'http://209.182.239.212:1085/api/invoice';
        JSONManagement: Codeunit "JSON Management";
        JObject: JsonObject;
        JObject2: JsonObject;
        JObjectQR: JsonObject;
        ReturnMessage: Text;
        ReturnId: Text;
        success: Text;
        QRCode: Text;
        middlewareSerialNumber: Text;
        //qrcodeGeneratorURL: Label 'https://portal.greencom.co.ke:1260/QrCode/api/values/generateQrCode';
        taxcontrolcode: Text;
        qrCodeURAText: Text;
        companies: Record "Company Information";
        CurrentCompany: Text;
        urlsaladin: Label 'http://192.168.0.88:3000/api/invoice';
        urlsaracen: Label 'http://192.168.0.84:3000/api/invoice';
        vatamount: Decimal;
        amountincludingvat: Decimal;
        amount: Decimal;
        totalinvoiceamount: Decimal;
        totaltaxamount: Decimal;
        unitprice: Decimal;
        currenttimestamp: DateTime;
        senderid: Text;
        senderidsaladin: Label 'e7818c68d3b891ae49d2';
        senderidsaracen: Label '43edff5570b0fa2fa5a5';
        senderidtest: Label 'ef096cc777fc79442e6b';
        CurrExchRate: Record "Currency Exchange Rate";
        VALExchRate: Text[50];
        CalculatedExchRate: Decimal;
        Text009: Label 'Exchange rate: %1/%2';
        currencycode: Text;
        invoicedate: Text;
        CurrencyFactor: Decimal;
        Client: HttpClient;
        Content: HttpContent;
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
        url: Text;
        urlLive: Text;
        myFile: File;
        myOutStream: OutStream;
        JToken: JsonToken;
        InvJToken: JsonToken;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        //tempBobTable: Record "Temp Blob";
        RecordRef: RecordRef;
        VarOutStream: OutStream;


    procedure FnGenerateQRCodeSIH(Receipt: Record "Store Requistion Headers") QrCode: BigText
    var
        SIH: Record "Sales Invoice Header";
        SILines: Record "Sales Invoice Line";
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

        //Receipt: Record "Receipts Header1";
        qrUrl: Text;
    begin
        begin

            Clear(RequestQr);
            Clear(ResponseQr);
            qrUrl := 'https://efiling.court.go.ke/Receipt/validate_receipts/' + Receipt."No.";
            EndpointDataQRCode := '{"qrtext": "' + qrUrl + '"}';

            contentHeadersQr.clear();
            requestQr.GetHeaders(contentHeadersQr);
            requestQr.Content.Clear();
            responseQr.Content.Clear();

            if IntegrationSetup.Get('QR CODE') then
                requestQr.SetRequestUri(IntegrationSetup."Send SMS API URL");
            requestQr.Content.WriteFrom(EndpointDataQRCode); //this makes the Content-Type = text/plain; charset=utf-8

            requestQr.Content.GetHeaders(contentHeadersQr);
            // Retrieve the contentHeaders associated with the content
            if contentHeadersQr.Contains('Content-Type') then
                contentHeadersQr.Remove('Content-Type');
            contentHeadersQr.Add('Content-Type', 'application/json');
            requestQr.Method('POST');
            clientQr.Clear();
            // if not clientQr.Send(requestQr, responseQr) then
            //     Error('Web Service error \Status Code : %1 \Description : %2', response.HttpStatusCode(), response.ReasonPhrase());
            clientQr.Send(requestQr, responseQr);
            Clear(json);
            Clear(JToken);
            Clear(JObject);
            Clear(QrCode);
            // Read the response content as json.
            responseQr.Content().ReadAs(json);

            JObject.ReadFrom(json);
            JObject.Get('ResponseCode', JToken);
            ReturnId := JToken.AsValue().AsText();
            // MESSAGE('This is the VerificationCode from kra %1', ReturnCode);
            JObject.Get('Title', JToken);
            ReturnMessage := JToken.AsValue().AsText();
            //  MESSAGE('This is the VerificationCode from kra %1', ReturnMessage);
            JObject.Get('Base64Image', JToken);
            ReturnMessage := JToken.AsValue().AsText();
            QrCode.AddText(JToken.AsValue().AsText());

        end;
    end;

    procedure GenerateApprovalQRCode(TableID: Integer; DocumentNo: Text; ApproverID: Text; ApprovalDateTime: DateTime; OTPCode: Code[20]; Location: Code[200]) QrCode: BigText
    var

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

        //Receipt: Record "Receipts Header1";
        qrUrl: Text;
    begin
        begin
            IntegrationSetup.Get();

            Clear(RequestQr);

            Clear(ResponseQr);
            // qrUrl := 'Asset No.: ' + DocumentNo + '; ' + ApproverID + '; location.: ' + Location;
            qrUrl := IntegrationSetup."Qr Code Api" + DocumentNo;
            EndpointDataQRCode := '{"qrtext": "' + qrUrl + '"}';

            contentHeadersQr.clear();
            requestQr.GetHeaders(contentHeadersQr);
            requestQr.Content.Clear();
            responseQr.Content.Clear();

            if IntegrationSetup.Get then
                requestQr.SetRequestUri(IntegrationSetup."Send SMS API URL");
            requestQr.Content.WriteFrom(EndpointDataQRCode); //this makes the Content-Type = text/plain; charset=utf-8

            requestQr.Content.GetHeaders(contentHeadersQr);
            // Retrieve the contentHeaders associated with the content
            if contentHeadersQr.Contains('Content-Type') then
                contentHeadersQr.Remove('Content-Type');
            contentHeadersQr.Add('Content-Type', 'application/json');
            requestQr.Method('POST');
            clientQr.Clear();
            // if not clientQr.Send(requestQr, responseQr) then
            //     Error('Web Service error \Status Code : %1 \Description : %2', response.HttpStatusCode(), response.ReasonPhrase());
            clientQr.Send(requestQr, responseQr);
            Clear(json);
            Clear(JToken);
            Clear(JObject);
            Clear(QrCode);
            // Read the response content as json.
            responseQr.Content().ReadAs(json);

            JObject.ReadFrom(json);
            JObject.Get('ResponseCode', JToken);
            ReturnId := JToken.AsValue().AsText();
            // MESSAGE('This is the VerificationCode from kra %1', ReturnCode);
            JObject.Get('Title', JToken);
            ReturnMessage := JToken.AsValue().AsText();
            //  MESSAGE('This is the VerificationCode from kra %1', ReturnMessage);
            JObject.Get('Base64Image', JToken);
            ReturnMessage := JToken.AsValue().AsText();
            QrCode.AddText(JToken.AsValue().AsText());

        end;
    end;



}
