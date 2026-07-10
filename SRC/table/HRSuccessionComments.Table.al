
table 52193573 "HR Succession Comments"
{
    Caption = 'HR Succession Comments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Position to Succed"; Code[10])
        {
            Caption = 'Position to Succed';
        }
        field(3; Comment; Text[200])
        {
            Caption = 'Comment';
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
