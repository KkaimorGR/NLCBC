
page 52193689 "HR Shortlisting List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Shortlisting Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Requisitions";
    SourceTableView = SORTING("Requisition No.") ORDER(DESCENDING) where(Status = const(Approved),
                            Closed = const(true));
    UsageCategory = Lists;
    Caption = 'HR Shortlisting List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755005; Outlook) { }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Shortlisting Panel")
            {
                ApplicationArea = Basic;
                Promoted = true;
                Visible = false;
                RunObject = page "HR Shortlisting Panel";
                ToolTip = 'Executes the Shortlisting Panel action.';
                //RunPageLink = "Applicant No"=field("Requisition No.");
            }
        }
    }
}
