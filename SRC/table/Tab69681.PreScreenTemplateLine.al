
Table 52194088 "Pre-Screen Template Line"
{

    fields
    {
        field(1; "Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template";
        }
        field(2; "Question Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Question Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(5; "Close Ended Qn Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Close Ended Qn Type";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Question Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

