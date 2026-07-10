
page 52194078 "Inspection Lines"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Inspection Line";
    ApplicationArea = All;
    Caption = 'Inspection Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purchase Order No. field.';
                }
                field("Delivery Note"; Rec."Delivery Note")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delivery Note field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Receipt Voucher No."; Rec."Receipt Voucher No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Voucher No. field.';
                }
                field("Quantity Ordered"; Rec."Quantity Ordered")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Quantity Ordered field.';
                }
                field("Quantity Accepted"; Rec."Quantity Accepted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Accepted field.';
                }
                field("Quantity Rejected"; Rec."Quantity Rejected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Rejected field.';
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Rejection field.';
                }
                field("Rejection No."; Rec."Rejection No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection No. field.';
                }
            }
        }
    }

    actions { }
}
