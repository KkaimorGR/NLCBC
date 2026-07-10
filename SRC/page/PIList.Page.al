
page 52194091 "PI List"
{
    PageType = List;
    SourceTable = "PI Master";
    ApplicationArea = All;
    Caption = 'PI List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("PI Code"; Rec."PI Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Code field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field("Colabotative Institution"; Rec."Colabotative Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Colabotative Institution field.';
                }
                field("PI Address"; Rec."PI Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Address field.';
                }
                field("PI Telephone"; Rec."PI Telephone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Telephone field.';
                }
                field("PI EMail"; Rec."PI EMail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI EMail field.';
                }
            }
        }
    }

    actions { }
}
