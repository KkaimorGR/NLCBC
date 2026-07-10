
page 52194185 Others
{
    PageType = List;
    SourceTable = Contracts;
    ApplicationArea = All;
    Caption = 'Others';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Advocates; Rec.Advocates)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocates field.';
                }
                field("Quantum of Claim"; Rec."Quantum of Claim")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantum of Claim field.';
                }
                field("Review Interval"; Rec."Review Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Interval field.';
                }
                field("Next Review Date"; Rec."Next Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Review Date field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons field.';
                }
            }
        }
    }

    actions { }
}
