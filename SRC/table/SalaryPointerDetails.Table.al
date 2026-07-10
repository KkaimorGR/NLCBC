
table 52193987 "Salary Pointer Details"
{
    Caption = 'Salary Pointer Details';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(2; "Payroll Period"; Date)
        {
            Caption = 'Payroll Period';
        }
        field(3; Present; Code[20])
        {
            Caption = 'Present';
        }
        field(4; Previous; Code[20])
        {
            Caption = 'Previous';
        }
        field(5; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Salary Scale';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period", Present, Previous, "Salary Scale")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

