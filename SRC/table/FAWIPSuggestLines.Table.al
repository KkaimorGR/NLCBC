
table 52193751 "FA WIP Suggest Lines"
{
    DrillDownPageId = "FA WIP Suggest Lines List";
    LookupPageId = "FA WIP Suggest Lines List";
    Caption = 'FA WIP Suggest Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            NotBlank = true;
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
