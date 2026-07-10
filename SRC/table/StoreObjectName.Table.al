
table 52194155 "Store Object Name"
{
    Caption = 'Store Object Name';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Object ID"; Integer)
        {
            Caption = 'Object ID';
        }
        field(2; "Object Type"; Option)
        {
            OptionMembers = TableData,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query",System,FieldNumber;
            Caption = 'Object Type';
        }
        field(3; "Object Name"; Text[50])
        {
            Caption = 'Object Name';
        }
    }

    keys
    {
        key(Key1; "Object ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
