
page 52193680 "HR OSSafety Checklist List"
{
    PageType = ListPart;
    SourceTable = "HR OSSafety Checklist";
    ApplicationArea = All;
    Caption = 'HR OSSafety Checklist List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(SafetyNo; Rec.SafetyNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SafetyNo field.';
                }
                field("Safety Rules"; Rec."Safety Rules")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Safety Rules field.';
                }
                field(Observed; Rec.Observed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Observed field.';
                }
                field("Not Observed"; Rec."Not Observed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Observed field.';
                }
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
                field("Observation Made"; Rec."Observation Made")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Observation Made field.';
                }
            }
        }
    }

    actions { }
}
