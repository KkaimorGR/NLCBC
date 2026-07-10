
page 52194313 "HR Hiring Criteria"
{
    PageType = List;
    SourceTable = "HR Hiring Criteria";
    ApplicationArea = All;
    Caption = 'HR Hiring Criteria';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Hiring Criteria"; Rec."Hiring Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hiring Criteria field.';
                }
            }
        }
    }

    actions { }
}
