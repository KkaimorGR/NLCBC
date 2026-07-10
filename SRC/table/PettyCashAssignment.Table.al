
table 52193730 "Petty Cash Assignment"
{
    Caption = 'Petty Cash Assignment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Status; Option)
        {
            OptionMembers = New,Approval,Issue,Confirmation;
            Caption = 'Status';
        }
        field(2; "Assigned User"; Code[20])
        {
            Caption = 'Assigned User';

        }
        field(3; "Allow Print"; Boolean)
        {
            Caption = 'Allow Print';
        }
    }

    keys
    {
        key(Key1; Status, "Assigned User")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        LoginMgt: Codeunit "User Management";
}
