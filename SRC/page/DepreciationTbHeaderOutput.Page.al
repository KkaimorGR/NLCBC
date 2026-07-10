
page 52193924 "Depreciation Tb Header Output"
{
    PageType = List;
    SourceTable = "Depreciation Tb Header Output";
    ApplicationArea = All;
    Caption = 'Depreciation Tb Header Output';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Depreciation Table"; Rec."Depreciation Table")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Depreciation Table field.';
                }
                field("Line Output"; Rec."Line Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Output field.';
                }
            }
        }
    }

    actions { }
}
