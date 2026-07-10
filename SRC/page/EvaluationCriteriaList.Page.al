
page 52194152 "Evaluation Criteria List"
{
    ApplicationArea = Basic;
    CardPageId = "Evaluation Criteria Header";
    PageType = List;
    SourceTable = "Evaluation Criterial Header";
    UsageCategory = Lists;
    Caption = 'Evaluation Criteria List';
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
