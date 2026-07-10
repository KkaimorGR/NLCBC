
table 52194045 "Committee Composition"
{
    Caption = 'Committee Composition';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
            Caption = 'Committee Type ID';
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
            Caption = 'Role';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Minimum No. of Members"; Integer)
        {
            Caption = 'Minimum No. of Members';
        }
    }

    keys
    {
        key(Key1; "Committee Type ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

