
page 52194196 "Salary Advance Lines"
{
    Caption = 'Salary Advance Lines';
    PageType = ListPart;
    SourceTable = "Staff Advance Lines";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date Taken"; Rec."Date Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Taken field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Payroll Deduct Month"; Rec."Payroll Deduct Month")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Payroll Deduct Month field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';

                }
                field("A Third Basic Pay"; Rec."A Third Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the A Third Basic Pay field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        // PayHeader: Record "Pending Vch. Surr. Line";
        // PayLine: Record "Receipt Line";
        Bal: Decimal;
        DimVal: Record "Dimension Value";
        ShortcutDimCode: array[8] of Code[20];
}
