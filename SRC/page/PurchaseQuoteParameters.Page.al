
page 52193945 "Purchase Quote Parameters"
{
    PageType = List;
    SourceTable = "Purchase Quote Params";
    ApplicationArea = All;
    Caption = 'Purchase Quote Parameters';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specification field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value field.';
                }
            }
        }
    }

    actions { }
}
