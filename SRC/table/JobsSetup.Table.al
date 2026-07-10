
table 52193796 "Jobs-Setup"
{
    Caption = 'Jobs Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Job Nos."; Code[10])
        {
            Caption = 'Job Nos.';
            TableRelation = "No. Series";
        }
        field(1001; "Automatic Update Job Item Cost"; Boolean)
        {
            Caption = 'Automatic Update Job Item Cost';
        }
        field(1002; "Grant Task Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Grant Task Nos';
        }
        field(1003; "Concept Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Concept Nos';
        }
        field(1004; "Proposal Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Proposal Nos';
        }
        field(1005; "Auto Update Project Status"; Boolean)
        {
            Caption = 'Auto Update Project Status';
        }
        field(1006; "System Contract Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'System Contract Nos';
        }
        field(1007; "Closeout Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Closeout Nos';
        }
        field(1008; "Donor Contact Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Donor Contact Nos';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
