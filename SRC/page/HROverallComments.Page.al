
page 52194393 "HR Overall Comments"
{
    PageType = List;
    SourceTable = "HR Overall Comments";
    ApplicationArea = All;
    Caption = 'HR Overall Comments';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No series"; Rec."No series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No series field.';
                }
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Comments field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field("Second Supervisor Comments"; Rec."Second Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Comments field.';
                }
            }
        }
    }

    actions { }
}
