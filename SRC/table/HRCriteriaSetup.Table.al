
table 52193757 "HR Criteria Setup"
{
    Caption = 'HR Criteria Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Job Grade"; Code[50])
        {
            TableRelation = "HR Lookup Values".Type where(Type = filter("Job Group"));
            Caption = 'Job Grade';
        }
        field(4; "Job Group Range"; Code[50])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Job Group Range';
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
