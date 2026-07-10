
page 52193687 "Separation List"
{
    ApplicationArea = Basic;
    CardPageId = "Separation Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Separation Header";
    UsageCategory = Lists;
    Caption = 'Separation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation No. field.';
                }
                field("Staff Code"; "Staff Code")
                {
                    ApplicationArea = all;

                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = all;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                }
                field("Job Description"; "Job Description")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }

    actions { }
}
