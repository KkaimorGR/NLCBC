
page 52193733 prPayrollType
{
    PageType = List;
    SourceTable = "prPayroll Type";
    ApplicationArea = All;
    Caption = 'prPayrollType';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Code field.';
                }
                field("Payroll Name"; Rec."Payroll Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Name field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Period Length"; Rec."Period Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Length field.';
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
            }
        }
    }

    actions { }
}
