
Page 52193541 "Supplier Categories"
{
    PageType = List;
    SourceTable = "Supplier Categories";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Category Code"; "Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Prequalified"; "No. Prequalified")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group"; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

