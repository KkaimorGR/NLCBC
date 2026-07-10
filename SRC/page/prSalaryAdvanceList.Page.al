
page 52193751 "prSalary Advance List"
{
    CardPageId = "prSalary Advance";
    Editable = false;
    PageType = List;
    SourceTable = "prSalary Advance";
    ApplicationArea = All;
    Caption = 'prSalary Advance List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
