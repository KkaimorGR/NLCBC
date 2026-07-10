

page 52194410 "Nature of Cases"
{
    PageType = List;
    SourceTable = "Nature of Cases";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Nature of Cases';
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

