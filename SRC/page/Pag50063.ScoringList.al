page 52193487 "Scoring List"
{
    ApplicationArea = All;
    Caption = 'Scoring List';
    PageType = List;
    SourceTable = "Scoreing Template";
    UsageCategory = Administration;
    CardPageId = "Scoring Template Page";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
