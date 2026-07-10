
page 52193434 Attachment
{

    PageType = List;
    SourceTable = Attachments1;
    ApplicationArea = All;
    Editable = false;
    Caption = 'Attachment';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Document_No; Rec.Document_No)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Document_No field.';
                }
                field(Link; Rec.Link)
                {
                    ApplicationArea = all;
                    ExtendedDatatype = URL;

                    ToolTip = 'Specifies the value of the Link field.';
                }
                field(Module; Rec.Module)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Module field.';
                }
                field(FileType; Rec.FileType)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the FileType field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the User field.';
                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the FileName field.';
                }
                field(DocumentID; Rec.DocumentID)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the DocumentID field.';
                }
                field(Order_No; Rec.Order_No)
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Order_No field.';
                }
            }
        }
    }

    actions { }
}
