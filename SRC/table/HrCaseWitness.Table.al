
table 52193998 "Hr Case Witness"
{
    DrillDownPageId = "Hr Case Witness";
    LookupPageId = "Hr Case Witness";
    Caption = 'Hr Case Witness';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(2; "Case Number"; Code[30])
        {
            Caption = 'Case Number';
        }
        field(3; "Witness Number"; Code[30])
        {
            // TableRelation = if ("Witness is Staff" = const(true)) "HR Employees"."No.";
            TableRelation = "HR Employees"."No.";
            Caption = 'Witness Number';
            trigger OnValidate()
            var
                Committeerec: Record "HR Disciplinary Cases NCA";
            begin
                // if "Witness is Staff" = true then begin
                Emp.Reset();
                Emp.SetRange("No.", "Witness Number");
                if Emp.FindSet() then begin
                    "Witness Name" := Emp."First Name" + ' ' + Emp."Last Name";
                    rec."Witness is Staff" := true;
                end;
                // end;
                Committeerec.Reset();
                Committeerec.SetRange(Committeerec."Document No.", rec."Case Number");
                Committeerec.SetRange("Accused Employee", rec."Witness Number");
                if Committeerec.Find('-') then
                    Error('Accussed employee cannot be part of the case witnesses');
            end;
        }
        field(4; "Witness Name"; Text[100])
        {
            Caption = 'Witness Name';
        }
        field(5; "Witness Statement"; Text[2000])
        {
            Caption = 'Witness Statement';
        }
        field(6; "Witness is Staff"; Boolean)
        {
            Caption = 'Witness is Staff';
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No';
        }
        field(8; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(9; "Phone No."; Code[10])
        {
            Caption = 'Phone No.';
        }
        field(10; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Witness Number")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Emp: Record "HR Employees";
}

