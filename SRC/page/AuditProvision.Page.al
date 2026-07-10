
page 52194052 "Audit Provision"
{
    PageType = Card;
    SourceTable = "Audit provision";
    ApplicationArea = All;
    Caption = 'Audit Provision';
    layout
    {
        area(Content)
        {
            group(Control1)
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
