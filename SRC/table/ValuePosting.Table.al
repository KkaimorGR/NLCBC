
table 52193723 "Value Posting"
{
    Caption = 'Value Posting';
    DataClassification = CustomerContent;
    fields
    {
        field(1; UserID; Code[50])
        {
            TableRelation = User;
            Caption = 'UserID';
        }
        field(2; "Value Posting"; Integer)
        {
            Caption = 'Value Posting';
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
