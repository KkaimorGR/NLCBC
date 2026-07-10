
page 52194307 "HR Professional Body Lines"
{
    PageType = List;
    SourceTable = "HR Professional Body Lines";
    ApplicationArea = All;
    Caption = 'HR Professional Body Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee qualifications code"; Rec."Employee qualifications code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee qualifications code field.';
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
