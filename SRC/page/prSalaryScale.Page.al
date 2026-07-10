
page 52193757 "prSalary Scale"
{
    PageType = List;
    SourceTable = "prSalary Scale";
    ApplicationArea = All;
    Caption = 'prSalary Scale';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Pay"; Rec."Minimum Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Pay field.';
                }
                field("Maximum Pay"; Rec."Maximum Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Pay field.';
                }
            }
        }
    }

    actions { }
}
