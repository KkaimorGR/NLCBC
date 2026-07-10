
table 52193641 "HR Organizational Indicators"
{
    Caption = 'HR Organizational Indicators';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DIVISION'));
            Caption = 'Department Code';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(5; Name; Text[250])
        {
            Caption = 'Name';
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
