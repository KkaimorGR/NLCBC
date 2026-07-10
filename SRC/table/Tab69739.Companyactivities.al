
Table 52194146 "Company activities"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Day; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Venue; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Department; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Cost; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

