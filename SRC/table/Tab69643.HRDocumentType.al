
Table 52194053 "HR Document Type"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Issuing Agency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Local Verification URL"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
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

