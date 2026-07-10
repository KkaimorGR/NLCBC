
Table 52194105 "Medical Checks Template Line"
{

    fields
    {
        field(1; "Template Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Medical History Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,General Health Question,Individual History,Family History,Vaccination History,Medical Examination,Lab Test';
            OptionMembers = " ","General Health Question","Individual History","Family History","Vaccination History","Medical Examination","Lab Test";
        }
        field(4; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Template Id", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

