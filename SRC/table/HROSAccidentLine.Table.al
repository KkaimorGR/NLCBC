
table 52193536 "HR OSAccident Line"
{
    Caption = 'HR OSAccident Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code", "Accident No")
        {
            Clustered = true;
        }
        key(Key2; "Accident No") { }
    }

    fieldgroups { }
}
