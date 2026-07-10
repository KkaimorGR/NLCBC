
table 52193880 "Evaluation Criterial Header"
{
    Caption = 'Evaluation Criterial Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Evaluation Year"; Integer)
        {
            TableRelation = "Evaluation Year";
            Caption = 'Evaluation Year';
        }
        field(3; "Actual Weight Assigned"; Decimal)
        {
            Caption = 'Actual Weight Assigned';
        }
        field(4; Description; Code[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
