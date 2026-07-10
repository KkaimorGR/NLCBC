
Table 52194038 "Recruitment Agency"
{

    fields
    {
        field(1; "Agency No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Email; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Address; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Address2; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Post Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; City; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Contact; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Accreditation Cert No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. of Vacancy Posting"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Agency No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

