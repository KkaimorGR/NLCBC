
table 52193831 "Institution Departments"
{
    Caption = 'Job Posting Group';
    DrillDownPageId = "Control-Information List";
    LookupPageId = "Control-Information List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(50000; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(50001; Institution; Option)
        {
            OptionCaption = ' ,MTRH,MU,OTHERS';
            OptionMembers = " ",MTRH,MU,OTHERS;
            Caption = 'Institution';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
