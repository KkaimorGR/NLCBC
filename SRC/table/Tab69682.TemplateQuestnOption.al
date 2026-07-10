
Table 52194089 "Template Questn Option"
{

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template";
        }
        field(2; "Question ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template Line"."Question Id";
        }
        field(3; "Option Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Question ID", "Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

