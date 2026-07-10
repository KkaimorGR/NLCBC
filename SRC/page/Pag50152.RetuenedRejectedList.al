page 52193577 "Retuened/Rejected List"
{
    ApplicationArea = All;
    Caption = 'Retuened/Rejected List';
    PageType = List;
    Editable = false;
    SourceTable = "Returned /Rejected Goods";
    CardPageId = "Returned/Rejcted Items";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No field.', Comment = '%';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ToolTip = 'Specifies the value of the Staff No. field.', Comment = '%';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ToolTip = 'Specifies the value of the Staff Name field.', Comment = '%';
                }
                field("Quantity Return/Rejected"; Rec."Quantity Return/Rejected")
                {
                    ToolTip = 'Specifies the value of the Quantity Return/Rejected field.', Comment = '%';
                }
                field("Total Inventory"; Rec."Total Inventory")
                {
                    ToolTip = 'Specifies the value of the Total Inventory field.', Comment = '%';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Date captured"; "Date captured")
                {
                    ApplicationArea = all;
                }
                field("Reason for Return"; "Reason for Return")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = all;

                }




            }
        }
    }
}
