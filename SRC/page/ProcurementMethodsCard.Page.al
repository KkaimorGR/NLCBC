
page 52194114 "Procurement Methods Card"
{
    PageType = Card;
    SourceTable = "Procurement Methods";
    ApplicationArea = All;
    Caption = 'Procurement Methods Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
            part(Control1000000001; "Procurement Methods Sub Page")
            {
                SubPageLink = "Proc. Method No." = field(Code);
            }
        }
    }

    actions { }
}
