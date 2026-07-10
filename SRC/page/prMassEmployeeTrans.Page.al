
page 52193725 "prMassEmployee Trans"
{
    CardPageId = "prMassList Transactions";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "PR Transaction Codes";
    SourceTableView = sorting("Transaction Code")
                      order(ascending)
                      where("Transaction Type" = filter(Deduction));
    ApplicationArea = All;
    Caption = 'prMassEmployee Trans';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
            }
        }
    }

    actions { }
}
