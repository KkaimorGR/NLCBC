
table 52193808 "Employee Portal Test"
{
    Caption = 'Employee Portal Test';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[10])
        {
            Caption = 'Employee No';
        }
        field(2; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
        }
        field(3; "Employee ID"; Code[50])
        {
            Caption = 'Employee ID';
        }
    }

    keys
    {
        key(Key1; "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
