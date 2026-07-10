
page 52194098 "Vendor Category"
{
    PageType = List;
    SourceTable = "User Document Cancellation";
    ApplicationArea = All;
    Caption = 'Vendor Category';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document Area"; Rec."Document Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Area field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control6; Outlook) { }
            systempart(Control7; Notes) { }
            systempart(Control8; MyNotes) { }
            systempart(Control9; Links) { }
        }
    }

    actions { }
}
