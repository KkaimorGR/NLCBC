
table 52193558 "HR Training Bonding Conditions"
{
    Caption = 'HR Training Bonding Conditions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Editable = false;
            Caption = 'Code';
        }
        field(2; "Condition Type"; Option)
        {
            OptionMembers = " ","Percentage of Training Cost","Total Training Cost",Duration;
            Caption = 'Condition Type';
        }
        field(3; "Minimum Amount"; Decimal)
        {
            Caption = 'Minimum Amount';
        }
        field(4; "Maximum Amount"; Decimal)
        {
            Caption = 'Maximum Amount';
        }
        field(5; "Condition Description"; Text[100])
        {
            Caption = 'Condition Description';
        }
        field(6; "Training Bonding Code"; Code[20])
        {
            Caption = 'Training Bonding Code';
        }
        field(7; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "Code", "Training Bonding Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRTrainingNeeds: Record "HR Training Needs";
}
