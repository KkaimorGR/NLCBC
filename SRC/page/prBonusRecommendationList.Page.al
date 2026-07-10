
page 52193756 "prBonus Recommendation List"
{
    CardPageId = "prBonus Recommendation Header";
    PageType = List;
    SourceTable = "prBonus Recommendation Header";
    ApplicationArea = All;
    Caption = 'prBonus Recommendation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Recommendation No."; Rec."Recommendation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendation No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Employee ID."; Rec."Employee ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee ID. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
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
