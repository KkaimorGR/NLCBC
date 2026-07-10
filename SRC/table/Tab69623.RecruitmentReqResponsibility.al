
Table 52194036 "Recruitment Req Responsibility"
{
    // DrillDownPageID = "Position Substitutes";
    // LookupPageID = "Position Substitutes";

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Responsibility,Job Dimensions';
            OptionMembers = Responsibility,"Job Dimensions";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

