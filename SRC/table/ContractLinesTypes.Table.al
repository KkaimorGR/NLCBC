
table 52193854 "Contract Lines Types"
{
    DrillDownPageId = "Contract Lines Type";
    LookupPageId = "Contract Lines Type";
    Caption = 'Contract Lines Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Line Code"; Code[20])
        {
            TableRelation = "Contract Lines"."Contract Line Code";
            Caption = 'Contract Line Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Fixed Assets,Services,Transport,Services Provided';
            OptionMembers = " ","Fixed Assets",Services,Transport,"Services Provided";
            Caption = 'Type';
        }
        field(4; "Contract Line Type"; Code[10])
        {
            Caption = 'Contract Line Type';
        }
        field(5; "Contract Cycle"; Code[10])
        {
            TableRelation = "Contract Cycle".Code;
            Caption = 'Contract Cycle';
        }
    }

    keys
    {
        key(Key1; "Contract Line Type", "Contract Line Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
