
page 52193789 "Job Application"
{
    Caption = 'Job Application';
    PageType = Card;
    SourceTable = "Job Applications";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(JobNo; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the JobNo field.';
                }

                field(ApplicantNames; Rec."Full Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNames field.';
                }



            }
        }
    }

    actions { }
}
