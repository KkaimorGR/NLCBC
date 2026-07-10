
table 52193915 "HR Dept. Responsibilities"
{
    Caption = 'HR Dept. Responsibilities';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Responsibility code"; Code[20])
        {
            Caption = 'Responsibility code';
        }
        field(2; "Responsibility Description"; Text[250])
        {
            Caption = 'Responsibility Description';
        }
        field(3; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(Key1; "Responsibility code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
