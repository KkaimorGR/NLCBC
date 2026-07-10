
page 52193985 Rates
{
    PageType = List;
    SourceTable = Rates;
    ApplicationArea = All;
    Caption = 'Rates';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control7; MyNotes) { }
            systempart(Control8; Links) { }
        }
    }

    actions { }
}
