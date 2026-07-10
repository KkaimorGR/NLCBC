page 52193531 "Items List"
{
    ApplicationArea = All;
    Caption = 'Items List';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the item.';
                    ApplicationArea = all;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    ApplicationArea = all;
                }
                field("Budget Quantity"; "Budget Quantity")
                {
                    ApplicationArea = all;
                    Caption = 'Quantity';
                }
                // field()
            }
        }
    }
}
