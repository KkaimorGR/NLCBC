
table 52193996 "Disciplinary Actions"
{
    LookupPageId = "Disciplinary Actions";
    Caption = 'Disciplinary Actions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; Terminate; Boolean)
        {
            Caption = 'Terminate';
        }
        field(4; Document; Text[100])
        {
            Caption = 'Document';
        }
        field(5; Comments; Text[200])
        {
            Caption = 'Comments';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

