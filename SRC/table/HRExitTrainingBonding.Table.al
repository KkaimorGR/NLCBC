
table 52193559 "HR Exit Training Bonding"
{
    Caption = 'HR Exit Interview Clearance Items';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
        }
        field(3; "Training Application Code"; Code[20])
        {
            Caption = 'Training Application Code';
        }
        field(4; "Training Description"; Text[250])
        {
            Caption = 'Training Description';
        }
        field(5; "Bonding Duration"; DateFormula)
        {
            Caption = 'Bonding Duration';
        }
        field(6; "Bondage Start Date"; Date)
        {
            Editable = false;
            Caption = 'Bondage Start Date';
        }
        field(7; "Bondage Release Date"; Date)
        {
            Editable = false;
            Caption = 'Bondage Release Date';
        }
        field(8; "Cleared for Early Release?"; Boolean)
        {
            Caption = 'Cleared for Early Release?';
            trigger OnValidate()
            begin
                "Cleared by" := UserId;
                "Date Cleared" := Today;
            end;
        }
        field(9; "Cleared by"; Code[10])
        {
            Caption = 'Cleared by';
        }
        field(10; "Date Cleared"; Date)
        {
            Caption = 'Date Cleared';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        ExitClearanceLines: Record "HR Exit Training Bonding";
        HREmployee: Record "FA Budget Entry";
        ClearingOfficer: Text;
}
