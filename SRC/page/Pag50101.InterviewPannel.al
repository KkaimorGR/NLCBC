page 52193525 "Interview Pannel"
{
    ApplicationArea = All;
    Caption = 'Interview Pannel';
    PageType = List;
    SourceTable = "Interview Pannel";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                    Visible = false;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ToolTip = 'Specifies the value of the Requisition No field.', Comment = '%';
                    Editable = false;
                    Visible = false;
                }
                field("JOb ID"; Rec."JOb ID")
                {
                    ToolTip = 'Specifies the value of the JOb ID field.', Comment = '%';
                    Editable = false;
                }
                field("Staff No"; Rec."Staff No")
                {
                    ToolTip = 'Specifies the value of the Staff No field.', Comment = '%';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ToolTip = 'Specifies the value of the Staff Name field.', Comment = '%';
                }
                field("Company Mail"; "Company Mail")
                {
                    ApplicationArea = all;
                }
                field(Roles; Roles)
                {
                    ApplicationArea = all;
                }
                field("Shortlisting Date"; "Shortlisting Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
