
Page 52193597 "Asset Incident List"
{
    ApplicationArea = Basic;
    CardPageID = "Asset Incident Card";
    Editable = false;
    PageType = List;
    SourceTable = "Asset Incident";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(IncidentNo; Rec."Incident No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(IncidentType; Rec."Incident Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateReported; Rec."Date Reported")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
