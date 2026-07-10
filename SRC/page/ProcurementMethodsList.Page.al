
page 52194115 "Procurement Methods List"
{
    ApplicationArea = Basic;
    CardPageId = "Procurement Methods Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Methods";
    UsageCategory = Lists;
    Caption = 'Procurement Methods List';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
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
