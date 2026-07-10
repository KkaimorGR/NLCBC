
table 52193535 "HR OSAccident"
{
    Caption = 'HR OSAccident';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Accident No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
