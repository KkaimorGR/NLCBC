
table 52193881 "Evaluation Criterial Line"
{
    Caption = 'Evaluation Criterial Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Evaluation Year"; Code[20])
        {
            Caption = 'Evaluation Year';
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
