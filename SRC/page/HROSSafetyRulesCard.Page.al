
page 52193679 "HR OSSafety Rules Card"
{
    PageType = Card;
    SourceTable = "HR OSSafety Rules";
    ApplicationArea = All;
    Caption = 'HR OSSafety Rules Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Safety No"; Rec."Safety No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety No field.';
                }
                field("Safety Rules"; Rec."Safety Rules")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Rules field.';
                }
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No. field.';
                }
            }
        }
    }

    actions { }
}
