
tableextension 52193440 "Company Info" extends "Company Information"
{
    fields
    {
        field(50000; "PIN No"; Code[11])
        {
            Caption = 'PIN No';
            DataClassification = CustomerContent;
        }
        field(50001; "Company Watermark"; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Company Watermark';
            DataClassification = CustomerContent;
        }
        field(50002; "NSSF Number"; Code[20])
        {
            Caption = 'NSSF Number';
            DataClassification = CustomerContent;
        }
        field(50003; "NHIF Number"; Code[20])
        {
            Caption = 'NHIF Number';
            DataClassification = CustomerContent;
        }
        field(50004; "Documents Attachment Link"; Text[150])
        {
            Caption = 'Documents Attachment Link';
            DataClassification = CustomerContent;
        }

        field(50010; "HR Document Link"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'HR Document Link';
        }
        field(50011; "Kenyan Shield"; BLOB)
        {
            SubType = Bitmap;

        }
        field(50012; "NLC Website"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}
