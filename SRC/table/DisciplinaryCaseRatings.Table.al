
table 52193993 "Disciplinary Case Ratings"
{
    LookupPageId = "Overtime Subpage";
    Caption = 'Disciplinary Case Ratings';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Comments; Text[200])
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

