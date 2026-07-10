page 52193485 "Scoring Template Page"
{
    ApplicationArea = All;
    Caption = 'Scoring Template Page';
    PageType = Card;
    SourceTable = "Scoreing Template";
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
            group("Scorings Lines")
            {
                Caption = 'Scoring Lines';
                part("Scoring Lines"; "Scoring Lines")
                {
                    SubPageLink = Code = field(Code);
                }
            }
        }
    }
}
