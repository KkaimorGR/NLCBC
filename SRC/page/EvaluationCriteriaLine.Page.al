
page 52194147 "Evaluation Criteria Line"
{
    PageType = List;
    SourceTable = "Evaluation Criterial Line";
    ApplicationArea = All;
    Caption = 'Evaluation Criteria Line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
            }
        }
    }

    actions { }
}
