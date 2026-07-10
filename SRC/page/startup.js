var signaturePad;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddIn', []);

function InitializeSignaturePad() {
    var canvas = document.createElement('canvas');
    canvas.width = 400;
    canvas.height = 200;
    canvas.style.border = '1px solid #000';
    controlAddIn.appendChild(canvas);
    
    signaturePad = new SignaturePad(canvas, {
        backgroundColor: 'rgb(255, 255, 255)',
        penColor: 'rgb(0, 0, 0)'
    });
}

function ClearSignature() {
    signaturePad.clear();
}

function GetSignatureData() {
    if (!signaturePad.isEmpty()) {
        var signatureData = signaturePad.toDataURL();
        // Remove the data:image/png;base64, prefix
        signatureData = signatureData.replace('data:image/png;base64,', '');
        return signatureData;
    }
    return '';
}