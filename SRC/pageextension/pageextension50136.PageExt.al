
pageextension 52193463 pageextension50136 extends "Bank Account Statement Lines"
{
    layout
    {
        addafter(Difference)
        {
            field(Reconciled; Rec.Reconciled)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reconciled field.';
            }
        }
    }
}
