
page 52194312 "HR Job Interview Factbo"
{
    PageType = List;
    SourceTable = "HR Job Interview";
    ApplicationArea = All;
    Caption = 'HR Job Interview Factbo';
    layout
    {
        area(Content)
        {
            field("Interview Description"; Rec."Interview Description")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interview Description field.';
            }
            field(Score; Rec.Score)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Score field.';
            }
            field("Total Score"; Rec."Total Score")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Score field.';
            }
            field(Comments; Rec.Comments)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Comments field.';
            }
        }
    }

    actions { }
}
