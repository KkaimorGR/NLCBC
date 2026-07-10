
table 52193587 "PR Bank Branches"
{
    DrillDownPageId = "PR Bank Branches";
    LookupPageId = "PR Bank Branches";
    Caption = 'PR Bank Branches';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Branch Code"; Code[10])
        {
            Caption = 'Branch Code';
        }
        field(2; "Branch Name"; Text[250])
        {
            Caption = 'Branch Name';
        }
        field(3; "Bank Code"; Code[10])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Bank Code';
        }
        field(4; "Bank Name"; Text[250])
        {
            CalcFormula = lookup("PR Bank Accounts"."Bank Name" where("Bank Code" = field("Bank Code")));
            FieldClass = FlowField;
            Caption = 'Bank Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Branch Code", "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Branch Name") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Branch Code", "Branch Name") { }
    }
}
