
tableextension 52193450 tableextension50123 extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = CustomerContent;
        }
    }
}
