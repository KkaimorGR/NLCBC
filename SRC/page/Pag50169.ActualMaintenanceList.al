
Page 52193594 "Actual Maintenance List"
{
    ApplicationArea = Basic;
    CardPageID = "Actual Maintenance Card";
    Editable = false;
    PageType = List;
    SourceTable = "Actual Maintenance";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MaintenanceNo; Rec."Maintenance No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(PlannedDate; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension1Code; Rec."Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2Code; Rec."Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(PlanNo; Rec."Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
            }
        }
    }

    actions
    {
    }
}
