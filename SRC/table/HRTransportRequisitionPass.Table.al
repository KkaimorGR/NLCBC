
table 52193545 "HR Transport Requisition Pass"
{
    Caption = 'HR Transport Requisition Pass';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Req No"; Code[20])
        {
            Caption = 'Req No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                if HREmp.Get("Employee No") then begin
                    "Passenger/s Full Name/s" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    Dept := HREmp."Global Dimension 2 Code";
                end;
            end;
        }
        field(3; "Passenger/s Full Name/s"; Text[70])
        {
            Caption = 'Passenger/s Full Name/s';
        }
        field(4; Dept; Text[70])
        {
            Caption = 'Dept';
        }
        field(5; "Daily Work Ticket"; Code[20])
        {
            Caption = 'Daily Work Ticket';
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'EntryNo';
        }
    }

    keys
    {
        key(Key1; "Req No", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
}
