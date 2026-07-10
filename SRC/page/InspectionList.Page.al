
page 52194079 "Inspection List"
{
    CardPageId = "Inspection Header";
    PageType = List;
    SourceTable = "Inspection Header";
    ApplicationArea = All;
    Caption = 'Inspection List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order No. field.';
                }
                field("Supplier No."; Rec."Supplier No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier No. field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = ' Receipt No.';
                    ToolTip = 'Specifies the value of the  Receipt No. field.';
                }
            }
        }
    }

    actions { }
}
