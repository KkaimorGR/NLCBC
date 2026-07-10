
table 52193774 "Online User Reset Activity"
{
    Caption = 'Online User Reset Activity';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "User Name"; Code[50])
        {
            Editable = true;
            NotBlank = true;
            Caption = 'User Name';
        }
        field(3; "Last Modified"; DateTime)
        {
            Caption = 'Last Modified';
        }
        field(4; Name; Text[150])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
