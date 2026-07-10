tableextension 52193425 "FA ledger Ext" extends "FA Ledger Entry"
{
    fields
    {
        field(50000; "Quantity Allocated"; Decimal)
        {
            Caption = 'Quantity Allocated';
            DataClassification = ToBeClassified;
        }
        field(50001; "Quantity Allocated2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity Allocated';
        }
    }
}
