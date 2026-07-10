
table 52193554 "HR Employee SIC Numbers"
{
    Caption = 'HR Employee SIC Numbers';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then
                    //"Employee First Name":= Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
            end;
        }
        field(2; "Level 3 SIC Code"; Code[10])
        {
            Caption = 'Level 3 SIC Code';
        }
        field(3; "Level 4 SIC Code"; Code[10])
        {
            Caption = 'Level 4 SIC Code';
        }
        field(4; SubSection; Code[10])
        {
            Caption = 'SubSection';
        }
        field(5; "Section Description"; Text[250])
        {
            Caption = 'Section Description';
        }
        field(6; "Sub Section Description"; Text[250])
        {
            Caption = 'Sub Section Description';
        }
        field(7; "Employee First Name"; Text[250])
        {
            Caption = 'Employee First Name';
        }
        field(8; "Employee Last Name"; Text[250])
        {
            Caption = 'Employee Last Name';
        }
        field(9; Section; Code[10])
        {
            Caption = 'Section';
        }
        field(10; "Level 1 SIC Code"; Code[10])
        {
            Caption = 'Level 1 SIC Code';
        }
        field(11; "Level 2 SIC Code"; Code[10])
        {
            Caption = 'Level 2 SIC Code';
        }
        field(12; "Level 1 Description"; Text[250])
        {
            Caption = 'Level 1 Description';
        }
        field(13; "Level 2 Description"; Text[250])
        {
            Caption = 'Level 2 Description';
        }
        field(14; "Level 3 Description"; Text[250])
        {
            Caption = 'Level 3 Description';
        }
        field(15; "Level4 Description"; Text[250])
        {
            Caption = 'Level4 Description';
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Level 3 SIC Code", "Level 4 SIC Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then
            //"Employee First Name":= Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
    end;

    var
        Employee: Record "HR Employees";
        OK: Boolean;
}
