 
   table 52193430 "Digital Signature"
{
    Caption = 'Digital Signature';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(70087; "Sender QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(70088; "Approver 1 QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(70089; "Approver 2 QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(70090; "Approver 3 QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(70091; "AIE QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(70095; "Approval Date"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70096; "Approver Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
