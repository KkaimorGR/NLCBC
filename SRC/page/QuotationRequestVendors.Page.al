
page 52193944 "Quotation Request Vendors"
{
    PageType = List;
    SourceTable = "Quotation Request Vendors";
    ApplicationArea = All;
    Caption = 'Quotation Request Vendors';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition Document No."; Rec."Requisition Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Document No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
            }
        }
    }

    actions { }
}
