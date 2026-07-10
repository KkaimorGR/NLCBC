
pageextension 52193462 pageextension50135 extends "Bank Account Statement"
{
    actions
    {
        addafter("&Card")
        {
            action("Posted Bank Reconciliation")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Posted Bank Reconciliation action.';
                trigger OnAction()
                begin
                    BankAccountStatement.Reset();
                    BankAccountStatement.SetRange(BankAccountStatement."Statement No.", Rec."Statement No.");
                    BankAccountStatement.SetRange(BankAccountStatement."Bank Account No.", Rec."Bank Account No.");
                    if BankAccountStatement.Find('-') then
                        Report.Run(Report::"Bank Account - Labels", true, false, BankAccountStatement);
                end;
            }
        }
    }

    var
        BankAccountStatement: Record "Bank Account Statement";
}
