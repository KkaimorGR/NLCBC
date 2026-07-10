
table 52193436 Attachmentss
{
    Caption = 'Attachmentss';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Document_No; Text[50])
        {
            Caption = 'Document_No';
        }
        field(2; Link; Text[250])
        {
            ExtendedDatatype = URL;
            Caption = 'Link';
        }
        field(3; Module; Text[100])
        {
            Caption = 'Module';
        }
        field(4; FileType; Text[50])
        {
            Caption = 'FileType';
        }
        field(5; User; Text[100])
        {
            Caption = 'User';
        }
        field(6; FileName; Text[250])
        {
            Caption = 'FileName';
        }
        field(7; DocumentID; Text[100])
        {
            Caption = 'DocumentID';
        }
        field(8; Order_No; Text[50])
        {
            Caption = 'Order_No';
        }
    }

    keys
    {
        key(Key1; Document_No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
