
page 52193887 "Document Cancellation Users"
{
    PageType = List;
    SourceTable = "Document Cancellation Users";
    ApplicationArea = All;
    Caption = 'Document Cancellation Users';
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
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field(Username; Rec.Username)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Username field.';
                }
                field("Notify/Can Cancel"; Rec."Notify/Can Cancel")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notify/Can Cancel field.';
                }
            }
        }
    }

    actions { }
}
