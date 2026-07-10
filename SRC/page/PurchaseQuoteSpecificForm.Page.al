
page 52194132 "Purchase Quote Specific Form"
{
    PageType = List;
    SourceTable = "Purchase Quote Inspection List";
    ApplicationArea = All;
    Caption = 'Purchase Quote Specific Form';
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
            }
        }
    }

    actions { }
}
