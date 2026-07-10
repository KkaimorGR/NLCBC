
table 50010 "HR Job Qualifications"
{
    Caption = 'HR Qualifications';
    DataCaptionFields = "Code", Description;
    DrillDownPageId = "HR Job Qualifications";
    LookupPageId = "HR Job Qualifications";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Qualification Type"; Code[50])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(7; Category; Option)
        {
            Caption = 'Category';
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(8; "Order"; Integer)
        {
            Caption = 'Order';
        }
        field(9; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(10; Professional; Boolean)
        {
            Caption = 'Professional';
        }
    }

    keys
    {
        key(Key1; "Qualification Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; Code, Description)
        {

        }
    }


    var
        HRJobs: Record "HR Jobs";
        Usersetup: Record "User Setup";
}
