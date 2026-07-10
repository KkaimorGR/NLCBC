
page 52194080 "Contract Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Line";
    ApplicationArea = All;
    Caption = 'Contract Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Detail; Rec.Detail)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Detail field.';
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
