
page 52194056 "Provision list"
{
    PageType = Card;
    SourceTable = "Audit provision";
    ApplicationArea = All;
    Caption = 'Provision list';
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
                field(date; Rec.date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the date field.';
                }
            }
        }
    }

    actions { }
}
