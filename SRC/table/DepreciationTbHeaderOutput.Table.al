
table 52193747 "Depreciation Tb Header Output"
{
    Caption = 'Depreciation Tb Header Output';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Depreciation Table"; Code[10])
        {
            Caption = 'Depreciation Table';
        }
        field(2; "Line Output"; Code[10])
        {
            Caption = 'Line Output';
            //TableRelation = Table50105;
        }
    }

    keys
    {
        key(Key1; "Depreciation Table", "Line Output")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
