page 52193507 "Survey Character"
{
    ApplicationArea = All;
    Caption = 'Survey Character';
    PageType = List;
    SourceTable = "Survey Character";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ToolTip = 'Specifies the value of the Candidate No. field.', Comment = '%';
                }
                field(Question; Rec.Question)
                {
                    ToolTip = 'Specifies the value of the Question field.', Comment = '%';
                }
                field(Respose; Rec.Respose)
                {
                    ToolTip = 'Specifies the value of the Respose field.', Comment = '%';
                }
                field(Explanation; Rec.Explanation)
                {
                    ToolTip = 'Specifies the value of the Explanation field.', Comment = '%';
                }
            }
        }
    }
}
