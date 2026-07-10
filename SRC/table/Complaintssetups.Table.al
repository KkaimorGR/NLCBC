
table 52193963 "Complaints set-ups"
{
    Caption = 'Complaints set-ups';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Complaint,Feedback,Suggestion,Complimemnt';
            OptionMembers = Complaint,Feedback,Suggestion,Complimemnt;
            Caption = 'Type';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
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

