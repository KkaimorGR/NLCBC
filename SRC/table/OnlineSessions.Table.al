
table 52193637 "Online Sessions"
{
    Caption = 'Online Sessions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "User Name"; Code[50])
        {
            Editable = false;
            TableRelation = "Online Users"."User Name";
            Caption = 'User Name';
        }
        field(2; "Session ID"; Text[100])
        {
            Editable = false;
            Caption = 'Session ID';
        }
        field(3; "Login Time"; DateTime)
        {
            Editable = false;
            Caption = 'Login Time';
        }
        field(4; "Logout Time"; DateTime)
        {
            Editable = false;
            Caption = 'Logout Time';
        }
        field(5; "Login Duration"; Decimal)
        {
            Caption = 'Login Duration';
        }
        field(6; IsActive; Boolean)
        {
            BlankNumbers = BlankZero;
            BlankZero = true;
            Caption = 'IsActive';
        }
    }

    keys
    {
        key(Key1; "User Name", "Session ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
