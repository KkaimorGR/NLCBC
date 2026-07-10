

page 52194402 "Case Year Setups"
{
    PageType = List;
    SourceTable = "Case Year Setups";
    ApplicationArea = All;
    Caption = 'Case Year Setups';
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

#pragma implicitwith restore

