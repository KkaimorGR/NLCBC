
page 52193793 "Applicant Job Requirements"
{
    PageType = List;
    SourceTable = "Application Qualification";
    //SourceTable = "HR Appplicants Requirements";
    ApplicationArea = All;
    Caption = 'Applicant Job Requirements';
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application No."; "Application No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the JOb Application No field.';
                }
                field("Education Level"; "Education Level")
                {
                    ApplicationArea = all;
                    Caption = 'Qualification Level';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Institution/Company"; "Institution/Company")
                {
                    ApplicationArea = all;
                }
                field("Attained Score"; "Attained Score")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Specialization; Specialization)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("From Date"; "From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; "To Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions { }
}
