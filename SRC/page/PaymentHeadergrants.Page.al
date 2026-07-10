
page 52194007 "Payment Header grants"
{
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Cust. Ledger Entry";
    ApplicationArea = All;
    Caption = 'Payment Header grants';
    layout
    {
        area(Content)
        {
            group(Control1) { }
        }
    }

    actions { }

    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
}
