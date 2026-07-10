
table 52194010 "Plaintive-Defentants"
{
    Caption = 'Plaintive-Defentants';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Plaintive,Defendant';
            OptionMembers = Plaintive,Defendant;
            Caption = 'Type';
        }
        field(3; Names; Code[255])
        {
            Caption = 'Names';
        }
        field(4; Contact; Code[100])
        {
            Caption = 'Contact';
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

