
table 52193866 "Order/Req Buffer"
{
    Caption = 'Order/Req Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; RequisitionNo; Code[20])
        {
            Caption = 'RequisitionNo';
        }
        field(2; TotalsonOrder; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field(OrderNo)));
            FieldClass = FlowField;
            Caption = 'TotalsonOrder';
            Editable = false;
        }
        field(3; TotalonReq; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field(RequisitionNo)));
            FieldClass = FlowField;
            Caption = 'TotalonReq';
            Editable = false;
        }
        field(4; UserID; Code[20])
        {
            Caption = 'UserID';
        }
        field(5; OrderNo; Code[20])
        {
            Caption = 'OrderNo';
        }
    }

    keys
    {
        key(Key1; RequisitionNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
