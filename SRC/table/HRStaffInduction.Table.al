
table 52193914 "HR Staff  Induction"
{
    Caption = 'HR Staff  Induction';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Induction Code"; Code[30])
        {
            Caption = 'Induction Code';
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
            trigger OnValidate()
            begin
                if Hr.Get("Employee Code") then
                    "Employee name" := Hr."First Name" + ' ' + Hr."Middle Name" + ' ' + Hr."Last Name";
            end;
        }
        field(3; "Employee name"; Text[60])
        {
            Caption = 'Employee name';
        }
        field(5; From; Date)
        {
            Caption = 'From';
        }
        field(6; Todate; Date)
        {
            Caption = 'Todate';
        }
        field(7; Duration; Option)
        {
            OptionCaption = ' ,Days,Week,Months,Years';
            OptionMembers = " ",Days,Week,Months,Years;
            Caption = 'Duration';
        }
        field(8; "Days Attended"; Decimal)
        {
            Caption = 'Days Attended';
        }
        field(9; Depatment; Code[10])
        {
            Caption = 'Depatment';
        }
        field(10; "Induction Status"; Option)
        {
            OptionMembers = "Not done",Done;
            Caption = 'Induction Status';
        }
    }

    keys
    {
        key(Key1; "Induction Code", "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Hr: Record "HR Employees";
}
