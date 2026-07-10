
table 52193939 "PR Email Status"
{
    Caption = 'PR Email Status';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            Editable = false;
            Caption = 'Employee No';
        }
        field(2; "Payroll Period"; Date)
        {
            Editable = false;
            Caption = 'Payroll Period';
        }
        field(3; "Date Sent"; Date)
        {
            Editable = false;
            Caption = 'Date Sent';
        }
        field(4; Status; Text[100])
        {
            Editable = false;
            Caption = 'Status';
        }
        field(5; Batch; Code[20])
        {
            Editable = false;
            Enabled = false;
            Caption = 'Batch';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
