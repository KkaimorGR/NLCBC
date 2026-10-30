page 52193455 "Item Base Units"
{
    ApplicationArea = All;
    Caption = 'Item Base Units';
    PageType = List;
    SourceTable = "Item Unit of Measure";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code to identify the unit of measure.';
                }
                field("Coupled to Dataverse"; Rec."Coupled to Dataverse")
                {
                    ToolTip = 'Specifies that the item unit of measure is coupled to a unit of measure in Dynamics 365 Sales.';
                }
            }
        }
    }
}
