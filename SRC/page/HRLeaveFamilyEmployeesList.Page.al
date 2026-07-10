
page 52193666 "HR Leave Family Employees List"
{
    PageType = List;
    SourceTable = "HR Leave Family Employees";
    ApplicationArea = All;
    Caption = 'HR Leave Family Employees List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Family; Rec.Family)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Family field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
