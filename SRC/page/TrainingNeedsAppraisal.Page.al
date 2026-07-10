
page 52194385 "Training Needs Appraisal"
{
    PageType = List;
    SourceTable = "Appraisal Training Development";
    ApplicationArea = All;
    Caption = 'Training Needs Appraisal';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Skills Gap"; Rec."Skills Gap")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Skills Gap field.';
                }
                field("Skills Example"; Rec."Skills Example")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Skills Example field.';
                }
                field("Recommended Development"; Rec."Recommended Development")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Development field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No field.';
                }
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("inhouse or outhouse"; Rec."inhouse or outhouse")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the inhouse or outhouse field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Type field.';
                }
            }
        }
    }

    actions { }
}
