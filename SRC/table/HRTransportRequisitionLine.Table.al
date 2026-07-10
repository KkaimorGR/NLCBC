
table 52193658 "HR Transport Requisition Line"
{
    Caption = 'HR Transport Requisition Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Requisition No"; Code[20])
        {
            Caption = 'Requisition No';
        }
        field(3; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                HrEmpREc: Record "HR Employees";
            begin
                HrEmpREc.Reset();
                HrEmpREc.SetRange("No.", rec."Employee No");
                if HrEmpREc.FindFirst() then
                    Names := HrEmpREc."Full Name";

            end;
        }
        field(4; Names; Text[150])
        {
            Caption = 'Names';
        }
        field(5; Purpose; Text[250])
        {
            Caption = 'Purpose';
        }
    }

    keys
    {
        key(Key1; "Requisition No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
