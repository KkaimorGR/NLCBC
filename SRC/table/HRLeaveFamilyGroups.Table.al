
table 52193513 "HR Leave Family Groups"
{
    Caption = 'HR Leave Family Groups';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39005661;
    //LookupPageID = UnknownPage39005661;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Remarks; Text[200])
        {
            Caption = 'Remarks';
        }
        field(4; "Max Employees On Leave"; Integer)
        {
            Description = 'Maximum nmber of employees allowed to be on leave at once';
            Caption = 'Max Employees On Leave';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
