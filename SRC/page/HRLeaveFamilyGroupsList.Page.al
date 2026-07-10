
page 52193665 "HR Leave Family Groups List"
{
    CardPageId = "HR Leave Family Groups Card";
    PageType = List;
    SourceTable = "HR Leave Family Groups";
    ApplicationArea = All;
    Caption = 'HR Leave Family Groups List';
    layout
    {
        area(Content)
        {
            repeater(Group)
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
