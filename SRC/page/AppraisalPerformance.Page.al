
page 52194145 "Appraisal Performance"
{
    PageType = ListPart;
    SourceTable = "Evaluation Parameter Line";
    ApplicationArea = All;
    Caption = 'Appraisal Performance';
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
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Overall Comment"; Rec."Overall Comment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Comment field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parameter Code field.';
                }
                field("Min. Score"; Rec."Min. Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Score field.';
                }
                field("Max. Score"; Rec."Max. Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max. Score field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Actuals Scores"; Rec."Actuals Scores")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actuals Scores field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }

    actions { }
}
