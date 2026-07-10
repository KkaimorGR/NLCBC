
table 52193822 "Compliance ledger Entries"
{
    Caption = 'Compliance ledger Entries';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Grant No"; Code[20])
        {
            Caption = 'Grant No';
        }
        field(2; "Compliance Code"; Code[20])
        {
            Caption = 'Compliance Code';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Document No"; Code[50])
        {
            Caption = 'Document No';
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(6; User; Code[50])
        {
            Caption = 'User';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; Comments; Text[250])
        {
            Caption = 'Comments';
        }
    }

    keys
    {
        key(Key1; "Grant No", "Compliance Code", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
