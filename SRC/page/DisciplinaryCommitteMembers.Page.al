

page 50037 "Disciplinary Committe Members"
{
    PageType = ListPart;
    SourceTable = "Disciplinary Committee Members";
    ApplicationArea = All;
    Caption = 'Disciplinary Committe Members';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }

            }
        }
    }

    actions { }
}

#pragma implicitwith restore

