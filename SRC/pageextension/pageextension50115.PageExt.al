
pageextension 52193442 pageextension50115 extends "Purchase List"
{

    //Unsupported feature: Property Insertion (SourceTableView) on ""Purchase List"(Page 53)".


    //Unsupported feature: Property Insertion (CardPageID) on ""Purchase List"(Page 53)".

    layout
    {
        addafter("No.")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
            }
        }
    }
}
