
Table 52194097 "Apptitude Question"
{

    fields
    {
        field(1; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Question; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Apptitude,Training Needs Request';
            OptionMembers = Apptitude,"Training Needs Request";
        }
    }

    keys
    {
        key(Key1; "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

