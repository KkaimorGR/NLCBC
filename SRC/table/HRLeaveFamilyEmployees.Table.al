
table 52193514 "HR Leave Family Employees"
{
    Caption = 'HR Leave Family Employees';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39005662;
    //LookupPageID = UnknownPage39005662;

    fields
    {
        field(1; Family; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Leave Family Groups".Code;
            Caption = 'Family';
        }
        field(2; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(3; Remarks; Text[100])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(Key1; Family, "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
