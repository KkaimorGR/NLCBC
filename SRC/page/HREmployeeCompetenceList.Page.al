
page 52194363 "HR Employee Competence List"
{
    PageType = List;
    SourceTable = "HR Employee Competence";
    ApplicationArea = All;
    Caption = 'HR Employee Competence List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Competence Code"; Rec."Competence Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competence Code field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Score"; Rec."Competency Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Score field.';
                }
            }
        }
    }

    actions { }
}
