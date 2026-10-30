page 52193454 "DMS Links"
{
    ApplicationArea = All;
    Caption = 'DMS Links';
    PageType = List;
    SourceTable = DMS;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("DMS Link Type"; Rec."DMS Link Type")
                {
                    ToolTip = 'Specifies the value of the DMS Link Type field.', Comment = '%';
                }
                field("DMS Link Path"; Rec."DMS Link Path")
                {
                    ToolTip = 'Specifies the value of the DMS Link Path field.', Comment = '%';
                }
            }
        }
    }
}
