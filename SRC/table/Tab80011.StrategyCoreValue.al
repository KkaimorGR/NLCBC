
Table 52194159 "Strategy Core Value"
{
    // DrillDownPageID = "Strategy Core Value";
    // LookupPageID = "Strategy Core Value";

    fields
    {
        field(1; "Strategic Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Core Value"; Code[255])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Core Values".Code;

            trigger OnValidate()
            begin

            end;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Priority Level"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Core Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    //    Corevalue: Record "Core Values";
}

