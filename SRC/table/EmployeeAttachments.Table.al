
table 52193484 "Employee Attachments"
{
    Caption = 'Employee Attachments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(2; "Attachment Code"; Code[20])
        {
            TableRelation = "Attachment Types".Code;
            Caption = 'Attachment Code';
        }
        field(3; URL; Text[250])
        {
            Caption = 'URL';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Attachment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
