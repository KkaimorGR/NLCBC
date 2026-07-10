page 52193486 "Scoring Lines"
{
    ApplicationArea = All;
    Caption = 'Scoring Lines';
    PageType = ListPart;
    SourceTable = "Scoring Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ToolTip = 'Specifies the value of the Maximum Score field.', Comment = '%';
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                    ToolTip = 'Specifies the value of the Minimum Score field.', Comment = '%';
                }
                field(Qualified; Qualified)
                {
                    ApplicationArea = all;

                }
            }
        }
    }
}
