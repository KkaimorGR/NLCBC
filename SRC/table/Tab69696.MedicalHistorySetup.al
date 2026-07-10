
Table 52194103 "Medical History Setup"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Record Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Medical Condition,General Health Question,Medical Examination,Lab Test';
            OptionMembers = "Medical Condition","General Health Question","Medical Examination","Lab Test";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Vaccine-Preventable Condition"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Examination Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Medical Examination Type";
        }
        field(6; "Applicable Gender"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Both Male/Female,Male Only,Female Only';
            OptionMembers = "Both Male/Female","Male Only","Female Only";
        }
        field(7; Blocked; Boolean)
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

