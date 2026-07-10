
page 52193950 "Quote Specifications List"
{
    PageType = List;
    SourceTable = "Quote Specifications";
    ApplicationArea = All;
    Caption = 'Quote Specifications List';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Value/Weight"; Rec."Value/Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value/Weight field.';
                }
            }
        }
    }

    actions { }
}
