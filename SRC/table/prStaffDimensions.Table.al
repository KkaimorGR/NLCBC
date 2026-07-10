
table 52193605 "prStaff Dimensions"
{
    Caption = 'prStaff Dimensions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Text[30])
        {
            TableRelation = "PR Salary Card"."Employee Code";
            Caption = 'Employee Code';
        }
        field(2; "Dimension 0"; Text[30])
        {
            Caption = 'Dimension 0';
        }
        field(3; "Dimension 1"; Text[30])
        {
            Caption = 'Dimension 1';
        }
        field(4; "Dimension 2"; Text[30])
        {
            Caption = 'Dimension 2';
        }
        field(5; "Dimension 3"; Text[30])
        {
            Caption = 'Dimension 3';
        }
        field(6; "Dimension 4"; Text[30])
        {
            Caption = 'Dimension 4';
        }
        field(7; "Dimension 5"; Text[30])
        {
            Caption = 'Dimension 5';
        }
        field(8; Percentage; Decimal)
        {
            Caption = 'Percentage';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Dimension 0", "Dimension 1", "Dimension 3", "Dimension 4", "Dimension 5")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
