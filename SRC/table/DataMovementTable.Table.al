
table 52194152 "Data Movement Table"
{
    Caption = 'Data Movement Table';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
        }
        field(2; "Old Name"; Text[50])
        {
            // CalcFormula = lookup(Object.Name where(ID = field(No),
            //                                         Type = const(Table)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Old Name';
        }
        field(3; "New No"; Integer)
        {
            Caption = 'New No';
        }
        field(4; "New Name"; Text[50])
        {
            // CalcFormula = lookup(Object.Name where(ID = field("New No"),
            //                                         Type = const(Table)));
            Editable = false;
            // FieldClass = FlowField;
            Caption = 'New Name';
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Pending,InProgress,Complete';
            OptionMembers = Pending,InProgress,Complete;
            Caption = 'Status';
        }
        field(6; "Existing Records"; Integer)
        {
            Caption = 'Existing Records';
        }
        field(7; "Moved Records"; Integer)
        {
            Caption = 'Moved Records';
        }
        field(8; "Data Count"; Integer)
        {
            FieldClass = Normal;
            Caption = 'Data Count';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
