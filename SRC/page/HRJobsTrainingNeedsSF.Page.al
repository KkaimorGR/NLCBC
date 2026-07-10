
page 52193631 "HR Jobs Training Needs SF"
{
    PageType = ListPart;
    SourceTable = "HR Job Training Needs";
    ApplicationArea = All;
    Caption = 'HR Jobs Training Needs SF';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
            }
        }
    }

    actions { }
}
