
page 52193812 "Procurement Type"
{
    PageType = List;
    SourceTable = "Procurement Limit Code";
    ApplicationArea = All;
    Caption = 'Procurement Type';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Procurement Code"; Rec."Procurement Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Code field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Procurement Amount Type"; Rec."Procurement Amount Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Amount Type field.';
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Amount field.';
                }
                field("Max Amount"; Rec."Max Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Amount field.';
                }
                field("Fixed Amount"; Rec."Fixed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Amount field.';
                }
            }
        }
    }

    actions { }
}
