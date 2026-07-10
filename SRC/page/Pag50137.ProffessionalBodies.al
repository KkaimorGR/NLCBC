 
    page 52193562 "Proffessional Bodies"
{
    ApplicationArea = All;
    Caption = 'Proffessional Bodies';
    PageType = List;
    Editable=false;
    SourceTable = "Job Applicants Qualification";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ToolTip = 'Specifies the value of the Candidate No. field.', Comment = '%';
                    Editable = false;
                    Visible = false;
                }
                field("Attained Score"; Rec."Attained Score")
                {
                    ToolTip = 'Specifies the value of the Attained Score field.', Comment = '%';
                    Visible = false;
                }
                field("Institution/Company";"Institution/Company")
                {
                    ApplicationArea=all;
                }
           
         
                field("Membership Registration No"; Rec."Membership Registration No")
                {
                    ToolTip = 'Specifies the value of the Membership Registration No field.', Comment = '%';
                }
                field("Membership Type";"Membership Type")
                {
                    ApplicationArea=all;
                }
                field("Member Renewal Date";"Member Renewal Date")
                {
                    ApplicationArea=all;
                    Caption='Registration Date';
                }
                field("Licensing Renewal Date";"Licensing Renewal Date")
                {
                    ApplicationArea=all;
                    Caption='Renewal Date';
                }
               
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ToolTip = 'Specifies the value of the Qualification Category field.', Comment = '%';
                    Visible=false;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ToolTip = 'Specifies the value of the Qualification Code field.', Comment = '%';
                    Visible=false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    Visible=false;
                }
                field("Education Level"; Rec."Education Level")
                {
                    ToolTip = 'Specifies the value of the Education Level field.', Comment = '%';
                    Visible = false;
                }
                field("From Date"; "From Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("To Date"; "To Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
        }
    }
}
