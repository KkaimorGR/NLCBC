
page 52193813 "Expense Code"
{
    PageType = List;
    SourceTable = "Expense Code";
    ApplicationArea = All;
    Caption = 'Expense Code';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    actions { }
}
