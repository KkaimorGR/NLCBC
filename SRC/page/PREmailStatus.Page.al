
page 52194354 "PR Email Status"
{
    PageType = List;
    SourceTable = "PR Email Status";
    ApplicationArea = All;
    Caption = 'PR Email Status';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Date Sent"; Rec."Date Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Sent field.';
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
}
