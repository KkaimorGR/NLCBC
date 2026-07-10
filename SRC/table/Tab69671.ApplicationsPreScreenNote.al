
Table 52194078 "Applications Pre-Screen Note"
{

    fields
    {
        field(1; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vacancy No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Pre-screening Stage"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(4; "Question ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

