
page 52193781 "Applicant Employment Profiles"
{
    PageType = Card;
    SourceTable = "Applicant Employment Profile";
    ApplicationArea = All;
    Caption = 'Applicant Employment Profiles';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(ApplicantNo; Rec.ApplicantNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNo field.';
                }
                field(Employer; Rec.Employer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer field.';
                }
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contacts field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(StaffNumber; Rec.StaffNumber)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StaffNumber field.';
                }
                field(DateEmployed; Rec.DateEmployed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateEmployed field.';
                }
                field(DateLeft; Rec.DateLeft)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateLeft field.';
                }
                field("Position Type"; Rec."Position Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Type field.';
                }
                field("Current Salary"; Rec."Current Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Salary field.';
                }
                field("Description of Duties"; Rec."Description of Duties")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of Duties field.';
                }
            }
        }
    }

    actions { }
}
