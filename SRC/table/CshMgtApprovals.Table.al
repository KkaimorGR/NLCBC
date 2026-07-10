
table 52193768 "CshMgt Approvals"
{
    Caption = 'CshMgt Approvals';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Document Type"; Option)
        {
            OptionMembers = PV,PC;
            Caption = 'Document Type';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(5; "Process Date"; Date)
        {
            Caption = 'Process Date';
        }
        field(6; "Process Time"; Time)
        {
            Caption = 'Process Time';
        }
        field(7; "Process User ID"; Code[20])
        {
            Caption = 'Process User ID';
        }
        field(8; "Process Name"; Code[20])
        {
            Caption = 'Process Name';
        }
        field(9; "Process Machine"; Text[30])
        {
            Caption = 'Process Machine';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
