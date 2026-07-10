
page 52194089 "Main Sub Components"
{
    AutoSplitKey = false;
    Caption = 'Main Sub Components';
    DataCaptionFields = "Main Sub No.";
    PageType = List;
    SourceTable = "Main Sub Component";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Main Sub No."; Rec."Main Sub No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Main Sub No.';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Main Sub No. field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = ' No.';
                    ToolTip = 'Specifies the value of the  No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions { }
}
