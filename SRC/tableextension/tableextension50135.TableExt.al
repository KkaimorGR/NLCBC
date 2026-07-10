
tableextension 52193462 tableextension50135 extends "Bank Account Statement"
{
    fields
    {
        field(50000; "Cash Book Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Cash Book Balance';
            DataClassification = CustomerContent;
        }
    }
}
