
table 52193995 "Disciplinary Cases"
{
    LookupPageId = "Disciplinary Cases";
    Caption = 'Disciplinary Cases';
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
        field(3; Rating; Code[50])
        {
            TableRelation = "Disciplinary Case Ratings".Code;
            Caption = 'Rating';
        }
        field(4; Comments; Text[200])
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

