
pageextension 52193483 pageextension50156 extends "Fixed Asset Setup"
{
    layout
    {
        addafter("Insurance Nos.")
        {
            field("Asset Transfer Nos."; Rec."Asset Transfer Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Asset Transfer Nos. field.';
            }
            field(FixedAssetNos; "Fixed Asset Nos.")
            {
                ApplicationArea = Basic;
            }
            field(InsuranceNos; "Insurance Nos.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
