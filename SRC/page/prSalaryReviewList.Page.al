
page 52193749 "prSalary Review List"
{
    CardPageId = "prSalary Review Header";
    Editable = false;
    PageType = List;
    SourceTable = "prSalary Review Header";
    ApplicationArea = All;
    Caption = 'prSalary Review List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Proposal No."; Rec."Proposal No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal No. field.';
                }
                field("Proposal Date"; Rec."Proposal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }
}
