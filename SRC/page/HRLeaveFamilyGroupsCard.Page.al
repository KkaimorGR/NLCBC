
page 52193667 "HR Leave Family Groups Card"
{
    PageType = Card;
    SourceTable = "HR Leave Family Groups";
    ApplicationArea = All;
    Caption = 'HR Leave Family Groups Card';
    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Max Employees On Leave"; Rec."Max Employees On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Employees On Leave field.';
                }
            }
        }
    }

    actions { }
}
