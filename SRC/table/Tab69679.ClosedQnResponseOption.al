
Table 52194086 "Closed Qn Response Option"
{

    fields
    {
        field(1; "Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Option Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Default Points"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Type ID", "Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

