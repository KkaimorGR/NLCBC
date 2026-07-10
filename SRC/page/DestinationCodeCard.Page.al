
page 52193904 "Destination Code Card"
{
    PageType = Card;
    SourceTable = "Travel Destination";
    ApplicationArea = All;
    Caption = 'Destination Code Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Destination Code"; Rec."Destination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Code field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control7; Outlook) { }
            systempart(Control8; Notes) { }
            systempart(Control9; MyNotes) { }
            systempart(Control10; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Destination Rate")
            {
                ApplicationArea = Basic;
                Caption = 'Destination Rate';
                Image = Travel;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = page "Destination Rate List";
                RunPageLink = "Destination Code" = field("Destination Code");
                ToolTip = 'Executes the Destination Rate action.';
            }
        }
    }
}
