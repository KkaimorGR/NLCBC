
table 52193853 "Contract Lines"
{
    DrillDownPageId = "Contract Line";
    LookupPageId = "Contract Line";
    Caption = 'Contract Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Line Code"; Code[50])
        {
            Caption = 'Contract Line Code';
        }
        field(2; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Fixed Assets,Services';
            OptionMembers = " ","Fixed Assets",Services;
            Caption = 'Type';
        }
        field(4; "Contract Type"; Code[50])
        {
            TableRelation = "Contract Types"."Contract Code";
            Caption = 'Contract Type';

        }
    }

    keys
    {
        key(Key1; "Contract Line Code", "Contract Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Des: Integer;
        Contract: Record "Contract Types";
}
