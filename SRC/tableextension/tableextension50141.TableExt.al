
tableextension 52193468 tableextension50141 extends "Inventory Setup"
{
    fields
    {
        field(50003; "Item Jnl Template"; Code[10])
        {
            TableRelation = "Item Journal Template";
            Caption = 'Item Jnl Template';
            DataClassification = CustomerContent;
        }
        field(50004; "Item Jnl Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name;
            Caption = 'Item Jnl Batch';
            DataClassification = CustomerContent;
        }
        field(50005; "Default Location Stock Limit"; Decimal)
        {
            Caption = 'Default Location Stock Limit';
            DataClassification = CustomerContent;
        }
        field(50006; "Internal Return Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Internal Return Nos';
            DataClassification = CustomerContent;
        }
    }
}
