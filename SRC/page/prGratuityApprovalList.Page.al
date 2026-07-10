
page 52193753 "prGratuity Approval List"
{
    CardPageId = "prGratuity Approval";
    PageType = List;
    SourceTable = "prGratuity Approval";
    ApplicationArea = All;
    Caption = 'prGratuity Approval List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
            }
        }
    }

    actions { }
}
