
Table 52194162 "Document Template"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Examination ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Courses;
        }
        field(6; "Examination Description"; Text[200])
        {
            //CalcFormula = lookup(Courses.Description where (Code=field("Examination ID")));
            //FieldClass = FlowField;
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

