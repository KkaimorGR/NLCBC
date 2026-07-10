
table 52193852 "Contract Types"
{
    DrillDownPageId = "Contract Type";
    LookupPageId = "Contract Type";
    Caption = 'Contract Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Code"; Code[50])
        {
            Caption = 'Contract Code';
        }
        field(2; "Contract Name"; Text[100])
        {
            Caption = 'Contract Name';
        }
        field(3; "Contract Cycle"; Code[50])
        {
            TableRelation = "Contract Cycle".Code;
            Caption = 'Contract Cycle';
        }
    }

    keys
    {
        key(Key1; "Contract Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
