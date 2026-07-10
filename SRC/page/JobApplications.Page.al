
page 52194192 "Job Applications"
{
    PageType = Card;
    SourceTable = "Job Applications";
    ApplicationArea = All;
    Caption = 'Job Applications';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }

            }
        }
    }

    actions { }
}
