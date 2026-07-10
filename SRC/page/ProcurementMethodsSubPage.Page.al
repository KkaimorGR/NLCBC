
page 52194113 "Procurement Methods Sub Page"
{
    PageType = CardPart;
    SourceTable = "Proc. Method Stage Duration";
    ApplicationArea = All;
    Caption = 'Procurement Methods Sub Page';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Proc. Method No."; Rec."Proc. Method No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Proc. Method No. field.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Duration(Days)"; Rec."Duration(Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration(Days) field.';
                }
            }
        }
    }

    actions { }
}
