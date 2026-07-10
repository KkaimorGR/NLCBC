
page 52193707 "HR OSAccident List"
{
    ApplicationArea = Basic;
    CardPageId = "HR OSAccident Card";
    PageType = List;
    SourceTable = "HR OSAccident";
    UsageCategory = Lists;
    Caption = 'HR OSAccident List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions { }
}
