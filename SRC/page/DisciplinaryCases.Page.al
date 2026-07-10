

page 50018 "Disciplinary Cases"
{
    PageType = List;
    SourceTable = "Disciplinary Cases";
    ApplicationArea = All;
    Caption = 'Disciplinary Cases';
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
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000007; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

