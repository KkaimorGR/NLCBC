
page 52193946 "Destination Rate List"
{
    CardPageId = "Destination Rates Card";
    PageType = List;
    SourceTable = "Destination Rate Entry";
    ApplicationArea = All;
    Caption = 'Destination Rate List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee Job Group"; Rec."Employee Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Job Group field.';
                }
                field("Advance Code"; Rec."Advance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Code field.';
                }
                field("Destination Code"; Rec."Destination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Code field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Type field.';
                }
                field("Daily Rate (Amount)"; Rec."Daily Rate (Amount)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Rate (Amount) field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Outlook) { }
            systempart(Control12; Notes) { }
            systempart(Control13; MyNotes) { }
            systempart(Control14; Links) { }
        }
    }

    actions { }
}
