
table 52193780 "Medium Plan"
{
    Caption = 'Medium Plan';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "financial year start"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year start';
        }
        field(4; "financial year end"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year end';
        }
        field(5; Station; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Station';
        }
        field(6; Process; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Process';
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
