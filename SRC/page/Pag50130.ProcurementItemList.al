page 52193555 "Procurement Item List"
{
    ApplicationArea = All;
    Caption = 'Procurement Item List';
    PageType = List;
    SourceTable = Item;
    CardPageId = "Procurement Items Card";
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
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies what you are selling.';
                }
                field(Model; Model)
                {
                    ApplicationArea = all;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the unit in which the item is held in inventory. The base unit of measure also serves as the conversion basis for alternate units of measure.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                }
                field(Inventory; Inventory)
                {
                    ToolTip = 'Inventory';
                }
                field("Maximum Inventory"; Rec."Maximum Inventory")
                {
                    ToolTip = 'Maximum Inventory';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ToolTip = 'Lead Time Calculation';
                }
                field("Stockout Warning"; Rec."Stockout Warning")
                {
                    ToolTip = 'Stock Out Warning';
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ToolTip = 'Last Date Modified';
                }



            }
        }
    }
}
