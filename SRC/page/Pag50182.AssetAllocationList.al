page 50062 "Fixed Asset Allocation"
{
    ApplicationArea = All;
    Caption = 'Asset Allocation List';
    PageType = List;
    CardPageId = "Fixed Asset Allocation Cr";
    SourceTable = "Asset Allocation";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No." field.', Comment = '%';
                }
                field("Asset No."; Rec."Asset No.")
                {
                    ToolTip = 'Specifies the value of the Asset No." field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Asset No." field.', Comment = '%';
                }

                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Asset No." field.', Comment = '%';
                }
                field("Quantity in Store"; "Quantity in Store")
                {
                    ToolTip = 'Specifies the value of the Asset No." field.', Comment = '%';
                }

            }
        }
    }
}
