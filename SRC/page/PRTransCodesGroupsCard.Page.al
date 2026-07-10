
page 52194378 "PR Trans Codes Groups - Card"
{
    Caption = 'PR Transaction Codes Groups Card';
    PageType = Card;
    SourceTable = "PR Trans Codes Groups";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Control1102756000)
            {
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Code field.';
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control3; Outlook) { }
        }
    }

    actions { }
}
