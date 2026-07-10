
table 52193888 "Evaluation Parameters Setup"
{
    Caption = 'Evaluation Parameters Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Line No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
