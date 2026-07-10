
table 52193539 "HR OSSafety Rules"
{
    Caption = 'HR OSSafety Rules';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Safety No"; Code[10])
        {
            Caption = 'Safety No';
        }
        field(2; "Safety Rules"; Text[200])
        {
            Caption = 'Safety Rules';
        }
        field(3; "Accident No."; Code[10])
        {
            TableRelation = "HR OSAccident"."Accident No";
            Caption = 'Accident No.';
        }
    }

    keys
    {
        key(Key1; "Safety No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
