page 52193506 "Character Setup"
{
    ApplicationArea = All;
    Caption = 'Character Setup';
    PageType = List;
    SourceTable = "Character Setup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field(Question; Rec.Question)
                {
                    ToolTip = 'Specifies the value of the Question field.', Comment = '%';
                }
                field(Response; Rec.Response)
                {
                    ToolTip = 'Specifies the value of the Response field.', Comment = '%';
                }
                field(Explanation; Rec.Explanation)
                {
                    ToolTip = 'Specifies the value of the Explanation field.', Comment = '%';
                }
            }
        }
    }
}
