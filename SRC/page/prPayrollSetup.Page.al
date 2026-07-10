
page 52193712 "prPayroll Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "prPayroll Setup";
    UsageCategory = Administration;
    Caption = 'prPayroll Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Salary Review Nos."; Rec."Salary Review Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Review Nos. field.';
                }
                field("Salary Advance Nos."; Rec."Salary Advance Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance Nos. field.';
                }
                field("Mortgage Nos."; Rec."Mortgage Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage Nos. field.';
                }
                field("Car Loan Nos."; Rec."Car Loan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan Nos. field.';
                }
                field("Gratuity Approval Nos."; Rec."Gratuity Approval Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gratuity Approval Nos. field.';
                }
                field("Bonus Recommendation Nos."; Rec."Bonus Recommendation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bonus Recommendation Nos. field.';
                }
                field("Employee Change Nos"; Rec."Employee Change Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Change Nos field.';
                }
                field("Allowances Nos"; Rec."Allowances Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allowances Nos field.';
                }
                field("Deductions Nos"; Rec."Deductions Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deductions Nos field.';
                }
                field("S.H.A"; "S.H.A")
                {
                    ApplicationArea = all;
                }
                field("Pension Arreas"; "Pension Arreas")
                {
                    ApplicationArea = all;
                }
                field("Employer PIN"; "Employer PIN")
                {
                    ApplicationArea = all;
                }
                field("Payroll Email Contact"; "Payroll Email Contact")
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions { }
}
