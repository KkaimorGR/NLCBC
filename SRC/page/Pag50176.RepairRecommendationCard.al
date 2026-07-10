
Page 52193601 "Repair Recommendation Card"
{
    PageType = Card;
    SourceTable = "Repair Recommendation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(LineNo; Rec."Line No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(RepairNo; Rec."Repair No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(VehicleNo; Rec."Vehicle No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(Recommendationbyofficer; Rec."Recommendation by officer")
            {
                ApplicationArea = Basic;
                MultiLine = true;
            }
        }
    }

    actions
    {
    }
}
