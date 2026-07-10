
page 52194146 "Evaluation Criteria Header"
{
    PageType = Card;
    SourceTable = "Evaluation Criterial Header";
    ApplicationArea = All;
    Caption = 'Evaluation Criteria Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Evaluation Year"; Rec."Evaluation Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Year field.';
                }
                field("Actual Weight Assigned"; Rec."Actual Weight Assigned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Weight Assigned field.';
                }
            }
            part("Evaluation Criterial Line"; "Evaluation Criteria Line")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions { }
}
