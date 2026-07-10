 
table 52193432 Attachments1
{
    Caption = 'Attachments';
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
        field(9; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(10; "Table Id"; Text[20])
        {
            Caption = 'Table Id';
        }
    }

    keys
    {
        key(Key1; Document_No, LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
