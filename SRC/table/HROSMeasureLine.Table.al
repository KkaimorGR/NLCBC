
table 52193537 "HR OSMeasure Line"
{
    Caption = 'HR OSMeasure Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Measure No"; Code[10])
        {
            Caption = 'Measure No';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code", "Measure No")
        {
            Clustered = true;
        }
        key(Key2; "Measure No") { }
    }

    fieldgroups { }
}
