
pageextension 52193460 pageextension50133 extends "Bank Acc. Reconciliation Lines"
{
    Editable = false;
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Check No."(Control 21)".

        modify(TotalBalance)
        {
            Caption = 'Cash Book Balance';
        }
        addafter("Applied Amount")
        {
            field(Reconciled; Rec.Reconciled)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reconciled field.';
            }
        }
    }
}
