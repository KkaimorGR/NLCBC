
table 52193944 "PR Trans Codes Groups"
{
    Caption = 'PR Transaction Code Groups';
    DrillDownPageId = "PR Trans Codes Groups - List";
    LookupPageId = "PR Trans Codes Groups - List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Group Code"; Code[20])
        {
            Caption = 'Group Code';
        }
        field(2; "Group Description"; Text[100])
        {
            Caption = 'Group Description';
        }
    }

    keys
    {
        key(Key1; "Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        PRTransCode: Record "Bank Bal. Alert Buffer";
}
