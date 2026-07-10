

page 50017 "Disciplinary Actions"
{
    PageType = List;
    SourceTable = "Disciplinary Actions";
    ApplicationArea = All;
    Caption = 'Disciplinary Actions';
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
                field(Terminate; Rec.Terminate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terminate field.';
                }
                field(Document; Rec.Document)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document field.';
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
            systempart(Control1000000008; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

