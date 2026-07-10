
table 52193582 "PR NHIF"
{
    Caption = 'PR SHA';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tier Code"; Code[10])
        {
            SqlDataType = Integer;
            Caption = 'Tier Code';
        }
        field(2; "NHIF Tier"; Decimal)
        {
            Caption = 'NHIF Tier';
        }
        field(3; Amount; Decimal)
        {
            MinValue = 0;
            Caption = 'Amount';
        }
        field(4; "Lower Limit"; Decimal)
        {
            Caption = 'Lower Limit';
        }
        field(5; "Upper Limit"; Decimal)
        {
            Caption = 'Upper Limit';
        }
        field(6; "Order"; Integer)
        {
            Caption = 'Order';
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
        key(Key2; "Order") { }
    }

    fieldgroups { }


    var
        Text001: Label 'Deletion not allowed';
}
