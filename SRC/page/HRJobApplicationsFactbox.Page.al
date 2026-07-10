
page 52193620 "HR Job Applications Factbox"
{
    PageType = ListPart;
    SourceTable = "HR Job Applications";
    ApplicationArea = All;
    Caption = 'HR Job Applications Factbox';
    layout
    {
        area(Content)
        {
            field(GeneralInfo; GeneralInfo)
            {
                ApplicationArea = Basic;
                Style = Strong;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the GeneralInfo field.';
            }
            field("Job Application No."; Rec."Job Application No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Application No. field.';
            }
            field("Date Applied"; Rec."Date Applied")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Date Applied field.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the First Name field.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Middle Name field.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
            field(Qualified; Rec.Qualified)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Qualified field.';
            }
            field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interview Invitation Sent field.';
            }
            field("ID Number"; Rec."ID Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the ID Number field.';
            }
            field(PersonalInfo; PersonalInfo)
            {
                ApplicationArea = Basic;
                Style = Strong;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the PersonalInfo field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field(Age; Rec.Age)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Age field.';
            }
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Marital Status field.';
            }
            field(CommunicationInfo; CommunicationInfo)
            {
                ApplicationArea = Basic;
                Style = Strong;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the CommunicationInfo field.';
            }
            field("Cell Phone Number"; Rec."Cell Phone Number")
            {
                ApplicationArea = Basic;
                ExtendedDatatype = PhoneNo;
                ToolTip = 'Specifies the value of the Cell Phone Number field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ExtendedDatatype = EMail;
                ToolTip = 'Specifies the value of the E-Mail field.';
            }
            field("Work Phone Number"; Rec."Work Phone Number")
            {
                ApplicationArea = Basic;
                ExtendedDatatype = PhoneNo;
                ToolTip = 'Specifies the value of the Work Phone Number field.';
            }
            field("Application Status"; "Application Status")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions { }

    var
        GeneralInfo: Label 'General Applicant Information';
        PersonalInfo: Label 'Personal Infomation';
        CommunicationInfo: Label 'Communication Information';
}
