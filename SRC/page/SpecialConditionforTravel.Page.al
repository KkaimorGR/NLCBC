
page 52194054 "Special Condition for Travel"
{
    PageType = Card;
    SourceTable = "Special Conditions for Travel";
    ApplicationArea = All;
    Caption = 'Special Condition for Travel';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
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
            }
        }
    }

    actions { }
}
