 
    page 52193575 "Signature Pad"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    
    layout
    {
        area(Content)
        {
            usercontrol(SignaturePad; SignaturePad)
            {
                trigger OnControlAddIn()
                begin
                    CurrPage.SignaturePad.InitializeSignaturePad();
                end;
            }
            field(SignatureData; SignatureDataText)
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
        area(FactBoxes)
        {
            // part(Preview; "Signature Preview")
            // {
            //     ApplicationArea = All;
            // }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Save)
            {
                ApplicationArea = All;
                Image = Save;
                
                trigger OnAction()
                begin
                    SaveSignature();
                end;
            }
            action(Clear)
            {
                ApplicationArea = All;
                Image = Delete;
                
                trigger OnAction()
                begin
                    CurrPage.SignaturePad.ClearSignature();
                    Clear(SignatureDataText);
                end;
            }
        }
    }
    
    var
        SignatureDataText: Text;
    
    local procedure SaveSignature()
    var
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        OutStr: OutStream;
        SignatureData: Text;
    begin
        CurrPage.SignaturePad.GetSignatureData(SignatureData);
        if SignatureData = '' then
            Error('Please sign before saving.');
            
        SignatureDataText := SignatureData;
        
        // Convert base64 to blob and save to database
        TempBlob.CreateOutStream(OutStr);
        Base64Convert.FromBase64(SignatureData, OutStr);
        
        // Here you would typically save the TempBlob to your desired table
        SaveSignatureToRecord(TempBlob);
    end;
    
    local procedure SaveSignatureToRecord(var TempBlob: Codeunit "Temp Blob")
    var
        SignatureRecord: Record "Signature Record";
    begin
        SignatureRecord.Init();
        SignatureRecord."Entry No." := 0; // AutoIncrement
        // SignatureRecord.Signature := TempBlob.;;
        SignatureRecord.Insert(true);
    end;
}

controladdin SignaturePad
{
    RequestedHeight = 200;
    MinimumHeight = 200;
    MaximumHeight = 200;
    RequestedWidth = 400;
    MinimumWidth = 400;
    MaximumWidth = 400;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/signature_pad/2.3.2/signature_pad.min.js';
    
    // StartupScript = 'startup.js';
    
    event OnControlAddIn();
    
    procedure InitializeSignaturePad();
    procedure ClearSignature();
    procedure GetSignatureData(SignatureData: Text);
}