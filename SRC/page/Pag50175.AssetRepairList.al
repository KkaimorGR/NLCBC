
Page 52193600 "Asset Repair List"
{
    ApplicationArea = Basic;
    CardPageID = "Asset Repair Card Vehicles";
    // Editable = false;
    PageType = List;
    SourceTable = "Asset Repair Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequestNo; Rec."Request No.")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Type"; "Asset Type")
                {
                    ApplicationArea = all;
                }
                field(RequestDate; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
