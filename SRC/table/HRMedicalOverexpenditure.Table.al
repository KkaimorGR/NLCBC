
table 52193571 "HR Medical Overexpenditure"
{
    Caption = 'HR Medical Overexpenditure';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Application No."; Code[20])
        {
            Caption = 'Application No.';
        }
        field(2; "Employee No."; Code[10])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No.';
        }
        field(3; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }
        field(4; Designation; Code[20])
        {
            Caption = 'Designation';
        }
        field(5; Region; Code[20])
        {
            Caption = 'Region';
        }
        field(6; Department; Code[20])
        {
            Caption = 'Department';
        }
        field(7; "Scheme Provider"; Code[20])
        {
            Caption = 'Scheme Provider';
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(9; "Hospital to be paid"; Text[100])
        {
            Caption = 'Hospital to be paid';
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(12; Eligible; Boolean)
        {
            Caption = 'Eligible';
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(14; "Responsibility Centre"; Code[10])
        {
            Caption = 'Responsibility Centre';
        }
    }

    keys
    {
        key(Key1; "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
