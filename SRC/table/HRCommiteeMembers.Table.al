
table 52193529 "HR Commitee Members"
{
    Caption = 'HR Commitee Members';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Member No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Member No.';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.Get("Member No.");
                "Member Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            end;
        }
        field(2; "Member Name"; Text[100])
        {
            Caption = 'Member Name';
        }
        field(3; Role; Text[100])
        {
            Caption = 'Role';
        }
        field(8; "Date Appointed"; Date)
        {
            Caption = 'Date Appointed';
        }
        field(9; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(10; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(11; Committee; Code[20])
        {
            TableRelation = "HR Committees".Code;
            Caption = 'Committee';
        }
    }

    keys
    {
        key(Key1; Committee, "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
}
