
table 52194011 "Nature of Cases"
{
    DrillDownPageId = "Nature of Cases";
    LookupPageId = "Nature of Cases";
    Caption = 'Nature of Cases';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Description; Code[255])
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

