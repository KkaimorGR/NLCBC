
page 52193962 "Employee Referees"
{
    PageType = List;
    SourceTable = "HR Employee Referees";
    ApplicationArea = All;
    Caption = 'Employee Referees';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee code"; Rec."Employee code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee code field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
                field("Business/Occupation"; Rec."Business/Occupation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business/Occupation field.';
                }
            }
        }
    }

    actions { }
}
