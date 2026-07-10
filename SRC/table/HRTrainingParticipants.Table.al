
table 52193773 "HR Training Participants"
{
    DrillDownPageId = "HR Employee Spouse";
    LookupPageId = "HR Employee Spouse";
    Caption = 'HR Training Participants';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Training Code"; Code[30])
        {
            Caption = 'Training Code';

        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';

        }
        field(3; "Employee name"; Text[60])
        {
            Caption = 'Employee name';
        }
        field(4; Objectives; Text[100])
        {
            Caption = 'Objectives';
        }
    }

    keys
    {
        key(Key1; "Training Code", "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    var
        // Hr: Record "Bank Slip";
        // Training: Record "Imprest Header";
        mcontent: Label 'You cannot assign participants where training category is ''Individual''';
}
