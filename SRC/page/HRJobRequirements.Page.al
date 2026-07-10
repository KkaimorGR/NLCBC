
page 52193622 "HR Job Requirements"
{
    DeleteAllowed = false;
    // InsertAllowed = true;
    // ModifyAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Jobs";
    ApplicationArea = All;
    Caption = 'HR Job Requirements';
    layout
    {
        area(Content)
        {
            group("Job Specification")
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
            }
            group("Job Requirements1")
            {
                part("Job Req"; "HR Job Requirement Lines")
                {
                    SubPageLink = "Job ID" = field("Job ID");
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Job Requirements")
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Job Requirements action.';
                trigger OnAction()
                begin
                    HRJobReq.Reset();
                    HRJobReq.SetRange(HRJobReq."Job ID", Rec."Job ID");
                    if HRJobReq.Find('-') then
                        Report.Run(Report::"HR Jobs(Conclusive)", true, true, HRJobReq);
                end;
            }
        }
    }

    var
        HRJobReq: Record "HR Jobs";
}
