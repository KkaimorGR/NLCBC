
table 52193584 "PR Bank Accounts"
{
    DrillDownPageId = "PR Bank Accounts";
    LookupPageId = "PR Bank Accounts";
    Caption = 'PR Bank Accounts';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Bank Code"; Code[20])
        {
            Caption = 'Bank Code';
        }
        field(2; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
        }
    }

    keys
    {
        key(Key1; "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Name") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name") { }
    }
}
